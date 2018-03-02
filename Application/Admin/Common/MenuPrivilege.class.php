<?php
namespace Admin\Common;
/**
 * @privilege_group
 * Class MenuPrivilege
 */
class MenuPrivilege
{
	protected $staff_id;

	public function __construct()
	{
		$this->staff_id = session('staff_id');
	}

	public function getStaffMenu()
	{
		$model = M('staff_menu');
		$where['staff_id'] = $this->staff_id;
		$result = $model->where($where)->select();

		return $result;
	}

	public function getStaffByMenuAuthority($menu_authoritys)
	{
		$model = M('staff_menu');

		$where['menu_authority_id'] = ['in', $menu_authoritys];
		$result = $model->distinct(true)->field('staff_id')->where($where)->select();

		return array_column($result, 'staff_id');
	}

	public function getMenuLevelByAuthority($menu_authoritys)
	{
		$result = '';
		$model = M('menu_authority');

		foreach ($menu_authoritys as $item) {
			$ret = $model->find($item);

			$result = ('' === $result) ? $ret['menus'] :  $result . ',' . $ret['menus'];
		}

		return $result;
	}

	public function mergeStaffWhere()
	{
		$staff_menus = $this->getStaffMenu();

		$staff_arr = $this->getStaffByMenuAuthority(array_column($staff_menus, 'menu_authority_id'));

		$where['staff_id'] = ['in', $staff_arr];

		return $where;
	}

	public function mergeLevelWhere()
	{
		if($this->isAdminStaff()) {
			return [];
		}

		$staff_menus = $this->getStaffMenu();

		$levels = $this->getMenuLevelByAuthority(array_column($staff_menus, 'menu_authority_id'));

		$where['level_id'] = ['in', $levels];

		return $where;
	}

	public function filterAuthorityLevels($source_levels)
	{
		$is_root = $this->isAdminStaff();

		$staff_menus = $this->getStaffMenu();
		$levels = $this->getMenuLevelByAuthority(array_column($staff_menus, 'menu_authority_id'));
		$levels .= ',';

		$result = [];		
        foreach ($source_levels as $item) {
            if(false === strpos($levels, $item['level_id'].',') && !$is_root) {

                continue;
            }

			$temp['tags_type'] = $item['tags_type'];
			$temp['name'] = $item['name'];
            $temp['level_id'] = $item['level_id'];
            $result[] = $temp;


           	foreach ($item['children']??[] as $item2) {
           		if(false === strpos($levels, $item2['level_id'].',') && !$is_root) {

                	continue;
            	}
				$temp['tags_type'] = $item2['tags_type'];
            	$temp['name'] = '　' . $item2['name'];
            	$temp['level_id'] = $item2['level_id'];
            	$result[] = $temp;

            	foreach ($item2['children']??[] as $item3) {
           			if(false === strpos($levels, $item3['level_id'].',') && !$is_root) {

                		continue;
            		}
					$temp['tags_type'] = $item3['tags_type'];
            		$temp['name'] = '　　' . $item3['name'];
            		$temp['level_id'] = $item3['level_id'];
            		$result[] = $temp;
            	}
            }
        }

        return $result;
	}

	private function isAdminStaff()
	{		
		$role = (new \Admin\Common\Privilege)->getRoleByStaffId($this->staff_id);

		$temp_arr = array_column($role, 'role_id');

		if(in_array('10000', $temp_arr)) {
			return true;
		}

		return false;
	}
}