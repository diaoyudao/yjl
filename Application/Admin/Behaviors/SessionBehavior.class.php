<?php
namespace Admin\Behaviors;
/**
 * @desc session 操作类
 * Class Privilege
 * @package Admin\Behaviors
 */
class SessionBehavior extends \Think\Behavior
{
    public function run(&$param)
    {
        session_start();
        session(null);  // 清空所有session
        session('login_id', 'admin');
        session('staff_name', '张三');
        session('staff_code', 'admin');
        session('staff_id','10000');

        // 登录时获取权限菜单，修改菜单权限后需要重新登录才能生效
        session('menu_privileges', ((new \Admin\Common\Base())->getMenu()));
    }
}