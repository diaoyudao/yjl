<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/business/index.css">
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public_en/hui3/lib/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>
</block>
<block name="title">Diversification of Business-Agile Group</block>

<block name="body_main">
    <div class="row">
        <div id="slider-3">
            <div class="slider">
                <div class="bd">
                    <ul>
                        <volist name="mobile_head_images" id="item" offset="0" length="2">
                            <li><a href="/en/business/estate?level_id=1000000128"><img class="banner-img"
                                                                                    src="{$item.image_url1}"
                                                                                    traditional_image="{$item.image_url2}"
                                                                                    simplified_image="{$item.image_url1}"></a>
                            </li>
                        </volist>
                    </ul>
                </div>
                <ol class="hd cl">
                    <li class="land-house">
                        <div class="land me-hidden"><img src="/public_en/img/home/business/index/index_btn1.png"></div>
                        <div class="land-active "><img class="left" src="/public_en/img/home/business/index/btn_icon1.png"><span>Residential Properties</span>
                            <div class="clear"></div>
                        </div>
                    </li>
                    <li class="land-house">
                        <div class="land "><img src="/public_en/img/home/business/index/index_btn2.png"></div>
                        <div class="land-active me-hidden"><img class="left"
                                                                src="/public_en/img/home/business/index/btn_icon2.png"><span>Commercial Properties</span>
                            <div class="clear"></div>
                        </div>
                    </li>
                </ol>
            </div>
        </div>
    </div>
    <div class="row list-bg pt-10">
        <div class="row txt-center mt-20"><span class="main-title c-white">A-Living</span></div>
        <ol class="container life-list cl">
            <a href="http://agile-living.agile.com.cn/yjl/Service/index/type/5#point">
                <li>
                    <div class="lift-btn oper"><img src="/public_en/img/home/business/index/index_icon1.png">
                        <div class="row f-7 txt-center main-color h-66">Property Management</div>
                </li>
            </a>
            <a href="http://agile-living.agile.com.cn/yjl/Business/index/type/1">
                <li>
                    <div class="lift-btn oper"><img src="/public_en/img/home/business/index/index_icon2.png">
                        <div class="row f-7 txt-center main-color h-66">Intelligent Community</div>
                </li>
            </a>
            <a href="http://agile-living.agile.com.cn/yjl/Business/index/type/2">
                <li>
                    <div class="lift-btn oper"><img src="/public_en/img/home/business/index/index_icon5.png">
                        <div class="row f-7 txt-center main-color h-66">Tourism Management</div>
                </li>
            </a>
            <a href="http://agile-living.agile.com.cn/yjl/Business/index/type/3">
                <li>
                    <div class="lift-btn oper"><img src="/public_en/img/home/business/index/index_icon8.png">
                        <div class="row f-7 txt-center main-color h-66">Advertisement</div>
                </li>
            </a>
            <a href="http://agile-living.agile.com.cn/yjl/Business/index/type/5">
                <li>
                    <div class="lift-btn oper"><img src="/public_en/img/home/business/index/index_icon3.png">
                        <div class="row f-7 txt-center main-color h-66">Building Inspection</div>
                </li>
            </a>
            <a href="http://agile-living.agile.com.cn/yjl/Business/index/type/4">
                <li>
                    <div class="lift-btn "><img src="/public_en/img/home/business/index/index_icon9.png">
                        <div class="row f-7 txt-center main-color h-66">Sale</div>
                </li>
            </a>
        </ol>
    </div>
    <div class="row ">
        <img class="img-responsive" src="{$mobile_education_images[0]['image_url1']}" traditional_image="">
        <a href="/en/business/education?level_id=1000000133">
            <div class="btn-more main-btn-s">More</div>
        </a>
    </div>
    <div class="row ">
        <img class="img-responsive" src="{$mobile_build_images[0].image_url1}"
             traditional_image="{$mobile_build_images[0].image_url2}"
             simplified_image="{$mobile_build_images[0].image_url1}">
        <a href="http://www.agilebuild.com.cn" target="_blank">
            <div class="btn-more main-btn-s">More</div>
        </a>
    </div>
    <div class="row ">
        <img class="img-responsive" src="{$mobile_environment_images[0].image_url1}"
             traditional_image="{$mobile_environment_images[0].image_url2}"
             simplified_image="{$mobile_environment_images[0].image_url1}">
        <a href="/en/business/environment?level_id=1000000132">
            <div class="btn-more main-btn-s">More</div>
        </a>
    </div>
    <div class="row ">
        <img class="img-responsive" src="{$mobile_hotel_images[0].image_url1}"
             traditional_image="{$mobile_hotel_images[0].image_url2}"
             simplified_image="{$mobile_hotel_images[0].image_url1}">
        <a href="/en/business/hotel?level_id=1000000131">
            <div class="btn-more main-btn-s">More</div>
        </a>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {
            $("#slider-3 .slider").slide({mainCell:".bd ul",titCell:".hd li",trigger:"click",effect:"leftLoop",autoPlay:false,delayTime:700,interTime:5000,pnLoop:false,titOnClassName:"active"});


            $('.land-house').click(function () {
                var me = $(this);
                me.find('.land-active').show();
                me.find('.land').hide();

                me.siblings().find('.land').show();
                me.siblings().find('.land-active').hide();
            });

            var image_life = "url({$mobile_life_images[0]['image_url1']})";
            $('.list-bg').css('background-image', image_life);

        });
    </script>
</block>