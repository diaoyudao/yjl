<?php
namespace Home\Common;

class Advert 
{
    public function getDataByTags($tags)
    {
        $model = M('advert');

        $where['status'] = C('STATUS_VALID');
        $where['show_flag'] = $tags;
        $result = $model->where($where)->select();

        return $result;
    }
}