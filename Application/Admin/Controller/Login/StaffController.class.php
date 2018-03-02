<?php
namespace Admin\Controller\Login;

use Think\Controller;
use Admin\Common\Record\StaffLog;

/**
 * 后台管理登录
 * @package Admin\Controller
 */
class StaffController extends Controller
{
	public function login()
	{
		if (IS_GET) {  // 获取页面
			$web_name = M('Config')->where("name = 'admin_web_name' and status = 1")->getField('value');
			$web_name = $web_name ? $web_name : C('ADMIN_WEB_NAME');

			$this->assign('web_name', $web_name);
			$this->display();
			return;
		}

		// 提交数据
		$this->loginSumbit();
	}

	/**
	 * 用户退出登录
	 */
	public function loginout()
	{
		(new StaffLog)->add('用户退出系统');  // 日志记录

		(new \Admin\Common\Session())->loginOut();
		redirect('/1fd3ab97ee/login/staff/login', 0, '');
	}

	/**
	 * 用户退出登录
	 */
	public function exceptionloginout()
	{
		(new StaffLog)->add('用户退出系统');  // 日志记录

		(new \Admin\Common\Session())->loginOut();
	}

	private function loginSumbit()
	{
		$parameter = $this->checkParameter();

		// 验证码
		$ret = $this->check_verify($parameter['verify']);
		if (!$ret) {
			$this->ajaxReturn(['status' => 'failed', 'message' => '验证码无效，请重试！']);
		}

		// 密码
		$model = M('Staff');
		$where['staff_code'] = $parameter['login_id'];
		$where['password'] = md5($parameter['password']);
		$where['status'] = 1;

		$staff = $model->where($where)->select();
		if (!$staff) {
        
			$this->ajaxReturn(['status' => 'failed', 'message' => '用户名或密码错误，请重试！']);
		}

		(new \Admin\Common\Session())->loginStart($staff[0]);

		// 英文特殊处理  
		if(2 == $parameter['system-lang']) {
			(new \Adminen\Common\Record\StaffLog)->add('用户登录系统');  // 日志记录
		} else {
			(new StaffLog)->add('用户登录系统');  // 日志记录
		}		

		$this->ajaxReturn(['status' => 'ok']);
	}

	private function check_verify($code)
	{
		$config = [
			'seKey' => C('VERIFY_KEY'), // 加密
		];
		$verify = new \Think\Verify($config);

		return $verify->check($code, C('VERIFY_ID'));
	}

	private function checkParameter()
	{
		try {
			(new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
				'system-lang' => ['enum_eq' => [1,2]],
				'login_id' => ['regexp' => '/^.{2,20}$/'],
				'password' => ['regexp' => '/^.{2,20}$/'],
				'verify' => ['regexp' => '/^[0-9a-zA-z]{4}$/'],
			]);
		} catch (\Exception $ex) {

			$this->ajaxReturn(['status' => 'failed', 'message' => '参数格式错误，请检查！']);
			//$this->ajaxReturn(['status' => 'failed', 'message' => $ex->getMessage()]);
		}

		return I('post.');
	}
}