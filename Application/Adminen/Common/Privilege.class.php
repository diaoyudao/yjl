<?php
namespace Adminen\Common;
/**
 * @privilege_group
 * Class Privilege
 * @package Admin\Behaviors
 */
class Privilege
{
    const NO_PRIVILIEGE_URL = [
        '/adminenglish/verify/login/index'
    ];
    /**
     * 获取当前用户的操作权限菜单
     */
    public function getPrivilegeMenu()
    {

        if (!session('staff_id')) {
            throw new \Exception('非法用户');
            exit;
        }
        $staff_id = session('staff_id');

        // 获取用户角色
        $roles = $this->getRoleByStaffId($staff_id);

        // 判断是否特殊管理员
        if (in_array(C('SELF_SYSTEMADMIN.role_id'), \Adminen\Common\Base::array_column($roles, 'role_id'))) {
            return ((new \Adminen\Common\Base())->getMenu());
        }

        // 获取每个角色的权限
        $menu_name_list = [];
        foreach ($roles as $role) {
            if ($role['menus']) {
                $temp = explode(',', $role['menus']);
                $menu_name_list = array_merge($menu_name_list, $temp);
            }
        }

        if (!$menu_name_list) {
            return [];
        }

        // 输出菜单权限
        return $this->matchPrivilegeMenu($menu_name_list);
    }

    /**
     * 未登录用户是否有访问权限
     * @param $current_menu
     * @return bool
     */
    public function isNoLoginPrivilege()
    {

        $current_menu = strtolower('/adminenglish/' . CONTROLLER_NAME . '/' . ACTION_NAME);
        if(in_array($current_menu, self::NO_PRIVILIEGE_URL)) {
            return true;
        }

        return false;
    }

    /**
     * @desc 判断当前员工是否有操作当前菜单的权限
     * @return bool
     */
    public function isOwnPrivilege()
    {
        $staff_id = $_SESSION['staff_id'] ?: 0;
        if (!$staff_id) {
            return false;
        }

        $current_menu = strtolower('/adminenglish/' . CONTROLLER_NAME . '/' . ACTION_NAME);

        // 权限依赖
        $depend_menus = $this->dependPrivilege($current_menu);
        if (!$depend_menus) {
            $depend_menus = [$current_menu];
        }

        // 菜单权限
        $ret = required_privilege((new \Adminen\Common\Base())->getMenu(), $depend_menus);
        //$ret = $this->requiredPrivilegeList($depend_menus);
        if (false === $ret) {
            return true;
        }

        // 检查用户权限 
        return required_privilege(session('menu_privileges_en'), $depend_menus);
    }

    /**
     * 获取用户角色
     */
    public function getRoleByStaffId($staff_id)
    {

        $sql = "select b.* from staff_role a, role b where a.staff_id = %d and a.role_id = b.role_id";
        $result = M('', '',C('DB_STAFF_CONFIG'))->query($sql, $staff_id);

        return $result;
    }

    /**
     * 检查员工角色
     * @param $staff_id
     * @return bool
     */
    private function checkStaffRole($staff_id, $controller)
    {
        // 获取员工权限
        $staff_role = M('StaffRole', '',C('DB_STAFF_CONFIG'));
        $staff_role->field('staff_id,role_id')
            ->where('staff_id = %d and delete_time is null', $staff_id);
        $result = $staff_role->select();

        foreach ($result as $row) {
            // 系统管理员，第一次部署的时候手工创建，不能被删除
            if ($row['role_id'] == C('SELF_SYSTEMADMIN.role_id')) {
                return true;
            }

            if ($this->checkRolePrivilege($row['role_id'], $controller)) {
                return true;
            }
        }

        return false;
    }

    /**
     * 匹配权限菜单
     * @param $menu_name_list // 拥有的权限菜单名称数组
     * @return array
     */
    private function matchPrivilegeMenu($menu_name_list)
    {
        $menu_list = [];
        foreach (((new \Adminen\Common\Base())->getMenu()) as $first_item) {
            $temp_first_item = [];
            foreach ($first_item['children'] as $second_item) {
                $temp_second_item = [];
                if (in_array($second_item['title'], $menu_name_list)) {
                    if (!$temp_first_item) {
                        $temp_first_item['iconfont'] = $first_item['iconfont'];
                        $temp_first_item['title'] = $first_item['title'];
                        $temp_first_item['link'] = $first_item['link'];
                    }
                    $temp_first_item['children'][] = $second_item;
                    continue;
                }
                foreach ($second_item['children'] as $third_item) {
                    if (in_array($third_item['title'], $menu_name_list)) {
                        if (!$temp_second_item) {
                            $temp_second_item['title'] = $second_item['title'];
                            $temp_second_item['link'] = $second_item['link'];
                        }
                        $temp_second_item['children'][] = $third_item;
                    }
                }
                if ($temp_second_item) {
                    if (!$temp_first_item) {
                        $temp_first_item['iconfont'] = $first_item['iconfont'];
                        $temp_first_item['title'] = $first_item['title'];
                        $temp_first_item['link'] = $first_item['link'];
                    }
                    $temp_first_item['children'][] = $temp_second_item;
                }
            }

            if ($temp_first_item) {
                $menu_list[] = $temp_first_item;
            }
        }

        return $menu_list;
    }

    /**
     * 获取当前菜单的依赖菜单
     * @param $current_menu
     */
    function dependPrivilege($current_menu)
    {
        return [];
    }
}