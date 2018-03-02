<?php
namespace Adminen\Controller\Templet;

use Think\Controller;
use Adminen\Common\Record\StaffLog;

/**
 * 后台管理登录
 * @package Admin\Controller
 */
class TypeController extends Controller
{
    public function lists()
    {
        $model = M('type');

        $paramter = $this->searchParameterCheck();
        $where = $this->composeParam($paramter);

        $count = $model->where($where)->count();

        $page = new \Think\Page($count, C('ONE_PAGE_SIZE'));
        $page->show();

        $result = $model->page(I('get.pg', 1, FILTER_VALIDATE_INT), C('ONE_PAGE_SIZE'))
            ->where($where)->order('tags,weight desc')->select();
        //(new StaffLog)->add('查看列表');  // 日志记录

        $menu_app = new \Adminen\Common\Menu();

        $source_levels = C('MENU_TYPE_LEVELS');
        $select_levels = (new \Adminen\Common\MenuPrivilege())->filterAuthorityLevels($source_levels);

        foreach ($result as &$item) {
            $item['menu_name'] = $menu_app->getMenuName($item['level_id']);
        }
        $type_lists=C('TYPE_TAGS');
        $this->assign('lists', $type_lists);
        $this->assign('select_levels', $select_levels);
        $this->assign('counts', $count);
        $this->assign('pager', $page);
        $this->assign('types', $result);
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
        $where = (new \Adminen\Common\MenuPrivilege())->mergeLevelWhere();

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
        $model = M('type');
        $advert = $model->find($parameter['type_id']);

        // 判断是否在使用
        $where['type'] = ['like', '%'.$advert['name'].'%'];
        $count = M('land')->where($where)->count();
        if(0 < $count) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '该类型已被关联表使用，请先删除关联数据']);
        }

        $ret = $model->delete($parameter['type_id']);
        if (false === $ret) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }

        $temp_log_string = '删除类型：' . $advert['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 批量删除角色
     */
    private function deleteBatch($parameter)
    {
        $temp_log_string = '批量删除类型：';

        $files = [];
        $model = M('type');
        $model->startTrans();
        try {
            foreach ($parameter['ids'] as $id) {
                $advert = $model->find($id);
                if ($advert['type_url']) {
                    $files[] = [
                        'type_url' => $advert['type_url'],
                        'thumbnail_url' => $advert['thumbnail_url'],
                    ];
                }

                $where['type'] = ['like', '%'.$advert['name'].'%'];
                $count = M('land')->where($where)->count();
                if(0 < $count) {
                    $model->rollback();

                    $this->ajaxReturn(['status' => 'failed', 'message' => '该类型已被关联表使用，请先删除关联数据']);
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

        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
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

        if($data['note']) {
            $data['note'] = (new \Adminen\Common\Textarea($data['note']))->convertEnterToBr();
        }

        $model = M('type');
        $ret = $model->where('type_id = %d', $paramter['type_id'])->save($data);
        if (false === $ret) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }

        $temp_log_string = '修改类型：' . $paramter['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 获取修改页面
     */
    private function changePage()
    {
        $type_id = I('get.type_id', 0, FILTER_VALIDATE_INT);
        if (!$type_id) {
            $this->show("参数错误");
            return;
        }

        $model = M('type');
        $advert = $model->find($type_id);
        if($advert['note']) {
            $advert['note'] = (new \Adminen\Common\Textarea($advert['note']))->convertBrToEnter();
        }

        $source_levels = C('MENU_TYPE_LEVELS');
        $select_levels = (new \Adminen\Common\MenuPrivilege())->filterAuthorityLevels($source_levels);

        $type_lists=C('TYPE_TAGS');

        $this->assign('lists', $type_lists);
        $this->assign('select_levels', $select_levels);
        $this->assign('type', $advert);
        $this->display('add');
    }


    /**
     * 获取添加页面
     */
    private function addPage()
    {
        $source_levels = C('MENU_TYPE_LEVELS');
        $select_levels = (new \Adminen\Common\MenuPrivilege())->filterAuthorityLevels($source_levels);

        $type_lists=C('TYPE_TAGS');

        $this->assign('select_levels', $select_levels);
        $this->assign('lists', $type_lists);
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

        if($data['note']) {
            $data['note'] = (new \Adminen\Common\Textarea($data['note']))->convertEnterToBr();
        }

        $model = M('type');
        $ret = $model->add($data);
        if (false === $ret) {
            $this->ajaxReturn(['status' => 'failed', 'message' => $model->getDbError()]);
        }

        $temp_log_string = '新增类型：' . $paramter['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 重复检查
     * @param $type  类型，add是新增，change是修改
     */
    private function duplicateCheck($paramter, $type = 'add')
    {
        $model = M('type');
        
        $where['level_id'] = $paramter['level_id'];
        $where['tags'] = $paramter['tags'];
        $where['name'] = $paramter['name'];

        if ($type == 'add') {
            $result = $model->where($where)->select();
        } else {
            $where['type_id'] = ['NEQ', $paramter['type_id']];
            $result = $model->where($where)->select();
        }

        if ($result) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '该类型名已经存在，请检查！']);
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
                    'type_id' => ['type' => 'integer'],
                ]);
            } catch (\Exception $ex) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);

                exit;
            }
        }

        try {
            (new \Adminen\Common\Parameter\Validator())->execute(I('post.'), [
                'level_id' => ['type' => 'integer'],
                'name' => ['type' => 'string'],
                'code' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'tags' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'note' => ['type' => 'string', 'allow_empty' => true],
                'weight' => ['type' => 'integer'],
                'status' => ['enum_eq' => [0, 1]],
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
                    'type_id' => ['type' => 'integer'],
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
                'pg' => ['type' => 'integer', 'required' => false],
            ]);

        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => 'parameter error.']);
        }

        return I('get.');
    }
}