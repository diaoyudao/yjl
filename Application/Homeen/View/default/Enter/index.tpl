<extend name="./Application/Homeen/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/enter/enter-index.css">
</block>
<block name="title">A Glance at Agile-Agile Group</block>

<block name="body_main">
    <div class="section1">
        <div class="vedio">
            <a href="/en/enter/publicityvedio">
                <img src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                     simplified_image="{$head_images[0]['image_url1']}" alt="" class="pic">
            </a>
        </div>

        <div class="introduce container">
            <h2>Agile Group</h2>
            <p>
                Agile Group Holdings Limited (former known as "Agile Property Holdings Limited"; Stock Code: 3383;
                "Agile") is a property developer which principally engaged in property development, with extensive
                presence in the diversified businesses development of living services, environmental protection, hotel
                operations, property investment, etc.. Founded in 1992, Agile has beenlisted on the Main Board of Hong
                Kong Stock Exchange since 2005 and are constituent stocks of Hang Seng Composite Index, Hang Seng Global
                Composite Index, Hang Seng Stock Connect Hong Kong Index Series and Lippo Select HK & Mainland Property
                Index. Agile's brand has become a household name in the nationwide with the coveted status as "China's
                Well-known Trademark".
            </p>
        </div>

        <div class="items">
            <ul class="container">
                <li style="margin-left: 0;">
                    <div class="title">Introduction of the Group</div>
                    <div class="coverbox">
                        <img src="/public_en/img/home/enter/index/index_sec1_p1.jpg" alt="">
                        <div class="cover" style="visibility: hidden"></div>
                    </div>
                    <div class="box">
                        <p style="visibility: hidden;margin-top: 100px;">
                            Agile Group Holdings Limited is an integrated conglomerate in China,principally engaged in
                            property development, with extensive presence in the diversified businesses development
                            ofliving services, environmental protection, hotel operations, property investment,etc..
                            Founded in 1992, Agile has been listed on the Main Board of Hong Kong Stock Exchange since
                            2005. Agile's brand has become a household name in the nationwide with the coveted status as
                            "China's Well-known Trademark".
                        </p>
                        <!--<a href="/en/enter/group?level_id=1000000126" style="visibility: hidden">More</a>-->
                        <a onclick="show_expecting()" href="javascript:;" style="visibility: hidden">More</a>
                    </div>
                </li>
                <li class="sce">
                    <div class="title">Chen Zhuo Lin <br>
                        (Chairman of Agile Group)
                    </div>
                    <div class="coverbox">
                        <img src="/public_en/img/home/enter/index/index_sec1_p2.jpg" alt="">
                        <div class="cover" style="visibility: hidden"></div>
                    </div>
                    <div class="box">
                        <p style="visibility: hidden;margin-top: 100px;">
                            Mr. Chen Zhuo Lin, the Chairman and President of Agile Group Holdings Limited. He is also
                            the Vice Chairperson of China Overseas Chinese Entrepreneurs Association, Honorary Vice
                            President of Chinese Language and Culture Education Foundation of China, Vice-Chairman of
                            Friends of Hong Kong Association Development Foundation, Vice-Chairman of New Home
                            Association of Hong Kong, Honorary Vice-Chairman of Sun Yat-sen Foundation and Vice
                            Chairperson of Guangdong Overseas Chinese Enterprises Association.
                        </p>
                        <a href="/en/enter/chair?level_id=1000000127" style="visibility: hidden">More</a>
                    </div>
                </li>
                <li class="tri">
                    <div class="title">Social Responsibility</div>
                    <div class="coverbox">
                        <img src="/public_en/img/home/enter/index/index_sec1_p3.jpg" alt="">
                        <div class="cover" style="visibility: hidden"></div>
                    </div>
                    <div class="box">
                        <p style="visibility: hidden;margin-top: 100px;">
                            In promoting the areas of Chinese culture, disaster relief, environmental protection, health
                            care, education, culture and sport, etc., Agile takes the social responsibility and caring
                            with practical action, and strive to build a harmonious city and society.
                        </p>
                        <a onclick="show_expecting()" href="javascript:;" style="visibility: hidden">More</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <div class="section2">
        <h2>Group Milestones</h2>
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
                             <img src="/public_en/img/home/enter/history/history_circle.jpg" alt="">
                             <img src="/public_en/img/home/enter/history/history_circle1.jpg" alt="" style="display: none">
                        </span>
                        </li>
                    </volist>
                    <div class="clear"></div>

                </ul>
                <div style="clear: both;height: 0"></div>
            </div>
        </div>
        <span><a onclick="show_expecting()" href="javascript:;" class="btn-more">More</a></span>
    </div>
    <div class="section3">
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
            <span class="prev arrow-left"><img src="/public_en/img/home/common/btn_prev.png" alt=""></span>
            <span class="next arrow-right"><img src="/public_en/img/home/common/btn_next.png" alt=""></span>
            <div class="pagination"></div>
        </div>
    </div>

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
//                location.href="/en/enter/historydetail?year=" + data.year;
                show_expecting();
            })

        })
    </script>
</block>

