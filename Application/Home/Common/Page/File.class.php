<?php
namespace Home\Common\Page;

class File
{
    const LIMIT_COUNT = 10;
    private $_level_id;

    public  function __construct($level_id)
    {
        $this->_level_id = $level_id;
    }

    public function getFile($tags, $limit = null)
    {
        $model = M('File');

        $where['status'] = C('STATUS_VALID');
        $where['level_id'] = $this->_level_id;
        if($tags)$where['tags'] = $tags;
        $result = $model->where($where)->order('tags desc,weight desc,begin_time desc')->limit($limit)->select();

        return $result;
    }
}