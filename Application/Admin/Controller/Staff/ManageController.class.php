<?php
namespace Admin\Controller\Staff;

use Think\Controller;
use Admin\Common\Record\StaffLog;

class ManageController extends Controller
{
	public function lists()
	{
		$paramter = $this->searchParameterCheck();
		$where = $this->composeParam($paramter);
		$model = M('Staff');

		$counts = $model->where($where)->count();
		$page = new \Think\Page($counts, C('ONE_PAGE_SIZE'));
		$page->show();

		$staffs = $model->page(I('get.pg', 1, FILTER_VALIDATE_INT), C('ONE_PAGE_SIZE'))->where($where)->select();

		foreach ($staffs as &$item) {
			// 查询用户的角色
			$string = $this->getRoleNameByStaff($item['staff_id']);
			$item['role_names'] = $string;

			$string = $this->getMenuLevelByStaff($item['staff_id']);
			$item['menu_authority_names'] = $string;
		}
		//(new StaffLog)->add('查看列表');  // 日志记录

		$this->assign('pager', $page);
		$this->assign('counts', $counts);
		$this->assign('staffs', $staffs);
		$this->display();
	}

	/*
	 * param $paramter array
	 * 参数组装a
	 */
	private function composeParam($paramter)
	{
		if ($paramter['staff_code'] != null) {
			$where['staff_code'] = ["LIKE","%".$paramter['staff_code']."%"];

		}
		if ($paramter['name'] != null) {
			$where['name'] = ["LIKE","%".$paramter['name']."%"];
		}

		return $where;
	}


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
	 * 删除
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
		// 特殊处理，自己不能删除自己
		if ($parameter['staff_id'] == session('staff_id')) {
			$this->ajaxReturn(['status' => 'failed', 'message' => '不能删除自己']);
		}

		$staff = M('Staff');
		$staff_role = M('StaffRole');
		$staff->startTrans();
		try {
			$name = $staff->find($parameter['staff_id'])->name;
			// 删除用户角色关系表
			$staff_role->where('staff_id = %d', $parameter['staff_id'])->delete();
			// 删除用户
			$staff->delete($parameter['staff_id']);

			$staff->commit();
		} catch (\Exception $ex) {
			$staff->rollback();

			$this->ajaxReturn(['status' => 'failed', 'message' => '失败：' . $ex->getMessage()]);
		}

		$temp_log_string = '删除用户：' . $name;
		(new StaffLog)->add($temp_log_string);  // 日志记录

		$this->ajaxReturn(['status' => 'ok']);
	}

	/**
	 * 批量删除角色
	 */
	private function deleteBatch($parameter)
	{
		$temp_log_string = '批量删除用户：';

		// 特殊处理，自己不能删除自己
		foreach ($parameter['ids'] as $id) {
			if ($id == session('staff_id')) {
				$this->ajaxReturn(['status' => 'failed', 'message' => '不能删除自己']);
			}
		}

		$model = M('Staff');
		$staff_role = M('StaffRole');
		$model->startTrans();
		try {
			foreach ($parameter['ids'] as $id) {
				$name = $model->find($parameter['staff_id'])->name;
				// 删除用户角色关系表
				$staff_role->where('staff_id = %d', $id)->delete();
				// 删除用户
				$model->delete($id);

				$temp_log_string .= $name . ',';
			}
			$model->commit();
		} catch (\Exception $ex) {
			$model->rollback();

			$this->ajaxReturn(['status' => 'failed', 'message' => '失败：' . $ex->getMessage()]);
		}

		(new StaffLog)->add($temp_log_string);  // 日志记录

		$this->ajaxReturn(['status' => 'ok']);
	}

	public function status()
	{
		$this->display();
	}

	/**
	 * 数据提交
	 */
	private function changeSubmit()
	{
		$paramter = $this->parameterCheck('change');
		$this->duplicateCheck('change');

		$data = array_merge([], $paramter);
		$data['login_status'] = 2;

		$staff = M('Staff');
		$staff_role = M('StaffRole');
		$staff_menu = M('staff_menu');
		$staff->startTrans();
		try {			
			$staff->where('staff_id = %d', $paramter['staff_id'])->save($data);  // 修改staff
			$staff_role->where('staff_id = %d ', $paramter['staff_id'])->delete();   // 删除关系表记录
			$staff_menu->where('staff_id = %d ', $paramter['staff_id'])->delete();   // 删除关系表记录

			foreach ($paramter['roles'] as $role_id) {
				$arr_temp['staff_id'] = $paramter['staff_id'];
				$arr_temp['role_id'] = $role_id;

				$ret = $staff_role->add($arr_temp);
				if(false === $ret) {
					throw new \Exception($staff_menu->getDbError());
				}
			}

			foreach ($paramter['menu_authoritys'] as $item) {
				$arr_temp = [];
				$arr_temp['staff_id'] = $paramter['staff_id'];
				$arr_temp['menu_authority_id'] = $item;

				$ret = $staff_menu->add($arr_temp);
				if(false === $ret) {
					throw new \Exception($staff_menu->getDbError());
				}
			}

			$staff->commit();
		} catch (\Exception $ex) {
			$staff->rollback();

			$this->ajaxReturn(['status' => 'failed', 'message' => $ex->getMessage()]);
		}

		$temp_log_string = '修改用户：' . $paramter['name'];
		(new StaffLog)->add($temp_log_string);  // 日志记录

		$this->ajaxReturn(['status' => 'ok']);
	}

	/**
	 * 获取修改页面
	 */
	private function changePage()
	{
		$staff_id = I('get.id', 0, FILTER_VALIDATE_INT);
		if (!$staff_id) {
			$this->show("参数错误");
			return;
		}

		$model = M('Staff');
		$staff = $model->find($staff_id);

		$model = M('StaffRole');
		$use_roles = $model->where("staff_id = %d", $staff_id)->field('role_id')->select();

		$model = M('menu_authority');
		$menu_authority = $model->field('menu_authority_id,name')->select();

		$model = M('StaffMenu');
		$user_menu_authority = $model->where("staff_id = %d", $staff_id)->field('menu_authority_id')->select();

		$this->assign('staff', $staff);
		$this->assign('roles', M('Role')->select());
		$this->assign('menu_authority', $menu_authority);
		$this->assign('user_menu_authority', array_column($user_menu_authority, 'menu_authority_id'));
		$this->assign('use_roles', \Admin\Common\Base::array_column($use_roles, 'role_id'));

		$this->display('add');
	}

	/**
	 * 获取添加页面
	 */
	private function addPage()
	{
		$model = M('Role');
		$result = $model->field('role_id,name')->select();

		$model = M('menu_authority');
		$menu_authority = $model->field('menu_authority_id,name')->select();

		$this->assign('roles', $result);
		$this->assign('menu_authority', $menu_authority);
		$this->display();
	}

	private function getMenuLevelByStaff($staff_id) {
		$staff_role = M();
		$sql = "select name from staff_menu a join menu_authority b on b.menu_authority_id=a.menu_authority_id and a.staff_id=%d ";
		$names = $staff_role->query($sql, $staff_id);

		return implode(',', array_column($names, 'name'));
	}

	/**
	 * 通过用户获取角色名
	 * @return string
	 */
	private function getRoleNameByStaff($staff_id)
	{
		$staff_role = M();
		$sql = "select name from staff_role a join role b on b.role_id=a.role_id and a.staff_id=%d ";
		$names = $staff_role->query($sql, $staff_id);

		return implode(',', array_column($names, 'name'));
	}

	/**
	 * 添加数据提交
	 */
	private function addSubmit()
	{
		$paramter = $this->parameterCheck();
		$this->duplicateCheck();

		$data = array_merge([], $paramter);
		$data['password'] = md5(C('INIT_PASSWORD'));

		$staff = M('Staff');
		$staff_role = M('StaffRole');
		$staff_menu = M('staff_menu');
		$staff->startTrans();
		try {
			$staff_id = $staff->add($data);

			foreach ($paramter['roles'] as $role_id) {
				$arr_temp = [];
				$arr_temp['staff_id'] = $staff_id;
				$arr_temp['role_id'] = $role_id;

				$staff_role->add($arr_temp);
			}

			foreach ($paramter['menu_authoritys'] as $item) {
				$arr_temp = [];
				$arr_temp['staff_id'] = $staff_id;
				$arr_temp['menu_authority_id'] = $item;

				$staff_menu->add($arr_temp);
			}

			$staff->commit();
		} catch (\Exception $ex) {
			$staff->rollback();

			$this->ajaxReturn(['status' => 'failed', 'message' => $ex->getMessage()]);
		}

		$temp_log_string = '新增用户：' . $paramter['name'];
		(new StaffLog)->add($temp_log_string);  // 日志记录

		$this->ajaxReturn(['status' => 'ok']);
	}

	/**
	 * 重复检查
	 * @param $type  类型，add是新增，change是修改
	 */
	private function duplicateCheck($type = 'add')
	{
		$model = M('Staff');
		if ($type == 'add') {
			$result = $model->where("staff_code = '%s'", I('post.staff_code'))->select();
		} else {
			$result = $model->where("staff_code = '%s' and staff_id != %d", I('post.staff_code'), I('post.staff_id'))
				->select();
		}

		if ($result) {
			$this->ajaxReturn(['status' => 'failed', 'message' => '该用户已经存在，请检查！']);

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
					'staff_id' => ['type' => 'string'],
				]);
			} catch (\Exception $ex) {
				$this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！']);
				exit;
			}
		}

		if ($type == 'add' || $type == 'change') {
			try {
				(new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
					'staff_code' => ['type' => 'string'],
					'name' => ['type' => 'string'],
					'status' => ['enum_eq' => [1, 0]],
					'identity' => ['enum_eq' => [1, 2]],
					'phone' => ['type' => 'phone', 'allow_empty' => true],
					'email' => ['type' => 'email', 'allow_empty' => true],
					'department' => ['type' => 'string', 'allow_empty' => true],
					'position' => ['type' => 'string', 'allow_empty' => true],
					'roles' => [
						'required' => false,
						'type' => 'array',
						'value' => [
							'type' => 'integer'
						]
					],
					'menu_authoritys' => [
						'required' => false,
						'type' => 'array',
						'value' => [
							'type' => 'integer'
						]
					],
				]);
			} catch (\Exception $ex) {
				$this->ajaxReturn(['status' => 'failed', 'message' => $ex->getMessage()]);
				exit;
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
					'staff_id' => ['type' => 'integer'],
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
				'staff_code' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
				'name' => ['type' => 'string', 'required' => false, 'allow_empty' => true],

			]);

		} catch (\Exception $ex) {

			$this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);
		}

		return I('get.');
	}
}