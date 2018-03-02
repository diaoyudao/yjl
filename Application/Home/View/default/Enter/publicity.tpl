<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/enter/enter-publicity.css">
</block>
<block name="title">企业宣传-雅居乐集团</block>

<block name="body_main">
    <div id="enPub">

        <div class="banner section1" style="height: 490px">
            <div class="swiper-container" id="slider1" style="height: 490px;">
                <div class="swiper-wrapper">
                    <volist name="head_images" id="item">
                        <div class="swiper-slide swiper-no-swiping">
                            <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                 simplified_image="{$item.image_url1}" style="height: 490px;" alt="">

                        </div>
                    </volist>
                </div>
            </div>
            <span class="prev arrow-left"><img src="/public/img/home/common/btn_prev.png" alt=""></span>
            <span class="next arrow-right"><img src="/public/img/home/common/btn_next.png" alt=""></span>
            <div class="pagination"></div>
        </div>


        <div class="content container">
            <p class="nav-p"><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a href="/enter/index?level_id=1000000123">走进雅居乐</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span>企业宣传</span></p>
            <h2><a href="/enter/publicityvedio">视频中心</a></h2>


            <ul>
                <volist name="media" id="item">
                    <li class="col-xs-4">
                        <a href="/enter/publicityvediodetail?video_id={$item.video_id}">
                            <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                 simplified_image="{$item.image_url1}" alt="">
                        </a>
                        <p class="title">
                            <a href="/enter/publicityvediodetail?video_id={$item.video_id}">{$item.title}</a></p>
                        <p class="time">时长: <span class="time-num">{$item.duration}</span>分钟</p>
                    </li>
                </volist>

            </ul>

        </div>
        <div class="container content" style="margin-top:0px;margin-bottom:50px;"><a class="btn-more" href="/enter/publicityvedio">了解更多</a></div>
<!--
        <div class="items">
            <h2>画册</h2>
            <div class="swiper-container container" id="slider2" style="height:463px;">
                <div class="swiper-wrapper">
                    <volist name="magazine" id="item">
                        <div class="swiper-slide">
                            <div>
                                <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                     simplified_image="{$item.image_url1}" alt="">

                                <p class="title">{$item.title}</p>
                                <a href="{$item.url}" class="btn-more">下载</a>
                            </div>
                        </div>
                    </volist>

                </div>
                <span class="prev"><img src="/public/img/home/common/btn_prev1.png" alt=""></span>
                <span class="next"><img src="/public/img/home/common/btn_next1.png" alt=""></span>
            </div>

        </div>
        -->
    </div>

</block>


<block name="footer_js">
    <!--[if IE]>
    <script src="http://api.html5media.info/1.1.4/html5media.min.js"></script>
    <![endif]-->

    <script>
        $(function () {
            $(".header .nav li").eq(1).addClass("active").siblings().removeClass("active");

            if($("#slider1 .swiper-slide").length!=1){
                var mySwiper1 = $("#slider1").swiper({
                    loop: true,
                    noSwiping: true,
//                loop: true,
                    autoplay: 5000,
                    speed: 300,
                    pagination: '.pagination',
                    paginationClickable: true,
//                pagination: '#bannerpagination',
//                paginationClickable: true,
//                grabCursor: true,
//                parallax: true,
                    //其他设置
                });
            }else {
                NoSwiper.bind("slider1");
            }
//            if($("#slider2 .swiper-slide").length!=1) {
//                var mySwiper2 = $("#slider2").swiper({
//                    loop: true,
//                    noSwiping: true,
////                loop: true,
//                    autoplay: 5000,
//                    speed: 300,
//                    paginationClickable: true,
//                    slidesPerView: 3,
////                pagination: '#bannerpagination',
////                paginationClickable: true,
////                grabCursor: true,
////                parallax: true,
//                    //其他设置
//                });
//            }else {
//                NoSwiper.bind("slider2");
//            }

            $('#slider1 .prev').click(function () {
                mySwiper1.swipePrev();
            })
            $('#slider1 .next').click(function () {
                mySwiper1.swipeNext();
            })

//            $('#slider2 .prev').click(function () {
//                mySwiper2.swipePrev();
//            })
//            $('#slider2 .next').click(function () {
//                mySwiper2.swipeNext();
//            })

        })


    </script>
</block>