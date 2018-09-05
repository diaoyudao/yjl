<?php

return [
	'MENU_TYPE_LEVELS' => [
		[
			'level_id' => '1000000128', 'name' => '地产',
		],
		[
			'level_id' => '1000000131', 'name' => '酒店',
		],
	],
	'MENU_VIDEO_LEVELS' => [
		[
			'level_id' => '1000000137', 'name' => '企业宣传',
		]
	],
	'MENU_FILE_LEVELS' => [
		
		[
			'level_id' => '1000000143', 'name' => '年报/中报',
		],
		[
			'level_id' => '1000000144', 'name' => '公告',
		],
	],
	'MENU_NOTICE_LEVELS' => [
		[
			'level_id' => '1000000123', 'name' => '走进雅居乐',
			'tags_type' => [],
			
			'children' => [
				[
					'level_id' => '1000000139', 'name' => '荣誉集锦',
				
				],
				[
					'level_id' => '1000000140', 'name' => '发展历程',
				
				],
				[
					'level_id' => '1000000138', 'name' => '社会责任',
					'tags_type' => [],
					'children' => [
						[
							'level_id' => '1000000167', 'name' => '教育事业',
						
						],
						[
							'level_id' => '1000000168', 'name' => '环境保护',
						
						],
						[
							'level_id' => '1000000166', 'name' => '其他',
						
						],
					]
				],
			]
		],
		[
			'level_id' => '1000000125', 'name' => '多元业务',
			'tags_type' => [],
			'children' => [
				
				[
					'level_id' => '1000000171', 'name' => '楼盘速递',
					'tags_type' => [],
					'children' => [
						['level_id' => '1000000183', 'name' => '1月'],
						['level_id' => '1000000182', 'name' => '2月'],
						['level_id' => '1000000181', 'name' => '3月'],
						['level_id' => '1000000180', 'name' => '4月'],
						['level_id' => '1000000179', 'name' => '5月'],
						['level_id' => '1000000178', 'name' => '6月'],
						['level_id' => '1000000177', 'name' => '7月'],
						['level_id' => '1000000176', 'name' => '8月'],
						['level_id' => '1000000175', 'name' => '9月'],
						['level_id' => '1000000174', 'name' => '10月'],
						['level_id' => '1000000173', 'name' => '11月'],
						['level_id' => '1000000172', 'name' => '12月'],
					]
				],
				[
					'level_id' => '1000000133', 'name' => '教育',
					'tags_type' => [],
					'children' => [
						[
							'level_id' => '1000000184', 'name' => '学前教育',
						],
						[
							'level_id' => '1000000185', 'name' => '基础教育',
						],
						[
							'level_id' => '1000000196', 'name' => '培训教育',
						
						],
					]
				],
			]
		],
		[
			'level_id' => '1000000129', 'name' => '新闻中心',
			'tags_type' => [],
			'children' => [
				[
					'level_id' => '1000000142', 'name' => '集团新闻',
				
				],
				[   'level_id' => '1000000141', 'name' => '媒体报道',
					'tags_type' => [],
					'children' => [
						[
							'level_id' => '1000000164', 'name' => '地产',
						],
						[
							'level_id' => '1000000163', 'name' => '雅生活',
						],
						[
							'level_id' => '1000000162', 'name' => '教育',
						],
						[
							'level_id' => '1000000161', 'name' => '环保',
						],
						[
							'level_id' => '1000000202', 'name' => '建设',
						],
					
					]
				],
			],
		],
		
		[
			'level_id' => '1000000135', 'name' => '加入雅居乐',
			'tags_type' => [],
			'children' => [
				[
					'level_id' => '1000000148', 'name' => '员工发展',
					'tags_type' => [],
					'children' => [
						['level_id' => '1000000201', 'name' => '文化活动',]
					]
				],
			]
		],
	
	],
	'MENU_MOBILE_IMAGE_LEVELS' => [
		[
			'level_id' => '10000', 'name' => '首页',
			'tags_type' => [
				'头部图片', '导航图片', '股市概况'
			],
		
		],
		[   'level_id' => '1000000123', 'name' => '走进雅居乐',
			'tags_type' => [
				'头部图片'
			],
			'children' => [
				[
					'level_id' => '1000000126', 'name' => '集团介绍',
					'tags_type' => [
						'头部图片'
					],
				],
				[
					'level_id' => '1000000138', 'name' => '社会责任',
					'tags_type' => [
						'头部图片'
					],
				],
				[
					'level_id' => '1000000137', 'name' => '企业宣传',
					'tags_type' => [
						'头部图片'
					],
				],
			],
		],
		[
			'level_id' => '1000000125', 'name' => '多元业务',
			'tags_type' => [
				'头部图片', '雅生活', '建设', '教育', '环保', '酒店','房管'
			],
			'children' => [
				[
					'level_id' => '1000000128', 'name' => '地产',
					'tags_type' => [
						'头部图片'
					],
				
				],
				[
					'level_id' => '1000000130', 'name' => '雅生活',
					'tags_type' => [
						'头部图片'
					],
					'children' => [
						[
							'level_id' => '1000000186', 'name' => '物业',
							'tags_type' => [
								'头部图片'
							],
						],
						[
							'level_id' => '1000000190', 'name' => '旅游',
							'tags_type' => [
								'头部图片', '中间图片'
							],
						],
						[
							'level_id' => '1000000191', 'name' => '智慧园区',
							'tags_type' => [
								'头部图片'
							],
						],
					],
				],
				[
					'level_id' => '1000000131', 'name' => '酒店',
					'tags_type' => [
						'头部图片'
					],
				],
				[
					'level_id' => '1000000132', 'name' => '环保',
					'tags_type' => [
						'头部图片'
					],
				],
				[
					'level_id' => '1000000133', 'name' => '教育',
					'children' => [
						[
							'level_id' => '1000000184', 'name' => '学前教育',
							'tags_type' => [
								'头部图片'
							],
						
						],
						[
							'level_id' => '1000000185', 'name' => 'K12教育',
							'tags_type' => [
								'头部图片'
							],
						],
						[
							'level_id' => '1000000195', 'name' => '国际教育',
							'tags_type' => [
								'头部图片'
							],
						],
						[
							'level_id' => '1000000196', 'name' => '培训教育',
							'tags_type' => [
								'头部图片'
							],
						],
					],
				],
			],
		],
		[
			'level_id' => '1000000136', 'name' => '投资者关系',
			'tags_type' => [
				'头部图片', '机构评级'
			],
			'children' => [
				
				[
					'level_id' => '1000000200', 'name' => '企业管治',
					'tags_type' => [
						'头部图片'
					],
				],
				
				[
					'level_id' => '1000000198', 'name' => '业绩发布材料',
					'tags_type' => [
						'材料'
					],
				],
			],
		],
		['level_id' => '1000000135', 'name' => '加入雅居乐',
			'tags_type' => [
				'头部图片', '加入雅居乐', '员工发展'
			],
			'children' => [
				[
					'level_id' => '1000000148', 'name' => '员工发展',
					'tags_type' => [
						'头部图片'
					],
				],
			]
		],
	],
	'MENU_IMAGE_LEVELS' => [
		[
			'level_id' => '10000', 'name' => '首页',
			'tags_type' => [
				'头部图片', '导航图片', '股市概况', '微信二维码'
			],
		
		],
		[   'level_id' => '1000000123', 'name' => '走进雅居乐',
			'tags_type' => [
				'头部图片'
			],
			'children' => [
				[
					'level_id' => '1000000126', 'name' => '集团介绍',
					'tags_type' => [
						'头部图片'
					],
				],
				[
					'level_id' => '1000000140', 'name' => '发展历程',
					'tags_type' => [
						'头部图片'
					],
				],
				[
					'level_id' => '1000000138', 'name' => '社会责任',
					'tags_type' => [
						'头部图片'
					],
				],
				[
					'level_id' => '1000000137', 'name' => '企业宣传',
					'tags_type' => [
						'头部图片'
					],
				],
			],
		],
		[
			'level_id' => '1000000125', 'name' => '多元业务',
			'tags_type' => [
				'头部图片', '雅生活', '建设', '教育', '环保', '酒店','房管'
			],
			'children' => [
				[
					'level_id' => '1000000128', 'name' => '地产',
					'tags_type' => [
						'头部图片'
					],
					'children' => [
						[
							'level_id' => '1000000165', 'name' => '楼盘查询',
							'tags_type' => [
								'头部图片'
							],
						],
					],
				],
				[
					'level_id' => '1000000130', 'name' => '雅生活',
					'tags_type' => [
						'头部图片'
					],
					'children' => [
						[
							'level_id' => '1000000186', 'name' => '物业',
							'tags_type' => [
								'头部图片'
							],
						],
						[
							'level_id' => '1000000190', 'name' => '旅游',
							'tags_type' => [
								'头部图片', '中间图片'
							],
						],
						[
							'level_id' => '1000000191', 'name' => '智慧园区',
							'tags_type' => [
								'头部图片'
							],
						],
					],
				],
				[
					'level_id' => '1000000131', 'name' => '酒店',
					'tags_type' => [
						'头部图片'
					],
				],
				[
					'level_id' => '1000000132', 'name' => '环保',
					'tags_type' => [
						'头部图片'
					],
				],
				[
					'level_id' => '1000000133', 'name' => '教育',
					'children' => [
						[
							'level_id' => '1000000184', 'name' => '学前教育',
							'tags_type' => [
								'头部图片'
							],
						
						],
						[
							'level_id' => '1000000185', 'name' => 'K12教育',
							'tags_type' => [
								'头部图片'
							],
						],
						[
							'level_id' => '1000000195', 'name' => '国际教育',
							'tags_type' => [
								'头部图片'
							],
						],
						[
							'level_id' => '1000000196', 'name' => '培训教育',
							'tags_type' => [
								'头部图片'
							],
						],
					],
				],
			],
		],
		[
			'level_id' => '1000000136', 'name' => '投资者关系',
			'tags_type' => [
				'头部图片', '机构评级'
			],
			'children' => [
				
				[
					'level_id' => '1000000200', 'name' => '企业管治',
					'tags_type' => [
						'头部图片'
					],
				],
				
				[
					'level_id' => '1000000198', 'name' => '业绩发布材料',
					'tags_type' => [
						'材料'
					],
				],
			],
		],
		['level_id' => '1000000135', 'name' => '加入雅居乐',
			'tags_type' => [
				'头部图片', '加入雅居乐', '员工发展'
			],
			'children' => [
				[
					'level_id' => '1000000148', 'name' => '员工发展',
					'tags_type' => [
						'头部图片'
					],
				],
			]
		],
	],
	
	'NOT_USE_MENU_LEVELS' => [
		['level_id' => '1000000127', 'name' => '主席专区'],
		['level_id' => '1000000134', 'name' => '联系我们'],
		['level_id' => '1000000145', 'name' => '机构评级'],
		['level_id' => '1000000146', 'name' => '联系我们'],
		['level_id' => '1000000149', 'name' => '廉洁举报'],
		['level_id' => '1000000150', 'name' => '招商招标'],
		['level_id' => '1000000151', 'name' => '客户联系'],
	],
];