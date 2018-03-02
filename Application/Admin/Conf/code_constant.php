<?php
return [
    'SELF_SYSTEMADMIN' => [
        'role_id' => '10000',
        'name' => '超级系统管理员',
    ],

    'SELF_ROOT_DIR' => '/home/www/yjl_test',  // 本地根目录路径
    'ADMIN_ALIAS' => '/1fd3ab97ee',  // 本地根目录路径

    'ADMIN_WEB_NAME' => '雅居乐官网后台管理系统',  // 后台网站名称
    'WEB_NAME' => '雅居乐官网',  // 前台网站名称
    
    'ONE_PAGE_SIZE' => 10,   // 单页显示的列表记录数

    'VERIFY_ID' => '_37&45%8#_',  // 验证码特殊标记
    'VERIFY_KEY' => '_37&45%8#_',  // 验证码加密
    'VERIFY_TIMEOUT' => 60,  // 验证码过期时间，秒


    /* 默认显示的图片 */
    'DEFAULT_SHOW_IMAGE' => '/public/img/admin/error.gif',

    /* 树根节点名称 */
    'ZTREE_ROOT' => [
        'level_id' => 10000,
        'name' => '首页',
        'pid' => 'null',
        'status' => '1',
        'weight' => '0',
        'open' => true,
    ],

    'DEFAULT_MAX_DATA' => '2299-1-1',  // 默认最大时间

    /* 文件上传 */
    'UPLOAD_FILE_ROOT_PATH' => '/home/www/yjl_test',  // 公告附件上传地址根目录，目录必须存在，不然会报错
    'UPLOAD_FILE_SAVE_PATH' => '/datas/file/',  // 公告附件上传地址子目录，目录可以不存在，系统会自动创建
    'UPLOAD_FILE_MAX_SIZE' => 5*1024*1024,  // 附件上传大小限制
    'UPLOAD_IMAGE_MAX_SIZE' => 2,  // 图片上传大小限制,2M

    /* 大文件上传 */
    'UPLOAD_LARGE_FILE_ROOT_PATH' => '/home/www/yjl_test',  // 大文件上传地址根目录，目录必须存在，不然会报错
    'UPLOAD_LARGE_FILE_SAVE_PATH' => '/datas/large_file/file/',  // 大文件上传地址子目录，目录可以不存在，系统会自动创建
    'UPLOAD_LARGE_FILE_TEMP_PATH' => '/datas/large_file/temp/',  // 大文件上传地址子目录，目录可以不存在，系统会自动创建
    'UPLOAD_LARGE_FILE_ONCE_SIZE' => 3145728,  // 附件单次上传大小限制，3M,3145728

];