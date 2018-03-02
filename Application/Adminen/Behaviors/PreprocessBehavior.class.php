<?php
namespace Adminen\Behaviors;
/**
 * @privilege_group
 * Class Privilege
 * @package Admin\Behaviors
 */
class PreprocessBehavior extends \Think\Behavior
{
    //行为执行入口
    public function run(&$param)
    {
        session_start();

        $ret = (new \Adminen\Common\Privilege())->isNoLoginPrivilege();
        if($ret == true) {  // 无需权限
            return;
        }

        if(!session('?staff_id')) {
            redirect('/1fd3ab97ee/login/staff/login', 2, '未登录，跳转到登录页面，请稍等...');
            exit;
        }

        // 判断用户状态
        $staff = M('staff','',C('DB_STAFF_CONFIG'))->find(session('staff_id'));
        if(2 == $staff['login_status']) {
            (new \Adminen\Common\Session())->loginOut();
            redirect('/1fd3ab97ee/login/staff/login', 4, '您的相关权限已被管理员修改，本地登录失效，请重新登录...');

            exit;
        }


        $ret = (new \Adminen\Common\Privilege())->isOwnPrivilege();
        if(!$ret) {
            \Think\Log::write('已登录，没有权限');
            if(IS_GET) {
                echo '您没有操作权限';
            } else {
                echo json_encode(["status" => "failed", "message" => "您没有操作权限"]);
                //'{"status":"failed", "message":"您没有操作权限"}';
            }

            exit;
        }
    }
}