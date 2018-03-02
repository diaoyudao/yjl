<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml/DTD/xhtml1-transitional.dtd">
<!--[if lt IE 7 ]>
<html xmlns="http://www.w3.org/1999/xhtml" class="ie ie6"> <![endif]-->
<!--[if IE 7 ]>
<html xmlns="http://www.w3.org/1999/xhtml" class="ie ie7"> <![endif]-->
<!--[if IE 8 ]>
<html xmlns="http://www.w3.org/1999/xhtml" class="ie ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]>
<html xmlns="http://www.w3.org/1999/xhtml"> <![endif]-->
<head>
    <meta charset="utf-8">
    <meta property="qc:admins" content="22622356756301671663756367"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/public/huiadmin/lib/html5.js"></script>
    <script type="text/javascript" src="/public/huiadmin/lib/respond.min.js"></script>
    <script type="text/javascript" src="/public/huiadmin/lib/PIE-2.0beta1/PIE_IE678.js"></script>
    <![endif]-->
    <title>
        预览
    </title>
    <meta name="keywords" content="雅居乐">
    <meta name="description" content="雅居乐">
    <!--sdk-->

    <link type="text/css" rel="stylesheet" href="/public/bootstrap/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="/public/css/home/globle.css"/>
    <link type="text/css" rel="stylesheet" href="/public/js/swiper/idangerous.swiper.css"/>

    <script type="text/javascript" src="/public/js/jquery-ui/external/jquery/jquery.js"></script>
    <script type="text/javascript" src="/public/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/public/js/swiper/noswiper.js"></script>
    <script type="text/javascript" src="/public/js/swiper/idangerous.swiper2.7.6.min.js"></script>

    <script type="text/javascript" src="/public/js/lib/sidelist.js"></script>
    <!--基地预约-->

    <link rel="stylesheet" href="/public/css/home/business/business_hotel_detail.css">
    <link rel="stylesheet" href="/public/css/home/enter/enter-publicity-vediodetail.css">


    <!--[if IE 6]>
    <script type="text/javascript" src="/public/js/lib/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->

</head>

<body>
<div class="section-s section1">
    <div class="content container">
        <p class="nav-p"><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                        href="/enter/index?level_id=1000000123">走进雅居乐</a></span>&nbsp;&nbsp;
            > &nbsp;&nbsp;<a href="/enter/publicity?level_id=1000000137">企业宣传</a></span>&nbsp;&nbsp; >
            &nbsp;&nbsp;<a href="/enter/publicityvedio">视频中心</a></span>&nbsp;&nbsp; > &nbsp;&nbsp;<span>视频详情</span>
        </p>


        <EMBED style=" margin: 5px auto; width:963px; height: 438px;"
               src="{$media.outside_link}"
               quality="high"
               wmode="transparent"
               pluginspage="http://www.macromedia.com/go/getflashplayer"
               type="application/x-shockwave-flash">

            <div class="title">{$media.title}</div>
            <div class="tips">
                发布时间：
                <php> echo date('Y-m-d',strtotime($media['begin_time']))</php>
                    <span class="begin-time">
                    </span>
                <span class="time">时长：{$media.duration}分钟</span>
                <img src="/public/img/home/enter/publicity/detail_eye.png" alt=""
                     style="vertical-align: middle;margin-left: 20px">
                    <span style="margin-left: 30px;">播放数：<span
                                style="color: #007069;font-size: 14px">{$media['view_count']}</span></span>
                <a style="margin-left: 30px;cursor:pointer;" id="a-two-code2"><img
                            src="/public/img/home/enter/publicity/detail_icon1.jpg" alt=""></a>
                <a onclick="shareXLWeiBo()" class="cursor"><span><img
                                src="/public/img/home/enter/publicity/detail_icon2.jpg" alt=""></span></a>
                <a onclick="shareQqZone()" class="cursor"><span><img
                                src="/public/img/home/enter/publicity/detail_icon3.jpg" alt=""></span></a>
            </div>
            <div style="height:0px;">
                <div style="position:relative;bottom:230px;left:450px;width:130px;height:130px;z-index:20;display:none;"
                     id="two-codes2">
                    <img src="{$two_bar_codes['image_url1']}" style="width:130px;height:130px;"/>
                </div>
            </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $('#two-codes2').hide();
        $('#a-two-code2').on('click', function () {
            if ($("#two-codes2").is(":hidden")) {
                $('#two-codes2').show();
            } else {
                $('#two-codes2').hide();
            }
        });



    });

    var shareXLWeiBo = function () {
        var _shareUrl = 'http://v.t.sina.com.cn/share/share.php?&appkey=895033136';     //真实的appkey ，必选参数
        _shareUrl += '&url=' + encodeURIComponent(document.location);     //参数url设置分享的内容链接|默认当前页location，可选参数
        _shareUrl += '&title=' + encodeURIComponent('{$media.title}');    //参数title设置分享的标题|默认当前页标题，可选参数
        _shareUrl += '&source=' + encodeURIComponent('雅居乐官网');
        _shareUrl += '&sourceUrl=' + encodeURIComponent('http://www.byyh.cn');
        _shareUrl += '&content=' + 'utf-8';   //参数content设置页面编码gb2312|utf-8，可选参数
        _shareUrl += '&pic=' + encodeURIComponent('');  //参数pic设置图片链接|默认为空，可选参数

        var _width = $(window).width() / 2;
        var _height = $(window).height() / 1.5;

        window.open(_shareUrl, '_blank', 'toolbar=no,menubar=no,scrollbars=no,resizable=1,location=no,status=0,' + 'width=' + _width + ',height=' + _height + ',top=' + (screen.height - _height) / 2 + ',left=' + (screen.width - _width) / 2);
    };
    var shareQqZone = function () {
        var _shareUrl = 'http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?';
        _shareUrl += 'url=' + encodeURIComponent(document.location);   //参数url设置分享的内容链接|默认当前页location
        _shareUrl += '&showcount=' + 1;      //参数showcount是否显示分享总数,显示：'1'，不显示：'0'，默认不显示
        _shareUrl += '&desc=' + encodeURIComponent('{$media.title}');    //参数desc设置分享的描述，可选参数
        _shareUrl += '&summary=' + encodeURIComponent('{$media.desc}');    //参数summary设置分享摘要，可选参数
        _shareUrl += '&title=' + encodeURIComponent(document.title);    //参数title设置分享标题，可选参数
        _shareUrl += '&site=' + encodeURIComponent('雅居乐官网');   //参数site设置分享来源，可选参数
        _shareUrl += '&pics=' + encodeURIComponent('');   //参数pics设置分享图片的路径，多张图片以＂|＂隔开，可选参数

        var _width = $(window).width() / 2;
        var _height = $(window).height() / 1.5;

        window.open(_shareUrl, '_blank', 'width=' + _width + ',height=' + _height + ',top=' + (screen.height - _height) / 2 + ',left=' + (screen.width - _width) / 2 + ',toolbar=no,menubar=no,scrollbars=no,resizable=1,location=no,status=0');
    }
</script>
</body>
</html>