<extend name="./Application/Homeen/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/business/business_estate.css">
</block>

<block name="title">Real Estate-Agile Group</block>


<block name="body_main">
    <div id="bu-home" class="section1">

        <div class="banner" id="slider1">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <volist name="head_images" id="item">
                        <div class="swiper-slide swiper-no-swiping">
                            <a
                            <if condition="$key EQ 0">href='/en/business/estatelists?level_id=1000000128'
                                <else/>
                                href='/en/business/estatelists?level_id=1000000128&city_id=&type=Shops&is_sales=&keyword='
                            </if>
                            >
                            <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                 simplified_image="{$item.image_url1}" alt="">
                            </a>
                        </div>
                    </volist>
                </div>

            </div>
            <div class="butn">
                <div class="btn1 btn-s">
                    <a href='/en/business/estatelists?level_id=1000000128'>
                        <div class="mask"></div>
                        <span style="display: none;"><img src="/public_en/img/home/business/index/index_btn1.png"
                                                          alt=""></span>
                        <div class="item" style="">
                            <span class="icon"><img src="/public_en/img/home/business/index/btn_icon1.png"
                                                    alt=""></span>
                            <span class="tip">Residential Properties</span>
                        </div>
                    </a>
                </div>
                <div class="btn2 btn-s">
                    <a href="/en/business/estatelists?level_id=1000000128&city_id=&type=Shops&is_sales=&keyword=">
                        <div class="mask"></div>
                        <span><img src="/public_en/img/home/business/index/index_btn2.png" alt=""></span>
                        <div class="item" style="display: none;">
                            <span class="icon"><img src="/public_en/img/home/business/index/btn_icon2.png"
                                                    alt=""></span>
                            <span class="tip">Commercial Properties</span>
                        </div>
                    </a>
                </div>
            </div>
            <span class="prev arrow-left"><img src="/public_en/img/home/common/btn_prev.png" alt=""></span>
            <span class="next arrow-right"><img src="/public_en/img/home/common/btn_next.png" alt=""></span>
        </div>


        <div class="search">
            <div class="container">
                <ul>
                    <li class="fir">
                        <div id="select1" class="select">
                            <div class="nav">City</div>
                            <ul class="items">
                                <volist name="city_type" id="item">
                                    <li id="{$item.type_id}">{$item.name}</li>
                                </volist>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <div id="select2" class="select">
                            <div class="nav">Products</div>
                            <ul class="items">
                                <volist name="format_type" id="item">
                                    <li id="{$item.name}">{$item.name}</li>
                                </volist>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <div id="select3" class="select">
                            <div class="nav">Sales Status</div>
                            <ul class="items">
                                <li id="1">Hot sale</li>
                                <li id="0">Sold</li>
                            </ul>
                        </div>
                    </li>
                    <div class="clear"></div>
                </ul>
                <div class="input">
                    <input type="text" placeholder="Please enter a project name or keyword" style="text-align: center;"><span
                            class="butn">Search</span>
                </div>
                <div class="side-list">
                    <ul>
                        <li class="side-tel">
                            <img src="/public_en/img/home/business/estate/detail/estate_icon1.png" alt="">
                            <div class="tel-box">400-698-3383</div>
                        </li>
                        <li class="side-xin"><img src="/public_en/img/home/business/estate/detail/estate_icon4.png"
                                                  alt="">
                            <div class="xin-box">
                                <div class="box-head"></div>
                                <img src="/public_en/img/home/common/two_code.png" alt="" width="130">
                            </div>
                        </li>
                        <!--<li><a href=""><img src="/public_en/img/home/business/estate/detail/estate_icon3.png" alt=""></a>-->
                        <!--</li>-->
                        <!--<li class="side-email">-->
                        <!--<img src="/public_en/img/home/business/estate/detail/estate_icon6.png" alt="">-->
                        <!--<div class="email-box">020-88839888</div>-->
                        <!--</li>-->
                        <li class=""><a onclick="history.go(-1);"><img
                                        src="/public_en/img/home/business/estate/detail/estate_icon7.png" alt=""></a>
                        </li>
                        <li class="last"><a><img src="/public_en/img/home/business/estate/detail/estate_icon5.png"
                                                 alt=""></a></li>
                    </ul>
                </div>


            </div>
        </div>

        <div class="section1">
            <div class="container">
                <h2>Search Projects from the Map</h2>
                <div class="box">
                    <div class="left">
                        <img src="/public_en/img/home/business/estate/index/home_map.jpg" alt="">
                    </div>
                    <div class="right">
                        <span>Agile has projects</span><br>
                        <span>in over 60 cities in China</span>
                        <p>
                            Agile has implemented its strategy of geographic diversification in China and extended its
                            presence into overseas markets. Agile has owned over 100 residential, commercial and tourism
                            projects in different stages of development.
                        </p>
                        <a onclick="show_expecting()" href="javascript:;">
                            Search
                        </a>

                    </div>
                </div>
            </div>
        </div>


        <div class="section2">
            <div class="container">

                <h2>Hot Sales</h2>

                <div class="banner" id="slider2">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <volist name="sales" id="item">
                                <div class="swiper-slide swiper-no-swiping">
                                    <div>
                                        <!--<a href="/en/business/estatedetail?land_id={$item.land_id}">-->
                                        <a href="javascript:void(0);" class="aler">
                                            <img
                                                    src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                                    simplified_image="{$item.image_url1}" alt="">
                                        </a>

                                        <div class="word">
                                            <div class="cover"></div>
                                            <span class="name" style="z-index: 2">
                                                <!--<a style="color: white"href="/en/business/estatedetail?land_id={$item.land_id}">-->
                                                <a style="z-index: 2;color: #fff;" href="javascript:void(0);"
                                                   class="aler">
                                                    {$item.name}</a></span><br>
                                            Sales Status：<span class="statu"><if condition="$item.is_sales eq 0">Sold
                                                    <else/>
                                                    Hot sale
                                                </if></span>
                                        </div>

                                        <div class="box">
                                            <!--开发时间:<span class="time">-->

                                            <!--<php> echo date('Y年m月',strtotime($item['begin_time']))</php>-->
                                            <br>
                                            <notempty name="item.tel">Sales hotline:<span
                                                        class="phone">{$item.tel}</span></notempty>
                                            <br>
                                            <p style="height: 56px;">Address:<span class="adress">{$item.address}</span>
                                            </p>

                                        </div>

                                        <div class="more">
                                            <!--<a href="/en/business/estatedetail?land_id={$item.land_id}">-->
                                            <a href="javascript:void(0);" class="aler">
                                                Details </a><span
                                                    class="icon"></span></div>
                                    </div>
                                </div>
                            </volist>
                        </div>
                    </div>
                </div>
                <span class="prev"><img src="/public_en/img/home/common/btn_prev1.png" alt=""></span>
                <span class="next"><img src="/public_en/img/home/common/btn_next1.png" alt=""></span>
                <div class="pagination"></div>

            </div>
        </div>

        <div class="section3">
            <div class="content container">
                <a href="/en/business/estateexpresslists?level_id=1000000171"><span
                            class="title">Projects Updates</span></a>
                <div class="news-box">
                    <div class="left" style="width:551px;">
                        <volist name="notices" id="item" offset="0" length="1">
                            <!-- <a href="/en/news/detail?id={$item.notice_id}">-->
                            <a href="javascript:void(0);" class="aler">
                                <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                     simplified_image="{$item.image_url1}" alt="">
                            </a>
                            <span style="">
                                <!--<a href="/en/news/detail?id={$item.notice_id}">-->
                                <a href="javascript:void(0);" class="aler">
                                    {$item.name}</a></span>
                        </volist>
                    </div>
                    <div class="right">
                        <div class="items1">
                            <ul>
                                <volist name="notices" id="item" offset="1" length="6">
                                    <li class="text"><img src="/public_en/img/home/news/point.png">
                                        <!--<a href="/en/news/detail?id={$item.notice_id}">-->
                                        <a href="javascript:void(0);" class="aler">
                                            {$item.name}</a></li>
                                    <li class="date">Release Time:
                                        <php>echo (new \DateTime($item['begin_time']))->format('Y-m');</php>
                                    </li>
                                </volist>
                            </ul>
                            <!--<a href="/en/business/estateexpresslists?level_id=1000000171"
                               style="float: right;font-size: 16px;color: #9d7cb3;margin-top: 60px;">-->
                            <a href="javascript:void(0);" class="aler"
                               style="float: right;font-size: 16px;color: #9d7cb3;margin-top: 60px;">

                                More></a>
                        </div>
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

		select(id1);
		select(id2);
		select(id3);
		$(function () {
			$(".header .nav li").eq(2).addClass("active").siblings().removeClass("active");
			SideList.top(600);
			SideList.tel();
			SideList.email();
			SideList.xin();

//            按钮动画
//            $("#slider1 .butn>div:not(.btn1)").find(".mask").one("mouseover", function () {
//                $(".btn1").find(".item").animate({width: "80px"}, 200, function () {
//                    $(this).hide().siblings("span").show();
//                });
//            })

			$("#slider1 .butn .mask").on("mouseover", function (e) {
				e.stopPropagation();
				var index = $(this).parents(".btn-s").index();
				$(".btn-s").find(".item").hide().siblings("span").show();
				$(this).siblings(".item").show().siblings("span").hide();
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


//            if ($('#slider1 .swiper-slide').length != 1) {
			var mySwiper1 = $('#slider1 .swiper-container').swiper({
				loop: true,
				noSwiping: true,
				autoplay: 3000,
				speed: 1000,
				onSlideChangeStart: function (swiper) {
					var index = swiper.activeLoopIndex;
					$(".btn-s").find(".item").hide().siblings("span").show();
					$(".btn-s").eq(index).find(".item").show().siblings("span").hide();
				}
//                pagination: '#bannerpagination',
//                paginationClickable: true,
//                grabCursor: true,
//                parallax: true,
				//其他设置
			});
//            }else {
//                NoSwiper.bind("slider1");
//            }

			var mySwiper2 = $('#slider2 .swiper-container').swiper({
				loop: true,
				noSwiping: true,
				autoplay: 3000,
				speed: 300,
				slidesPerView: 3,
				pagination: '.section2 .pagination',
				paginationClickable: true,
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

			$(".section2 .prev").click(function () {
				mySwiper2.swipePrev();
			})

			$(".section2 .next").click(function () {
				mySwiper2.swipeNext();
			})


//            点击查询按钮事件

			$(".search .input .butn").click(function () {
				var city = $("#select1 .nav").attr("id");
				(city == undefined) ? city = "" : city;
				var type = $("#select2 .nav").attr("id");
				(type === undefined) ? type = "" : type;
				var sales = $("#select3 .nav").attr("id");
				(sales === undefined) ? sales = "" : sales;
				var keyword = $(".search .input input").val();
//                (keyword===undefined)?key"":keyword;
				var data = {
					city_id: city,
					type: type,
					is_sales: sales,
					keyword: keyword,
				};

				if ("Please enter a project name or keyword" == data.keyword) {
					data.keyword = "";
				}
				var url = "/business/estatelists?level_id=1000000128&" + "city_id=" + data.city_id + "&" + "type=" + data.type + "&" + "is_sales=" + data.is_sales + "&" + "keyword=" + data.keyword;
//                location.href = url;
				show_expecting();
			})
		})
    </script>
</block>