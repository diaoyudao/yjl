<extend name="./Application/Homeen/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/business/business_hotel.css">
</block>
<block name="title">Hotel Operations-Agile Group</block>

<block name="body_main">
    <div id="hotel" class="section1">
        <div class="banner" id="slider1">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <volist name="head_images" id="item">
                        <div class="swiper-slide swiper-no-swiping">
                            <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                 simplified_image="{$item.image_url1}" alt="">
                        </div>
                    </volist>
                </div>
            </div>
            <span class="prev arrow-left"><img src="/public_en/img/home/common/btn_prev.png" alt=""></span>
            <span class="next arrow-right"><img src="/public_en/img/home/common/btn_next.png" alt=""></span>
            <div class="pagination"></div>
        </div>
        <div class="search">
            <div class="container">
                <ul class="selects">
                </ul>
                <div class="input">
                    <input type="text" placeholder="Please type the name of hotel or relevant keywords"
                           style="text-align: center;"><span
                            class="butn">Search</span>
                </div>

                <div class="side-list">
                    <ul>
                        <!--<li class="side-tel">-->
                        <!--<img src="/public_en/img/home/business/estate/detail/estate_icon1.png" alt="">-->
                        <!--<div class="tel-box">020-88839888</div>-->
                        <!--</li>-->
                        <!--<li><a href=""><img src="/public_en/img/home/business/estate/detail/estate_icon2.png" alt=""></a>-->
                        <!--</li>-->
                        <!--<li><a href=""><img src="/public_en/img/home/business/estate/detail/estate_icon3.png" alt=""></a>-->
                        <!--</li>-->
                        <li class="side-xin"><img src="/public_en/img/home/business/estate/detail/estate_icon4.png"
                                                  alt="">
                            <div class="xin-box">
                                <div class="box-head"></div>
                                <img src="/public_en/img/home/business/hotel/two-code-hotel.jpg" alt="" width="130">
                            </div>
                        </li>
                        <li class=""><a onclick="history.go(-1);"><img
                                        src="/public_en/img/home/business/estate/detail/estate_icon7.png" alt=""></a>
                        </li>
                        <li class="last"><a><img src="/public_en/img/home/business/estate/detail/estate_icon5.png"
                                                 alt=""></a></li>
                    </ul>
                </div>
            </div>
        </div>


        <div class="main">
            <div class="container">
                <div class="list">
                    <img src="/public_en/img/home/business/hotel/hotel_list.jpg" alt="">
                </div>

                <h2>Agile Group Hotel Operations Company</h2>

                <div class="box">
                    <div class="left">
                        <img src="/public_en/img/home/business/hotel/hotel_p1.jpg" alt="">
                        <img src="/public_en/img/home/business/hotel/hotel_p2.jpg" class="sce" alt="">
                    </div>
                    <div class="right">
                        <p>Agile Group Hotel Operations Company is established in 2008 and based in Guangzhou.</p>
                        <div class="title">Brands</div>
                        <p>
                            The company boasts over 20 hotels across Guangdong, Shanghai, Jiangsu, Hainan, Sichuan,
                            Hunan, Yunnan, etc. and joins forces with myriad renowned international hotel groups,
                            including InterContinental Hotels & Resorts, Raffles Hotels & Resorts, Jumeirah Hotels &
                            Resorts, Marriott International, Starwood Hotels & Resorts, Hilton Hotels & Resorts, Howard
                            Johnson International, Capella Hotels & Resorts , Hyatt Hotels & Resorts, Outrigger Hotels
                            and Resorts, etc.

                        </p>
                        <div class="title">Features</div>
                        <p>
                            Agile hotels strive to provide a pleasant stay combining local cultural characteristics,
                            creating unique projects and well received by the customers. Agile Group continues to shine
                            in hospitality management thanks to its deep reservoir of experience in providing
                            professional services and operations.
                        </p>
                        <div class="title">Details</div>
                        <p>
                            Hospitality services provided for Shanghai Marriott Hotel City Centre, Raffles Hainan,
                            Sheraton Bailuhu Resort Huizhou, Howard Johnson Agile Plaza Chengdu, Holiday Inn Resort
                            Hainan Clearwater Bay, Foshan Agile Hotel, Zhongshan Agile Hotel and Tengchong Agile Hotel
                            under Agile's hotel management arm has created a steady revenue stream.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</block>

<block name="footer_js">
    <script>
        var id1 = "select1";
        var id2 = "select2";
        var id3 = "select3";

        //        select(id1);
        //        select(id2);
        //        select(id3);
        $(function () {
            $(".header .nav li").eq(2).addClass("active").siblings().removeClass("active");
            SideList.top(394);
//            SideList.tel();
            SideList.xin();

            if ($('#slider1 .swiper-slide').length != 1) {
                var mySwiper = $('#slider1 .swiper-container').swiper({
                    loop: true,
                    noSwiping: true,
//                loop: true,
                    autoplay: 3000,
                    speed: 400,
                    pagination: '#slider1 .pagination',
                    paginationClickable: true,
//                pagination: '#bannerpagination',
//                paginationClickable: true,
//                grabCursor: true,
//                parallax: true,
                    //其他设置
                });
            } else {
                NoSwiper.bind("slider1");
            }


            $('.prev').click(function () {
                mySwiper.swipePrev();
            })
            $('.next').click(function () {
                mySwiper.swipeNext();
            })

            $.ajax({
                url: window.document.location.href,
                success: function () {
                    var id = 1;
                    var ul = $(".search .selects");
                    var lists = JSON.parse('<php>echo json_encode($lists)</php>');

                    for (var i = 0; i < 3; i++) {
                        var li = $("<li></li>");
                        var select = $("<div class='select'></div>").attr({id: "select" + (i + 1)}).appendTo(li);
                        var nav = $("<div class='nav'></div>").text(lists[id - 1].name).appendTo(select);
                        var items = $("<ul class='items'></ul>").appendTo(select);
                        li.appendTo(ul);
                        id++;
                    }
                    var clear = $("<div class='clear'></div>").appendTo(ul);
                    $(".search li:first").addClass("fir");


                    //点击事件

                    $(".search .selects>li").click(function () {
                        return false
                        var index = $(this).index();
                        var items = $(".search .items").eq(index);
                        items.text("");
                        $.ajax({
                            url: window.document.location.href,
                            type: "post",
                            data: "type_id=" + lists[index].type_id,
                            success: function (res) {
                                for (var i = 0; i < res.item.length; i++) {
                                    var li = $("<li></li>").text(res.item[i].name).appendTo(items);
                                }
                                var el = "#select" + (index + 1);
                                $(el).find(".items").show();
                                $(el).find(".items").find("li").on("mouseover", function () {
                                    $(this).addClass("active").siblings("li").removeClass("active");
                                })
                                $(el).find(".nav").click(function () {
                                    $(el).find(".items").show();
                                })
                                $(el).click(function (event) {
                                    event.stopPropagation();
                                });
                                $(el).find(".items").show();
                                $(el).find(".items").find("li").on("mouseover", function () {
                                    $(this).addClass("active").siblings("li").removeClass("active");
                                })

                                $(el).find("li").on("click", function () {
                                    var index = $(this).index();
                                    $(el).find(".items").hide();
                                    $(el).find(".nav").text($(this).text());

                                    // 后端操作
//                                    location.href="/en/business/hoteldetail?land_id=" + res.item[index].land_id;
                                    show_expecting();
                                })
                                $(document).on("click", function (event) {
                                    $(el).find(".items").hide();
                                })
                            }
                        })
                    })
                }
            })


            //查询按钮点击事件
            $(".search .input .butn").click(function () {
                var keyword = $(".search .input input").val();
                if ("Please type the name of hotel or relevant keywords" == keyword) {
                    keyword = "";
                }
//                location.href="/en/business/hotellists?level_id=1000000131&keyword=" + keyword;
                show_expecting();
            })


        })

    </script>
</block>