<?php
namespace Admin\Controller\Business;

use Think\Controller;
use Admin\Common\Record\StaffLog;

/**
 * 后台管理登录
 * @package Admin\Controller
 */
class LifeController extends Controller
{
    public function index()
    {
        $templet = (new \Admin\Common\Templet())->jump($this, I('get.'));

        $this->display($templet);
    }
}