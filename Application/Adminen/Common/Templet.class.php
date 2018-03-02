<?php
namespace Adminen\Common;

class Templet
{
    const TEMPLET_NUMBER =[
        0 => '/adminenglish/templet/image/lists',
        1 => '/adminenglish/templet/notice/lists',
        2 => '/adminenglish/templet/image/add',
        3 => '/adminenglish/templet/notice/add',
    ];

    public function jump($controller, $parameter)
    {
        if (!($this->checkParameter($parameter))) {
            echo 'parameter error.';

            return false;
        }

        $templet = self::TEMPLET_NUMBER[$parameter['tpl']];
        $templet .= '?sys_menu_id=' . $parameter['sys_menu_id'];

        redirect($templet, 0, '');

        return;
    }

    public function getMenuName($sys_menu_id)
    {
        $menu = ((new \Adminen\Common\Base())->getMenu());
        $search = 'sys_menu_id=' . $sys_menu_id;

        foreach($menu as $item1) {
            $name = $item1['title'];
            if(false !== strpos($item1['link'], $search)) {
                $result[] = $name;
                return $result;
            }

            foreach($item1['children'] as $item2) {
                if(false !== strpos($item2['link'], $search)) {
                    $result[] = $name;
                    $result[] = $item2['title'];
                    return $result;
                }
            }
        }

        return [];
    }

    private function checkParameter($parameter)
    {
        try {
            (new \Adminen\Common\Parameter\Validator())->execute($parameter, [
                'sys_menu_id' => ['type' => 'integer'],
                'tpl' => ['type' => 'integer'],
            ]);
        } catch (\Exception $ex) {

            return false;
        }

        return true;
    }
}