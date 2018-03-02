<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2014 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用入口文件

// 检测PHP环境
if (version_compare(PHP_VERSION, '5.3.0', '<')) {
    die('require PHP > 5.3.0 !');
}

// 开启调试模式 建议开发阶段开启 部署阶段注释或者设为false
define('APP_DEBUG', true);

//echo $_SERVER['REQUEST_STRING'];
//phpinfo();

// 绑定Admin模块到当前入口文件
define('BIND_MODULE', 'Admin');

// 自动生成控制器，开发时用
define('BUILD_CONTROLLER_LIST', 'Index,Staff,Role');

// 定义应用目录
define('APP_PATH', './Application/');

// 取消目录安全默认目录
define('BUILD_DIR_SECURE', false);

// 引入ThinkPHP入口文件
try {

    require './ThinkPHP/ThinkPHP.php';

} catch (\Exception $ex) {
    \Think\Log::write('system-exception');
    $err_msg = 'system-exception: '.$ex->getLine().'行，'.$ex->getFile().', '.$ex->getMessage().', '. $ex->getTraceAsString();
    \Think\Log::write($err_msg);

    header("Content-type:text/html;charset=utf-8");
    exit('{"status": "failed", "message": "系统异常1"}');
} catch (\Error $ex) {   
    \Think\Log::write('code-exception');
    $err_msg = 'code-exception: '.$ex->getLine().'行，'.$ex->getFile().', '.$ex->getMessage().', '. $ex->getTraceAsString();
    \Think\Log::write($err_msg);

    header("Content-type:text/html;charset=utf-8");
    exit('{"status": "failed", "message": "系统异常2"}');
}


// 亲^_^ 后面不需要任何代码了 就是如此简单
