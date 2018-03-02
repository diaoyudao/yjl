<extend name="./Application/Home/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/invest/invest-governance.css">
    <script type="text/javascript" src="/public/hui3/lib/swiper3.4.1/js/swiper.min.js"></script>
</block>
<block name="title">企业管治-雅居乐集团</block>

<block name="head_menu">
    <a class="tip" href="#">企业管治/</a>
</block>

<block name="body_main">
    <div class="row ">
        <div class="swiper-container" id="banner-swiper">
            <div class="swiper-wrapper">
                <volist name="mobile_head_images" id="item">
                    <div class="swiper-slide">
                        <a><img class="banner-img" src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                simplified_image="{$item.image_url1}" alt="">
                        </a>
                    </div>
                </volist>
            </div>
            <!-- Add Pagination -->
            <if condition="1 lt count($mobile_head_images)">
                <div class="swiper-pagination"></div>
            </if>
            <!-- Add Arrows
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            -->
        </div>
    </div>
    <div class="content-img1 txt-center" style="position:relative">
        <img src="/public/img/mobile/invest/index/governance_p1.jpg">
        <p class="p-posit">
            管治理念
        </p>
        <a href="/invest/control?level_id=1000000197">
            <div class=" main-btn-s btn-posit">
                查看详情
            </div>
        </a>
    </div>
    <div class="content-img2 txt-center" style="position:relative">
        <img src="/public/img/mobile/invest/index/governance_p2.jpg">
        <p class="p-posit">
            董事会
        </p>
        <a href="/invest/directorate">
            <div class="row cl  main-btn-s btn-posit">查看详情
            </div>
        </a>
    </div>
    <div class="content-img3 txt-center" style="position:relative">
        <img src="/public/img/mobile/invest/index/governance_p3.jpg">
        <p class="p-posit">
            董事委员会
        </p>
        <a href="/invest/committee">
            <div class="main-btn-s btn-posit">
                查看详情
            </div>
        </a>
    </div>
    <div class="content-img4 txt-center" style="position:relative">
        <img src="/public/img/mobile/invest/index/governance_p4.jpg">
        <p class="p-posit">
            内部监控
        </p>
        <a href="/invest/monitored">
            <div class="main-btn-s btn-posit">
                查看详情
            </div>
        </a>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(3).addClass("active").siblings().removeClass("active");

            $(".item").mouseover(function () {
                $(this).find(".cover").css({visibility:"visible"});
                $(this).find(".word").css({visibility:"visible"});
            })
            $(".item").mouseout(function () {
                $(this).find(".cover").css({visibility:"hidden"});
                $(this).find(".word").css({visibility:"hidden"});
            })
        });
    </script>
</block>