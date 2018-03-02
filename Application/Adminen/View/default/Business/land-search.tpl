<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml/DTD/xhtml1-transitional.dtd">
<!--[if lt IE 7 ]>
<html xmlns="http://www.w3.org/1999/xhtml" class="ie ie6"> <![endif]-->
<!--[if IE 7 ]>
<html xmlns="http://www.w3.org/1999/xhtml" class="ie ie7"> <![endif]-->
<!--[if IE 8 ]>
<html xmlns="http://www.w3.org/1999/xhtml" class="ie ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]>
<html xmlns="http://www.w3.org/1999/xhtml"> <![endif]-->
<head>
    <meta charset="utf-8">
    <meta property="qc:admins" content="22622356756301671663756367"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/public/huiadmin/lib/html5.js"></script>
    <script type="text/javascript" src="/public/huiadmin/lib/respond.min.js"></script>
    <script type="text/javascript" src="/public/huiadmin/lib/PIE-2.0beta1/PIE_IE678.js"></script>
    <![endif]-->
    <title>
        预览
    </title>
    <meta name="keywords" content="雅居乐">
    <meta name="description" content="雅居乐">
    <!--sdk-->

    <link type="text/css" rel="stylesheet" href="/public/bootstrap/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="/public/css/home/globle.css"/>
    <link type="text/css" rel="stylesheet" href="/public/js/swiper/idangerous.swiper.css"/>

    <script type="text/javascript" src="/public/js/jquery-ui/external/jquery/jquery.js"></script>
    <script type="text/javascript" src="/public/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/public/js/swiper/noswiper.js"></script>
    <script type="text/javascript" src="/public/js/swiper/idangerous.swiper2.7.6.min.js"></script>

    <script type="text/javascript" src="/public/js/lib/sidelist.js"></script>
    <!--基地预约-->
   
    <link rel="stylesheet" href="/public/css/home/business/business_estatedetail.css">
    <style>
        label{
            max-width: 200px;
        }
    </style>

    


    <!--[if IE 6]>
    <script type="text/javascript" src="/public/js/lib/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->

</head>

<body>
    <div id="estate" class="section1">
        <div class="pic-box">
            <img src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                 simplified_image="{$head_images[0]['image_url1']}" alt="" class="pic">
        </div>
        <div class="content container">
            <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                            href="/business/index?level_id=1000000125">多元业务</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span><a
                            href="/business/estatelists?level_id=1000000128">地产</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span>{$estate[0].name}</span>
            <h2>{$estate[0].name}</h2>


            <div class="box">
                <div class="left">
                    {$estate[0].note}
                </div>
                <div class="right" style="padding: 0; width: 400px;position: relative;">
                    <img style="width: 400px;height: 300px;" src="{$cover_images[0]['image_url1']}"
                         traditional_image="{$cover_images[0]['image_url2']}"
                         simplified_image="{$cover_images[0]['image_url1']}" alt="">
                    <div class="contact">
                        <img src="{$code_images[0]['image_url1']}" traditional_image="{$code_images[0]['image_url2']}"
                             simplified_image="{$code_images[0]['image_url1']}" alt="">
                        <div class="word right">
                            <p>业态：
                                <php>echo str_replace(',',' ',$estate[0]['type'])</php>
                            </p>
                            <p>售卖：
                                <if condition=" $estate[0]['is_sales'] eq 0">售馨
                                    <else/>
                                    在售
                                </if>
                            </p>
                            <p>地址：{$estate[0].address}</p>
                            <p>销售热线：{$estate[0].tel}</p>
                        </div>
                    </div>

                    <div class="side-list">
                        <ul>
                            <li class="side-tel">
                                <img src="/public/img/home/business/estate/detail/estate_icon1.png" alt="">
                                <div class="tel-box">{$estate[0].tel}</div>
                            </li>
                            <li><a href="#image"><img src="/public/img/home/business/estate/detail/estate_icon2.png"
                                                      alt=""></a></li>
                            <li><a href="#estate_map"><img
                                            src="/public/img/home/business/estate/detail/estate_icon3.png"
                                            alt=""></a></li>
                            <li class="side-xin"><img src="/public/img/home/business/estate/detail/estate_icon4.png"
                                                      alt="">
                                <div class="xin-box">
                                    <div class="box-head"></div>
                                    <img src="{$code_images[0]['image_url1']}"
                                         traditional_image="{$code_images[0]['image_url2']}"
                                         simplified_image="{$code_images[0]['image_url1']}" alt=""
                                         width="130" />
                                </div>
                            </li>
                            <li class=""><a onclick="history.go(-1);"><img src="/public/img/home/business/estate/detail/estate_icon7.png" alt=""></a></li>
                            <li class="last"><a><img src="/public/img/home/business/estate/detail/estate_icon5.png" alt=""></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="section section1">
            <div class="container" id="image">
                <ul class="tabs">
                    <li class="fir active">户型图</li>
                    <li>规划图</li>
                    <li>实景图</li>
                </ul>
                <div class="banner" id="slider1">
                </div>
                <span class="prev arrow-left"><img src="/public/img/home/common/btn_prev1.png" alt=""></span>
                <span class="next arrow-right"><img src="/public/img/home/common/btn_next1.png" alt=""></span>
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

    <script type="text/javascript">
        $(function () {
            $(".header .nav li").eq(2).addClass("active").siblings().removeClass("active");
            SideList.top(600);
            SideList.tel();
            SideList.xin();
            var room = JSON.parse('<php>echo json_encode($room_images)</php>');
            var plan = JSON.parse('<php>echo json_encode($plan_images)</php>');
            var real = JSON.parse('<php>echo json_encode($real_images)</php>');
            var lists = [room, plan, real];
            var slider1 = $("#slider1");
            clickLi(0);
            $(".section1 .tabs li").click(function () {
                var index = $(this).index();
                $(this).addClass("active").siblings().removeClass("active");
                clickLi(index);
            })





            function clickLi(index) {
                slider1.html("");
                var img;
                var data = lists[index];
                var container = $("<div class='swiper-container'></div>");
                var wrapper = $("<div class='swiper-wrapper'></div>").appendTo(container);
                if(data) {
                    for (var i = 0; i < data.length; i++) {
                        var slide = $("<div class='swiper-slide'></div>");
                        var div = $("<div></div>").appendTo(slide);
                        img = $('<img onclick="showImage(this)" />').attr({
                            src: data[i].image_url1,
                            traditional_image: data[i].image_url2,
                            simplified_image: data[i].image_url1
                        }).appendTo(div);
                        slide.appendTo(wrapper);
                    }
                }
                container.appendTo(slider1);
                swiper1();
            }

        })

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


            $('#estate .section1 .prev').click(function () {
                mySwiper1.swipePrev();
            })
            $('#estate .section1 .next').click(function () {
                mySwiper1.swipeNext();
            })


            $(window).on("resize", function () {
                height1 = $("#slider1 .swiper-slide img").height();
                $("#slider1 .swiper-wrapper").height(height1);
                $("#slider1 .swiper-slide").height(height1);
            })
        }


        //        map.addControl(new BMap.NavigationControl());
        //                map.addControl(new BMap.CopyrightControl(''));
        //                map.addControl(new BMap.OverviewMapControl());
        //        map.addControl(new BMap.MapTypeControl());
        //        map.setCurrentCity("北京");



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
</body>
</html>