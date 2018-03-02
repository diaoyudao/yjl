<extend name="./Application/Homeen/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/business/business_hotel_list.css">
</block>
<block name="head_common2">
    <script src="/public_en/js/lib/page.js"></script>
</block>
<block name="title">Hotel Search-Agile Group</block>

<block name="body_main">
    <div id="hotel-list">
        <div class="section1">
            <div class="content container">
                <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                                href="/en/business/index?level_id=1000000125">Diversification of Business</a></span>&nbsp;&nbsp;
                    > &nbsp;&nbsp;<span>Hotel Operations</span></p>
                <h2>Hotel Search</h2>

                <div class="search">
                    <div class="input">
                        <input type="text" placeholder="Please type the name of hotel or relevant keywords" style="text-align: center;"><span
                                class="btn">Search</span>
                    </div>

                    <ul class="city">
                        <li class="fir">City:</li>
                        <li><a>All</a></li>
                        <volist name="hotel_city" id="item">
                            <li><a id="{$item.type_id}">{$item.name}</a></li>
                        </volist>
                    </ul>
                </div>
            </div>
        </div>

        <div class="section2">
            <div class="container">
                <ul class="items">
                    <volist name="hotels" id="item">
                        <li>
                            <a href="/en/business/hoteldetail?land_id={$item.land_id}">
                                <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                     simplified_image="{$item.image_url1}" alt="">
                                <div class="box">
                                    <span>{$item.name}</span>
                                    <p>{$item.desc}</p>
                                    <div class="more">
                                        Details
                                        <span class="icon">
                                        </span>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </volist>

                    <div class="clear"></div>
                </ul>


                <div class="btn-list">
                    <div class="box">
                        <ul>

                        </ul>
                        <span class="prev"><img src="/public_en/img/home/common/btn_prev1.png" alt=""></span>
                        <span class="next"><img src="/public_en/img/home/common/btn_next1.png" alt=""></span>
                    </div>
                </div>


                <div class="side-list">
                    <ul>
                        <!--
                            <li class="side-tel">
                                <img src="/public_en/img/home/business/estate/detail/estate_icon1.png" alt="">
                                <div class="tel-box">020-88839888</div>
                            </li>
                            <!--<li><a href=""><img src="/public_en/img/home/business/estate/detail/estate_icon2.png" alt=""></a>-->
                        <!--</li>-->
                        <!--<li><a href=""><img src="/public_en/img/home/business/estate/detail/estate_icon3.png" alt=""></a>-->
                        <!--</li>-->
                        <li class="side-xin"><img src="/public_en/img/home/business/estate/detail/estate_icon4.png" alt="">
                            <div class="xin-box">
                                <div class="box-head"></div>
                                <img src="/public_en/img/home/business/hotel/two-code-hotel.jpg" alt="" width="130">
                            </div>
                        </li>
                        <li class=""><a onclick="history.go(-1);"><img
                                        src="/public_en/img/home/business/estate/detail/estate_icon7.png" alt=""></a></li>
                        <li class="last"><a><img src="/public_en/img/home/business/estate/detail/estate_icon5.png" alt=""></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(2).addClass("active").siblings().removeClass("active");
            SideList.top(335);
            SideList.tel();
            SideList.xin();
            $(".section2 .items li:nth-child(3n-2)").addClass("fir");
            var page = 1;
            var total = JSON.parse('<php>echo json_encode($total)</php>');
            var init = JSON.parse('<php>echo json_encode($parameter)</php>');
            var data = {
                keyword: init.keyword,
                city_id: "",
                pg: "",
            }
            $(".search .input input").val(data.keyword);


            clickLi(page, total);

            $(".search .city a").click(function () {
                data.city_id = $(this).attr("id");
                page = data.pg = 1;
                ajaxPage()
            })
            $('.search  ul li').click(function () {
                $(this).siblings().removeClass('bold');
                $(this).addClass('bold');

            })
            function ajaxPage() {

                K.doAjax(data, window.document.location.href, function (res) {
                    if (res.status && res.status == 'ok') {
                        total = res.total;
                        var ul = $(".section2 .items");
                        ul.text("");
                        if (res.item == null) {
                            $(".section2 .btn-list .box ul").html("");
                            return;
                        }
                        for (var i = 0; i < res.item.length; i++) {
                            var li = $("<li></li>");
                            var a = $("<a href='/en/business/hoteldetail?land_id="+res.item[i].land_id+"'></a>").appendTo(li);
                            var img = $("<img src='" + res.item[i].image_url1 + "' traditional_image='" + res.item[i].image_url2 + "'" +
                                    " simplified_image = '" + res.item[i].image_url1 + "' />").appendTo(a);
                            var box = $("<div class='box'></div>").appendTo(a);
                            var span = $("<span></span>").text(res.item[i].name).appendTo(box);
                            var p = $("<p></p>").text(res.item[i].desc).appendTo(box);
                            var more = $("<div class='more'>Details<span class='icon'></span></div>").appendTo(box)
                            li.appendTo(ul);
                        }

                        ul.append($("<div class='clear'></div>"));

//                    href:"/business/hoteldetail?land_id="+res.item[i].land_id
                        clickLi(page, res.total);
                        $(".section2 .items li:nth-child(3n-2)").addClass("fir");
                    } else {
                    }
                });
            }


            function clickLi(index, total) {
                $(".section2 .btn-list .box ul").html(showPages(index, total));
                $(".section2 .btn-list li").click(function () {
                    page = data.pg = parseInt($(this).text());

                    ajaxPage();
                })
            }

            $(".section2 .btn-list .next").click(function () {
                if (page >= total) {
                    return
                }
                page = data.pg = page + 1;
                ajaxPage()
            })

            $(".section2 .btn-list .prev").click(function () {
                if (page <= 1) {
                    return
                }
                page = data.pg = page - 1;
                ajaxPage()
            })

            $(".search .btn").click(function () {
                var keyword = $(".search .input input").val();
                data.keyword = keyword;
                ajaxPage()
            })
        })
    </script>
</block>