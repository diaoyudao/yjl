<?php
namespace Admin\Controller\Role;

use Think\Controller;
use Admin\Common\Record\StaffLog;

class ManageController extends Controller
{
    public function lists()
    {
        $model = M('Role');
        $paramter = $this->searchParameterCheck();
        $where = $this->composeParam($paramter);

        $counts = $model->where($where)->count();
        $page = new \Think\Page($counts, C('ONE_PAGE_SIZE'));
        $page->show();

        $datas = $model->page(I('get.pg', 1, FILTER_VALIDATE_INT), C('ONE_PAGE_SIZE'))->where($where)->select();

        $result = [];
        foreach ($datas as $item) {
            // 查询角色的用
            $string = $this->getStaffNameByRole($item['role_id']);
            $item['staff_name'] = $string;

            $result[] = $item;
        }
        //(new StaffLog)->add('查看列表');  // 日志记录

        $this->assign('pager', $page);
        $this->assign('counts', $counts);
        $this->assign('datas', $result);
        $this->display();
    }

    /*
     * param $paramter array
     * 参数组装a
     */
    private function composeParam($paramter)
    {
        if ($paramter['name'] != null) {
            $where['name'] = ["LIKE", "%" . $paramter['name'] . "%"];
        }

        return $where;
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

        $temp = I('post.batch', '');
        if (!empty($temp)) {
            // 批量删除
            $this->deleteBatch($parameter);
            return;
        }

        $this->deleteOne($parameter);
    }

    private function deleteOne($parameter)
    {
        // 特殊处理，超级管理员不能修改和删除
        if ($parameter['role_id'] == C('SELF_SYSTEMADMIN.role_id')) {
            $this->ajaxReturn([
                'status' => 'failed',
                'message' => C('SELF_SYSTEMADMIN.name') . '不能修改或删除！'
            ]);
        }

        $model = M('Role');
        $role = $model->find($parameter['role_id']);
        $model->delete(I('post.role_id'));

        $temp_log_string = '删除角色：' . $role['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 批量删除角色
     * @request {
     *      role_id: (integer),
     * }
     */
    private function deleteBatch($parameter)
    {
        $temp_log_string = '删除角色：';

        // 特殊处理，超级管理员不能修改和删除
        foreach ($parameter['ids'] as $id) {
            if ($id == C('SELF_SYSTEMADMIN.role_id')) {
                $this->ajaxReturn([
                    'status' => 'failed',
                    'message' => C('SELF_SYSTEMADMIN.name') . '不能修改或删除！'
                ]);
            }
        }

        $model = M('Role');
        $model->execute('begin');
        try {
            foreach ($parameter['ids'] as $id) {
                $role = $model->find($id);
                $temp_log_string .= $role['name'] . ',';
                $model->delete($id);
            }
            $model->execute('commit');
        } catch (\Exception $ex) {
            $model->execute('rollback');

            $this->ajaxReturn([
                'status' => 'failed',
                'message' => '失败：' . $ex->getMessage()
            ]);
        }

        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 数据提交
     */
    private function changeSubmit()
    {
        $this->parameterCheck('change');

        $this->duplicateCheck('change');

        // 特殊处理，超级管理员不能修改和删除
        if (I('post.role_id') == C('SELF_SYSTEMADMIN.role_id')) {
            $this->ajaxReturn([
                'status' => 'failed',
                'message' => C('SELF_SYSTEMADMIN.name') . '不能修改或删除！'
            ]);
        }

        $paramter = I('post.');
        $data['name'] = $paramter['name'];
        $data['note'] = $paramter['note'];

        $string = implode(',', $paramter['privileges']);
        $data['menus'] = $string;
        try {
            $model = M('Role');
            $model->where('role_id = %d', $paramter['role_id'])->save($data);

            (new \Admin\Common\Service)->changeStaffLoginStatusByRoleId($paramter['role_id']);
        } catch (\Exception $ex) {
            $this->ajaxReturn([
                'status' => 'failed',
                'message' => $ex->getMessage()
            ]);
        }

        $temp_log_string = '修改角色：' . $paramter['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 获取修改页面
     */
    private function changePage()
    {
        $role_id = I('get.id', 0, FILTER_VALIDATE_INT);
        if (!$role_id) {
            $this->show("参数错误");
            return;
        }

        // 特殊处理，超级管理员不能修改和删除
        if ($role_id == C('SELF_SYSTEMADMIN.role_id')) {
            $this->show(C('SELF_SYSTEMADMIN.name') . '不能修改或删除！');
            return;
        }

        $model = M('Role');
        $role = $model->find($role_id);
        //var_dump($role);
        //$role['menus'] = explode(',', $role['menus']);
        $this->assign('role', $role);
        $this->display('add');
    }


    /**
     * 获取添加页面
     */
    private function addPage()
    {
        $this->display();
    }

    /**
     * 添加数据提交
     */
    private function addSubmit()
    {
        $paramter=$this->parameterCheck();

        $this->duplicateCheck();

        // $paramter = I('post.');
//        dump($paramter);
        $data['name'] = $paramter['name'];
        $data['note'] = $paramter['note'];
        $string = implode(',', $paramter['privileges']);
        $data['menus'] = $string;
        try {
            $model = M('Role');
            $model->add($data);            
        } catch (\Exception $ex) {
            $this->ajaxReturn([
                'status' => 'failed',
                'message' => $ex->getMessage()
            ]);
        }

        $temp_log_string = '新增角色：' . $paramter['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }


    /**
     * 通过角色获取用户姓名
     * @return string
     */
    private function getStaffNameByRole($role_id)
    {
        $staff_role = M();
        $sql = "select name from staff_role a join staff on staff.staff_id=a.staff_id and role_id=%d ";
        $names = $staff_role->query($sql, $role_id);

        return implode(',', \Admin\Common\Base::array_column($names, 'name'));
    }

    /**
     * 重复检查
     * @param $type  类型，add是新增，change是修改
     */
    private function duplicateCheck($type = 'add')
    {
        $model = M('Role');
        if ($type == 'add') {
            $result = $model->where("name = '%s'", I('post.name'))->select();
        } else {
            $result = $model->where("name = '%s' and role_id != %d", I('post.name'), I('post.role_id'))
                ->select();
        }

        if ($result) {
            $this->ajaxReturn([
                'status' => 'failed',
                'message' => '该角色已经存在，请检查！'
            ]);

            exit;
        }
    }

    /**
     * 入参检查
     * @param $type [add|change|delete|batchdelete]
     * @return  post参数数组
     */
    private function parameterCheck($type = 'add')
    {
        if ($type == 'change') {
            try {
                (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                    'role_id' => ['type' => 'integer'],
                ]);
            } catch (\Exception $ex) {

                $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);
            }
        }

        if ($type == 'add' || $type == 'change') {
            try {
                (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                    'name' => ['type' => 'string'],
                    'note' => [
                        'type' => 'string',
                        'required' => false,
                        'allow_empty' => true
                    ],
                    'privileges' => [
                        'required' => false,
                        'allow_empty' => true,
                        'type' => 'array',
                        'value' => [
                            'type' => 'string'
                        ]
                    ],
                ]);
            } catch (\Exception $ex) {

                $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！']);
            }
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
                    'role_id' => ['type' => 'integer'],
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
                'name' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
            ]);

        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);
        }

        return I('get.');
    }
}