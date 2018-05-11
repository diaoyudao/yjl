<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/news/news-group.css">
    <link rel="stylesheet" href="/public_en/css/mobile/business/easte_list.css">
</block>
<block name="head_common2">
    <script src="/public_en/js/lib/page.js"></script>
</block>
<block name="title">Search Property-Agile Group</block>
<block name="head_menu">
    <a class="tip" href="#">Search Property/</a>
</block>
<block name="body_main">

    <div class="  container bgc-ef pt-20 pb-20">

        <h2 class="main-title title-color txt-center">Search for Property</h2>

        <div class="search ">
            <div class="input mt-20 text-center ">
                <input type="text" placeholder="Please type the property name" style="text-align: center;"><span class="butn txt-center">Search</span>
            </div>
            <div class="mt-20">
                <ul class="city">
                    <li class="title-color">City:</li>
                    <li><span>All</span></li>
                    <volist name="estate_city" id="item">
                        <li id="{$item.type_id}"><span>{$item.name}</span></li>
                    </volist>
                </ul>
                <ul class="state">
                    <li class="">Products:</li>
                    <li id=""><span>All</span></li>
                    <volist name="format" id="item">
                        <li id="{$item.name}"><span>{$item.name}</span></li>
                    </volist>
                </ul>
                <ul class="sales">
                    <li class="">Sales Status:</li>
                    <li id=""><span>All</span></li>
                    <li id="1"><span>Hot sale</span></li>
                    <li id="0"><span>Sold</span></li>
                </ul>
            </div>

        </div>
        <div class="content">
            <div class="option-content active">
                <ul>
                    <volist name="estates" id="item">
                        <!--<a href="/en/business/estatedetail?land_id={$item.land_id}">-->
                            <a onclick='show_expecting()'>
                            <li>
                                <div class="box pt-10 pb-10">
                                    <if condition=" 1 == $item['web_stick']"><img class="icon"
                                                                                  src="/public_en/img/home/news/news-icon_03.png">
                                    </if>
                                    <notempty name="item.image_url1"><img class="content-img" src="{$item.image_url1}"
                                                                          traditional_image="{$item.image_url2}"
                                                                          simplified_image="{$item.image_url1}" alt="">
                                    </notempty>
                                    <span class="new-title">{$item.name}</span>
                   <span class="new-content">
                         <p>Products:
                             <php>echo str_replace(',',' ',$item['type'])</php>
                         </p>
                                <p>Sales Status:
                                    <if condition="$item.is_sales eq 0">Sold
                                        <else/>
                                        Hot sale
                                    </if>
                                </p>
                                <p>Address: {$item.address}</p>
                                <notempty name="item.tel">
                                    <p>Sales hotline: {$item.tel}</p>
                                </notempty>
                   </span>
                                </div>
                            </li>
                        </a>
                    </volist>
                </ul>
            </div>

            <a class="fff" id="much" onclick="show_more()">
                <div class="mt-20 main-btn">More</div>
            </a>

        </div>
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
                    <img src="/public_en/img/home/common/two_code.png" alt="" >
                </div>
            </li>
            <li class=""><a><img src="/public_en/img/mobile/base/go-top.jpg" alt=""></a></li>
        </ul>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {
            total_pages = '{$total}';

            if(2 > total_pages) {
                $('#much').hide();
            }

            $(".search .input .butn").click(function () {
                $('.option-content ul').empty();
                data.keyword = $(".search .input input").val();
                data.pg = 0;
                $('#much').show();
                show_more();
            });
            $(".search ul li").click(function () {
                data.pg = 0;
                $('.option-content ul').empty();
                type = $(this).parents("ul").get(0).className;
                $('#much').show();
                switch (type) {
                    case "city":
                        data.city_id = $(this).attr("id");
                        data.keyword = $(".search .input input").val();
                        break;
                    case "state":
                        data.type = $(this).attr("id");
                        data.keyword = $(".search .input input").val();
                        break;
                    case "sales":
                        data.is_sales = $(this).attr("id");
                        data.keyword = $(".search .input input").val();
                        break;
                }
                show_more();
            });
        });

        var total_pages = 1;
        var init = JSON.parse('<php>echo json_encode($parameter)</php>');
        var data = {
            city_id: init.city_id,
            type: init.type,
            is_sales: init.is_sales,
            keyword: init.keyword,
            pg: 1,
        };
        $(".search .input input").val(data.keyword);
        if (init.city_id) {
            $('#' + init.city_id).addClass('bold');
        }
        if (init.type) {
            $('#' + init.type).addClass('bold');
        }
        if (init.is_sales) {
            $('#' + init.is_sales).addClass('bold');
        }
        $('.search  ul li').click(function () {
            $(this).siblings().removeClass('bold');
            $(this).addClass('bold');

        });


        var show_more = function () {
            loading_show();
            data.pg++;
            setTimeout("postData()", 1000);
        };

        var addList = function (res) {
            var initFun = initFun || function (){};  // 如果需要初始请在外围自定义
            initFun();

            if (res.item.length == 0) {
                return;
            }
            for (var i = 0; i < res.item.length; i++) {
//                var temp_str = '<a href="/en/news/detail?id=' + res.item[i].notice_id + '">';
                var temp_str = "<a onclick='show_expecting()'>";
                temp_str += '<li><div class="box pt-10 pb-10">';
                if (1 == res.item[i].web_stick) {
                    temp_str += '<img class="icon" src="/public_en/img/home/news/news-icon_03.png">';
                }
                if ("" != res.item[i].image_url1) {
                    temp_str += '<img class="content-img" src="' + res.item[i].image_url1 + '" traditional_image="' + res.item[i].image_url2 + '" simplified_image="' + res.item[i].image_url1 + '">';
                }
                temp_str += ' <span class="new-title">' + res.item[i].name + '</span>';


                temp_str += '<span class="new-content">';
                temp_str += '<p>Products:' + res.item[i].type.replace(",", " ") + '</p>';
                if (res.item[i].is_sale == 0) {
                    temp_str += '  <p>Sales Status:Sold</p>';
                } else {
                    temp_str += '  <p>Sales Status:Hot sale</p>';
                }
                temp_str += '<p>Address: ' + res.item[i].address + '</p>';
                if (res.item[i].tel)temp_str += '<p>Sales hotline: ' + res.item[i].tel + '</p>';
                temp_str += '</span></div></li></a>';
                $('.option-content ul').append($(temp_str));
            }
        };

        var postData = function () {
            K.doAjax(data, window.document.location.href, function (res) {
                total_pages = res.total;
                addList(res);
                if (null === res.total) {
                    $('#much').hide();
                }
                if (total_pages == data.pg) {
                    $('#much').hide();
                }

                gradeChangeNew();

                loading_hide();
            }, function (err) {
                console.log('post error');
                loading_hide();
            });
        }
    </script>
</block>