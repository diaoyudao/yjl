<extend name="./Application/Home/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/invest/invest-grade.css">
</block>
<block name="head_common2">
    <script src="/public/js/lib/tab.js"></script>
</block>
<block name="title">机构评级-雅居乐集团</block>

<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a href="/invest/index?level_id=1000000136">投资者关系</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span>机构评级</span></p>
            <h2>机构评级</h2>
            <div class="score">
                <a class="active"><img class="point" src="/public/img/home/invest/point2.png"><span
                        class="level">信用评级<span class="icon"></span></span></a>

                <a><img class="point" src="/public/img/home/invest/point2.png"><span
                        class="level second">股票评级<span class="icon" style="display: none;"></span></span></a>
            </div>

            <div class="form">
                <p class="date">(更新至 <php>echo $credits_time;</php>)</p>
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
            <div class="form" style="display: none;">
                <p class="date">(更新至 <php>echo $share_time;</php>)</p>
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
                    <volist name="sold" id="item" >
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
</block>
<block name="footer_js">
    <script>
        $(".header .nav li").eq(3).addClass("active").siblings().removeClass("active");
        $(function () {
            $(".page span").eq(0).addClass("active");
            var index = 0;
            $(".page span").click(function () {
                index = $(this).index()-1;
                $(this).addClass("active").siblings().removeClass("active");
                $(".form table").eq(index+1).show().siblings("table").hide();
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
                if (index >=2) {
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
</block>