<?php
namespace Homeen\Controller;

use Think\Controller;

class VerifyController extends Controller
{
	public function index()
	{
		session_start();
		(new \Adminen\Common\Verify())->get();
	}
}