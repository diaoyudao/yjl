<?php
namespace Home\Common\Page;

class Notice
{
    private $_level_id;

    public function __construct($level_id)
    {
        $this->_level_id = $level_id;
    }

    public function getNotice($tags, $where = [], $limit = null, $order = null)
    {
        $model = M('notice');

        $where['status'] = C('STATUS_VALID');
        $where['level_id'] = $this->_level_id;
        if ($tags) {
            $where['tags'] = $tags;
        }

        if (empty($where['begin_time'])) {
            $where['begin_time'] = ['ELT', (new \DateTime())->format('Y-m-d')];
        }
        if (empty($where['end_time'])) {
            $temp_str = "end_time is null or end_time >= '" . (new \DateTime())->format('Y-m-d') . "'";
            if(!empty($where['_string'])) {
                $where['_string'] = ' (' . $where['_string'] . ') and (' . $temp_str . ') ';
            } else {
                $where['_string'] = $temp_str;
            }            
        }

        $order = $order ?? 'tags desc,weight desc,begin_time desc';
        $total_count = $model->where($where)->count();
        $result = $model->where($where)->order($order)->limit($limit)
        ->select();
        return [$total_count, $result];
    }

}