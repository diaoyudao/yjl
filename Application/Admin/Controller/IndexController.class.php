<?php
namespace Admin\Controller;

use Think\Controller;

/**
 * 后台管理主页
 * @package Admin\Controller
 */
class IndexController extends Controller
{
    public function index()
    {
        $web_name = M('Config')->where("name = 'admin_web_name' and status = 1")->getField('value');
        $web_name = $web_name ? $web_name : C('ADMIN_WEB_NAME');

        $this->assign('web_name', $web_name);
        $this->display();
    }
}