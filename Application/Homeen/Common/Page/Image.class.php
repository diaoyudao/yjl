<?php
namespace Homeen\Common\Page;

class Image
{
    private $_level_id;

    public  function __construct($level_id)
    {
        $this->_level_id = $level_id;
    }

    public function getImage($tags)
    {
        $model = M('Image');

        $where['status'] = C('STATUS_VALID');
        $where['level_id'] = $this->_level_id;
        $where['tags'] = $tags;

        $result = $model->where($where)->order('weight desc,begin_time desc')->select();

        return $result;
    }
    public function getMobileImage($tags)
    {
        $model = M('mobileImage');

        $where['status'] = C('STATUS_VALID');
        $where['level_id'] = $this->_level_id;
        $where['tags'] = $tags;

        $result = $model->where($where)->order('weight desc,begin_time desc')->select();

        return $result;
    }

}