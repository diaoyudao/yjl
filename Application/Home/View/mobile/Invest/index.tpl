<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/invest/invest-index.css">
</block>
<block name="title">投资者关系-雅居乐集团</block>

<block name="body_main">
    <div class="">
        <img src="{$mobile_head_images[0].image_url1}" traditional_image="{$mobile_head_images[0].image_url2}"
             simplified_image="{$mobile_head_images[0].image_url1}" alt="" class="banner-img"/>
    </div>
    <div class="container mt-20 mb-20">
        <div class="shares pb-10">
            <div class="container context pt-10 ">
                <span>雅居乐HK03383</span>
                <span class="right">成交额（亿）</span>
                <div class="clear"></div>
                <span class="f-30">$<span id="val01">4.230</span></span>
                <span style="position: relative;">
                    <img class="share-tags-img" style="position:absolute;bottom: 1.6rem;width: 26px;"
                         src="/public/img/mobile/index/shares-up.jpg">
                    <span class="">HKD</span>
                </span>
                <span class="right mr-10 f-20" style="color: #a3c0be;">$<span id="val12">275</span></span>
                <div class="remove-invest f-14">
                    <span  style="color: #cce2e1;">
                         <span>变动</span><span><img class="share_image2" src="/public/img/home/invest/main_shares_up.png"></span><span
                                id="val03">0.05</span><span>（<img class="share_image2" src="/public/img/home/invest/main_shares_up.png"></span><span
                                id="val04">1.09</span>%）
                    </span>

                </div>
                <div style="font-size: .9rem;">
                    <p style=" color: #80b8b4;">截至&nbsp;<span id="shares-time">2016-10-28 15:28:03</span>*报价有15分钟或以上延迟。</p>
                    <p style=" color: #95b7b6;">资料来源：新浪股票指数</p>
                </div>
            </div>
        </div>
    </div>
    <div class="container  pt-20 pb-30 bg-c">
        <h2 class="txt-center f-20 pt-10 pb-10">企业公告</h2>
        <volist name="notices" id="item">
            <div class="mt-10" style="background: #fff;">
                <div class="container pt-10 pb-10 ">
                    <div class=" pr-5 left pt-5" style="display: inline; "><img
                                src="/public/img/mobile/invest/index/dot.png" class="xs-img"></div>
                    <div class="pl-5 left word">
                        <span>{$item.title}</span>
                        <p>发布时间：
                            <php>echo date('Y年m月',strtotime($item['begin_time']))</php>
                        </p>
                    </div>
                    <div class="right">
                        <a href="{$item.url}">
                            <img src="/public/img/mobile/invest/index/download-btn.png" class="md-img ">
                        </a>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </volist>


        <a class="fff" href="/invest/notice?level_id=1000000144"><div class="row cl mt-20 main-btn">            
                查看更多            
        </div></a>
    </div>
    <div class="container pt-20 pb-30">
        <h2 class="txt-center f-20 pt-10 pb-10">企业管治</h2>
        <div class="mt-10">
            <div class=" left" style="width: 66%;">
                <a href="/invest/control?level_id=1000000197">
                    <img src="/public/img/mobile/invest/index/pic1.jpg" class="image">
                </a>
            </div>
            <div class="nav-btn txt-center right">
                <a href="/invest/control"><span>管治理念</span></a>
            </div>
        </div>

        <div class="clear"></div>
        <div class="mt-10">
            <div class=" right" style="width: 66%;">
                <a href="/invest/directorate">
                    <img src="/public/img/mobile/invest/index/pic2.jpg" class="image">
                </a>
            </div>

            <div class="nav-btn txt-center left" >
                <a href="/invest/directorate"><span>董事会</span></a>
            </div>
        </div>

        <div class="clear"></div>
        <div class="mt-10">
            <div class=" left" style="width: 66%;">
                <a href="/invest/committee">
                    <img src="/public/img/mobile/invest/index/pic3.jpg" class="image">
                </a>
            </div>

            <div class="nav-btn txt-center right" style="background: rgb(12,139,131);">
                <a href="/invest/committee"><span>董事委员会</span></a>
            </div>
        </div>
        <div class="clear"></div>
        <div class="mt-10">
            <div class=" right" style="width: 66%;">
                <a href="/invest/monitored">
                    <img src="/public/img/mobile/invest/index/pic2.jpg" class="image">
                </a>
            </div>

            <div class="nav-btn txt-center left" >
                <a href="/invest/monitored"><span>内部监控</span></a>
            </div>
        </div>

        <div class="clear"></div>
    </div>
    <div class="pic-box">
        <div>
            <img src="{$mobile_grade_images[0].image_url1}" traditional_image="{$mobile_grade_images[0].image_url2}"
                 simplified_image="{$mobile_grade_images[0].image_url1}" alt="" class="tags-img"/>
        </div>
        <div class="s3_content">
            <a class="btn-more1" href="/invest/grade?level_id=1000000145">查看评级</a>
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
            var turnover = parseFloat(elements[11] / 100000000).toFixed(3);
            var val1=parseFloat(elements[6]).toFixed(2);
            var val5=parseFloat(elements[7]).toFixed(2);
            var val6=parseFloat(elements[8]).toFixed(2);

            if(0 == elements[6]){
                val1=parseFloat(elements[3]).toFixed(2);
                val5=0;
                val6=0;
            }
            document.getElementById('val01').innerText = val1;
            document.getElementById('shares-time').innerText = elements[17] + ' ' + elements[18];
            document.getElementById('val12').innerText = turnover;
            document.getElementById('val03').innerText = val5;
            document.getElementById('val04').innerText = val6;
            if (parseFloat(elements[3]) > parseFloat(elements[6])) {
                var temp = $('.share-tags-img');
                temp.html("");
                temp.attr("src", "/public/img/home/index/main_shares_icon1.png");
                $('.share_image2').attr("src", "/public/img/home/invest/main_shares_down.png");
            }
        }
    </script>
    <script>sear("hk03383");</script>
</block>
