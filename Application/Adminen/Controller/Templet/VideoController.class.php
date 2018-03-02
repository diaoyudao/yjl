<?php
namespace Adminen\Controller\Templet;

use Think\Controller;
use Adminen\Common\Record\StaffLog;
use Admin\Common\Audit;

class VideoController extends Controller
{
    /**
     * 列表
     */
    public function lists()
    {
        $model = M('Video');

        $paramter = $this->searchParameterCheck();
        $where = $this->composeParam($paramter);

        $count = $model->where($where)->count();

        $page = new \Think\Page($count, C('ONE_PAGE_SIZE'));
        $page->show();

        $result = $model->page(I('get.pg', 1, FILTER_VALIDATE_INT), C('ONE_PAGE_SIZE'))
            ->where($where)->order('weight desc')->select();

        $menu_app = new \Adminen\Common\Menu();
        $source_levels = C('MENU_VIDEO_LEVELS');
        $select_levels = (new \Adminen\Common\MenuPrivilege())->filterAuthorityLevels($source_levels);

        foreach ($result as &$item) {
            $item['menu_name'] = $menu_app->getMenuName($item['level_id']);
        }

        $this->assign('counts', $count);
        $this->assign('videos', $result);
        $this->assign('pager', $page);
        $this->assign('select_levels', $select_levels);
        $this->display();
    }
    /**
     * 查看
     */
    public function search()
    {
        $video_id = I('get.video_id', 0, FILTER_VALIDATE_INT);
        if (!$video_id) {
            $this->show("参数错误");
            return;
        }

        (new StaffLog)->add('视频预览:' . $video_id);  // 日志记录


        $model = M('video');
        $video = $model->find($video_id);

        $this->assign('media', $video);
        $this->display();
    }
    public function add()
    {
        if (IS_GET) {  // 获取页面
            $source_levels = C('MENU_VIDEO_LEVELS');
            $select_levels = (new \Adminen\Common\MenuPrivilege())->filterAuthorityLevels($source_levels);

            $this->assign('select_levels', $select_levels);
            $this->display();
            return;
        }

        // 提交数据
        $this->addSubmit();
    }

    /**
     * 数据提交
     */
    public function change()
    {
        if (IS_GET) {  // 获取页面
            $datas = M('Video')->find(I('get.video_id'));
            $source_levels = C('MENU_VIDEO_LEVELS');
            $select_levels = (new \Adminen\Common\MenuPrivilege())->filterAuthorityLevels($source_levels);

            $this->assign('select_levels', $select_levels);
            $this->assign('video', $datas);
            $this->display('add');

            return;
        }

        // 提交数据
        $this->changeSubmit();
    }

    /**
     * 待审核
     */
    public function audit()
    {
        $parameter = $this->deleteParameterCheck();

        if ('' != (I('post.batch', ''))) {
            // 批量待审核
            $this->auditBatch($parameter);
            return;
        }

        $this->auditOne($parameter);
    }

    /**
     * 发布
     */
    public function release()
    {
        $parameter = $this->deleteParameterCheck();

        if ('' != (I('post.batch', ''))) {
            // 批量发布
            $this->releaseBatch($parameter);
            return;
        }

        $this->releaseOne($parameter);
    }

    /**
     * 删除
     */
    public function delete()
    {
        $parameter = $this->deleteParameterCheck();

        $staff_id = session('staff_id');
        $release = (new \Adminen\Common\Release())->getRelease();

        if ('' != (I('post.batch', ''))) {
            // 批量删除
            $this->deleteBatch($parameter,$staff_id,$release);
            return;
        }

        $this->deleteOne($parameter,$staff_id,$release);
    }

    private function deleteBatch($parameter,$staff_id,$release)
    {
        $temp_log_string = '批量删除视频：';

        $files = [];
        $model = M('Video');
        $model->startTrans();
        try {
            foreach ($parameter['ids'] as $id) {
                $file = $model->find($id);
                $files[] = [
                    'image_url' => $file['image_url'],
                    'thumbnail_url' => $file['thumbnail_url'],
                    'url' => $file['url'],
                ];
                if (1 == $release && $file['staff_id'] != $staff_id) {
                    $this->ajaxReturn(['status' => 'failed', 'message' => '您不能删除其他编辑者的视频']);
                } else {
                    $ret = $model->delete($id);
                }
                if (false === $ret) {
                    throw new \Exception($model->getDbError());
                }

                $count = $model->where("url = '%s'", $file['url'])->count();
                if (0 >= $count) {
                    $ret = M('LargeFileTemp')->where("url = '%s'", $file['url'])->delete();
                    if (false === $ret) {
                        throw new \Exception($model->getDbError());
                    }
                }

                $temp_log_string .= $file['name'] . ',';
            }

            $model->commit();
        } catch (\Exception $ex) {
            $model->rollback();

            $this->ajaxReturn(['status' => 'failed', 'message' => '失败：' . $ex->getMessage()]);
        }

        // 删除视频，无论视频删除成功与否，都返回成功
        $this->batchDeleteFile($files);

        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 批量删除视频
     */
    private function batchDeleteFile($files)
    {
        try {
            foreach ($files as $file) {
                if ($file['url']) {
                    mv_file(C('UPLOAD_LARGE_FILE_ROOT_PATH') . $file['url']);
                }
                if ($file['image_url']) {
                    mv_file(C('UPLOAD_LARGE_FILE_ROOT_PATH') . $file['image_url']);
                }
                if ($file['thumbnail_url']) {
                    mv_file(C('UPLOAD_LARGE_FILE_ROOT_PATH') . $file['thumbnail_url']);
                }
            }
        } catch (\Exception $ex) {
            \Think\Log::write('删除视频失败');
        }
    }
    /**
     * 批量审核内容
     */
    private function auditBatch($parameter)
    {
        $temp_log_string = '批量待审核内容：';

        $model = M('Video');
        $model->startTrans();
        try {
            foreach ($parameter['ids'] as $id) {
                $advert = $model->find($id);
                $ret = $model->where(['video_id' => $id])->save(['status' => C('STATUS_INVALID')]);
                if (false === $ret) {
                    $model->rollback();

                    $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
                }
                $temp_log_string .= $advert['name'] . ',';
            }

            $model->commit();
        } catch (\Exception $ex) {
            $model->rollback();

            $this->ajaxReturn(['status' => 'failed', 'message' => '失败：' . $ex->getMessage()]);
        }


        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 批量发布内容
     */
    private function releaseBatch($parameter)
    {
        $temp_log_string = '批量发布内容：';

        $model = M('Video');
        $model->startTrans();
        try {
            foreach ($parameter['ids'] as $id) {
                $advert = $model->find($id);
                $ret = $model->where(['video_id' => $id])->save(['status' => C('STATUS_VALID')]);
                if (false === $ret) {
                    $model->rollback();

                    $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
                }
                $temp_log_string .= $advert['name'] . ',';
            }

            $model->commit();
        } catch (\Exception $ex) {
            $model->rollback();

            $this->ajaxReturn(['status' => 'failed', 'message' => '失败：' . $ex->getMessage()]);
        }


        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    private function auditOne($parameter)
    {
        $model = M('Video');
        $advert = $model->find($parameter['video_id']);
        $ret = $model->where(['video_id' => $parameter['video_id']])->save(['status' => C('STATUS_INVALID')]);
        if (false === $ret) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }


        $temp_log_string = '待审核内容：' . $advert['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    private function releaseOne($parameter)
    {
        $model = M('Video');
        $advert = $model->find($parameter['video_id']);
        $ret = $model->where(['video_id' => $parameter['video_id']])->save(['status' => C('STATUS_VALID')]);
        if (false === $ret) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }


        $temp_log_string = '发布内容：' . $advert['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    private function deleteOne($parameter,$staff_id,$release)
    {
        $model = M('Video');
        $file = $model->find($parameter['video_id']);

        // 删除
        $model->startTrans();
        try {
            if (1 == $release && $file['staff_id'] != $staff_id) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '您不能删除其他编辑者的评级']);
            } else {
                $ret = $model->delete($parameter['video_id']);
            }
            if (false === $ret) {
                $model->rollback();
                $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
            }

            $count = $model->where("url = '%s'", $file['url'])->count();
            if (0 >= $count) {
                M('LargeFileTemp')->where("url = '%s'", $file['url'])->delete();

                mv_file(C('UPLOAD_LARGE_FILE_ROOT_PATH') . $file['url']);
            }

            if ($file['image_url']) {
                mv_file(C('UPLOAD_LARGE_FILE_ROOT_PATH') . $file['image_url']);
            }

            if ($file['thumbnail_url']) {
                mv_file(C('UPLOAD_LARGE_FILE_ROOT_PATH') . $file['thumbnail_url']);
            }

            $model->commit();
        } catch (\Exception $ex) {
            $model->rollback();

            $this->ajaxReturn(['status' => 'failed', 'message' => $ex->getMessage()]);
        }

        $temp_log_string = '删除视频：' . $file['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    private function changeSubmit()
    {
        $paramter = $this->parameterCheck('change');
        $this->duplicateCheck('change');

        $model = M('Video');

        $firmware = $model->find($paramter['video_id']);
        $data = array_merge([], $paramter);
        $data['update_time'] = (new \DateTime())->format('Y-m-d H:i:s');
        $data['staff_id'] = session('staff_id');
        if (!isset($data['stick'])) {
            $data['stick'] = 0;
        }

        $model->startTrans();
        try {
            $ret = $model->where('video_id = %d', $paramter['video_id'])->save($data);
            if (false === $ret) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
            }

            $this->deleteLargeFile($model, $firmware, $data); // 删除没有使用的视频

            $model->commit();
        } catch (\Exception $ex) {
            $model->rollback();

            $this->ajaxReturn(['status' => 'failed', 'message' => $ex->getMessage()]);
        }

        $temp_log_string = '修改视频：' . $paramter['video_id'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    private function deleteLargeFile($model, $firmware, $data)
    {
        if ($firmware['url'] && $firmware['url'] != $data['url']) {
            $count = $model->where("url = '%s' and video_id != %d"
                , $firmware['url'], $firmware['video_id'])
                ->count();
            if (0 >= $count) {
                M('LargeFileTemp')->where("url = '%s' and size = %d", $firmware['url'], $firmware['size'])->delete();
                mv_file(C('UPLOAD_LARGE_FILE_ROOT_PATH') . $firmware['url']);
            }
        }
    }

    /**
     * 添加数据提交
     */
    private function addSubmit()
    {
        $paramter = $this->parameterCheck();
        $this->duplicateCheck();

        $model = M('Video');
        $data = array_merge([], $paramter);
        $data['begin_time'] = (new \DateTime())->format('Y-m-d H:i:s');
        $data['staff_id'] = session('staff_id');

        $ret = $model->add($data);
        if (false === $ret) {
            $this->ajaxReturn(['status' => 'failed', 'message' => $model->getDbError()]);
        }

        $temp_log_string = '新增视频：' . $paramter['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 重复检查
     * @param $type  类型，add是新增，change是修改
     */
    private function duplicateCheck($type = 'add')
    {
        $model = M('Video');
        $where['level_id'] = I('post.level_id');
        $where['tags'] = I('post.tags');
        $where['title'] = I('post.title');

        if ($type == 'add') {
            $result = $model->where($where)->select();
        } else {
            $where['video_id'] = ['NEQ', I('post.video_id')];

            $result = $model->where($where)->select();
        }

        if ($result) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '该视频已经存在，请检查！']);
        }
    }

    /**
     * 入参检查
     * @param $type delete
     * @return  post参数数组
     */
    private function deleteParameterCheck()
    {
        try {
            if ('' != (I('post.batch', ''))) {
                (new \Adminen\Common\Parameter\Validator())->execute(I('post.'), [
                    'ids' => [
                        'type' => 'array',
                        'value' => [
                            'type' => 'integer'
                        ]
                    ],
                ]);
            } else {
                (new \Adminen\Common\Parameter\Validator())->execute(I('post.'), [
                    'video_id' => ['type' => 'integer'],
                ]);
            }
        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);
        }

        return I('post.');
    }

    /**
     * 入参检查
     * @param $type [add|change]
     * @return  post参数数组
     */
    private function parameterCheck($type = 'add')
    {
        if ($type == 'change') {
            try {
                (new \Adminen\Common\Parameter\Validator())->execute(I('post.'), [
                    'video_id' => ['type' => 'integer'],
                ]);
            } catch (\Exception $ex) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);
            }
        }

        try {
            (new \Adminen\Common\Parameter\Validator())->execute(I('post.'), [
                'level_id' => ['type' => 'integer'],
                'title' => ['type' => 'string'],
                'tags' => ['type' => 'string', 'allow_empty' => true],
                'desc' => ['type' => 'string', 'allow_empty' => true],
                'image_url1' => ['type' => 'string', 'allow_empty' => true],
                'thumbnail_url1' => ['type' => 'string', 'allow_empty' => true],
                'image_url2' => ['type' => 'string', 'allow_empty' => true],
                'thumbnail_url2' => ['type' => 'string', 'allow_empty' => true],
                'link_url1' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'link_url2' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'name' => ['type' => 'string', 'allow_empty' => true],
                'size' => ['type' => 'integer', 'allow_empty' => true],
                'duration' => ['type' => 'integer'],
                'url' => ['type' => 'string', 'allow_empty' => true],
                'weight' => ['type' => 'integer'],
                'status' => ['enum_eq' => [0, 1]],
                'stick' => ['enum_eq' => [0, 1], 'required' => false],
            ]);
        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => $ex->getMessage()]);
        }

        return I('post.');
    }

    /**
     * 入参检查
     * @return  get参数数组
     */
    private function searchParameterCheck()
    {
        try {
            (new \Adminen\Common\Parameter\Validator())->execute(I('get.'), [
                'pg' => ['type' => 'integer', 'required' => false],
                'level_id' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
                'tags' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'title' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'status' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
            ]);

        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => 'parameter error.']);
        }

        return I('get.');
    }

    /*
     * param $paramter array
     * 参数组装a
     */
    private function composeParam($paramter)
    {
        $where = (new \Adminen\Common\MenuPrivilege())->mergeLevelWhere();

        if (isset($paramter['level_id']) && '' != $paramter['level_id']) {
            if ($where['level_id']) {
                $where['_string'] = 'level_id =' . $paramter['level_id'];
            } else {
                $where['level_id'] = $paramter['level_id'];
            }
        }
        if (null !== ($paramter['status']) && "" !== ($paramter['status'])) {
            $where['status'] = $paramter['status'];
        }
        if (!empty($paramter['tags'])) {
            $where['tags'] = ['like', '%' . $paramter['tags'] . '%'];
        }

        if (!empty($paramter['title'])) {
            $where['title'] = ['like', '%' . $paramter['title'] . '%'];
        }

        return $where;
    }
}