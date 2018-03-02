<?php
namespace Home\Common;

/**
 * 层级处理类
 *
 */
class Level
{
    public $list_levels = [];
    public $select_levels = [];

    public function getListLevels()
    {
        return $this->list_levels;
    }

    public function getSelectLevels()
    {
        return $this->select_levels;
    }

    /**
     * 递归查询，包含层级内容和选中层级
     * @param $datas  查询的层级内容
     * @param $level_id 需要查询的层级id
     */
    public function mergeSelectNodes($datas, $level_id, $depth = 1, $max_depth = -1)
    {
        if (0 < $max_depth && $depth > $max_depth) {
            return;
        }
        // 查找是否有子节点
        foreach ($datas as $item) {
            if ($item['pid'] == $level_id) {
                $name = $item['name'];
                for ($i = 1; $i <= $depth; $i++) {
                    $name = '　' . $name;
                }
                $this->select_levels[] = ['name' => $name, 'value' => $item['level_id']];
                $temp = $depth + 1;
                $this->mergeSelectNodes($datas, $item['level_id'], $temp);
            }
        }
    }

    public function mergeListSelectNodes($datas, $level_id, $depth = 1)
    {
        // 查找是否有子节点
        foreach ($datas as $item) {
            if ($item['pid'] == $level_id) {
                $item['open'] = true;
                $this->list_levels[] = $item;
                $name = $item['name'];
                for ($i = 1; $i <= $depth; $i++) {
                    $name = '　' . $name;
                }
                $this->select_levels[] = ['name' => $name, 'value' => $item['level_id']];
                $this->mergeListSelectNodes($datas, $item['level_id'], ++$depth);
            }
        }
    }

    /**
     * 名称模糊查询
     */
    public function getLevelByName($levels, $name)
    {
        // 查询需要的层级节点
        $this->list_levels = [];

        // 获取当前层级
        $cur_levels = [];
        foreach ($levels as $item) {
            if (false !== stripos($item['name'], $name)) {
                $cur_levels[] = $item;
            }
        }

        foreach ($cur_levels as $item) {

            $this->getLevelById($levels, $item);
        }
    }

    /**
     * 获取某个节点的所有子节点,含当前节点。
     */
    public function getCurSonLevelById($levels, $cur_level_id)
    {
        $cur_level = [];
        foreach ($levels as $item) {
            if ($cur_level_id === (int)$item['level_id']) {
                $cur_level = $item;
                $this->list_levels[] = $item;

                break;
            }
        }

        $this->getLevelById($levels, $cur_level);

        return;
    }

    /**
     * 获取某个节点的所有子节点。
     */
    public function getLevelById($levels, $cur_level)
    {
        if (empty($cur_level)) {
            return;
        }

        $merge_parent_name = $this->mergeParentNodeName($levels, $cur_level['pid'], $cur_level['name']);

        $this->getChildrenNodes($levels, $cur_level, $merge_parent_name);
    }

    public function getAllParentName($levels, $level_id)
    {
        // 获取当前层级     
        foreach ($levels as $item) {
            if ($level_id == $item['level_id']) {
                $level = $item;
                break;
            }
        }
    }

    public function mergeParentNodeName($levels, $pid, $merge_name, $oper = ' ')
    {
        if (!$pid) {
            return $merge_name;
        }
        // 获取当前层级     
        foreach ($levels as $item) {
            if ($pid == $item['level_id']) {
                $merge_name = $merge_name ? $item['name'] . $oper . $merge_name : $item['name'];

                if (!$item['pid']) {
                    return $merge_name;
                } else {
                    return $this->mergeParentNodeName($levels, $item['pid'], $merge_name, $oper);
                }
            }
        }
    }

    /**
     * 递归查询所有子节点，放入list_levels成员中，包含本节点
     * @param $datas
     * @param $level_id // 当前节点id
     * @param $marge_name //传入所以父节点和本节点名称合并结果
     */
    public function getChildrenNodes($datas, $cur_level, $marge_name = '')
    {
        $cur_level['marge_name'] = $marge_name;

        // 查找是否有子节点
        $tags = false;
        foreach ($datas as $item) {
            if ($item['pid'] == $cur_level['level_id']) {
                $temp_name = empty($marge_name) ? $item['name'] : $marge_name . ' ' . $item['name'];

                $tags = true;

                $this->getChildrenNodes($datas, $item, $temp_name);
            }
        }

        if (!$tags) {
            $this->list_levels[] = $cur_level;
        }
    }

    /**
     * 获取层级名为name1的下面某个节点名为name2的节点id,含多层节点
     */
    public function getLevelIdByName($name1, $name2)
    {
        $where['status']= C('');
        $where['name']= $name1;

        $level = M('menu_level')->where($where)->getField('level_id');

        while(true){

        }
    }
}