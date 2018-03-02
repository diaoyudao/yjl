<?php
namespace Home\Controller;

use Think\Controller;

class CokController extends Controller
{
    public function cok()
    {
        $this->ajaxReturn(['status' => 'ok']);
    }
}