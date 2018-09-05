<?php
return [
    /* 验证码 */
    'VERIFY_ID' => '_37&45%8#_',  // 验证码特殊标记
    'VERIFY_KEY' => '_37&45%8#_',  // 验证码加密
    'VERIFY_TIMEOUT' => 60,  // 验证码过期时间，秒

    /* 代码常量 */
    'STATUS_VALID' => 1,  // 状态，有效
    'STATUS_INVALID' => 0,  // 状态，无效
    'LAND_TAGS' => [
        'head' => [
            'name' => '头部图片',
            'size_desc' => '建议尺寸为：1920*550，大小不超过200K',
        ],
        'two_code' => [
            'name' => '二维码',
            'size_desc' => '建议尺寸为：200X200，大小不超过20K',
        ],
        'cover' => [
            'name' => '封面图片',
            'size_desc' => '建议尺寸为：800X600，大小不超过100K',
        ],
        'real' => [
            'name' => '实景图',
            'size_desc' => '建议尺寸为：800X600，大小不超过100K',
        ],
        'room' => [
            'name' => '户型图',
            'size_desc' => '建议尺寸为：800X600，大小不超过100K',
        ],
        'plan' => [
            'name' => '规划图',
            'size_desc' => '建议尺寸为：800X600，大小不超过100K',
        ],
    ],
    'HOTEL_TAGS' => [
        'head' => [
            'name' => '头部图片',
            'size_desc' => '建议尺寸为：1920*550，大小不超过200K',
        ],
        'two_code' => [
            'name' => '二维码',
            'size_desc' => '建议尺寸为：200X200，大小不超过20K',
        ],
        'cover' => [
            'name' => '封面图片',
            'size_desc' => '建议尺寸为：800X600，大小不超过100K',
        ],
        'location' => [
            'name' => '内景图',
            'size_desc' => '建议尺寸为：800X600，大小不超过100K',
        ],
        'interior' => [
            'name' => '外景图',
            'size_desc' => '建议尺寸为：800X600，大小不超过100K',
        ],
        'room' => [
            'name' => '房间图',
            'size_desc' => '建议尺寸为：800X600，大小不超过100K',
        ],
    ],
    'TYPE_TAGS' => [
        '地产-业态',
        '地产-城市',
        '酒店-城市',
        '酒店-属性',
    ],


    'INIT_PASSWORD' => 'agile888',  // 初始密码


    'IMAGE_SAVE_PATH_TEMP' => 'temp',  // 附件上传临时目录限制
    'IMAGE_SAVE_PATH_ROOT' => '/home/www/yjl_test',  // 图片上传地址根目录,网站根目录
    'IMAGE_SAVE_PATH' => '/datas/image/source',  // 图片上传地址子目录，相应于根目录
    'IMAGE_PREVIEW_PATH' => '/datas/image/thumbnail',  // 缩略图相对地址，相应于根目录

    'IMAGE_SERVER_ROOT_URL' => '',  // 图片服务器url
    'FILE_SERVER_ROOT_URL' => '',   // 文件服务器url


    'DOMAIN_CHINESE' => 'deve.yjl.com',   // 中文版域名
    'DOMAIN_ENGLISH' => 'deve.yjl.com',   // 英文版域名
    'COOKIE_DOMAIN' => 'deve.yjl.com',       // cookie 域名
];