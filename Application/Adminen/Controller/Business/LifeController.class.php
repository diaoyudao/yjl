<?php
namespace Adminen\Controller\Business;

use Think\Controller;
use Adminen\Common\Record\StaffLog;

/**
 * 后台管理登录
 * @package Admin\Controller
 */
class LifeController extends Controller
{
    public function index()
    {
        $templet = (new \Adminen\Common\Templet())->jump($this, I('get.'));

        $this->display($templet);
    }
}