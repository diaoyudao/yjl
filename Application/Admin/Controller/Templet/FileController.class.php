<?php
namespace Admin\Controller\Templet;

use Think\Controller;
use Admin\Common\Record\StaffLog;

class FileController extends Controller
{
    /**
     * 列表
     */
    public function lists()
    {
        $model = M('File');

        $paramter = $this->searchParameterCheck();
        $where = $this->composeParam($paramter);

        $count = $model->where($where)->count();

        $page = new \Think\Page($count, C('ONE_PAGE_SIZE'));
        $page->show();

        $result = $model->page(I('get.pg', 1, FILTER_VALIDATE_INT), C('ONE_PAGE_SIZE'))
            ->where($where)->order('weight desc,begin_time desc,update_time desc')->select();

        $menu_app = new \Admin\Common\Menu();
        foreach ($result as &$item) {
            $item['menu_name'] = $menu_app->getMenuName($item['level_id']);
        }

        $source_levels = C('MENU_FILE_LEVELS');
        $filter_levels = (new \Admin\Common\MenuPrivilege())->filterAuthorityLevels($source_levels);

        $this->assign('counts', $count);
        $this->assign('files', $result);
        $this->assign('pager', $page);
        $this->assign('select_levels', $filter_levels);
        $this->display();
    }

    public function add()
    {
        if (IS_GET) {  // 获取页面
            $source_levels = C('MENU_FILE_LEVELS');
            $select_levels = (new \Admin\Common\MenuPrivilege())->filterAuthorityLevels($source_levels);

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
            $datas = M('File')->find(I('get.file_id'));
            $source_levels = C('MENU_FILE_LEVELS');
            $select_levels = (new \Admin\Common\MenuPrivilege())->filterAuthorityLevels($source_levels);

            $this->assign('select_levels', $select_levels);
            $this->assign('firmware', $datas);
            $this->display('add');

            return;
        }

        // 提交数据
        $this->changeSubmit();
    }

    public function changeOne()
    {
        if (IS_GET) {  // 获取页面
            $datas = M('File')->find(I('get.file_id'));
            $source_levels = C('MENU_FILE_LEVELS');
            $select_levels = (new \Admin\Common\MenuPrivilege())->filterAuthorityLevels($source_levels);

            $this->assign('select_levels', $select_levels);
            $this->assign('firmware', $datas);
            $this->display('add');

            return;
        }

        // 提交数据
        $this->changeSubmitone();
    }

    /**
     * 删除
     */
    public function delete()
    {
        $parameter = $this->deleteParameterCheck();

        if ('' != (I('post.batch', ''))) {
            // 批量删除
            $this->deleteBatch($parameter);
            return;
        }

        $this->deleteOne($parameter);
    }

    private function deleteOne($parameter)
    {
        $model = M('File');
        $advert = $model->find($parameter['file_id']);

        $ret = $model->delete($parameter['file_id']);
        if (false === $ret) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }
        $count = $model->where("url = '%s'", $advert['url'])->count();
        if (0 >= $count) {
            M('LargeFileTemp')->where("url = '%s'", $advert['url'])->delete();

            mv_file(C('UPLOAD_LARGE_FILE_ROOT_PATH') . $advert['url']);
        }
        // 删除文件
        if ($advert['image_url1']) {  // 删除文件，失败也继续
            mv_file(C('IMAGE_SAVE_PATH_ROOT') . $advert['image_url1']);
        }
        if ($advert['thumbnail_url1']) {  // 删除文件，失败也继续
            mv_file(C('IMAGE_SAVE_PATH_ROOT') . $advert['thumbnail_url1']);
        }
        if ($advert['image_url2']) {  // 删除文件，失败也继续
            mv_file(C('IMAGE_SAVE_PATH_ROOT') . $advert['image_url2']);
        }
        if ($advert['thumbnail_url2']) {  // 删除文件，失败也继续
            mv_file(C('IMAGE_SAVE_PATH_ROOT') . $advert['thumbnail_url2']);
        }
      

        $temp_log_string = '删除文件：' . $advert['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }
    private function deleteBatch($parameter)
    {
        $temp_log_string = '批量删除文件：';

        $files = [];
        $model = M('File');
        $model->startTrans();
        try {
            foreach ($parameter['ids'] as $id) {
                $file = $model->find($id);
                $files[] = [
                    'image_url' => $file['image_url'],
                    'thumbnail_url' => $file['thumbnail_url'],
                    'url' => $file['url'],
                ];

                $ret = $model->delete($id);
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

        // 删除文件，无论文件删除成功与否，都返回成功
        $this->batchDeleteFile($files);

        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 批量删除文件
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
            \Think\Log::write('删除图片失败');
        }
    }




    private function changeSubmit()
    {
        $paramter = $this->parameterCheck('change');
        // 按照客户的要求公告标题可以重复，不做检查了20170626
        // $this->duplicateCheck('change');

        $model = M('File');

        $firmware = $model->find($paramter['file_id']);
        $data = array_merge([], $paramter);
        $data['update_time'] = (new \DateTime())->format('Y-m-d H:i:s');
        $data['staff_id'] = session('staff_id');

        $model->startTrans();
        try {
            $ret = $model->where('file_id = %d', $paramter['file_id'])->save($data);
            if (false === $ret) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
            }

            $this->deleteLargeFile($model, $firmware, $data); // 删除没有使用的文件

            $model->commit();
        } catch (\Exception $ex) {
            $model->rollback();

            $this->ajaxReturn(['status' => 'failed', 'message' => $ex->getMessage()]);
        }

        $temp_log_string = '修改文件：' . $paramter['file_id'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    private function changeSubmitOne()
    {
        $paramter = $this->parameterCheck('change');
        // 按照客户的要求公告标题可以重复，不做检查了20170626
        // $this->duplicateCheck('change');

        $model = M('File');

        $firmware = $model->find($paramter['file_id']);
        $data = array_merge([], $paramter);
//        $data['update_time'] = $firmware['update_time'];
        $data['staff_id'] = session('staff_id');

        $model->startTrans();
        try {
            $ret = $model->where('file_id = %d', $paramter['file_id'])->save($data);
//            dump($ret);
            if (false === $ret) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
            }

            $this->deleteLargeFile($model, $firmware, $data); // 删除没有使用的文件

            $model->commit();
        } catch (\Exception $ex) {
            $model->rollback();

            $this->ajaxReturn(['status' => 'failed', 'message' => $ex->getMessage()]);
        }

        $temp_log_string = '修改文件：' . $paramter['file_id'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok','data'=>$data]);
    }

    private function deleteLargeFile($model, $firmware, $data)
    {
        if ($firmware['url'] && $firmware['url'] != $data['url']) {
            $count = $model->where("url = '%s' and file_id != %d"
                , $firmware['url'], $firmware['file_id'])
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
        // 按照客户的要求公告标题可以重复，不做检查了20170626
        // $this->duplicateCheck();

        $model = M('File');
        $data = array_merge([], $paramter);
        $data['update_time'] = (new \DateTime())->format('Y-m-d H:i:s');
        $data['staff_id'] = session('staff_id');

        $ret = $model->add($data);
        if (false === $ret) {
            $this->ajaxReturn(['status' => 'failed', 'message' => $model->getDbError()]);
        }

        $temp_log_string = '新增文件：' . $paramter['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 重复检查
     * @param $type  类型，add是新增，change是修改
     */
    private function duplicateCheck($type = 'add')
    {
        $model = M('File');
        $where['level_id'] = I('post.level_id');
        $where['title'] = I('post.title');
        $where['tags'] = I('post.tags');

        if ($type == 'add') {
            $result = $model->where($where)->select();
        } else {
            $where['file_id'] = ['NEQ', I('post.file_id')];
            $result = $model->where($where)->select();
        }

        if ($result) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '该文件已经存在，请检查！']);

            exit;
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
                (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                    'ids' => [
                        'type' => 'array',
                        'value' => [
                            'type' => 'integer'
                        ]
                    ],
                ]);
            } else {
                (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                    'file_id' => ['type' => 'integer'],
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
                (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                    'file_id' => ['type' => 'integer'],
                ]);
            } catch (\Exception $ex) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);
            }
        }

        try {
            (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
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
                'url' => ['type' => 'string', 'allow_empty' => true],
                'weight' => ['type' => 'integer'],
                'status' => ['enum_eq' => [0, 1]],
            ]);
        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => $ex->getMessage()]);
        }
        
        $paramter = I('post.');

        if (empty($paramter['begin_time'])) {
            $paramter['begin_time'] = (new \DateTime())->format('Y-m-d');
        }
        if ('' === ($paramter['end_time'])) {
            $paramter['end_time'] = null;
        }

        return $paramter;
    }

    /**
     * 入参检查
     * @return  get参数数组
     */
    private function searchParameterCheck()
    {
        try {
            (new \Admin\Common\Parameter\Validator())->execute(I('get.'), [
                'pg' => ['type' => 'integer', 'required' => false],
                'level_id' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
                'tags' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'title' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
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
        $where = (new \Admin\Common\MenuPrivilege())->mergeLevelWhere();

        if (isset($paramter['level_id']) && '' != $paramter['level_id']) {
            if($where['level_id']) {
                $where['_string'] = 'level_id =' . $paramter['level_id'];
            } else {
                $where['level_id'] = $paramter['level_id'];
            }            
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