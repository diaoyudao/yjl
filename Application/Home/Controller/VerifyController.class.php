<?php
namespace Home\Controller;

use Think\Controller;

class VerifyController extends Controller
{
	public function index()
	{
		session_start();
		(new \Admin\Common\Verify())->get();
	}
}