<extend name="./Application/Home/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/business/business_index.css">
</block>
<block name="title">多元业务-雅居乐集团</block>

<block name="body_main">
    <div id="bu-index">

        <div class="banner section1" id="slider1">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <volist name="head_images" id="item">
                        <div class="swiper-slide swiper-no-swiping">
                            <a href='/business/estate?level_id=1000000128'>
                                <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                     simplified_image="{$item.image_url1}" alt=""/>
                            </a>
                        </div>
                    </volist>
                </div>
            </div>
            <div class="butn">

                <div class="btn1 btn-s">
                    <a href="/business/estate?level_id=1000000128">
                        <div class="mask"></div>
                        <span style="display: none;"><img src="/public/img/home/business/index/index_btn1.png"
                                                          alt=""></span>
                        <div class="item" style="width: 200px;">
                            <span class="icon"><img src="/public/img/home/business/index/btn_icon1.png" alt=""></span>
                            <span class="tip">住宅地产</span>
                        </div>
                    </a>
                </div>

                <div class="btn2 btn-s">
                    <a href="/business/estate?level_id=1000000128">
                        <div class="mask"></div>
                        <span><img src="/public/img/home/business/index/index_btn2.png" alt=""></span>
                        <div class="item" style="display: none;">
                            <span class="icon"><img src="/public/img/home/business/index/btn_icon2.png" alt=""></span>
                            <span class="tip">商业地产</span>
                        </div>
                    </a>
                </div>

            </div>
        </div>

        <div class="main">
            <div class="nav-life" >
                <div class="bg-box">
                    <volist name="life_images" id="item">

                        <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                             simplified_image="{$item.image_url1}" alt="" class="pic" style="visibility: visible">
                    </volist>

                </div>
                <h2>雅生活</h2>
                <p>
                    2015年，雅居乐重新定义社区服务理念，以联动发展模式，整合最优质的商业资源，倾情打造集优质物业管理平台、高新社区互联网平台2015年雅居乐重新定义社区服务理念，以联动发展模式，整合最优质的商业资源，倾情打造集优质物业管理平台、高新社区互联网平台、2015年，雅居乐重新定义社区服务理念，以联动发展模式，整合最优质的商业资源，倾情打造集优质物业管理平台、高新社区互联网平台、2015年，雅居乐重新定义社区服务理念，以联动发展模式，整合最优质的商业资源，倾情打造集优质物业管理平台、高新社区互联网平台、2015年，雅居乐重新定义社区服务理念，以联动发展模式，整合最优质的商业资源，倾情打造集优质物业管理平台、高新社区互联网平台、</p>

               <!-- <ul>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon1.png" alt="">
                        <span>物业</span>
                        <div class="contain" style="display: none;">
                            <a href="/business/property?level_id=1000000186" class="btn-more">了解更多</a>
                        </div>
                    </li>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon2.png" alt="">
                        <span>园林</span>
                        <div class="contain" style="display: none;">
                            <a href="/business/park?level_id=1000000187" class="btn-more">了解更多</a>
                        </div>
                    </li>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon3.png" alt="">
                        <span>设计</span>
                        <div class="contain" style="display: none;">
                            <a href="/business/design?level_id=1000000188" class="btn-more">了解更多</a>
                        </div>
                    </li>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon4.png" alt="">
                        <span>装饰</span>
                        <div class="contain" style="display: none;">
                            <a href="/business/decorate?level_id=1000000189" class="btn-more">了解更多</a>
                        </div>
                    </li>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon5.png" alt="">
                        <span>旅游</span>
                        <div class="contain" style="display: none;">
                            <a href="/business/tour?level_id=1000000190" class="btn-more">了解更多</a>
                        </div>
                    </li>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon6.png" alt="">
                        <span>网络</span>
                        <div class="contain" style="display: none;">
                            <a href="/business/net?level_id=1000000191" class="btn-more">了解更多</a>
                        </div>
                    </li>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon7.png" alt="">
                        <span>智能</span>
                        <div class="contain" style="display: none;">
                            <a class="btn-more">敬请期待</a>
                        </div>
                    </li>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon8.png" alt="">
                        <span>广告</span>
                        <div class="contain" style="display: none;">
                            <a class="btn-more">敬请期待</a>
                        </div>
                    </li>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon9.png" alt="">
                        <span>营销</span>
                        <div class="contain" style="display: none;">
                            <a class="btn-more">敬请期待</a>
                        </div>
                    </li>
                </ul>-->
                <ul>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon1.png" alt="">
                        <span>物业</span>
                        <div class="contain" style="display: none;">
                            <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Service/index/type/5#point" class="btn-more">了解更多</a>
                        </div>
                    </li>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon2.png" alt="">
                        <span>智慧园区</span>
                        <div class="contain" style="display: none;">
                            <!--<a href="/business/park?level_id=1000000187" class="btn-more">了解更多</a>-->
                            <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/1"  class="btn-more">了解更多</a>
                        </div>
                    </li>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon5.png" alt="">
                        <span>旅游</span>
                        <div class="contain" style="display: none;">
                            <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/2"  class="btn-more">了解更多</a>
                        </div>
                    </li>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon8.png" alt="">
                        <span>广告</span>
                        <div class="contain" style="display: none;">
                            <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/3" class="btn-more">了解更多</a>
                        </div>
                    </li>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon3.png" alt="">
                        <span>验房</span>
                        <div class="contain" style="display: none;">
                            <!--<a href="/business/design?level_id=1000000188"  class="btn-more">了解更多</a>-->
                            <a  target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/5" class="btn-more ">了解更多</a>
                        </div>
                    </li>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon9.png" alt="">
                        <span>营销</span>
                        <div class="contain" style="display: none;">
                            <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/4" class="btn-more">了解更多</a>
                        </div>
                    </li>
                    <!-- <li class="col-xs-2">
                         <div class="cover"></div>
                         <img src="/public/img/home/business/index/index_icon4.png" alt="">
                         <span>装饰</span>
                         <div class="contain" style="display: none;">
                             <a href="/business/decorate?level_id=1000000189"  class="btn-more">了解更多</a>
                         </div>
                     </li>
                     <li class="col-xs-2">
                         <div class="cover"></div>
                         <img src="/public/img/home/business/index/index_icon6.png" alt="">
                         <span>网络</span>
                         <div class="contain" style="display: none;">
                             <a href="/business/net?level_id=1000000191"  class="btn-more">了解更多</a>
                         </div>
                     </li>
                     <li class="col-xs-2">
                         <div class="cover"></div>
                         <img src="/public/img/home/business/index/index_icon7.png" alt="">
                         <span>智能</span>
                         <div class="contain" style="display: none;">
                             <a class="btn-more">敬请期待</a>
                         </div>
                     </li>-->
                </ul>

            </div>
        </div>
        <div class="section" style="margin-top: -2px;">
            <img src="{$education_images[0].image_url1}" traditional_image="{$education_images[0].image_url2}"
                 simplified_image="{$education_images[0].image_url1}" alt="" class="pic">
            <!--<div class="box">-->
            <!--&lt;!&ndash;<p class="title">教 育</p>&ndash;&gt;-->
            <!--&lt;!&ndash;<p class="en-title">十年树木，百年树人。雅居乐的卓越蓝图不仅是创建优质的生活典范，</p>&ndash;&gt;-->
            <!--&lt;!&ndash;<p class="en-title">更是致力与社会共建一个美好未来</p>&ndash;&gt;-->
            <!--</div>-->
            <a href="/business/education?level_id=1000000133" class="btn-more">了解更多</a>

        </div>
        <div class="section" style="margin-top: -2px;">
            <img src="{$build_images[0].image_url1}" traditional_image="{$build_images[0].image_url2}"
                 simplified_image="{$build_images[0].image_url1}" alt="" class="pic">
            <!--<div class="box">-->
            <!--&lt;!&ndash;<p class="title">教 育</p>&ndash;&gt;-->
            <!--&lt;!&ndash;<p class="en-title">十年树木，百年树人。雅居乐的卓越蓝图不仅是创建优质的生活典范，</p>&ndash;&gt;-->
            <!--&lt;!&ndash;<p class="en-title">更是致力与社会共建一个美好未来</p>&ndash;&gt;-->
            <!--</div>-->
            <a target="_blank" href="http://www.agilebuild.com.cn" class="btn-more ">了解更多</a>

        </div>

        <div class="section">
            <img src="{$environment_images[0].image_url1}" traditional_image="{$environment_images[0].image_url2}"
                 simplified_image="{$environment_images[0].image_url1}" alt="" class="pic">
            <!--<div class="box">-->
            <!--<p class="title">环 保</p>-->
            <!--<p class="en-title">尊重自然，敬畏自然，雅居乐宣扬绿色生活，</p>-->
            <!--<p class="en-title">以【绿色、环保、可持续】为人居开发理念，促使人、建筑、自然和谐共生。</p>-->
            <!--</div>-->
            <a href="/business/environment?level_id=1000000132" class="btn-more">了解更多</a>

        </div>


        <div class="section">
            <img src="{$hotel_images[0].image_url1}" traditional_image="{$hotel_images[0].image_url2}"
                 simplified_image="{$hotel_images[0].image_url1}" alt="" class="pic">
            <!--<div class="box" style="top: 195px;">-->
            <!--<p class="title">雅居乐酒店</p>-->
            <!--<p class="en-title">HOTEL</p>-->
            <a href="/business/hotel?level_id=1000000131" class="btn-more">了解更多</a>
            <!--</div>-->
        </div>
        <div class="section" style="margin-top: -2px;">
            <img src="{$agency_images[0].image_url1}" traditional_image="{$agency_images[0].image_url2}"
                 simplified_image="{$agency_images[0].image_url1}" alt="" class="pic">
            <!--<div class="box">-->
            <!--&lt;!&ndash;<p class="title">教 育</p>&ndash;&gt;-->
            <!--&lt;!&ndash;<p class="en-title">十年树木，百年树人。雅居乐的卓越蓝图不仅是创建优质的生活典范，</p>&ndash;&gt;-->
            <!--&lt;!&ndash;<p class="en-title">更是致力与社会共建一个美好未来</p>&ndash;&gt;-->
            <!--</div>-->
            <a  href="javascript:;" class="btn-more aler">了解更多</a>

        </div>
    </div>
</block>


<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(2).addClass("active").siblings().removeClass("active");


            var mySwiper1 = $('#slider1 .swiper-container').swiper({
                loop: true,
                noSwiping: true,
                autoplay: 3000,
                speed: 1000,
                onSlideChangeStart: function(swiper){
                    var index=swiper.activeLoopIndex;
                    $(".btn-s").find(".item").hide().siblings("span").show();
                    $(".btn-s").eq(index).find(".item").show().siblings("span").hide();
                }
//                paginationClickable: true,
//                pagination: '#bannerpagination',
//                paginationClickable: true,
//                grabCursor: true,
//                parallax: true,
                //其他设置
            });
            //            按钮动画
//            $("#slider1 .butn>div:not(.btn1)").find(".mask").one("mouseover", function () {
//                $(".btn1").find(".item").animate({width: "80px"}, 200, function () {
//                    $(this).hide().siblings("span").show();
//                });
//            })

            $("#slider1 .butn .mask").on("mouseover", function (e) {
                e.stopPropagation()
                var index = $(this).parents(".btn-s").index();
                $(".btn-s").find(".item").hide().siblings("span").show();
                $(this).siblings(".item").show().siblings("span").hide();
//                $(this).siblings(".item").stop(false, true).animate({width: "200px"}, 200);
                mySwiper1.swipeTo(index, 1000, true);
                mySwiper1.stopAutoplay();
            })

//            $("#slider1 .butn .mask").on("mouseout", function (e) {
//                e.stopPropagation()
//                var index = $(this).index();
//                $(this).siblings(".item").animate({width: "80px"}, 200, function () {
//                    $(this).hide().siblings("span").show();
//                });
//            })

            $(".main .nav-life li").mouseover(function () {
                var index = $(this).index();
                $(this).parents().find(".bg-box img").eq(index).css({visibility: "visible"}).siblings().css({visibility: "hidden"});
                $(this).find(".contain").show().parent().siblings().find(".contain").hide();
            });

            $(".main .nav-life li").mouseout(function () {
                var index = $(this).index();
                $(this).find(".contain").hide();
            })

        })
    </script>
</block>