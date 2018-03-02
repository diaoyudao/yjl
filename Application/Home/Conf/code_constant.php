<?php
return [
    /* 代码常量 */
    'STATUS_VALID' => 1,  // 状态，有效
    'STATUS_INVALID' => 0,  // 状态，无效

    'HOME_PATH' => '',   // 相对路径，相对与长安官网服务器路径

	'ONE_PAGE_SIZE' => 6,   // 单页显示的列表记录数

	'COOKIE_PREFIX' => 'bl_incall_',  // cookie前缀
	'COOKIE_EXPIRE' => 12*3600,   // cookie保留时间
	'LOOP_COK_TIME' => 70,  // 循环调用页面停留时间，s
	'DURATION_OUT_TIME' => 30*60,  // 停留页面超时时间，s

];