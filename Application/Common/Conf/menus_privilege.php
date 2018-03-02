<?php
return [
    /**
     * 菜单权限列表，列表中的菜单表示需要权限的菜单
     * 页面只显示两层菜单，第三层只作为权限控制用，是页面下的操作控制
     */
    'menu_privilege_list' => [
        [
            'iconfont' => 'xe627',
            'title' => '栏目管理',
            'link' => '#',
            'children' => [
                [
                    'title' => '栏目层级管理',
                    'link' => '/1fd3ab97ee/menu/level/index',
                ],
                [
                    'title' => '分类管理',
                    'link' => '/1fd3ab97ee/templet/type/lists',
                ],
            ]
        ],
        [
            'iconfont' => 'xe613',
            'title' => '数据管理',
            'link' => '#',
            'children' => [
                [
                    'title' => '图片管理-WAP',
                    'link' => '/1fd3ab97ee/templet/mobile/lists',
                ],
                [
                    'title' => '图片管理-PC',
                    'link' => '/1fd3ab97ee/templet/image/lists',
                ],

                [
                    'title' => '文件管理',
                    'link' => '/1fd3ab97ee/templet/file/lists',
                ],
                [
                    'title' => '视频管理',
                    'link' => '/1fd3ab97ee/templet/video/lists',
                ],
            ]
        ],
        [
            'iconfont' => 'xe616',
            'title' => '内容管理',
            'link' => '#',
            'children' => [
                [
                    'title' => '文章管理',
                    'link' => '/1fd3ab97ee/templet/notice/lists',
                ],
                [
                    'title' => '信用评级',
                    'link' => '/1fd3ab97ee/invest/credit/lists',
                ],
                [
                    'title' => '股票评级',
                    'link' => '/1fd3ab97ee/invest/share/lists',
                ],
            ],
        ],
        [
            'iconfont' => 'xe620',
            'title' => '多元业务',
            'link' => '#',
            'children' => [
                [
                    'title' => '地产业务',
                    'link' => '/1fd3ab97ee/business/land/lists',
                ],
                [
                    'title' => '酒店业务',
                    'link' => '/1fd3ab97ee/business/hotel/lists',
                ],
            ],
        ],
        [
            'iconfont' => 'xe61a',
            'title' => '数据统计',
            'link' => '#',
            'children' => [
                [
                    'title' => '媒体采访',
                    'link' => '/1fd3ab97ee/statistics/interviews/lists',
                ],
                [
                    'title' => '投资者访问',
                    'link' => '/1fd3ab97ee/statistics/investvisit/lists',
                ],
                [
                    'title' => '举报统计',
                    'link' => '/1fd3ab97ee/statistics/witnesses/lists',
                ],
  /*              [
                    'title' => '网站访问',
                    'link' => '/1fd3ab97ee/statistics/visit/lists',
                ], */
            ],
        ],
        [
            'iconfont' => 'xe62c',
            'title' => '权限管理',
            'link' => '#',
            'children' => [
                [
                    'title' => '角色管理',
                    'link' => '/1fd3ab97ee/role/manage/lists',
                    'children' => [
                        [
                            'title' => '角色列表',
                            'link' => '/1fd3ab97ee/Notice/add',
                        ],
                        [
                            'title' => '新增角色',
                            'link' => '/1fd3ab97ee/role/manage/add',
                        ],
                        [
                            'title' => '修改角色',
                            'link' => '/1fd3ab97ee/role/manage/change',
                        ],
                        [
                            'title' => '删除角色',
                            'link' => '/1fd3ab97ee/role/manage/delete',
                        ],
                    ],
                ],
                [
                    'title' => '栏目组管理',
                    'link' => '/1fd3ab97ee/menu/authority/lists',
                ],
                [
                    'title' => '人员管理',
                    'link' => '/1fd3ab97ee/staff/manage/lists',
                    'children' => [
                        [
                            'title' => '管理员列表',
                            'link' => '/1fd3ab97ee/Notice/add',
                        ],
                        [
                            'title' => '新增管理员',
                            'link' => '/1fd3ab97ee/staff/manage/add',
                        ],
                        [
                            'title' => '修改管理员',
                            'link' => '/1fd3ab97ee/staff/manage/change',
                        ],
                        [
                            'title' => '删除管理员',
                            'link' => '/1fd3ab97ee/staff/manage/delete',
                        ],
                        [
                            'title' => '重置密码',
                            'link' => '/1fd3ab97ee/staff/password/reset',
                        ],
                    ],
                ],
            ],
        ],
        [
            'id' => '100100',
            'iconfont' => 'xe62e',
            'title' => '系统管理',
            'link' => '#',
            'children' => [
                [
                    'id' => '10000101',
                    'title' => '配置管理',
                    'link' => '/1fd3ab97ee/system/config/change',
                ],
                [
                    'title' => '后台操作日志',
                    'link' => '/1fd3ab97ee/system/log/lists',
                ]
            ]
        ],
    ],

    'en_menu_privilege_list' => [
        [
            'iconfont' => 'xe627',
            'title' => '栏目管理-英文版',
            'link' => '#',
            'children' => [
    /*            [
                    'title' => '栏目层级管理',
                    'link' => '/adminenglish/menu/level/index',
                ],  */
                [
                    'title' => '分类管理',
                    'link' => '/adminenglish/templet/type/lists',
                ],
            ]
        ],
        [
            'iconfont' => 'xe613',
            'title' => '数据管理-英文版',
            'link' => '#',
            'children' => [
                [
                    'title' => '图片管理-WAP',
                    'link' => '/adminenglish/templet/mobile/lists',
                ],
                [
                    'title' => '图片管理-PC',
                    'link' => '/adminenglish/templet/image/lists',
                ],

                [
                    'title' => '文件管理',
                    'link' => '/adminenglish/templet/file/lists',
                ],
                [
                    'title' => '视频管理',
                    'link' => '/adminenglish/templet/video/lists',
                ],
            ]
        ],
        [
            'iconfont' => 'xe616',
            'title' => '内容管理-英文版',
            'link' => '#',
            'children' => [
                [
                    'title' => '文章管理',
                    'link' => '/adminenglish/templet/notice/lists',
                ],
                [
                    'title' => '信用评级',
                    'link' => '/adminenglish/invest/credit/lists',
                ],
                [
                    'title' => '股票评级',
                    'link' => '/adminenglish/invest/share/lists',
                ],
            ],
        ],
        [
            'iconfont' => 'xe620',
            'title' => '多元业务-英文版',
            'link' => '#',
            'children' => [
                [
                    'title' => '地产业务',
                    'link' => '/adminenglish/business/land/lists',
                ],
                [
                    'title' => '酒店业务',
                    'link' => '/adminenglish/business/hotel/lists',
                ],
            ],
        ],
        [
            'iconfont' => 'xe61a',
            'title' => '数据统计-英文版',
            'link' => '#',
            'children' => [
                [
                    'title' => '媒体采访',
                    'link' => '/adminenglish/statistics/interviews/lists',
                ],
                [
                    'title' => '投资者访问',
                    'link' => '/adminenglish/statistics/investvisit/lists',
                ],
                [
                    'title' => '举报统计',
                    'link' => '/adminenglish/statistics/witnesses/lists',
                ],
  /*              [
                    'title' => '网站访问',
                    'link' => '/adminenglish/statistics/visit/lists',
                ], */
            ],
        ],
   /*     [
            'iconfont' => 'xe62c',
            'title' => '权限管理',
            'link' => '#',
            'children' => [
                [
                    'title' => '角色管理',
                    'link' => '/adminenglish/role/manage/lists',
                    'children' => [
                        [
                            'title' => '角色列表',
                            'link' => '/adminenglish/Notice/add',
                        ],
                        [
                            'title' => '新增角色',
                            'link' => '/adminenglish/role/manage/add',
                        ],
                        [
                            'title' => '修改角色',
                            'link' => '/adminenglish/role/manage/change',
                        ],
                        [
                            'title' => '删除角色',
                            'link' => '/adminenglish/role/manage/delete',
                        ],
                    ],
                ],
                [
                    'title' => '栏目组管理',
                    'link' => '/adminenglish/menu/authority/lists',
                ],
                [
                    'title' => '人员管理',
                    'link' => '/adminenglish/staff/manage/lists',
                    'children' => [
                        [
                            'title' => '管理员列表',
                            'link' => '/adminenglish/Notice/add',
                        ],
                        [
                            'title' => '新增管理员',
                            'link' => '/adminenglish/staff/manage/add',
                        ],
                        [
                            'title' => '修改管理员',
                            'link' => '/adminenglish/staff/manage/change',
                        ],
                        [
                            'title' => '删除管理员',
                            'link' => '/adminenglish/staff/manage/delete',
                        ],
                        [
                            'title' => '重置密码',
                            'link' => '/adminenglish/staff/password/reset',
                        ],
                    ],
                ],
            ],
        ], */
        [
            'id' => '100100',
            'iconfont' => 'xe62e',
            'title' => '系统管理-英文版',
            'link' => '#',
            'children' => [
                [
                    'id' => '10000101',
                    'title' => '配置管理',
                    'link' => '/adminenglish/system/config/change',
                ],
       /*         [
                    'title' => '后台操作日志',
                    'link' => '/adminenglish/system/log/lists',
                ] */
            ]
        ],
    ],
];