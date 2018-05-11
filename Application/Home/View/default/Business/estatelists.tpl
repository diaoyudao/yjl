<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/business/business_home_list.css">
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public/js/lib/page.js"></script>
</block>
<block name="title">地产搜索-雅居乐集团</block>
<block name="body_main">
    <div class="section1">
        <div class="banner" id="slider1">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide swiper-no-swiping">
                        <img src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                             simplified_image="{$head_images[0]['image_url1']}" alt="" >
                    </div>
                </div>
            </div>
            <span class="prev arrow-left"><img src="/public/img/home/common/btn_prev.png" alt=""></span>
            <span class="next arrow-right"><img src="/public/img/home/common/btn_next.png" alt=""></span>
        </div>


    </div>
    <div class="section2">
        <div class="content container">
            <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a href="/business/index?level_id=1000000125">多元业务</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span>地产</span></p>
            <h2>地产搜索</h2>

            <div class="search">
                <div class="box">
                    <div class="input">
                        <input type="text" placeholder="请输入楼盘名称或关键词" style="text-align: center;"><span class="btn">查询</span>
                    </div>

                    <ul class="city">
                        <li class="fir">城市:</li>
                        <li><a id="">全部</a></li>

                        <volist name="estate_city" id="item">
                            <li><a id="{$item.type_id}">{$item.name}</a></li>
                        </volist>
                    </ul>
                    <ul class="state">
                        <li class="fir">业态:</li>
                        <li><a id="">全部</a></li>
                        <volist name="format" id="item">
                            <li><a id="{$item.name}">{$item.name}</a></li>
                        </volist>
                    </ul>
                    <ul class="sales">
                        <li class="fir">售卖:</li>
                        <li><a id="">全部</a></li>
                        <li><a id="1">在售</a></li>
                        <li><a id="0">售罄</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="section3">
        <div class="container">
            <ul class="items">

                <volist name="estates" id="item">
                    <li>
                        <a href="/business/estatedetail?land_id={$item.land_id}">
                            <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                 simplified_image="{$item.image_url1}" alt="">
                            <div class="box">
                                <span>{$item.name}</span>
                                <p>业态: <php>echo str_replace(',',' ',$item['type'])</php></p>
                                <p>售卖:
                                    <if condition="$item.is_sales eq 0">售罄
                                        <else/>
                                        在售
                                    </if>
                                </p>
                                <p style="height: 42px;overflow: hidden;">地址: {$item.address}</p>
                                <notempty name="item.tel">
                                    <p>销售热线: {$item.tel}</p>
                                </notempty>
                            </div>
                        </a>
                    </li>
                </volist>
                <div class="clear"></div>
            </ul>


            <div class="btn-list">
                <div class="box">
                    <ul>
                        <!--<li class="active">1</li>-->
                        <!--<li>2</li>-->
                        <!--<li class="active">3</li>-->
                        <!--<li>4</li>-->
                        <!--<li>5</li>-->
                    </ul>
                    <span class="prev"><img src="/public/img/home/common/btn_prev1.png" alt=""></span>
                    <span class="next"><img src="/public/img/home/common/btn_next1.png" alt=""></span>
                </div>


            </div>
        </div>
    </div>

    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box">400-698-3383</div>
            </li>
            <!--<li><a href=""><img src="/public/img/home/business/estate/detail/estate_icon2.png" alt=""></a>-->
            <!--</li>-->
            <!--<li><a href=""><img src="/public/img/home/business/estate/detail/estate_icon3.png" alt=""></a>-->
            <!--</li>-->
            <li class="side-xin"><img src="/public/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public/img/home/common/two_code.png" alt="" width="130">
                </div>
            </li>
            <li class=""><a onclick="history.go(-1);"><img src="/public/img/home/business/estate/detail/estate_icon7.png" alt=""></a></li>
            <li class="last"><a><img src="/public/img/home/business/estate/detail/estate_icon5.png" alt=""></a></li>
        </ul>
    </div>
</block>


<block name="footer_js">
    <script>

        $(function () {
            SideList.top(600);
            SideList.tel();
            SideList.xin();
            var page = 1;
            var total = JSON.parse('<php>echo json_encode($total)</php>');
            $(".header .nav li").eq(2).addClass("active").siblings().removeClass("active");
            $(".section3 .items li:nth-child(3n-2)").addClass("fir");

//            获取初始数据
            var init = JSON.parse('<php>echo json_encode($parameter)</php>');
            var data = {
                city_id: init.city_id,
                type: init.type,
                is_sales: init.is_sales,
                keyword: init.keyword,
                pg: "",
            }
            $(".search .input input").val(data.keyword);
            if(init.city_id){
                $('#'+init.city_id).parent().addClass('bold');
            }
            if (init.type) {
                $('#' + init.type).parent().addClass('bold');
            }
            if (init.is_sales) {
                $('#' + init.is_sales).parent().addClass('bold');
            }

            clickLi(page, total);

            $(".search .box a").click(function () {
                data.keyword = $(".search .input input").val();
                page=data.pg=1;
                type = $(this).parents("ul").get(0).className;
                switch (type) {
                    case "city":
                        data.city_id = $(this).attr("id");
                        break;
                    case "state":
                        data.type = $(this).attr("id");
                        break;
                    case "sales":
                        data.is_sales = $(this).attr("id");
                        break;
                }
                if("请输入楼盘名称或关键词"==data.keyword){
                    data.keyword="";
                }
                ajaxPage()
            })


            $(".search .btn").click(function () {
                var keyword = $(".search .input input").val();
                data.keyword = keyword;
                if("请输入楼盘名称或关键词"==data.keyword){
                    data.keyword="";
                }
                ajaxPage()
            })

            if($('#slider1 .swiper-slide').length!=1) {
                var mySwiper1 = $('#slider1 .swiper-container').swiper({
                    loop: true,
                    noSwiping: false,
                    noSwiping: true,
//                loop: true,
                    autoplay: 5000,
                    speed: 300,
//                pagination: '#bannerpagination',
//                paginationClickable: true,
//                grabCursor: true,
//                parallax: true,
                    //其他设置
                });
            }else {
                NoSwiper.bind("slider1");
            }
            $('#slider1 .prev').click(function () {
                mySwiper1.swipePrev();
            })
            $('#slider1 .next').click(function () {
                mySwiper1.swipeNext();
            })

            $('.search .box ul li').click(function () {
                $(this).siblings().removeClass('bold');
                $(this).addClass('bold');

            })


            function clickLi(index, total) {
                $(".section3 .btn-list .box ul").html(showPages(index, total));
                $(".section3 .btn-list li").click(function () {
                    page = data.pg = parseInt($(this).text());
                    ajaxPage();
                })
            }


            $(".section3 .btn-list .next").click(function () {
                if (page >= total) {
                    return
                }
                page = data.pg = page + 1;
                ajaxPage()
            })

            $(".section3 .btn-list .prev").click(function () {
                if (page <= 1) {
                    return
                }
                page = data.pg = page - 1;
                ajaxPage()
            })


            function ajaxPage() {
                K.doAjax(data, window.document.location.href, function (res) {
                    total=res.total;
                    if (res.status && res.status == 'ok') {
                        var ul = $(".section3 .items");
                        ul.text("");
                        if(res.item==null){
                            $(".section3 .btn-list .box ul").html("");
                            return;
                        }
                        for (var i = 0; i < res.item.length; i++) {
                            var li = $("<li></li>");
                            var a = $("<a href='/business/estatedetail?land_id="+res.item[i].land_id+"'></a>").appendTo(li);
                            var img = $("<img src='"+res.item[i].image_url1+"' traditional_image='" + res.item[i].image_url2 + "'" +
                                    " simplified_image = '" + res.item[i].image_url1 + "' />").appendTo(a);
                            var box = $("<div class='box'></div>").appendTo(a);
                            var span = $("<span></span>").text(res.item[i].name).appendTo(box);
                            var status = $("<p></p>").text("业态: " + res.item[i].type.replace(/,/g,' ')).appendTo(box);
                            var sales;
                            (res.item[i].is_sales == 1) ? sales = "在售" : sales = "售罄";
                            $("<p></p>").text("售卖: " + sales).appendTo(box)
                            var address = $("<p style='height:42px;overflow: hidden;'></p>").text("地址: " + res.item[i].address).appendTo(box);
                            if(res.item[i].tel)var phone = $("<p></p>").text("销售热线: " + res.item[i].tel).appendTo(box);
                            li.appendTo(ul);
                        }
                        gradeChangeNew()
                        ul.append($("<div class='clear'></div>"));
                        clickLi(page, res.total);
                        $(".section3 .items li:nth-child(3n-2)").addClass("fir");
                    } else {
//                        获取失败
                    }
                });
            }

        })

    </script>
</block>