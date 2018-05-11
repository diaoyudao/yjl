<?php
return array(
    //'配置项'=>'配置值'
    'CONTROLLER_LEVEL' => 1,  // 控制器层级，默认1层
    'URL_MODEL' => 1,  // url 为普通模式

    // 不自动启动session
    'SESSION_AUTO_START' =>false,

    // url不区分大小写
    'URL_CASE_INSENSITIVE' => true,
    // 配置模板名称
    'DEFAULT_V_LAYER' => 'View',
    // 模板后缀
    'TMPL_TEMPLATE_SUFFIX' => '.tpl',
    // 配置简化模板的目录层
    'TMPL_FILE_DEPR' => '/',
    // 配置模板主题
//    'DEFAULT_THEME' => 'default',
    'DEFAULT_THEME' => 'default',

    /* 模板引擎设置 */
    'TMPL_ACTION_ERROR'      => __DIR__. '/../View/' . 'Error/dispatch_jump.tpl', // 默认错误跳转对应的模板文件
    'TMPL_EXCEPTION_FILE'    => __DIR__. '/../View/' . 'Error/think_exception.tpl', // 异常页面的模板文件

    // 加载自定义配置文件
    'LOAD_EXT_CONFIG' => 'code_constant,menu_lists',

    /* 数据库链接设置begin */
    'DB_PREFIX' => '',  // 配置数据表的前缀
    'DB_TYPE' => 'mysql', // 数据库类型
    'DB_HOST' => '172.16.30.125', // 服务器地址
    'DB_NAME' => 'yjl_cms_english', // 数据库名
    'DB_USER' => 'mysqluser', // 用户名
    'DB_PWD' => 'tt@test', // 密码 Jx2137*9@!
    'DB_PORT' => '3306', // 端口
    'DB_CHARSET' => 'utf8', // 数据库编码默认采用utf8
    'DB_DEBUG' => true, // 数据库调试模式 开启后可以记录SQL日志
    'DB_PARAMS' => [
        \PDO::ATTR_PERSISTENT => false,  // 使用长连接***
        \PDO::ATTR_CASE => \PDO::CASE_NATURAL  // 不区分字段大小写
    ],

    'URL_ROUTER_ON' => true,
    'URL_ROUTE_RULES' => [
        '/news/detail/:id' => '/news/detail',
        //    '/^my\/uuu$/' => 'User/Index',
        //    '/^my\/(\d{4})\/(\d{2})\/(\d{2})$/' => 'Index/day?year=:1&month=:2&day=:3',
    ],
    // 伪静态
    'URL_HTML_SUFFIX' => 'shtml',

    // 静态页面缓存
    'HTML_CACHE_ON' => false, // 开启静态缓存
    'HTML_CACHE_TIME' => 600, // 全局静态缓存有效期（秒）
    'HTML_FILE_SUFFIX' => '.static', // 设置静态缓存文件后缀
    'HTML_CACHE_RULES' => [ // 定义静态缓存规则
// 定义格式1 数组方式
        //  '静态地址' => array('静态规则', '有效期', '附加规则'),
// 定义格式2 字符串方式
        //  '静态地址' => '静态规则',
        'news:detail' => ['news-detail-{id}', 600],  // 配置所有控制器
        //'read' => ['{$_SERVER.REQUEST_URI}', 0],

    ],
   
);
