<extend name="./Application/Homeen/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/invest/invest-grade.css">
</block>
<block name="head_common2">
    <script src="/public_en/js/lib/tab.js"></script>
</block>
<block name="title">Ratings-Agile Group</block>

<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                            href="/en/invest/index?level_id=1000000136">Investor Relations</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span>Ratings</span></p>
            <h2>Ratings</h2>
            <div class="score">
                <a class="active"><img class="point" src="/public_en/img/home/invest/point2.png"><span
                            class="level">Credit Ratings<span class="icon"></span></span></a>

                <a><img class="point" src="/public_en/img/home/invest/point2.png"><span
                            class="level second">Institution Ratings<span class="icon"
                                                                          style="display: none;"></span></span></a>
            </div>

            <div class="form">
                <p class="date">(Updates at
                    <php>echo date('m/d/Y',strtotime($credits_time))</php>
                    )
                </p>
                <table class="table" border="0" cellspacing="0"
                       style="color:#FFF; text-align:left; font-size:14px; font-weight:bold; width:100%;">
                    <tr>
                        <td bgcolor="006c65" ; style=" width:42px;border: none;"><img
                                    src="/public_en/img/home/invest/point3.png"></td>
                        <td bgcolor="007069" ; style=" width:240px; color: #fff; font-size: 17px;border: none;">Credit
                            Ratings Agencies
                        </td>
                        <td bgcolor="006c65" ; style=" width:160px; color: #fff; font-size: 17px;border: none;">Date
                        </td>
                        <td bgcolor="007069" ; style="  color: #fff; font-size: 17px;border: none;">Corporate Family
                            Ratings
                        </td>
                        <td bgcolor="006c65" ; style=" width:130px; color: #fff; font-size: 17px;border: none;">Outlook
                        </td>
                    </tr>
                    <volist name="credits" id="item">
                        <tr>
                            <td bgcolor="f5f5f5">{$i}</td>
                            <td bgcolor="ffffff">{$item.institution}</td>
                            <td bgcolor="f5f5f5">
                                <php>echo date('m/d/Y',strtotime($item['begin_time']))</php>
                            </td>
                            <td bgcolor="ffffff">{$item.grade}</td>
                            <td bgcolor="f5f5f5">{$item.forecast}</td>
                        </tr>
                    </volist>
                </table>
            </div>
            <div class="form" style="display: none;">
                <p class="date">(Updates at
                    <php>echo date('m/d/Y',strtotime($share_time))</php>
                    )
                </p>
                <table class="table" border="0" cellspacing="0"
                       style="color:#FFF; text-align:left; font-size:14px; font-weight:bold; width:100%;">
                    <tr>
                        <td bgcolor="006c65" ; style=" width:42px;border: none;"><img
                                    src="/public_en/img/home/invest/point3.png"></td>
                        <td bgcolor="007069" ; style=" width:240px; color: #fff; font-size: 17px;border: none;">Research
                            Institutes
                        </td>
                        <td bgcolor="006c65" ; style=" width:160px; color: #fff; font-size: 17px;border: none;">Date
                        </td>
                        <td bgcolor="007069" ; style=" width:160px; color: #fff; font-size: 17px;border: none;">
                            Analysts
                        </td>
                        <td bgcolor="006c65" ; style=" width:130px; color: #fff; font-size: 17px;border: none;">Rating
                        </td>
                        <td bgcolor="007069" ; style="  color: #fff; font-size: 17px;border: none;">
                            Target Price(HKD)
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" bgcolor="2dbca5"
                            style="height:40px;border: none;color:#fff;font-size: 17px;text-align: center;">
                            <span style="padding-left:5px;padding-bottom:5px;width:45%;display: inline-block;border-top: 1px solid #fff;"></span>
                            <span>Buy</span>
                            <span style="padding-bottom:5px;width:45%;display: inline-block;border-top: 1px solid #fff;"></span>
                        </td>
                    </tr>
                    <volist name="buy" id="item">
                        <tr>
                            <td bgcolor="f5f5f5">{$i}</td>
                            <td bgcolor="ffffff">{$item.institution}</td>
                            <td bgcolor="f5f5f5">
                                <php>echo date('m/d/Y',strtotime($item['begin_time']))</php>
                            </td>
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
                                    src="/public_en/img/home/invest/point3.png"></td>
                        <td bgcolor="007069" ; style=" width:240px; color: #fff; font-size: 17px;border: none;">Research
                            Institutes
                        </td>
                        <td bgcolor="006c65" ; style=" width:160px; color: #fff; font-size: 17px;border: none;">Date
                        </td>
                        <td bgcolor="007069" ; style=" width:160px; color: #fff; font-size: 17px;border: none;">
                            Analysts
                        </td>
                        <td bgcolor="006c65" ; style=" width:130px; color: #fff; font-size: 17px;border: none;">Rating
                        </td>
                        <td bgcolor="007069" ; style="  color: #fff; font-size: 17px;border: none;">
                            Target Price(HKD)
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" bgcolor="2dbca5"
                            style="height:40px;border: none;color:#fff;font-size: 17px;text-align: center;">
                            <span style="padding-left:5px;padding-bottom:5px;width:45%;display: inline-block;border-top: 1px solid #fff;"></span>
                            <span>Neutral</span>
                            <span style="padding-bottom:5px;width:45%;display: inline-block;border-top: 1px solid #fff;"></span>
                        </td>
                    </tr>
                    <volist name="neuter" id="item">
                        <tr>
                            <td bgcolor="f5f5f5">{$i}</td>
                            <td bgcolor="ffffff">{$item.institution}</td>
                            <td bgcolor="f5f5f5">
                                <php>echo date('m/d/Y',strtotime($item['begin_time']))</php>
                            </td>
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
                                    src="/public_en/img/home/invest/point3.png"></td>
                        <td bgcolor="007069" ; style=" width:240px; color: #fff; font-size: 17px;border: none;">Research
                            Institutes
                        </td>
                        <td bgcolor="006c65" ; style=" width:160px; color: #fff; font-size: 17px;border: none;">Date
                        </td>
                        <td bgcolor="007069" ; style=" width:160px; color: #fff; font-size: 17px;border: none;">
                            Analysts
                        </td>
                        <td bgcolor="006c65" ; style=" width:130px; color: #fff; font-size: 17px;border: none;">Rating
                        </td>
                        <td bgcolor="007069" ; style="  color: #fff; font-size: 17px;border: none;">
                            Target Price(HKD)
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" bgcolor="2dbca5"
                            style="height:40px;border: none;color:#fff;font-size: 17px;text-align: center;">
                            <span style="padding-left:5px;padding-bottom:5px;width:45%;display: inline-block;border-top: 1px solid #fff;"></span>
                            <span>Sell</span>
                            <span style="padding-bottom:5px;width:45%;display: inline-block;border-top: 1px solid #fff;"></span>
                        </td>
                    </tr>
                    <volist name="sold" id="item">
                        <tr>
                            <td bgcolor="f5f5f5">{$i}</td>
                            <td bgcolor="ffffff">{$item.institution}</td>
                            <td bgcolor="f5f5f5">
                                <php>echo date('m/d/Y',strtotime($item['begin_time']))</php>
                            </td>
                            <td bgcolor="ffffff">{$item.analyst}</td>
                            <td bgcolor="f5f5f5">{$item.grade}</td>
                            <td class="hkd" bgcolor="ffffff">{$item.hkd}</td>
                        </tr>
                    </volist>
                </table>
                <div class="page">
                    <i class="prev"><img src="/public_en/img/home/invest/prev.png"></i>
                    <span>1</span>
                    <span>2</span>
                    <span>3</span>
                    <i class="next"><img src="/public_en/img/home/invest/next.png"></i>
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
				index = $(this).index() - 1;
				$(this).addClass("active").siblings().removeClass("active");
				$(".form table").eq(index + 1).show().siblings("table").hide();
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
//            console.log($(".hkd").html())
			var hkd = $(".hkd");
			hkd.each(function (i) {
				var hkd_value = parseFloat($(this).html());

				$(this).html(hkd_value.toFixed(2))
			});


		});
    </script>
</block>