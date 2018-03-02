<?php
namespace Homeen\Common;

class Service
{
    /**
    * 获取集团二维码
    */
	public static function getTwoBarCodes()
	{
        $home_level_id = 10000;
        $tags = '微信二维码';
        
		$model = M('image');

		$where['status'] = C('STATUS_VALID');        
		$where['level_id'] = $home_level_id;
        $where['tags'] = $tags;
        
		$result = $model->where($where)->limit(1)->select();

		return $result[0] ?? [];
	}
}