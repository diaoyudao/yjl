<?php
namespace Adminen\Controller\Business;

use Think\Controller;
use Adminen\Common\Record\StaffLog;

/**
 * 后台管理登录
 * @package Admin\Controller
 */
class ImageController extends Controller
{
    public function lists()
    {
        $model = M('land_image');

        $paramter = $this->searchParameterCheck();
        $where = $this->composeParam($paramter);

        $count = $model->where($where)->count();

        $page = new \Think\Page($count, C('ONE_PAGE_SIZE'));
        $page->show();

        $result = $model->page(I('get.pg', 1, FILTER_VALIDATE_INT), C('ONE_PAGE_SIZE'))
            ->where($where)->order('tags,weight desc')->select();
        //(new StaffLog)->add('查看列表');  // 日志记录
        $type = I('get.type');
        if ('land' == $type) $tags_lists = C('LAND_TAGS');
        if ('hotel' == $type) $tags_lists = C('HOTEL_TAGS');
        $this->assign('lists', $tags_lists);
        $this->assign('counts', $count);
        $this->assign('pager', $page);
        $this->assign('images', $result);
        $this->display();
    }

    /**
     * 新增
     */
    public function add()
    {
        if (IS_GET) {  // 获取页面
            $type = I('get.type');
            $this->addPage($type);
            return;
        }

        // 提交数据
        $this->addSubmit();
    }

    /**
     * 修改
     */
    public function change()
    {
        if (IS_GET) {  // 获取页面
            $type = I('get.type');
            $this->changePage($type);
            return;
        }

        // 提交数据
        $this->changeSubmit();
    }

    /**
     * 删除角色
     * @request {
     *      role_id: (integer),
     * }
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

    /*
     * param $paramter array
     * 参数组装a
     */
    private function composeParam($paramter)
    {
        $where['land_id'] = $paramter['land_id'];

        if (!empty($paramter['tags'])) {
            $where['tags'] = ['like', '%' . $paramter['tags'] . '%'];
        }

        if (!empty($paramter['name'])) {
            $where['name'] = ['like', '%' . $paramter['name'] . '%'];
        }

        return $where;
    }

    private function deleteOne($parameter)
    {
        $model = M('land_image');
        $advert = $model->find($parameter['land_image_id']);

        $ret = $model->delete($parameter['land_image_id']);
        if (false === $ret) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }

        // 删除文件
        if ($advert['image_url']) {  // 删除文件，失败也继续
            mv_file(C('IMAGE_SAVE_PATH_ROOT') . $advert['image_url']);
        }
        if ($advert['thumbnail_url']) {  // 删除文件，失败也继续
            mv_file(C('IMAGE_SAVE_PATH_ROOT') . $advert['thumbnail_url']);
        }

        $temp_log_string = '删除图片：' . $advert['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 批量删除角色
     */
    private function deleteBatch($parameter)
    {
        $temp_log_string = '批量删除图片：';

        $files = [];
        $model = M('land_image');
        $model->startTrans();
        try {
            foreach ($parameter['ids'] as $id) {
                $advert = $model->find($id);
                if ($advert['image_url1']) {
                    $files[] = [
                        'image_url1' => $advert['image_url1'],
                        'thumbnail_url1' => $advert['thumbnail_url1'],
                        'image_url2' => $advert['image_url2'],
                        'thumbnail_url2' => $advert['thumbnail_url2'],
                    ];
                }

                $ret = $model->delete($id);
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
                if ($file['image_url1']) {
                    mv_file(C('IMAGE_SAVE_PATH_ROOT') . $file['image_url1']);
                }

                if ($file['thumbnail_url1']) {
                    mv_file(C('IMAGE_SAVE_PATH_ROOT') . $file['thumbnail_url1']);
                }
                if ($file['image_url2']) {
                    mv_file(C('IMAGE_SAVE_PATH_ROOT') . $file['image_url2']);
                }

                if ($file['thumbnail_url2']) {
                    mv_file(C('IMAGE_SAVE_PATH_ROOT') . $file['thumbnail_url2']);
                }
            }
        } catch (\Exception $ex) {
            \Think\Log::write('删除图片失败');
        }
    }

    /**
     * 数据提交
     */
    private function changeSubmit()
    {
        $paramter = $this->parameterCheck('change');
        $this->duplicateCheck($paramter, 'change');

        $data = array_merge([], $paramter);
        $data['update_time'] = (new \DateTime())->format('Y-m-d H:i:s');
        if ($data['desc']) {
            $data['desc'] = (new \Adminen\Common\Textarea($data['desc']))->convertEnterToBr();
        }

        $model = M('land_image');
        $ret = $model->where('land_image_id = %d', $paramter['land_image_id'])->save($data);
        if (false === $ret) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }

        $temp_log_string = '修改图片：' . $paramter['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 获取修改页面
     */
    private function changePage($type)
    {
        $land_image_id = I('get.land_image_id', 0, FILTER_VALIDATE_INT);
        if (!$land_image_id) {
            $this->show("参数错误");
            return;
        }

        $model = M('land_image');
        $image = $model->find($land_image_id);
        if ($image['desc']) {
            $image['desc'] = (new \Adminen\Common\Textarea($image['desc']))->convertBrToEnter();
        }
        if ('land' == $type) $tags_lists = C('LAND_TAGS');
        if ('hotel' == $type) $tags_lists = C('HOTEL_TAGS');
        $this->assign('lists', $tags_lists);
        $this->assign('image', $image);
        $this->display('add');
    }


    /**
     * 获取添加页面
     */
    private function addPage($type)
    {
        if ('land' == $type) $tags_lists = C('LAND_TAGS');
        if ('hotel' == $type) $tags_lists = C('HOTEL_TAGS');

        $this->assign('lists', $tags_lists);
        $this->display();
    }

    /**
     * 添加数据提交
     */
    private function addSubmit()
    {
        $paramter = $this->parameterCheck();
        $this->duplicateCheck($paramter);

        $data = array_merge([], $paramter);
        $data['staff_id'] = session('staff_id');
        if ($data['desc']) {
            $data['desc'] = (new \Adminen\Common\Textarea($data['desc']))->convertEnterToBr();
        }

        $model = M('land_image');
        $ret = $model->add($data);
        if (false === $ret) {
            $this->ajaxReturn(['status' => 'failed', 'message' => $model->getDbError()]);
        }

        $temp_log_string = '新增图片：' . $paramter['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 重复检查
     * @param $type  类型，add是新增，change是修改
     */
    private function duplicateCheck($paramter, $type = 'add')
    {
        $model = M('land_image');

        $where['land_id'] = $paramter['land_id'];
        $where['tags'] = $paramter['tags'];
        $where['name'] = $paramter['name'];

        if ($type == 'add') {
            $result = $model->where($where)->select();
        } else {
            $where['land_image_id'] = ['NEQ', $paramter['land_image_id']];
            $result = $model->where($where)->select();
        }

        if ($result) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '该图片名已经存在，请检查！']);
        }
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
                    'land_image_id' => ['type' => 'integer'],
                ]);
            } catch (\Exception $ex) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);

                exit;
            }
        }

        try {
            (new \Adminen\Common\Parameter\Validator())->execute(I('post.'), [
                'name' => ['type' => 'string'],
                'tags' => ['type' => 'string'],
                'desc' => ['type' => 'string', 'allow_empty' => true],
                'image_url1' => ['type' => 'string'],
                'thumbnail_url1' => ['type' => 'string', 'allow_empty' => true],
                'image_url2' => ['type' => 'string', 'allow_empty' => true],
                'thumbnail_url2' => ['type' => 'string', 'allow_empty' => true],
                'link_url1' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'link_url2' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'weight' => ['type' => 'integer'],
            ]);
        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => $ex->getMessage()]);
        }

        return I('post.');
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
                    'land_image_id' => ['type' => 'integer'],
                ]);
            }
        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);
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
                'land_id' => ['type' => 'integer'],
                'pg' => ['type' => 'integer', 'required' => false],
            ]);

        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => 'parameter error.']);
        }

        return I('get.');
    }
}