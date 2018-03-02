<?php
//error_reporting(E_ALL);
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

//phpinfo();

// 绑定Admin模块到当前入口文件
define('BIND_MODULE', 'Home');



// 创建模型列表，干净的目录才生效
//define('BUILD_MODEL_LIST','User,Menu');


// 自动生成控制器，开发时用
// define('BUILD_CONTROLLER_LIST', 'Index,User,Menu');

// 定义应用目录
define('APP_PATH', './Application/');

// 取消目录安全默认目录
define('BUILD_DIR_SECURE', false);

// 引入ThinkPHP入口文件
require './ThinkPHP/ThinkPHP.php';




// 亲^_^ 后面不需要任何代码了 就是如此简单
