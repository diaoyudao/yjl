﻿<extend name="./Application/Homeen/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/business/business_estatedetail.css">
    <style>
        label{
            max-width: 200px;
        }
    </style>
</block>
<block name="title">{$estate[0].name}-Agile Group</block>
<block name="body_main">
    <div id="estate" class="section1">
        <div class="pic-box">
            <img src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                 simplified_image="{$head_images[0]['image_url1']}" alt="" class="pic">
        </div>
        <div class="content container">
            <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                    href="/en/business/index?level_id=1000000125">Diversification of Business</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span><a
                        href="/en/business/estatelists?level_id=1000000128">Property</a></span>&nbsp;&nbsp;
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
                            <p>Products：
                                <php>echo str_replace(',',' ',$estate[0]['type'])</php>
                            </p>
                            <p>Sales Status：
                                <if condition=" $estate[0]['is_sales'] eq 0">Sold
                                    <else/>
                                    Hot sale
                                </if>
                            </p>
                            <p>Address：{$estate[0].address}</p>
                            <p>Sales hotline：{$estate[0].tel}</p>
                        </div>
                    </div>

                    <div class="side-list">
                        <ul>
                            <li class="side-tel">
                                <img src="/public_en/img/home/business/estate/detail/estate_icon1.png" alt="">
                                <div class="tel-box">{$estate[0].tel}</div>
                            </li>
                            <li><a href="#image"><img src="/public_en/img/home/business/estate/detail/estate_icon2.png"
                                                      alt=""></a></li>
                            <li><a href="#estate_map"><img
                                    src="/public_en/img/home/business/estate/detail/estate_icon3.png"
                                    alt=""></a></li>
                            <li class="side-xin"><img src="/public_en/img/home/business/estate/detail/estate_icon4.png"
                                                      alt="">
                                <div class="xin-box">
                                    <div class="box-head"></div>
                                    <img src="{$code_images[0]['image_url1']}"
                                             traditional_image="{$code_images[0]['image_url2']}"
                                             simplified_image="{$code_images[0]['image_url1']}" alt=""
                                             width="130" />
                                </div>
                            </li>
                            <li class=""><a onclick="history.go(-1);"><img src="/public_en/img/home/business/estate/detail/estate_icon7.png" alt=""></a></li>
                            <li class="last"><a><img src="/public_en/img/home/business/estate/detail/estate_icon5.png" alt=""></a></li>
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
                <span class="prev arrow-left"><img src="/public_en/img/home/common/btn_prev1.png" alt=""></span>
                <span class="next arrow-right"><img src="/public_en/img/home/common/btn_next1.png" alt=""></span>
            </div>
        </div>


        <div class="section section2">
            <div class="container" id="estate_map">
                <h2>楼盘地图周边</h2>


                <div class="main">
                    <div id="map" style="width: 680px;height: 320px;float: left;">
                        <!--<img src="/public_en/img/home/business/estate/detail/estate_map.jpg" alt="">-->
                    </div>
                    <div class="right">
                        <div class="nav">
                            <ul>
                                <li class="active">交通</li>
                                <li>教育</li>
                                <li>医疗</li>
                                <li>商业</li>
                            </ul>
                        </div>
                        <div id="results" style="width: 316px;height: 263px;overflow: auto"></div>
                    </div>

                    <div class="clear"></div>
                    <p class="tips">
                        *免责条款：本网显示房屋位置、交通、医疗、教育、商业等配套信息，来源于百度地图提供的第三方数据，不作为要约，仅供参考，双方具体权利义务应以法律规定及买卖合同约定为准。</p>
                </div>
            </div>
        </div>


        <div class="section section3">
            <div class="container">
                <h2>Hot Sales</h2>
                <div class="banner" id="slider2">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <volist name="sales" id="item">
                                <div class="swiper-slide swiper-no-swiping">
                                    <div>
                                        <a href="/en/business/estatedetail?land_id={$item.land_id}">
                                            <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                                 simplified_image="{$item.image_url1}" alt="">
                                        </a>
                                    </div>
                                </div>
                            </volist>
                        </div>
                    </div>
                </div>
                <span class="prev"><img src="/public_en/img/home/common/btn_prev1.png" alt=""></span>
                <span class="next"><img src="/public_en/img/home/common/btn_next1.png" alt=""></span>

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
    <script src="http://api.map.baidu.com/api?v=2.0&ak=2PnDtDDG2ISO2qtFw4GLT4CMdZajY5hM"
            type="text/javascript"></script>
    <script>
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


            var mySwiper2 = $('#slider2 .swiper-container').swiper({
                loop: true,
                noSwiping: true,
                autoplay: 3000,
                speed: 500,
                slidesPerView: 3,
//                pagination: '#bannerpagination',
//                paginationClickable: true,
//                grabCursor: true,
//                parallax: true,
                //其他设置
            });

            var height2 = $("#slider2 .swiper-slide img").height();
            $("#slider2 .swiper-wrapper").height(height2);
            $("#slider2 .swiper-slide").height(height2);


            $(window).on("resize", function () {
                height2 = $("#slider2 .swiper-slide>div").height();
                $("#slider2 .swiper-wrapper").height(height2);
                $("#slider2 .swiper-slide").height(height2);
            })


            $('#estate .section3 .prev').click(function () {
                mySwiper2.swipePrev();
            })
            $('#estate .section3 .next').click(function () {
                mySwiper2.swipeNext();
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
        var map = new BMap.Map("map");
        var point_x = {$estate[0]['positon_x']} ? {$estate[0]['positon_x']} : '';
        var point_y = {$estate[0]['positon_y']} ? {$estate[0]['positon_y']} : '';
        map.centerAndZoom(new BMap.Point(point_x, point_y), 15);
        var point=new BMap.Point(point_x, point_y);

        
        var myIcon = new BMap.Icon("/public_en/img/home/business/estate/detail/index_z_2327d6a.png", new BMap.Size(23, 33), {
            imageOffset: new BMap.Size(0, 0-11 * 25) // 设置图片偏移
        });
        var title=$('h2').eq(0).text();
        var w=title.length/2*10-4;
        var label = new BMap.Label(title,{offset:new BMap.Size(-w,-20)});
        var marker2 = new BMap.Marker(point,{icon:myIcon,offset: new BMap.Size(0, -14)});  // 创建标注
        map.addOverlay(marker2);
        marker2.setLabel(label);
        var local = new BMap.LocalSearch(map,
                {renderOptions: {map: map, panel: "results", autoViewport: false}});
        local.disableFirstResultSelection();
        var arr = ['公交', '学校', '医疗', '商场'];
        local.searchInBounds(arr[0], map.getBounds());
        searchTab();


        //        map.addControl(new BMap.NavigationControl());
        //                map.addControl(new BMap.CopyrightControl(''));
        //                map.addControl(new BMap.OverviewMapControl());
        //        map.addControl(new BMap.MapTypeControl());
        //        map.setCurrentCity("北京");


        function searchTab() {
            $("#estate .main .nav li").click(function () {
                var index = $(this).index();

                local.searchInBounds(arr[index], map.getBounds());
                $(this).addClass("active").siblings("li").removeClass("active");
            })
        }
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