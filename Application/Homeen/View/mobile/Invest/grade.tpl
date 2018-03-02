<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/invest/invest-grade.css">
</block>
<block name="head_common2">
    <script src="/public_en/js/lib/tab.js"></script>
</block>
<block name="title">Ratings-Agile Group</block>

<block name="head_menu">
    <a class="tip" href="#">Ratings/</a>
</block>

<block name="body_main">
    <div class="content  container  pt-20 pb-30 bg-c">
        <h2 class="txt-center f-20 pt-10 pb-10" style="font-weight:bold">Ratings</h2>
        <div class="score">
            <a class="active" style="float:left"><img class="point" src="/public_en/img/home/invest/point2.png"><span
                        class="level">Credit<br>Ratings<span class="icon"></span></span></a>

            <a style="float:right"><img class="point" src="/public_en/img/home/invest/point2.png"><span
                        class="level second">Institution<br>Ratings<span class="icon"
                                                                         style="display: none;"></span></span></a>
        </div>
        <div class="form">
            <h4 class="txt-center f-20 pt-20 pb-5" style="font-weight:bold">Credit Ratings</h4>
            <span class="date">(Updates at <php>echo date('m/d/Y',strtotime($credits_time))</php>)</span>
            <table class="table" border="0" cellspacing="0"
                   style="color:#FFF; text-align:left; font-size:14px; font-weight:bold; width:100%;">
                <tr>
                    <td class="f-t" bgcolor="006c65" ; style=" width:20px;border: none;"><img
                                src="/public_en/img/home/invest/point3.png"></td>
                    <td class="f-t" bgcolor="007069" ; style=" width:50px; color: #fff;border: none;text-align:center">
                        Credit<br>Ratings<br>Agencies
                    </td>
                    <td class="f-t" bgcolor="006c65" ; style="color: #fff; border: none;text-align:center">Date</td>
                    <td class="f-t" bgcolor="007069" ; style="width:55px;color: #fff;border: none;text-align:center">
                        Corporate<br>Family<br>Ratings
                    </td>
                    <td class="f-t" bgcolor="006c65" ; style="color: #fff;border: none;text-align:center">Outlook
                    </td>
                </tr>
                <volist name="credits" id="item">
                    <tr>
                        <td class="f-w" bgcolor="f5f5f5">{$i}</td>
                        <td class="f-w" bgcolor="ffffff">{$item.institution}</td>
                        <td class="f-w" bgcolor="f5f5f5">
                            <php>echo date('m/d/Y',strtotime($item['begin_time']))</php>
                        </td>
                        <td class="f-w" bgcolor="ffffff">{$item.grade}</td>
                        <td class="f-w" bgcolor="f5f5f5">{$item.forecast}</td>
                    </tr>
                </volist>
            </table>
        </div>

        <div class="form" style="display: none;">
            <h4 class="txt-center f-20 pt-20 pb-5" style="font-weight:bold">Stocks Rating Summary of Research
                Institutes</h4>
            <span class="date">(Updates at <php>echo date('m/d/Y',strtotime($share_time))</php>)</span>
            <table class="table" border="0" cellspacing="0"
                   style="color:#FFF; text-align:left; font-size:14px; font-weight:bold; width:100%;">
                <tr>
                    <td bgcolor="006c65" ; style="border: none;padding: 8px;"><img
                                src="/public_en/img/home/invest/point3.png"></td>
                    <td bgcolor="007069" ;
                        style=" width:281px; color: #fff; font-size: 10px;border: none;padding: 6px;">Research<br>Institutes
                    </td>
                    <td bgcolor="006c65" ;
                        style=" width:190px; color: #fff; font-size: 10px;border: none;padding: 6px;">Date
                    </td>
                    <td bgcolor="007069" ;
                        style=" width:180px; color: #fff; font-size: 10px;border: none;padding: 6px;">Analysts
                    </td>
                    <td bgcolor="006c65" ;
                        style=" width:128px; color: #fff; font-size: 10px;border: none;padding: 6px;">Rating
                    </td>
                    <td bgcolor="007069" ;
                        style=" width:174px; color: #fff; font-size: 10px;border: none;padding: 6px;">
                        Target<br>Price<br>(HKD)
                    </td>
                </tr>
                <tr style="border-bottom:1px solid #fff" id="buy-head">
                    <td colspan="6" bgcolor="2dbca5"
                        style="height:40px;border: none;color:#fff;font-size: 17px;text-align: center;">
                        <span style="padding-left:5px;padding-bottom:5px;width:40%;display: inline-block;border-top: 1px solid #81d7c9;"></span>
                        <span>Buy</span>
                        <span style="padding-bottom:5px;width:40%;display: inline-block;border-top: 1px solid #81d7c9;"></span>
                        <img id="icon-head-0" class="table-icon icon-tran-rotate"
                             src="/public_en/img/mobile/invest/index/table-icon_03.png">
                    </td>
                </tr>
                <volist name="buy" id="item">
                    <tr class="buy-c">
                        <td class="f-w" bgcolor="f5f5f5">{$i}</td>
                        <td class="f-w" bgcolor="ffffff">{$item.institution}</td>
                        <td class="f-w" bgcolor="f5f5f5">
                            <php>echo date('m/d/Y',strtotime($item['begin_time']))</php>
                        </td>
                        <td class="f-w" bgcolor="ffffff">{$item.analyst}</td>
                        <td class="f-w" bgcolor="f5f5f5">{$item.grade}</td>
                        <td class="f-w hkd" bgcolor="ffffff">{$item.hkd}</td>
                    </tr>
                </volist>
                <tr style="border-bottom:1px solid #fff" class="parent1">
                    <td colspan="6" bgcolor="2dbca5"
                        style="height:40px;border: none;color:#fff;font-size: 17px;text-align: center;">
                        <span style="padding-left:5px;padding-bottom:5px;width:35%;display: inline-block;border-top: 1px solid #81d7c9;"></span>
                        <span>Neutral</span>
                        <span style="padding-bottom:5px;width:35%;display: inline-block;border-top: 1px solid #81d7c9;"></span>
                        <img id="icon-head-1" class="table-icon"
                             src="/public_en/img/mobile/invest/index/table-icon_03.png">
                    </td>
                </tr>
                <volist name="neuter" id="item">
                    <tr class="brother son">
                        <td class="f-w brother son" bgcolor="f5f5f5">{$i}</td>
                        <td class="f-w brother son" bgcolor="ffffff">{$item.institution}</td>
                        <td class="f-w brother son" bgcolor="f5f5f5">
                            <php>echo date('m/d/Y',strtotime($item['begin_time']))</php>
                        </td>
                        <td class="f-w brother son" bgcolor="ffffff">{$item.analyst}</td>
                        <td class="f-w brother son " bgcolor="f5f5f5">{$item.grade}</td>
                        <td class="f-w brother son hkd" bgcolor="ffffff">{$item.hkd}</td>
                    </tr>
                </volist>
                <tr style="border-bottom:1px solid #fff" class="parent2">
                    <td colspan="6" bgcolor="2dbca5"
                        style="height:40px;border: none;color:#fff;font-size: 17px;text-align: center;">
                        <span style="padding-left:5px;padding-bottom:5px;width:41%;display: inline-block;border-top: 1px solid #81d7c9;"></span>
                        <span>Sell</span>
                        <span style="padding-bottom:5px;width:41%;display: inline-block;border-top: 1px solid #81d7c9;"></span>
                        <img id="icon-head-2" class="table-icon"
                             src="/public_en/img/mobile/invest/index/table-icon_03.png">
                    </td>
                </tr>
                <volist name="sold" id="item">
                    <tr class="brother1 son">
                        <td class="f-w brother1 son " bgcolor="f5f5f5">{$i}</td>
                        <td class="f-w brother1 son " bgcolor="ffffff">{$item.institution}</td>
                        <td class="f-w brother1 son " bgcolor="f5f5f5">
                            <php>echo date('m/d/Y',strtotime($item['begin_time']))</php>
                        </td>
                        <td class="f-w brother1 son " bgcolor="ffffff">{$item.analyst}</td>
                        <td class="f-w brother1 son " bgcolor="f5f5f5">{$item.grade}</td>
                        <td class="f-w brother1 son hkd" bgcolor="ffffff">{$item.hkd}</td>
                    </tr>
                </volist>
            </table>
        </div>
    </div>
</block>
<block name="footer_js">
    <script>
		$(function () {
			$(".score a").click(function () {
				var Index = $(this).index();
				$(this).addClass("active").siblings("a").removeClass("active");
				$(".score a .icon").css({"display": "none"});
				$(".score a .icon").eq(Index).css({"display": "block"});
				$(".form").css({"display": "none"});
				$(".form").eq(Index).css({"display": "block"});
			})
			$(".parent1").click(function () {
				if ($(".brother").is(":hidden")) {
					$(".brother").show();
					$("#icon-head-1").addClass("icon-tran-rotate");
				} else {
					$(".brother").hide();
					$("#icon-head-1").removeClass("icon-tran-rotate");
				}
			});
			$(".parent2").click(function () {
				if ($(".brother1").is(":hidden")) {
					$(".brother1").show();
					$("#icon-head-2").addClass("icon-tran-rotate");
				} else {
					$(".brother1").hide();
					$("#icon-head-2").removeClass("icon-tran-rotate");
				}
			});
			$('#buy-head').click(function () {
				if ($(".buy-c").is(":hidden")) {
					$(".buy-c").show();
					$("#icon-head-0").addClass("icon-tran-rotate");
				} else {
					$(".buy-c").hide();
					$("#icon-head-0").removeClass("icon-tran-rotate");
				}
			});
			var hkd = $(".hkd");
			hkd.each(function (i) {
				var hkd_value = parseFloat($(this).html());

				$(this).html(hkd_value.toFixed(2))
			});
		})

    </script>
</block>