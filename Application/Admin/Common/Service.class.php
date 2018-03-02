<?php
namespace Admin\Common;
/**
 * @desc 公共函数操作类
 * Class Service
 * @package Admin\Common
 */
class Service
{
	public function getStaffByRoleId($role_id)
	{
		$staff_role = M();
        $sql = "select staff.* from staff_role a join staff on staff.staff_id=a.staff_id and role_id=%d ";
        $staffs = $staff_role->query($sql, $role_id);

        return $staffs;
	}

	public function getStaffByMenuAuthor($menu_authority_id)
	{
		$staff = M();
		$sql = "select staff.* from staff_menu a ,staff where staff.staff_id=a.staff_id and menu_authority_id=%d ";
		$staffs = $staff->query($sql, $menu_authority_id);

		return $staffs;
	}


	public function changeStaffLoginStatusByRoleId($role_id)
	{
		$staffs = $this->getStaffByRoleId($role_id);
		$model = M('staff');
		$data['login_status'] = 2;

		foreach ($staffs as $item) {
			$data['staff_id'] = $item['staff_id'];
			$model->save($data);
		}
	}

	public function changeStaffLoginStatusByMenuAuthorId($menu_authority_id)
	{
		$staffs = $this->getStaffByMenuAuthor($menu_authority_id);
		$model = M('staff');
		$data['login_status'] = 2;

		foreach ($staffs as $item) {
			$data['staff_id'] = $item['staff_id'];
			$model->save($data);
		}
	}
}