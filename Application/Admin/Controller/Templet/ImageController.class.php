<?php
namespace Admin\Controller\Templet;

use Think\Controller;
use Admin\Common\Record\StaffLog;

/**
 * 后台管理登录
 * @package Admin\Controller
 */
class ImageController extends Controller
{
    public function lists()
    {
        $model = M('image');

        $paramter = $this->searchParameterCheck();
        $where = $this->composeParam($paramter);

        $count = $model->where($where)->count();

        $page = new \Think\Page($count, C('ONE_PAGE_SIZE'));
        $page->show();

        $result = $model->page(I('get.pg', 1, FILTER_VALIDATE_INT), C('ONE_PAGE_SIZE'))
            ->where($where)->order('level_id,tags,weight desc,begin_time desc')->select();
        //(new StaffLog)->add('查看列表');  // 日志记录

        $menu_app = new \Admin\Common\Menu();

        foreach ($result as &$item) {
            $item['menu_name'] = $menu_app->getMenuName($item['level_id']);
        }

        $source_levels = C('MENU_IMAGE_LEVELS');
        $filter_levels = (new \Admin\Common\MenuPrivilege())->filterAuthorityLevels($source_levels);
        
        $this->assign('counts', $count);
        $this->assign('pager', $page);
        $this->assign('images', $result);
        $this->assign('select_levels', $filter_levels);
        $this->display();
    }

    /**
     * 新增
     */
    public function add()
    {
        if (IS_GET) {  // 获取页面
            $this->addPage();
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
            $this->changePage();
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

        if (!empty($paramter['name'])) {
            $where['name'] = ['like', '%' . $paramter['name'] . '%'];
        }

        return $where;
    }

    private function deleteOne($parameter)
    {
        $model = M('image');
        $advert = $model->find($parameter['image_id']);

        $ret = $model->delete($parameter['image_id']);
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
        $model = M('image');
        $model->startTrans();
        try {
            foreach ($parameter['ids'] as $id) {
                $advert = $model->find($id);
                if ($advert['image_url']) {
                    $files[] = [
                        'image_url' => $advert['image_url'],
                        'thumbnail_url' => $advert['thumbnail_url'],
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
                if ($file['image_url']) {
                    mv_file(C('IMAGE_SAVE_PATH_ROOT') . $file['image_url']);
                }

                if ($file['thumbnail_url']) {
                    mv_file(C('IMAGE_SAVE_PATH_ROOT') . $file['thumbnail_url']);
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

        $model = M('image');
        $ret = $model->where('image_id = %d', $paramter['image_id'])->save($data);
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
    private function changePage()
    {
        $image_id = I('get.image_id', 0, FILTER_VALIDATE_INT);
        if (!$image_id) {
            $this->show("参数错误");
            return;
        }

        $model = M('image');
        $advert = $model->find($image_id);
        if ($advert['desc']) {
            $advert['desc'] = (new \Admin\Common\Textarea($advert['desc']))->convertBrToEnter();
        }

        $source_levels = C('MENU_IMAGE_LEVELS');
        $select_levels = (new \Admin\Common\MenuPrivilege())->filterAuthorityLevels($source_levels);
        $tags_type=[];
        foreach ($select_levels as $key=>$val){
            if($val['level_id']==$advert['level_id']){
                $tags_type=$val['tags_type'];
            }
        }
        $this->assign('select_levels', $select_levels);
        $this->assign('tags_type', $tags_type);
        $this->assign('image', $advert);
        $this->display('add');
    }


    /**
     * 获取添加页面
     */
    private function addPage()
    {
        $source_levels = C('MENU_IMAGE_LEVELS');
        $select_levels = (new \Admin\Common\MenuPrivilege())->filterAuthorityLevels($source_levels);
        $this->assign('select_levels', $select_levels);
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

        $model = M('image');
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
        $model = M('image');

        $where['tags'] = $paramter['tags'];
        $where['level_id'] = $paramter['level_id'];
        $where['name'] = $paramter['name'];

        if ($type == 'add') {
            $result = $model->where($where)->select();
        } else {
            $where['image_id'] = ['NEQ', $paramter['image_id']];
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
                (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                    'image_id' => ['type' => 'integer'],
                ]);
            } catch (\Exception $ex) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);

                exit;
            }
        }

        try {
            (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                'level_id' => ['type' => 'integer'],
                'name' => ['type' => 'string'],
                'tags' => ['type' => 'string'],
                'desc' => ['type' => 'string', 'allow_empty' => true],
                'image_url1' => ['type' => 'string'],
                'thumbnail_url1' => ['type' => 'string', 'allow_empty' => true],
                'image_url2' => ['type' => 'string', 'allow_empty' => true],
                'thumbnail_url2' => ['type' => 'string', 'allow_empty' => true],
                'link_url1' => ['type' => 'string','allow_empty' => true],
                'link_url2' => ['type' => 'string','required' => false, 'allow_empty' => true],
                'weight' => ['type' => 'integer'],
                'status' => ['enum_eq' => [0, 1]],
                'begin_time' => ['type' => 'string', 'allow_empty' => true],
                'end_time' => ['type' => 'string', 'allow_empty' => true],
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
        if ($paramter['desc']) {
            $paramter['desc'] = (new \Admin\Common\Textarea($paramter['desc']))->convertEnterToBr();
        }

        return $paramter;
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
                    'image_id' => ['type' => 'integer'],
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
            (new \Admin\Common\Parameter\Validator())->execute(I('get.'), [
                'pg' => ['type' => 'integer', 'required' => false],
            ]);

        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => 'parameter error.']);
        }

        return I('get.');
    }
}