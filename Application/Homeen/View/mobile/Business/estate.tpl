<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/business/estate.css">
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public_en/hui3/lib/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>
    <script type="text/javascript" src="/public_en/js/lib/select.js"></script>
    <script type="text/javascript" src="/public_en/hui3/lib/jcarousellite.min.js"></script>

</block>
<block name="title">Real Estate-Agile Group</block>
<block name="head_menu">
    <a class="tip">Real Estate/</a>
</block>

<block name="body_main">
    <div id="slider-3">
        <div class="slider">
            <div class="bd">
                <ul>
                    <volist name="mobile_head_images" id="item">
                        <li>
                            <a
                            <if condition="$key EQ 0">href='/en/business/estatelists?level_id=1000000128'
                                <else/>
                                href='/en/business/estatelists?level_id=1000000128&city_id=&type=Shops&is_sales=&keyword='
                            </if>
                            >
                            <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                 simplified_image="{$item.image_url1}" alt="" class="banner-img">
                            </a>
                        </li>
                    </volist>
                </ul>
            </div>
            <ol class="hd cl">
                <li class="land-house">
                    <div class="land me-hidden"><img src="/public_en/img/home/business/index/index_btn1.png"></div>
                    <div class="land-active "><img class="left"
                                                   src="/public_en/img/home/business/index/btn_icon1.png"><span>Residential Properties</span>
                        <div class="clear"></div>
                    </div>
                </li>
                <li class="land-house">
                    <div class="land "><img src="/public_en/img/home/business/index/index_btn2.png"></div>
                    <div class="land-active me-hidden"><img class="left"
                                                            src="/public_en/img/home/business/index/btn_icon2.png"><span>Commercial Properties</span>
                        <div class="clear"></div>
                    </div>
                </li>
            </ol>
        </div>
    </div>
    <div class="search txt-center ">
        <div class="container">
            <div class="option">
                <div class="city">
                    <span class="text txt-center">City</span>
                    <select>
                        <option>All</option>
                        <volist name="city_type" id="item">
                            <option value="{$item.type_id}">{$item.name}</option>
                        </volist>
                    </select>
                </div>
            </div>
            <div class="option">
                <div class="type">
                    <span class="text txt-center">Products</span>
                    <select>
                        <option>All</option>
                        <volist name="format_type" id="item">
                            <option value="{$item.name}">{$item.name}</option>
                        </volist>
                    </select>
                </div>
            </div>
            <div class="option">
                <div class="sales">
                    <span class="text txt-center">Sales Status</span>
                    <select>
                        <option>All</option>
                        <option value="1">Hot sale</option>
                        <option value="0">Sold</option>
                    </select>
                </div>
            </div>
            <div class="input">
                <input type="text" placeholder="Please type the property name" style="text-align: center;"><span
                        class="butn">Search</span>
            </div>
        </div>

    </div>


    <div class="mt-20 container">

        <h2 class="title-color main-title txt-center">Search Projects from the Map</h2>
        <div>
            <img src="/public_en/img/mobile/business/easte/map.png" class="tags-img mt-20">
        </div>
        <div class="mt-20">
            <h3 class="title-color min-title" style="color: #00716a;">Agile has projects in over 60 cities in China</h3>
            <p class="mt-10">
                Agile has implemented its strategy of geographic diversification in China and extended its presence into
                overseas markets. Agile has owned over 100 residential, commercial and tourism projects in different
                stages of development.
            </p>
        </div>

        <a href="javascript:;" class="a-color aler">
            <div class="main-btn mt-20 mb-20">Search</div>
        </a>

    </div>
    <div class=" cl container bgc-ef pt-20">
        <h2 class="main-title title-color txt-center">Hot Sales</h2>
        <div class="rollpic  txt-center mt-20"><a href="javascript:void(0)" class="prev"></a>
            <div class="rollpicshow txt-center pb-20">
                <ul>
                    <volist name="sales" id="item">
                        <li class="">
                            <!-- <a href="/en/business/estatedetail?land_id={$item.land_id}">-->
                            <a onclick='show_expecting()'>
                                <img src="{$item.image_url1}"
                                     traditional_image="{$item.image_url2}"
                                     simplified_image="{$item.image_url1}" class="tags-img">
                            </a>

                            <div class="word">
                                <div class="cover"></div>
                                <h3 class="txt-center min-title">
                                    <!--<a class="a-color" href="/en/business/estatedetail?land_id={$item.land_id}">-->
                                    <a onclick='show_expecting()' class="a-color">
                                        {$item.name}
                                    </a>
                                </h3>

                                <p class="txt-center status">Sales Status：<span><if condition="$item.is_sales eq 0">
                                            Sold
                                            <else/>
                                            Hot sale
                                        </if></span>
                                </p>
                            </div>

                            <div class="box">
                                <!--开发时间:<span class="time">-->

                                <!--<php> echo date('Y年m月',strtotime($item['begin_time']))</php>-->
                                </span><br>
                                <notempty name="item.tel">Sales hotline:<span class="phone">{$item.tel}</span>
                                </notempty>
                                <br>
                                <p style="height: 56px;">Address:<span class="adress">{$item.address}</span>
                                </p>

                            </div>

                            <!--<a class="a-color" href="/en/business/estatedetail?land_id={$item.land_id}">-->
                            <a onclick='show_expecting()' class="a-color">
                                <div class="btn-more1 ">Details</div>
                            </a>


                        </li>

                    </volist>
                </ul>
            </div>
            <a href="javascript:void(0)" class="next"></a>
        </div>
    </div>
    <div class="mt-30  container">
        <h2 class="main-title title-color txt-center  mb-20">楼盘速递</h2>
        <volist name="notices" id="item" offset="0" length="3">
            <div class="mt-10 bgc-ef">
                <div class="container pt-10 ">

                    <!--<a href="/en/news/detail?id={$item.notice_id}">-->
                    <a onclick='show_expecting()'>
                        <div class=" pt-5 pr-5 left pt-5 left"><img
                                    src="/public_en/img/mobile/invest/index/dot.png" class="xs-img"></div>
                        <div class="pl-5 left content" style="width: 90%;">
                            <span>{$item.name}</span>
                            <p class="color-999">Release Time：
                                <php>echo date('Y-m',strtotime($item['begin_time']))</php>
                            </p>
                        </div>
                        <div class="clear"></div>
                    </a>


                </div>
            </div>
        </volist>
        <a onclick='show_expecting()' href="javascript:void(0)"
           class="a-color">
            <div class="main-btn mt-20 mb-20">
                More
            </div>
        </a>

    </div>

</block>
<block name="body_side">
    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public_en/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box"><a href="tel://400-698-3383">400-698-3383</a></div>
            </li>
            <li class="side-xin"><img src="/public_en/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public_en/img/home/common/two_code.png" alt="">
                </div>
            </li>
            <li class=""><a><img src="/public_en/img/mobile/base/go-top.jpg" alt=""></a></li>
        </ul>
    </div>
</block>
<block name="footer_js">
    <script>

		$(function () {

			$("#slider-3 .slider").slide({mainCell:".bd ul",titCell:".hd li",trigger:"click",effect:"leftLoop",autoPlay:false,delayTime:700,interTime:5000,pnLoop:false,titOnClassName:"active"});


			$("#slider-1 .slider")
				.slide({mainCell:".bd ul",titCell:".hd li",trigger:"mouseover",effect:"leftLoop",autoPlay:false,delayTime:850,
                interTime:7000,pnLoop:false,titOnClassName:"active"});

			$('.land-house').click(function () {
				var me = $(this);
				me.find('.land-active').show();
				me.find('.land').hide();

				me.siblings().find('.land').show();
				me.siblings().find('.land-active').hide();
			});


			$(".rollpic .rollpicshow").jCarouselLite({
				auto: 2000, /*自动播放间隔时间*/
				speed: 500, /*速度*/
				btnNext: ".next", /*向前滚动*/
				btnPrev: ".prev", /*向后滚动*/
				visible: 1 /*显示数量*/
			});
//            点击查询按钮事件

			$(".city  select").change(function () {
				var value = $(".city option:selected").text();
				$(".city .text").text(value);

			});
			$(".type  select").change(function () {
				var value = $(".type option:selected").text();
				$(".type .text").text(value);

			});
			$(".sales  select").change(function () {
				var value = $(".sales option:selected").text();
				$(".sales .text").text(value);

			});
			var value_city = $(".city option:selected").text();
			var value_type = $(".type option:selected").text();
			var value_sales = $(".sales option:selected").text();
			if ("All" != value_city) $(".city .text").text(value_city);
			if ("All" != value_type) $(".type .text").text(value_type);
			if ("All" != value_sales) $(".sales .text").text(value_sales);

			$(".search .input .butn").click(function () {
				var city = $(".city  select").val();
				(city == "All") ? city = "" : city;
				var type = $(".type  select").val();
				(type === "All") ? type = "" : type;
				var sales = $(".sales  select").val();
				(sales === "All") ? sales = "" : sales;
				var keyword = $(".search .input input").val();
				var data = {
					city_id: city,
					type: type,
					is_sales: sales,
					keyword: keyword,
				};

				if ("Please type the property name" == data.keyword) {
					data.keyword = "";
				}
				var url = "/business/estatelists?level_id=1000000128&" + "city_id=" + data.city_id + "&" + "type=" + data.type + "&" + "is_sales=" + data.is_sales + "&" + "keyword=" + data.keyword;
//                location.href = url;
				show_expecting()
			})
		})
    </script>
</block>