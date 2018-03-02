<?php
namespace Admin\Common;

/**
 * 层级处理类
 *
 */
class Menu
{
    protected $list_levels = [];  // 排序输出层级节点

    private $menus;

    public function __construct()
    {
        $this->menus = M('menu_level')->where('status=1')->order('weight desc')->select();
    }

    /**
     * 获取自定义数据层级
     */
    public function getMenuSelect($level_id = null)
    {
        $level_app = (new \Home\Common\Level());
        $level_app->mergeSelectNodes($this->menus, empty($level_id) ? C('ZTREE_ROOT.level_id') : $level_id);

        $select_levels[] = ['name' => C('ZTREE_ROOT.name'), 'value' => C('ZTREE_ROOT.level_id')];
        $select_levels = array_merge($select_levels, $level_app->getSelectLevels());

        return $select_levels;
    }

    public function getMenuName($level_id)
    {
        return (new \Home\Common\Level())->mergeParentNodeName($this->menus, $level_id, '', ' > ');
    }

    public function getMenuLevel() {
        $model = M('menu_level');
        $result = $model->order('weight desc')->select();

        $root_menu = C('ZTREE_ROOT');
        //$root_menu['pid'] = 10000;
        $this->list_levels[] = $root_menu;

        $this->getChildrenNodes($result, C('ZTREE_ROOT.level_id'), 1, true);

        //var_dump($this->list_levels);
        foreach ($this->list_levels as &$item) {
            if(10000 == $item['pid']) {
                $item['pid'] = 'null';
            }
        }

        return $this->list_levels;
    }

    /**
     * 递归查询，包含层级内容和选中层级
     * @param $datas
     * @param $level_id
     */
    public function getChildrenNodes($datas, $level_id, $depth = 1, $filterNotUse = false)
    {
        // 查找是否有子节点
        foreach ($datas as $item) {
            if($filterNotUse) {
                $temp_tags = false;
                foreach (C('NOT_USE_MENU_LEVELS') as $not_use_level) {
                    if($not_use_level['level_id'] == $item['level_id']) {
                        \Think\Log::write('filter='.$item['level_id'].'--'.$item['name']);
                        $temp_tags = true;
                        break;                        
                    }
                }
                if($temp_tags) {
                    continue;
                }
            }
            if ($item['pid'] == $level_id) {
                $item['open'] = (2 > $depth) ? true : false;
                $this->list_levels[] = $item;
                $name = $item['name'];
                for ($i = 1; $i <= $depth; $i++) {
                    $name = '　' . $name;
                }
                $this->select_levels[] = ['name' => $name, 'value' => $item['level_id']];

                $temp_depth = $depth + 1;
                $this->getChildrenNodes($datas, $item['level_id'], $temp_depth, $filterNotUse);
            }
        }
    }
}