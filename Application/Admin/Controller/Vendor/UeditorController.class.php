<?php
namespace Admin\Controller\Vendor;

use Think\Controller;

class UeditorController extends Controller
{
    public function index()
    {
        require('./ThinkPHP/Library/Vendor/ueditor/controller.php');
    }
}