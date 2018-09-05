<?php
return array(
    //'配置项'=>'配置值'

    'CONTROLLER_LEVEL' => 2,  // 控制器层级，默认1层
    'URL_MODEL' => 1,  // url 为普通模式

    // 自动启动session
    'SESSION_AUTO_START' => true,

    'DEFAULT_FILTER' => 'trim', // 默认对输入的处理，去除两端空格

    // 加载自定义配置文件
    'LOAD_EXT_CONFIG' => 'menus_privilege,depend_privilege,code_constant,use_menu_level',

    // 发生错误设置
    'ERROR_MESSAGE'          => '页面错误！请稍后再试～', //错误显示信息,非调试模式有效
    //'ERROR_PAGE'             => '/public', // 错误定向页面

    /* 模板引擎设置 */
    'TMPL_ACTION_ERROR'      => __DIR__. '/../View/' . 'Error/dispatch_jump.tpl', // 默认错误跳转对应的模板文件
    'TMPL_EXCEPTION_FILE'    => __DIR__. '/../View/' . 'Error/think_exception.tpl', // 异常页面的模板文件

    /* 数据库链接设置begin */
    'DB_PREFIX' => '',  // 配置数据表的前缀
    'DB_TYPE' => 'mysql', // 数据库类型
    'DB_HOST' => '172.16.30.125', // 服务器地址
    'DB_NAME' => 'yjl_cms_english', // 数据库名
    'DB_USER' => 'mysqluser', // 用户名
    'DB_PWD' => 'tt@test', // 密码
    'DB_PORT' => '3306', // 端口
    'DB_CHARSET' => 'utf8', // 数据库编码默认采用utf8
    'DB_DEBUG' => false, // 数据库调试模式 开启后可以记录SQL日志
    'DB_PARAMS' => [
        \PDO::ATTR_PERSISTENT => false,  // 使用长连接***
        \PDO::ATTR_CASE => \PDO::CASE_NATURAL  // 不区分字段大小写
    ],

    // 用户外链表相关的数据库配置
    'DB_STAFF_CONFIG' => 'mysql://mysqluser:tt@test@172.16.30.125:3306/yjl_cms#utf8',

    // 配置模板名称
    'DEFAULT_V_LAYER' => 'View',
    // 配置模板主题
    'DEFAULT_THEME' => 'default',
    // 模板后缀
    'TMPL_TEMPLATE_SUFFIX' => '.tpl',
    // 配置简化模板的目录层
    'TMPL_FILE_DEPR' => '-',

    'LOG_RECORD' => true, // 开启日志记录
    'LOG_LEVEL'  =>'EMERG,ALERT,CRIT,ERR', // 只记录EMERG ALERT CRIT ERR 错误
);