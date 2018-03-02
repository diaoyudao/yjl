<?php
namespace Admin\Controller\Menu;

use Think\Controller;
use Admin\Common\Record\StaffLog;

class AuthorityController extends Controller
{
	public function lists()
	{
		$paramter = $this->searchParameterCheck();
		$where = $this->composeParam($paramter);

		$model = M('menu_authority');
		$counts = $model->where($where)->count();
		$page = new \Think\Page($counts, C('ONE_PAGE_SIZE'));
		$page->show();

		$datas = $model->page(I('get.pg', 1, FILTER_VALIDATE_INT), C('ONE_PAGE_SIZE'))->where($where)->select();

		$result = [];
		foreach ($datas as $item) {
			// 查询栏目权限的用
			$string = $this->getStaffNameByMenuAuthority($item['menu_authority_id']);
			$item['staff_name'] = $string;

			$result[] = $item;
		}

		//(new StaffLog)->add('查看列表');  // 日志记录

		$this->assign('pager', $page);
		$this->assign('counts', $counts);
		$this->assign('datas', $result);
		$this->display();
	}

	public function add()
	{
		if(IS_GET) {
			$this->addPage();

			return;
		}

		$this->addSubmit();
	}

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
	 * 数据提交
	 */
	private function changeSubmit()
	{
		$this->parameterCheck('change');
		$this->duplicateCheck('change');

		$paramter = I('post.');
		$data['name'] = $paramter['name'];
		$data['note'] = $paramter['note'];
		$string = implode(',', $paramter['privileges']);
		$data['menus'] = $string;

		try {
			$model = M('menu_authority');
			$model->where('menu_authority_id = %d', $paramter['menu_authority_id'])->save($data);

			(new \Admin\Common\Service)->changeStaffLoginStatusByMenuAuthorId($paramter['menu_authority_id']);
		} catch (\Exception $ex) {
			$this->ajaxReturn([
				'status' => 'failed',
				'message' => $ex->getMessage()
			]);
		}

		$temp_log_string = '修改栏目权限：' . $paramter['name'];
		(new StaffLog)->add($temp_log_string);  // 日志记录

		$this->ajaxReturn(['status' => 'ok']);
	}

	/**
	 * 获取修改页面
	 */
	private function changePage()
	{
		$menu_authority_id = I('get.id', 0, FILTER_VALIDATE_INT);
		if (!$menu_authority_id) {
			$this->show("参数错误");
			return;
		}

		$model = M('menu_authority');
		$menu_authority = $model->find($menu_authority_id);
		//var_dump($role);
		//$role['menus'] = explode(',', $role['menus']);


		$this->assign('menu_authority', $menu_authority);
		$this->display('add');
	}

	private function deleteOne($parameter)
	{
		$model = M('menu_authority');
		$role = $model->find($parameter['menu_authority_id']);
		$model->delete(I('post.menu_authority_id'));

		$temp_log_string = '删除栏目权限：' . $role['name'];
		(new StaffLog)->add($temp_log_string);  // 日志记录

		$this->ajaxReturn(['status' => 'ok']);
	}

	/**
	 * 批量删除栏目权限
	 * @request {
	 *      menu_authority_id: (integer),
	 * }
	 */
	private function deleteBatch($parameter)
	{
		$temp_log_string = '删除栏目权限：';

		$model = M('menu_authority');
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
		$this->parameterCheck();

		$this->duplicateCheck();

		$paramter = I('post.');
		$data['name'] = $paramter['name'];
		$data['note'] = $paramter['note'];
		$string = implode(',', $paramter['privileges']);
		$data['menus'] = $string;

		try {
			$model = M('menu_authority');
			$model->add($data);
		} catch (\Exception $ex) {
			$this->ajaxReturn([
				'status' => 'failed',
				'message' => $ex->getMessage()
			]);
		}

		$temp_log_string = '新增栏目权限：' . $paramter['name'];
		(new StaffLog)->add($temp_log_string);  // 日志记录

		$this->ajaxReturn(['status' => 'ok']);
	}

	/*
	 * param $paramter array  // 参数组装
	 * 
	 */
	private function composeParam($paramter)
	{
		if ($paramter['name'] != null) {
			$where['name'] = ["LIKE","%".$paramter['name']."%"];
		}

		return $where;
	}

	/**
	 * 通过栏目权限获取用户姓名
	 * @return string
	 */
	private function getStaffNameByMenuAuthority($menu_authority_id)
	{
		$staff_role = M();
		$sql = "select name from staff_menu a ,staff where staff.staff_id=a.staff_id and menu_authority_id=%d ";
		$names = $staff_role->query($sql, $menu_authority_id);

		return implode(',', \Admin\Common\Base::array_column($names, 'name'));
	}

	/**
	 * 重复检查
	 * @param $type  类型，add是新增，change是修改
	 */
	private function duplicateCheck($type = 'add')
	{
		$model = M('menu_authority');
		if ($type == 'add') {
			$result = $model->where("name = '%s'", I('post.name'))->select();
		} else {
			$result = $model->where("name = '%s' and menu_authority_id != %d", I('post.name'), I('post.menu_authority_id'))
				->select();
		}

		if ($result) {
			$this->ajaxReturn([
				'status' => 'failed',
				'message' => '该栏目权限名称已经存在，请检查！'
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
					'menu_authority_id' => ['type' => 'integer'],
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
					'menu_authority_id' => ['type' => 'integer'],
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