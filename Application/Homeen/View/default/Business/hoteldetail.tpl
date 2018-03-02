<extend name="./Application/Homeen/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/business/business_hotel_detail.css">
</block>
<block name="title">{$hotel[0].name}-Agile Group</block>

<block name="body_main">
    <div id="hotel-detail" class="section1">
        <div class="pic-box" style="position: relative;overflow: hidden;height: 490px;">
            <img src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                 simplified_image="{$head_images[0]['image_url1']}" alt="" class="pic">
        </div>
        <div class="content container">
            <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                    href="/en/business/index?level_id=1000000125">Diversification of Business</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span><a
                            href="/en/business/hotel?level_id=1000000131">Hotel Operations</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span>{$hotel[0].name}</span></p>
            <h2>{$hotel[0].name}</h2>


            <div class="box">
                <div class="left">

                    {$hotel[0].note}
                </div>
                <div class="right">
                    <div>
                        <img src="{$logo_images[0]['image_url1']}" traditional_image="{$logo_images[0]['image_url2']}"
                             simplified_image="{$logo_images[0]['image_url1']}" alt="">
                        <div class="main">
                            <span>City：{$hotel[0].city_name}</span>
                            <span>属性：{$property[0].property_name}</span>
                            <span class="last">Address：{$hotel[0].address}</span>

                            <p>
                                <img src="/public_en/img/home/business/hotel/detail/detail_call.png" alt="">
                                <span class="call">{$hotel[0].tel}</span>
                            </p>
                            <p>
                                <img src="{$code_images[0]['image_url1']}"
                                     traditional_image="{$code_images[0]['image_url2']}"
                                     simplified_image="{$code_images[0]['image_url1']}" alt=""></p>
                            <span class="public">{$code_images[0]['name']}</span>
                        </div>


                        <div class="side-list">
                            <ul>
                                <li class="side-tel">
                                    <img src="/public_en/img/home/business/estate/detail/estate_icon1.png" alt="">
                                    <div class="tel-box">{$hotel[0].tel}</div>
                                </li>
                                <!--<li>-->
                                    <!--<a href="#image">-->
                                        <!--<img src="/public_en/img/home/business/estate/detail/estate_icon2.png" alt="">-->
                                    <!--</a>-->
                                <!--</li>-->
                                <!--<li>-->
                                    <!--<a href="">-->
                                        <!--<img src="/public_en/img/home/business/estate/detail/estate_icon3.png" alt="">-->
                                    <!--</a>-->
                                <!--</li>-->
                                <li class="side-xin">
                                    <img src="/public_en/img/home/business/estate/detail/estate_icon4.png" alt="">
                                    <div class="xin-box">
                                        <div class="box-head"></div>
                                        <img src="{$code_images[0]['image_url1']}"
                                             traditional_image="{$code_images[0]['image_url2']}"
                                             simplified_image="{$code_images[0]['image_url1']}" alt=""
                                             width="130">
                                    </div>
                                </li>
                                <!--<li class="side-email">-->
                                    <!--<img src="/public_en/img/home/business/estate/detail/estate_icon6.png" alt="">-->
                                    <!--<div class="email-box">{$hotel[0].email}</div>-->
                                <!--</li>-->
                                <li class=""><a onclick="history.go(-1);"><img src="/public_en/img/home/business/estate/detail/estate_icon7.png" alt=""></a></li>
                                <li class="last"><a><img src="/public_en/img/home/business/estate/detail/estate_icon5.png" alt=""></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="section section1">
            <div class="container" id="image">
                <ul class="tabs">
                    <li class="fir active">房间图</li>
                    <li>外景图</li>
                    <li>内景图</li>
                </ul>
                <div class="banner" id="slider1">
                </div>
                <span class="prev arrow-left"><img src="/public_en/img/home/common/btn_prev1.png" alt=""></span>
                <span class="next arrow-right"><img src="/public_en/img/home/common/btn_next1.png" alt=""></span>
            </div>
        </div>

    </div>
    <div class="modal fade" id="modal-source-image" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
        <div class="modal-dialog" style="width:840px;">
            <div class="modal-content" style="background-color: #666;text-align: center;">
                <div class="" style="height:30px;line-height:30px;width:100%;">
                    <button type="button" data-dismiss="modal" class="close" style="margin-top:3px;margin-right:5px;color:#fff;">
                        <span class="glyphicon glyphicon-remove" style="font-size:20px;"></span>
                    </button>
                </div>
                <div class="modal-body" style="padding-top:0px;">
                    <img id="modal-img" src="/datas/image/source/357dfb7fe7aac560f31421551421c20d.jpg" style="border:none;height:600px;width:800px;" />
                </div>
            </div>
        </div>
    </div>
</block>


<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(2).addClass("active").siblings().removeClass("active");
            $(".content .box p:first-child").css({marginTop: 0});
            SideList.top(590);
            SideList.tel();
//            SideList.email();
            SideList.xin();

            var room = JSON.parse('<php>echo json_encode($room_images)</php>');
            var plan = JSON.parse('<php>echo json_encode($location_images)</php>');
            var real = JSON.parse('<php>echo json_encode($interior_images)</php>');
            var lists = [room, plan, real];
            var slider1 = $("#slider1");
            cliclLi(0);
            $(".section1 .tabs li").click(function () {
                $(this).addClass("active").siblings().removeClass("active");
                var index = $(this).index();
                cliclLi(index);
//                var lists = JSON.parse('<php>echo json_encode($lists)</php>');
//                var wrapper=$("#slider1 .swiper-wrapper");
//                wrapper.text("");
//                var slide=$("<div></div>").attr({class:"swiper-slide"});
//                var div=$("<div></div>").appendTo(slide);
//                var img=$("<img/>").attr({src:""}).appendTo(div);
//                var title=$("<div></div>").attr({class:"title"}).text("aaaaa").appendTo(div);
//                slide.appendTo(wrapper);
            })


//            var mySwiper1 = $('#slider1 .swiper-container').swiper({
//                loop: true,
//                noSwiping: true,
//                autoplay: 5000,
//                speed: 300,
//                slidesPerView: 2,
////                pagination: '#bannerpagination',
////                paginationClickable: true,
////                grabCursor: true,
////                parallax: true,
//                //其他设置
//            });


            function cliclLi(index) {
                slider1.text("");
                var img;
                var data = lists[index];

                var container = $("<div class='swiper-container'></div>");
                var wrapper = $("<div class='swiper-wrapper'></div>").appendTo(container);
                for (var i = 0; i < data.length; i++) {
                    var slide = $("<div class='swiper-slide'></div>");
                    var div = $("<div></div>").appendTo(slide);

                    img = $('<img onclick="showImage(this)" />').attr({
                        src: data[i].image_url1,
                        traditional_image: data[i].image_url2,
                        simplified_image: data[i].image_url1,
                    }).appendTo(div);

                    var title = $("<div class='title'></div>").text(data[i].name).appendTo(div);
                    var cover = $("<div class='cover'></div>").appendTo(title);

                    slide.appendTo(wrapper);
                }
                container.appendTo(slider1);
                swiper1();
            }

            function swiper1() {

                var mySwiper1 = $('#slider1 .swiper-container').swiper({
                    loop: true,
                    noSwiping: true,
                    autoplay: 3000,
                    speed: 300,
                    slidesPerView: 2,
//                pagination: '#bannerpagination',
//                paginationClickable: true,
//                grabCursor: true,
//                parallax: true,
                    //其他设置
                });

                var height1 = $("#slider1 .swiper-slide img").height();
                $("#slider1 .swiper-wrapper").height(height1);
                $("#slider1 .swiper-slide").height(height1);


                $('.section1 .prev').click(function () {
                    mySwiper1.swipePrev();
                })
                $('.section1 .next').click(function () {
                    mySwiper1.swipeNext();
                })

                $(window).on("resize", function () {
                    height1 = $("#slider1 .swiper-slide img").height();
                    $("#slider1 .swiper-wrapper").height(height1);
                    $("#slider1 .swiper-slide").height(height1);
                })
            }
            
        });

        function showImage(img) {
            var temp = img.src;
            if(!temp) {
                return;
            }
            $('#modal-img').attr('src',temp);

            var height = $(window).height();
            var width = $(window).width();

            height = height/2 -310;
            width = width/2 - 410;
            $('#modal-source-image .modal-dialog').css('margin-top',height+'px');
            $('#modal-source-image .modal-dialog').css('margin-left',width+'px');
            $('#modal-source-image').modal({keyboard: true});
        }
    </script>
</block>