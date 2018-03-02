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
    <script src="/public/js/lib/tab.js"></script>
</head>

<body>
<div class="section1">
    <div class="content container">
        <div class="score">
            <a class="active"><img class="point" src="/public/img/home/invest/point2.png"><span
                        class="level ">股票评级<span class="icon"></span></span></a>
        </div>

        <div class="form" >
            <p class="date">(更新至
                <php>echo $share_time;</php>
                )
            </p>
            <table class="table" border="0" cellspacing="0"
                   style="color:#FFF; text-align:left; font-size:14px; font-weight:bold; width:100%;">
                <tr>
                    <td bgcolor="006c65" ; style=" width:42px;border: none;"><img
                                src="/public/img/home/invest/point3.png"></td>
                    <td bgcolor="007069" ; style=" width:240px; color: #fff; font-size: 17px;border: none;">投行/券商
                    </td>
                    <td bgcolor="006c65" ; style=" width:160px; color: #fff; font-size: 17px;border: none;">日期</td>
                    <td bgcolor="007069" ; style=" width:160px; color: #fff; font-size: 17px;border: none;">分析师</td>
                    <td bgcolor="006c65" ; style=" width:130px; color: #fff; font-size: 17px;border: none;">评级</td>
                    <td bgcolor="007069" ; style=" width:145px; color: #fff; font-size: 17px;border: none;">
                        目标价(HKD)
                    </td>
                </tr>
                <tr>
                    <td colspan="6" bgcolor="2dbca5"
                        style="height:40px;border: none;color:#fff;font-size: 17px;text-align: center;">
                        <span style="padding-left:5px;padding-bottom:5px;width:45%;display: inline-block;border-top: 1px solid #fff;"></span>
                        <span>买入</span>
                        <span style="padding-bottom:5px;width:45%;display: inline-block;border-top: 1px solid #fff;"></span>
                    </td>
                </tr>
                <volist name="buy" id="item">
                    <tr>
                        <td bgcolor="f5f5f5">{$i}</td>
                        <td bgcolor="ffffff">{$item.institution}</td>
                        <td bgcolor="f5f5f5">{$item.begin_time}</td>
                        <td bgcolor="ffffff">{$item.analyst}</td>
                        <td bgcolor="f5f5f5">{$item.grade}</td>
                        <td class="hkd" bgcolor="ffffff">{$item.hkd}</td>
                    </tr>
                </volist>
            </table>
            <table class="table" border="0" cellspacing="0"
                   style="display: none;color:#FFF; text-align:left; font-size:14px; font-weight:bold; width:100%;">
                <tr>
                    <td bgcolor="006c65" ; style=" width:42px;border: none;"><img
                                src="/public/img/home/invest/point3.png"></td>
                    <td bgcolor="007069" ; style=" width:240px; color: #fff; font-size: 17px;border: none;">投行/券商
                    </td>
                    <td bgcolor="006c65" ; style=" width:160px; color: #fff; font-size: 17px;border: none;">日期</td>
                    <td bgcolor="007069" ; style=" width:160px; color: #fff; font-size: 17px;border: none;">分析师</td>
                    <td bgcolor="006c65" ; style=" width:130px; color: #fff; font-size: 17px;border: none;">评级</td>
                    <td bgcolor="007069" ; style=" width:145px; color: #fff; font-size: 17px;border: none;">
                        目标价(HKD)
                    </td>
                </tr>
                <tr>
                    <td colspan="6" bgcolor="2dbca5"
                        style="height:40px;border: none;color:#fff;font-size: 17px;text-align: center;">
                        <span style="padding-left:5px;padding-bottom:5px;width:45%;display: inline-block;border-top: 1px solid #fff;"></span>
                        <span>中性</span>
                        <span style="padding-bottom:5px;width:45%;display: inline-block;border-top: 1px solid #fff;"></span>
                    </td>
                </tr>
                <volist name="neuter" id="item">
                    <tr>
                        <td bgcolor="f5f5f5">{$i}</td>
                        <td bgcolor="ffffff">{$item.institution}</td>
                        <td bgcolor="f5f5f5">{$item.begin_time}</td>
                        <td bgcolor="ffffff">{$item.analyst}</td>
                        <td bgcolor="f5f5f5">{$item.grade}</td>
                        <td class="hkd" bgcolor="ffffff">{$item.hkd}</td>
                    </tr>
                </volist>
            </table>
            <table class="table" border="0" cellspacing="0"
                   style="display: none;color:#FFF; text-align:left; font-size:14px; font-weight:bold; width:100%;">
                <tr>
                    <td bgcolor="006c65" ; style=" width:42px;border: none;"><img
                                src="/public/img/home/invest/point3.png"></td>
                    <td bgcolor="007069" ; style=" width:240px; color: #fff; font-size: 17px;border: none;">投行/券商
                    </td>
                    <td bgcolor="006c65" ; style=" width:160px; color: #fff; font-size: 17px;border: none;">日期</td>
                    <td bgcolor="007069" ; style=" width:160px; color: #fff; font-size: 17px;border: none;">分析师</td>
                    <td bgcolor="006c65" ; style=" width:130px; color: #fff; font-size: 17px;border: none;">评级</td>
                    <td bgcolor="007069" ; style=" width:145px; color: #fff; font-size: 17px;border: none;">
                        目标价(HKD)
                    </td>
                </tr>
                <tr>
                    <td colspan="6" bgcolor="2dbca5"
                        style="height:40px;border: none;color:#fff;font-size: 17px;text-align: center;">
                        <span style="padding-left:5px;padding-bottom:5px;width:45%;display: inline-block;border-top: 1px solid #fff;"></span>
                        <span>卖出</span>
                        <span style="padding-bottom:5px;width:45%;display: inline-block;border-top: 1px solid #fff;"></span>
                    </td>
                </tr>
                <volist name="sold" id="item">
                    <tr>
                        <td bgcolor="f5f5f5">{$i}</td>
                        <td bgcolor="ffffff">{$item.institution}</td>
                        <td bgcolor="f5f5f5">{$item.begin_time}</td>
                        <td bgcolor="ffffff">{$item.analyst}</td>
                        <td bgcolor="f5f5f5">{$item.grade}</td>
                        <td class="hkd" bgcolor="ffffff">{$item.hkd}</td>
                    </tr>
                </volist>
            </table>
            <div class="page">
                <i class="prev"><img src="/public/img/home/invest/prev.png"></i>
                <span>1</span>
                <span>2</span>
                <span>3</span>
                <i class="next"><img src="/public/img/home/invest/next.png"></i>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        $(".page span").eq(0).addClass("active");
        var index = 0;
        $(".page span").click(function () {
            index = $(this).index() - 1;
            $(this).addClass("active").siblings().removeClass("active");
            $(".form table").eq(index).show().siblings("table").hide();
        });
        $(".page .prev").click(function () {
            if (index <= 0) {
                return;
            } else {
                index--;
                $(".page span").eq(index).addClass("active").siblings().removeClass("active");
                $(this).parents(".form").find("table").eq(index).show().siblings(".form table").hide();
            }
        });
        $(".page .next").click(function () {
            if (index >= 2) {
                return;
            } else {
                index++;
                $(".page span").eq(index).addClass("active").siblings().removeClass("active");
                $(this).parents(".form").find("table").eq(index).show().siblings(".form table").hide();
            }
        });
        var hkd = $(".hkd");
        hkd.each(function (i) {
            var hkd_value=parseFloat($(this).html());

            $(this).html(hkd_value.toFixed(2))
        });
    });
</script>
</body>
</html>