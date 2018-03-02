<?php
namespace Home\Common\Page;

class Video
{
    private $_level_id;

    public  function __construct($level_id)
    {
        $this->_level_id = $level_id;
    }

    public function getVideo($tags,$data,$limit = null)
    {
        $model = M('Video');
        if($data)$where=array_merge([],$data);
        $where['status'] = C('STATUS_VALID');
        $where['level_id'] = $this->_level_id;
        if($tags)$where['tags'] = $tags;
        $result = $model->where($where)->order('weight desc,begin_time desc')->limit($limit)->select();

        return $result;
    }

    public function getVideoById($video_id)
    {
        $model = M('Video');

        $result = $model->find($video_id);

        return $result;
    }

}