<extend name="./Application/Homeen/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/invest/invest-index.css">
</block>
<block name="title">Investor Relations-Agile Group</block>

<block name="body_main">
    <div class="section1">
        <div class="slider">
            <div class="pic-box">
                <a target="_blank" <notempty name="item.link_url1"> href='{$item.link_url1}'</notempty> >
                <img src="{$head_images[0].image_url1}" traditional_image="{$head_images[0].image_url2}"
                     simplified_image="{$head_images[0].image_url1}" alt="" class="pic"/>
                     </a>
            </div>
        </div>
        <div class="cover1">
            <div class="shares">
                <div class="content container">
                    <div class="cover"></div>
                    <div class="title"><span id="val06">Agile Group(3383.HK)</span><span id="val09"></span></div>
                    <div style="overflow: hidden;position: relative;">
                        <div class="now">
                            $<span class="now-num" id="val01">4.230</span> <span class="icon"><img id="share_image"
                                                                                                   src="/public_en/img/home/invest/main_shares_icon.png"
                                                                                                   alt=""></span> <span
                                class="index">HKD</span>
                        </div>
                        <div class="item">
                            <div class="title">Day high</div>
                            $<span class="max" id="val03"></span><span class="index">HKD</span>
                        </div>
                        <div class="item">
                            <div class="title">Day Low</div>
                            $<span class="min" id="val04"></span><span class="index">HKD</span>
                        </div>
                        <div class="item">
                            <div class="title">Volume</div>
                            <span class="volume" id="val11"></span><span class="index">Million</span>
                        </div>
                        <div class="item">
                            <div class="title">Turnover</div>
                            $<span class="trunover" id="val12"></span><span class="index">Million</span>
                        </div>
                    </div>
                    <div  style="color: #a5c2bf;font-size: 14px;">
                        Change&nbsp;<img class="share_image2"
                                      src="/public_en/img/home/invest/main_shares_up.png"
                                      alt="" style="margin-bottom: 5px;padding-right: 5px;"><span class="" id="val13"  ></span>
                        （<img class="share_image2"
                              src="/public_en/img/home/invest/main_shares_up.png"
                              alt="" style="margin-bottom: 5px;padding-right: 5px;"><span class="" id="val14" ></span>%）
                    </div>
                    <span class="time">
                        As as &nbsp;<span class="time-to" id="val07"></span>
                    </span>
                    <span class="text" style="margin-right:70px;color: #999">* Stocks information isdelayed by around 15 minutes Source of information: Sina Stocks Index
</span>
                    <p><span></span></p>
                </div>
            </div>
        </div>
    </div>
    <div class="section3">
        <div class="report container">
            <div class="box">
                <div class="left">
                    <div class="title"><span><a href="/en/invest/notice?level_id=1000000144">Announcements</a></span></div>
                    <img src="/public_en/img/home/invest/pic1.jpg" style="width: 397px;height: 298px;">
                </div>
                <div class="right">
                    <volist name="notices" id="item" offset="0" length="1"></volist>
                        <div class="item1">
                            <div class="">
                                <span class="icon "></span>
                                <span  class="text">{$item.title}</span>
                            </div>
                            <div class="clear"></div>
                            <span class="date">Release Time: <php>echo date('Y-m',strtotime($item['begin_time']))</php></span>
                            <span class="downLoad"><span class="icon1"></span><a href="{$item.url}">Download</a></span>
                        </div>
                    <volist name="notices" id="item" offset="1" length="1">
                        <div class="item2">
                            <div class="">
                                <span class="icon"></span>
                                <span class="text">{$item.title}</span>
                            </div>
                            <div class="clear"></div>
                            <span class="date">Release Time: <php>echo date('Y-m',strtotime($item['begin_time']))</php></span>
                            <span class="downLoad"><span class="icon1"></span><a href="{$item.url}">Download</a></span>
                        </div>
                    </volist>

                    <div class="more" style="margin-top:10px;"><a class="btn-more" href="/en/invest/notice?level_id=1000000144">More</a></div>
                </div>
            </div>

            <div class="contact">
                <a class="btn-more1" href="/en/invest/contact?level_id=1000000146">Contact Us</a>
            </div>
        </div>
    </div>
    <div class="section4">
        <div style="background: #efefef;width: 100%">
            <div class="content container">
                <h2>Corporate Governance</h2>
                <ul class="list">
                    <li style="margin-left: 0;"><a href="/en/invest/control?level_id=1000000197">
                        <img src="/public_en/img/home/invest/p1.jpg">
                        <span class="title">Corporate Governance</span>
                    </a>
                    </li>
                    <li><a href="/en/invest/directorate">
                        <img src="/public_en/img/home/invest/p2.jpg">
                        <span class="title">Board Diectors</span>
                        </a>
                    </li>
                    <li><a href="/en/invest/committee">
                        <img src="/public_en/img/home/invest/p3.jpg">
                        <span class="title">Board Committees</span>
                        </a>
                    </li>
                    <li><a href="/en/invest/monitored">
                        <img src="/public_en/img/home/invest/p4.jpg">
                        <span class="title">Internal Control</span>
                        </a>
                    </li>

                </ul>
            </div>
        </div>
    </div>
    <div class="section5">
        <div class="slider">
            <div class="pic-box">
                <img src="{$grade_images[0].image_url1}" traditional_image="{$grade_images[0].image_url2}"
                     simplified_image="{$grade_images[0].image_url1}" alt="" class="pic">
            </div>
            <!--<div class="box">-->
                <!--<span class="title">机构评级</span><br>-->
                <!--<span class="word">RATING</span>-->
                <!--<div class="s5_content">-->
                    <a class="btn-more" href="/en/invest/grade?level_id=1000000145">More
                    </a>
                <!--</div>-->
            <!--</div>-->

        </div>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(3).addClass("active").siblings().removeClass("active");
        })
    </script>
    <script src="http://hq.sinajs.cn/list=hk03383" id="src_code"></script>
    <script>
        function sear(code) {
            var rettag = eval("hq_str_" + code);
            var elements = rettag.split(",");
            var volume = parseFloat(elements[12] / 1000000).toFixed(3);
            var turnover = parseFloat(elements[11] / 1000000).toFixed(2);
            var val1=parseFloat(elements[6]).toFixed(2);
            var val3=parseFloat(elements[4]).toFixed(2);
            var val4=parseFloat(elements[5]).toFixed(2);
            var val5=parseFloat(elements[7]).toFixed(2);
            var val6=parseFloat(elements[8]).toFixed(2);
            if(0 == elements[6]){
                val1=parseFloat(elements[3]).toFixed(2);
                val5=0.00;
                val6=0.00;
                val3=parseFloat(elements[3]).toFixed(2);
                val4=parseFloat(elements[3]).toFixed(2);
            }
            document.getElementById('val01').innerText = val1;
            document.getElementById('val03').innerText = val3;
            document.getElementById('val04').innerText = val4;
            //document.getElementById('val06').innerText = elements[1];
            document.getElementById('val07').innerText = elements[17] + ' ' + elements[18];
            //document.getElementById('val09').innerText = '（3383.HK）';
            document.getElementById('val11').innerText = volume;
            document.getElementById('val12').innerText = turnover;
            document.getElementById('val13').innerText = val5;
            document.getElementById('val14').innerText = val6;
            if (parseFloat(elements[3]) > parseFloat(elements[6])) {
                var temp = $('#share_image');
                temp.html("");
                temp.attr("src", "/public_en/img/home/invest/main_shares_icon1.png");
                $('.share_image2').attr("src", "/public_en/img/home/invest/main_shares_down.png");

            }

        }
    </script>
    <script>sear("hk03383");</script>
</block>
