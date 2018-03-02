<extend name="./Application/Home/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/business/business_hotel.css">
</block>
<block name="title">酒店-雅居乐集团</block>

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
            <span class="prev arrow-left"><img src="/public/img/home/common/btn_prev.png" alt=""></span>
            <span class="next arrow-right"><img src="/public/img/home/common/btn_next.png" alt=""></span>
            <div class="pagination"></div>
        </div>
        <div class="search">
            <div class="container">
                <ul class="selects">
                </ul>
                <div class="input">
                    <input type="text" placeholder="请输入酒店名称或关键词" style="text-align: center;"><span
                            class="butn">查询</span>
                </div>

                <div class="side-list">
                    <ul>
                        <!--<li class="side-tel">-->
                        <!--<img src="/public/img/home/business/estate/detail/estate_icon1.png" alt="">-->
                        <!--<div class="tel-box">020-88839888</div>-->
                        <!--</li>-->
                        <!--<li><a href=""><img src="/public/img/home/business/estate/detail/estate_icon2.png" alt=""></a>-->
                        <!--</li>-->
                        <!--<li><a href=""><img src="/public/img/home/business/estate/detail/estate_icon3.png" alt=""></a>-->
                        <!--</li>-->
                        <li class="side-xin"><img src="/public/img/home/business/estate/detail/estate_icon4.png" alt="">
                            <div class="xin-box">
                                <div class="box-head"></div>
                                <img src="/public/img/home/business/hotel/two-code-hotel.jpg" alt="" width="130">
                            </div>
                        </li>
                        <li class=""><a onclick="history.go(-1);"><img src="/public/img/home/business/estate/detail/estate_icon7.png" alt=""></a></li>
                        <li class="last"><a><img src="/public/img/home/business/estate/detail/estate_icon5.png" alt=""></a></li>
                    </ul>
                </div>
            </div>
        </div>


        <div class="main">
            <div class="container">
                <div class="list">
                    <img src="/public/img/home/business/hotel/hotel_list.jpg" alt="">
                </div>

                <h2>雅居乐集团酒店管理公司</h2>

                <div class="box">
                    <div class="left">
                        <img src="/public/img/home/business/hotel/hotel_p1.jpg" alt="">
                        <img src="/public/img/home/business/hotel/hotel_p2.jpg" class="sce" alt="">
                    </div>
                    <div class="right">
                        <p>雅居乐集团酒店管理公司成立于 2008 年,总部位于广州。</p>
                        <div class="title">品牌</div>
                        <p>拥有超过 20
                            间品牌酒店,位于广东、上海、江苏、海南、四川、湖南、云南等地,并与全球十多个知名国际酒店集团合作,包括洲际酒店集团、雅高酒店集团、卓美亚酒店集团、万豪国际酒店集团、喜达屋酒店集团、希尔顿酒店集团、豪生国际酒店集团、嘉佩乐酒店集团、凯悦酒店集团及豪瑞格酒店集团等。
                        </p>
                        <div class="title">特色</div>
                        <p>雅居乐酒店致力为客人提供最舒适入住体验,并融合当地特色文化,创造别具特色的项目,深受广大客人欢迎。凭借专业的服务和经营,雅居乐集团在酒店营运业务取得理想的成绩。
                        </p>
                        <div class="title">详情</div>
                        <p>
                            酒店管理公司经营的多间酒店持续提供稳定收入,分别是上海雅居乐万豪酒店、海南雅居莱佛士酒店、惠州白鹭湖雅居乐喜来登度假酒店、成都雅居乐豪生大酒店、海南清水湾假日度假酒店、佛山雅居乐酒店、中山雅居乐酒店及腾冲雅居乐原乡客栈,还有逾10间酒店正处于规划、兴建及装修阶段,包括广西南宁希尔顿酒店/希尔顿花园酒店、海南清水湾
                            JW万豪酒店、海南清水湾希尔顿酒店、扬州凯乐嘉轩酒店、长沙灰汤豪生温泉大酒店、海南卓美亚酒店、海南文昌假日酒店、腾冲嘉佩乐酒店、无锡豪生行政公寓、海南豪瑞格酒店、腾冲希尔顿酒店等。</p>

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
//                                    $(el).find(".items").find("li").on("mouseover", function () {
//                                        $(this).addClass("active").siblings("li").removeClass("active");
//                                    })
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
                                    location.href = "/business/hoteldetail?land_id=" + res.item[index].land_id;
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
                if ("请输入酒店名称或关键词" == keyword) {
                    keyword = "";
                }
                location.href = "/business/hotellists?level_id=1000000131&keyword=" + keyword;
            })


        })

    </script>
</block>