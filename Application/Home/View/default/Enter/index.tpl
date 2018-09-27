<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/enter/enter-index.css">
</block>
<block name="title">走进雅居乐-雅居乐集团</block>

<block name="body_main">
    <div class="section1">
        <div class="vedio">
            <a href="/enter/publicityvedio">
                <img src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                     simplified_image="{$head_images[0]['image_url1']}" alt="" class="pic">
            </a>
        </div>

        <div class="introduce container">
            <h2>雅居乐集团</h2>
            <p>雅居乐集团控股有限公司（前称“雅居乐地产控股有限公司”）（股份代号：3383）（以下简称“雅居乐”）</p>
            <p>是一家以房地产开发为主营业务，同时在生活服务、环保、酒店、物业投资等产业多元发展的综合性集团。</p>
            <p>公司创立于1992年， 2005 年于香港联交所主板上市，现为摩根士丹利资本国际新兴市场指数成份股、</p>
            <p>恒生综合指数成份股和恒生环球综合指数成份股，品牌享誉全国，系“中国驰名商标”。</p>
        </div>

        <div class="items">
            <ul class="container">
                <li style="margin-left: 0;">
                    <div class="title">集团介绍</div>
                    <div class="coverbox">
                        <img src="/public/img/home/enter/index/index_sec1_p1.jpg" alt="">
                        <div class="cover" style="visibility: hidden"></div>
                    </div>
                    <div class="box">
                        <p style="visibility: hidden;margin-top: 100px;">
                            雅居乐集团控股有限公司是一家以房地产开发为主营业务，同时在生活服务、环保、酒店、物业投资等产业多元发展的综合性集团。公司创立于1992年， 2005
                            年于香港联交所主板上市，品牌享誉全国，系“中国驰名商标”。</p>
                        <a href="/enter/group?level_id=1000000126" style="visibility: hidden">了解更多</a>
                    </div>
                </li>
                <li class="sce">
                    <div class="title">陈卓林专区</div>
                    <div class="coverbox">
                        <img src="/public/img/home/enter/index/index_sec1_p2.jpg" alt="">
                        <div class="cover" style="visibility: hidden"></div>
                    </div>
                    <div class="box">
                        <p style="visibility: hidden;margin-top: 100px;">
                            雅居乐集团控股有限公司董事会主席兼总裁。同时任中国侨商投资企业协会常务副会长、中国华文教育基金会名誉副会长、香港友好协进会发展基金副主席、香港新家园协会副会长、孙中山基金会名誉副会长、广东省侨商投资企业协会副会长。
                        </p>
                        <a href="/enter/chair?level_id=1000000127" style="visibility: hidden">了解更多</a>
                    </div>
                </li>
                <li class="tri">
                    <div class="title">公益慈善</div>
                    <div class="coverbox">
                        <img src="/public/img/home/enter/index/index_sec1_p3.jpg" alt="">
                        <div class="cover" style="visibility: hidden"></div>
                    </div>
                    <div class="box">
                        <p style="visibility: hidden;margin-top: 100px;">
                            在弘扬中华文化、赈灾扶贫、环境保护、医疗、教育、文件等领域，雅居乐用实际行动展现对社会的责任与关怀，为构建和谐城市、和谐社会努力。</p>
                        <a href="/enter/duty?level_id=1000000138" style="visibility: hidden">了解更多</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <div class="section2">
        <h2>集团发展历程</h2>
        <div class="container">
            <div class="box">
                <ul>
                    <volist name="history" id="item">
                        <li class="r">
                            <span class="tags">{$item[0].tags}</span>
                            <volist name="item" id="ite">
                                <p title="{$ite.name}"> {$ite.name}</p>
                            </volist>
                            <span class="circle">
                             <img src="/public/img/home/enter/history/history_circle.jpg" alt="">
                             <img src="/public/img/home/enter/history/history_circle1.jpg" alt="" style="display: none">
                        </span>
                        </li>
                    </volist>
                    <div class="clear"></div>

                </ul>
                <div style="clear: both;height: 0"></div>
            </div>
        </div>
        <span><a href="/enter/history?level_id=1000000140" class="btn-more">了解更多</a></span>
    </div>
    <!--<div class="section3">
        <div class="banner" id="slider1">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <volist name="honor" id="item">

                        <div class="swiper-slide swiper-no-swiping">
                            <div style="">
                                <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                     simplified_image="{$item.image_url1}" alt="">

                                <div class="cover" style="display: none;"></div>
                                <div class="word" style="display: none;">
                                    <p>{$item.name}<br>{$item.short_name}</p>
                                </div>

                            </div>
                        </div>
                    </volist>

                </div>
            </div>
            <span class="prev arrow-left"><img src="/public/img/home/common/btn_prev.png" alt=""></span>
            <span class="next arrow-right"><img src="/public/img/home/common/btn_next.png" alt=""></span>
            <div class="pagination"></div>
        </div>
    </div>-->

    <!--<div class="section4">-->
    <!--<h2>集体画册</h2>-->
    <!--<div class="container">-->
    <!--<div class="banner" id="slider2">-->
    <!--<div class="swiper-container">-->
    <!--<div class="swiper-wrapper"></div>-->
    <!--</div>-->
    <!--<span class="icon-left"><</span>-->
    <!--<span class="icon-right">></span>-->
    <!--</div>-->


    <!--<div class="word-box"></div>-->
    <!--</div>-->
    <!--</div>-->


    </div>
</block>


<block name="footer_js">
    <script>
        $(function () {
//            var imgisload=false;
//            $("#slider1 .swiper-slide img").on("load",function () {
//                if(imgisload){
//                    return;
//                }
//
//                imgisload=true;
//            });
//            if($("#slider1 .swiper-slide img").get(0).complete){
//                if(imgisload){
//                    return;
//                }
//                var boxheight=$("#slider1 .swiper-slide img").height()+20;
//                $("#slider1 .swiper-wrapper").height(boxheight);
//                imgisload=true;
//
//            }


//            ajax
//            $.ajax({
//                url: window.document.location.href,
//                success: function (res) {
//                    var lists = JSON.parse('<php>echo json_encode($file)</php>');
//                    var wrapper = $("#slider2 .swiper-wrapper");
//                    var box = $(".word-box");
//                    for (var i = 0; i < lists.length; i++) {
//                        var slide = $("<div class='swiper-slide'></div>");
//                        var title = $("<div class='title'></div>").appendTo(slide);
//                        var img = $("<img src='" + lists[i].image_url1 + "' traditional_image='" + lists[i].image_url2 + "' simplified_image='" + lists[i].image_url1 + "'/>").appendTo(title);
//                        slide.appendTo(wrapper);
//
//                        var item = $("<div class='item'></div>");
//                        var item_title = $("<div class='title'></div>").text(lists[i].title).appendTo(item);
//                        var val = $("<p></p>").text(lists[i].desc).appendTo(item);
//                        $("<br/>").appendTo(item);
//                        var url = $("<a class='download btn-more' href='" + lists[i].url + "'>下 载</a>").appendTo(item);
//                        item.appendTo(box);
//
//
//                    }
//                    box.find(".item:eq(1)").addClass("active");
//
//                    var mySwipe2 = new Swiper('#slider2 .swiper-container', {
//                        centeredSlides: true,
//                        slidesPerView: 3,
//                        watchActiveIndex: true,
//                        initialSlide: 1,
//                        onSlideChangeEnd: function () {
//                            index = mySwipe2.activeIndex;
//                            $(".section4 .word-box .item").eq(index).addClass("active").siblings().removeClass("active");
//                        }
//                    })
//
//                    $('#slider2 .icon-left').click(function () {
//                        index = mySwipe2.activeIndex;
//                        if (index == 0) {
//                            return;
//                        }
//                        mySwipe2.swipePrev();
//                    })
//                    $('#slider2 .icon-right').click(function () {
//                        index = mySwipe2.activeIndex;
//                        mySwipe2.swipeNext();
//                    })
//                }
//            })


//            var index;
            $(".header .nav li").eq(1).addClass("active").siblings().removeClass("active");

            $(".section1 .items li").on("mouseover", function () {
                $(this).find(".cover").css({visibility: "visible"});
                $(this).find(".box").find("p").css({visibility: "visible"});
                $(this).find(".box").find("a").css({visibility: "visible"});
            })

            $(".section1 .items li").on("mouseout", function () {
                $(this).find(".cover").css({visibility: "hidden"});
                $(this).find(".box").find("p").css({visibility: "hidden"});
                $(this).find(".box").find("a").css({visibility: "hidden"});
            })


            $(".section2 .box li:odd").addClass("l").removeClass("r");

            $('.section2 .box li').mouseover(function () {
                $(this).find("span img").eq(1).show().siblings().hide();
                $(this).find("span").addClass("active").parents("li").siblings("li").find("span").removeClass("active");
            })

            $('.section2 .box li').mouseout(function () {
                $(this).find("span img").eq(1).hide().siblings().show();
                $(this).find("span").removeClass("active");
            })


            var mySwiper1 = $("#slider1 .swiper-container").swiper({
                loop: true,
                noSwiping: true,
//                loop: true,
                autoplay: 3000,
                speed: 300,
                slidesPerView: 5,
                onInit: function (swiper) {
                    var slider = $("#slider1 .swiper-slide img");
                    slider.each(function () {
                        var width = $(this).width();
                        var height = $(this).height();
                        var boxheight = $("#slider1 .swiper-slide img").height() + 20;
                        $("#slider1 .swiper-wrapper").height(boxheight);
                        if (width != height) {
                            $(this).height(width);
                        }
                    });
                },
                select: "auto",
//                pagination: '#bannerpagination',
//                paginationClickable: true,
//                grabCursor: true,
//                parallax: true,
                //其他设置
            });
            $('#slider1 .prev').click(function () {
                mySwiper1.swipePrev();
            })
            $('#slider1 .next').click(function () {
                mySwiper1.swipeNext();
            })
            $("#slider1 .swiper-slide").mouseover(function () {
                $("#slider1 .swiper-slide").find(".word").hide();
                $("#slider1 .swiper-slide").find(".cover").hide();
                $(this).find(".word").show();
                $(this).find(".cover").show();
            })

            $("#slider1 .swiper-slide").mouseout(function () {
                $("#slider1 .swiper-slide").find(".word").hide();
                $("#slider1 .swiper-slide").find(".cover").hide();
            })


            $(".section2 .box li").click(function () {
                var data = {
                    year: $(this).find(".tags").text()
                }
                location.href = "/enter/historydetail?year=" + data.year;
            })

        })
    </script>
</block>

