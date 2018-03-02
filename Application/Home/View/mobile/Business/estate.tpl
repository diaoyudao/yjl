<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/business/estate.css">
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public/hui3/lib/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>
    <script type="text/javascript" src="/public/js/lib/select.js"></script>
    <script type="text/javascript" src="/public/hui3/lib/jcarousellite.min.js"></script>

</block>
<block name="title">地产-雅居乐集团</block>
<block name="head_menu">
    <a class="tip">地产/</a>
</block>

<block name="body_main">
    <div id="slider-3">
        <div class="slider">
            <div class="bd">
                <ul>
                    <volist name="mobile_head_images" id="item">
                        <li><a href="/business/estatelists?level_id=1000000128">
                                <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                     simplified_image="{$item.image_url1}" alt="" class="banner-img">
                            </a>
                        </li>
                    </volist>
                </ul>
            </div>
            <ol class="hd cl">
                <li class="land-house">
                    <div class="land me-hidden"><img src="/public/img/home/business/index/index_btn1.png"></div>
                    <div class="land-active "><img class="left"
                                                   src="/public/img/home/business/index/btn_icon1.png"><span>住宅地产</span>
                        <div class="clear"></div>
                    </div>
                </li>
                <li class="land-house">
                    <div class="land "><img src="/public/img/home/business/index/index_btn2.png"></div>
                    <div class="land-active me-hidden"><img class="left"
                                                            src="/public/img/home/business/index/btn_icon2.png"><span>商业地产</span>
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
                    <span class="text txt-center">城市</span>
                    <select>
                        <option>全部</option>
                        <volist name="city_type" id="item">
                            <option value="{$item.type_id}">{$item.name}</option>
                        </volist>
                    </select>
                </div>
            </div>
            <div class="option">
                <div class="type">
                    <span class="text txt-center">业态</span>
                    <select>
                        <option>全部</option>
                        <volist name="format_type" id="item">
                            <option value="{$item.name}">{$item.name}</option>
                        </volist>
                    </select>
                </div>
            </div>
            <div class="option">
                <div class="sales">
                    <span class="text txt-center">销售状态</span>
                    <select>
                        <option>全部</option>
                        <option value="1">在售</option>
                        <option value="0">售罄</option>
                    </select>
                </div>
            </div>
            <div class="input">
                <input type="text" placeholder="请输入楼盘名称或关键词" style="text-align: center;"><span
                        class="butn">查询</span>
            </div>
        </div>

    </div>


    <div class="mt-20 container">

        <h2 class="title-color main-title txt-center">地图找楼盘</h2>
        <div>
            <img src="/public/img/mobile/business/easte/map.png" class="tags-img mt-20">
        </div>
        <div class="mt-20">
            <h3 class="title-color min-title" style="color: #00716a;">雅居乐的楼盘
                遍布全国逾40个城市</h3>
            <p class="mt-10">
                雅居乐地产实现全国战略性布局，并拓展至海外——马来西亚，筑造逾100处不同发展阶段的城市豪宅、高端别墅、生活大盘、旅游地产、商业中心、星级酒店等标杆性项目。
            </p>
        </div>

        <a href="/business/estatelists?level_id=1000000128&city_id=&type_id=&is_sales=&keyword=" class="a-color">
            <div class="main-btn mt-20 mb-20">开始搜索</div>
        </a>

    </div>
    <div class=" cl container bgc-ef pt-20">
        <h2 class="main-title title-color txt-center">热销楼盘</h2>
        <div class="rollpic  txt-center mt-20"><a href="javascript:void(0)" class="prev"></a>
            <div class="rollpicshow txt-center pb-20">
                <ul>
                    <volist name="sales" id="item">
                        <li class="">
                            <a href="/business/estatedetail?land_id={$item.land_id}">
                                <img src="{$item.image_url1}"
                                     traditional_image="{$item.image_url2}"
                                     simplified_image="{$item.image_url1}" class="tags-img">
                            </a>

                            <div class="word">
                                <div class="cover"></div>
                                <h3 class="txt-center min-title">
                                    <a class="a-color"
                                       href="/business/estatedetail?land_id={$item.land_id}">{$item.name}
                                    </a>
                                </h3>

                                <p class="txt-center status">项目状态：<span><if condition="$item.is_sales eq 0">售罄
                                            <else/>
                                            在售
                                        </if></span>
                                </p>
                            </div>

                            <div class="box">
                                <!--开发时间:<span class="time">-->

                                <!--<php> echo date('Y年m月',strtotime($item['begin_time']))</php>-->
                                </span><br>
                                <notempty name="item.tel">销售热线:<span class="phone">{$item.tel}</span></notempty>
                                <br>
                                <p style="height: 56px;">项目地址:<span class="adress">{$item.address}</span>
                                </p>

                            </div>

                            <a class="a-color"
                               href="/business/estatedetail?land_id={$item.land_id}">
                                <div class="btn-more1 ">了解详情</div>
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

                    <a href="/news/detail?id={$item.notice_id}">
                        <div class=" pt-5 pr-5 left pt-5 left"><img
                                    src="/public/img/mobile/invest/index/dot.png" class="xs-img"></div>
                        <div class="pl-5 left content" style="width: 90%;">
                            <span>{$item.name}</span>
                            <p class="color-999">发布时间：
                                <php>echo date('Y年m月',strtotime($item['begin_time']))</php>
                            </p>
                        </div>
                        <div class="clear"></div>
                    </a>


                </div>
            </div>
        </volist>
        <a href="/business/estateexpresslists?level_id=1000000171"
           class="a-color">
            <div class="main-btn mt-20 mb-20">
                查看更多
            </div>
        </a>

    </div>

</block>
<block name="body_side">
    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box"><a href="tel://400-020-3383">400-020-3383</a></div>
            </li>
            <li class="side-xin"><img src="/public/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public/img/home/common/two_code.png" alt="">
                </div>
            </li>
            <li class=""><a><img src="/public/img/mobile/base/go-top.jpg" alt=""></a></li>
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
            if ("全部" != value_city)$(".city .text").text(value_city);
            if ("全部" != value_type)$(".type .text").text(value_type);
            if ("全部" != value_sales)$(".sales .text").text(value_sales);

            $(".search .input .butn").click(function () {
                var city = $(".city  select").val();
                (city == "全部") ? city = "" : city;
                var type = $(".type  select").val();
                (type === "全部") ? type = "" : type;
                var sales = $(".sales  select").val();
                (sales === "全部") ? sales = "" : sales;
                var keyword = $(".search .input input").val();
                var data = {
                    city_id: city,
                    type: type,
                    is_sales: sales,
                    keyword: keyword,
                };

                if ("请输入楼盘名称或关键词" == data.keyword) {
                    data.keyword = "";
                }
                var url = "/business/estatelists?level_id=1000000128&" + "city_id=" + data.city_id + "&" + "type=" + data.type + "&" + "is_sales=" + data.is_sales + "&" + "keyword=" + data.keyword;
                location.href = url;
            })
        })
    </script>
</block>