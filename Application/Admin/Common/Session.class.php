<?php
namespace Admin\Common;
/**
 * @desc session 操作类
 * Class Privilege
 * @package Admin\Behaviors
 */
class Session
{
    public function start()
    {
        session_start();
    }

    /**
     * 启动登录session
     * @param $staff // 用户表记录数据
     * @throws \Exception
     */
    public function loginStart($staff)
    {
        if (empty($staff)) {
            throw new \Exception('illegal user');
        }
        
        session_start();
        session(null);  // 清空所有session
        session('login_id', $staff['staff_code']);
        session('staff_name', $staff['name']);
        session('staff_code', $staff['staff_code']);
        session('staff_id', $staff['staff_id']);

        // 登录时获取权限菜单，修改菜单权限后需要重新登录才能生效
        session('menu_privileges', (new \Admin\Common\Privilege)->getPrivilegeMenu());
        session('menu_privileges_en', (new \Adminen\Common\Privilege)->getPrivilegeMenu());
        
        $data['staff_id'] = $staff['staff_id'];
        $data['login_status'] = 1;
        M('staff')->save($data);
    }

    public function loginOut()
    {       

        session_destroy();

    }
}