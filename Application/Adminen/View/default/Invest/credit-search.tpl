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

    <link rel="stylesheet" href="/public/css/home/invest/invest-grade.css">


    <!--[if IE 6]>
    <script type="text/javascript" src="/public/js/lib/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->

</head>

<body>
<div class="section1">
    <div class="content container">
        <div class="score">
            <a class="active"><img class="point" src="/public/img/home/invest/point2.png"><span
                        class="level">信用评级<span class="icon"></span></span></a>

        </div>

        <div class="form">
            <p class="date">(更新至
                <php>echo $credits_time;</php>
                )
            </p>
            <table class="table" border="0" cellspacing="0"
                   style="color:#FFF; text-align:left; font-size:14px; font-weight:bold; width:100%;">
                <tr>
                    <td bgcolor="006c65" ; style=" width:42px;border: none;"><img
                                src="/public/img/home/invest/point3.png"></td>
                    <td bgcolor="007069" ; style=" width:240px; color: #fff; font-size: 17px;border: none;">信用评级机构
                    </td>
                    <td bgcolor="006c65" ; style=" width:160px; color: #fff; font-size: 17px;border: none;">日期</td>
                    <td bgcolor="007069" ; style=" width:160px; color: #fff; font-size: 17px;border: none;">企业家族评级
                    </td>
                    <td bgcolor="006c65" ; style=" width:130px; color: #fff; font-size: 17px;border: none;">评级展望
                    </td>
                </tr>
                <volist name="credits" id="item">
                    <tr>
                        <td bgcolor="f5f5f5">{$i}</td>
                        <td bgcolor="ffffff">{$item.institution}</td>
                        <td bgcolor="f5f5f5">{$item.begin_time}</td>
                        <td bgcolor="ffffff">{$item.grade}</td>
                        <td bgcolor="f5f5f5">{$item.forecast}</td>
                    </tr>
                </volist>
            </table>
        </div>
    </div>
</div>

</body>
</html>