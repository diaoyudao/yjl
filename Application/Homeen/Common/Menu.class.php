<?php
namespace Homeen\Common;

class Menu
{
	public function getMenuLists()
	{
		$model = M('menu_level');

		$where['status'] = C('STATUS_VALID');
		$where['pid'] = 1000;
		$result = $model->where($where)->select();

		return $result;
	}
}