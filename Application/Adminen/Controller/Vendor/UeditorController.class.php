<?php
namespace Adminen\Controller\Vendor;

use Think\Controller;

class UeditorController extends Controller
{
    public function index()
    {
        require('./ThinkPHP/Library/Vendor/ueditor/controller.php');
    }
}