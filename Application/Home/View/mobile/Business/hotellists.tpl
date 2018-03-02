<extend name="./Application/Home/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/business/hotel_list.css">
    <link rel="stylesheet" href="/public/css/mobile/news/news-group.css">
</block>
<block name="head_common2">
    <script src="/public/js/lib/page.js"></script>
</block>
<block name="title">酒店查询-雅居乐集团</block>
<block name="head_menu">
    <a class="tip" href="#">酒店查询/</a>
</block>
<block name="body_main">

    <div class="  container bgc-ef pt-20 pb-20">

        <h2 class="main-title title-color txt-center">酒店查询</h2>

        <div class="search ">
            <div class="input mt-20 text-center ">
                <input type="text" placeholder="请输入酒店名称或关键词" style="text-align: center;"><span class="butn txt-center">查询</span>
            </div>

            <ul class="city mt-20">
                <li class="title-color">城市:</li>
                <li><span>全部</span></li>
                <volist name="hotel_city" id="item">
                    <li id="{$item.type_id}"><span>{$item.name}</span></li>
                </volist>
            </ul>
        </div>
        <div class="content">
            <div class="option-content active">
                <ul>
                    <volist name="hotels" id="item">
                        <a href="/business/hoteldetail?land_id={$item.land_id}">
                            <li>
                                <div class="box pt-20 pb-20">
                                    <if condition=" 1 == $item['web_stick']"><img class="icon"
                                                                                  src="/public/img/home/news/news-icon_03.png">
                                    </if>
                                    <notempty name="item.image_url1"><img class="content-img" src="{$item.image_url1}"
                                                                          traditional_image="{$item.image_url2}"
                                                                          simplified_image="{$item.image_url1}" alt="">
                                    </notempty>
                                    <span class="new-title">{$item.name}</span>
                   <span class="new-content">
                        <php>
                            $leng=mb_strlen($item['desc'],'utf-8');
                            echo ($leng>23)?mb_substr($item['desc'], 0, 23,'utf-8').'...':$item['desc'];
                        </php>
                   </span>
                                </div>
                            </li>
                        </a>
                    </volist>
                </ul>
            </div>

            <a class="fff" id="much" onclick="show_more()">
                <div class="row cl mt-20 main-btn">查看更多</div>
            </a>

        </div>
    </div>

</block>

<block name="body_side">
    <div class="side-list">
        <ul>

            <li class="side-xin"><img src="/public/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public/img/home/business/hotel/two-code-hotel.jpg" alt="" >
                </div>
            </li>
            <li class=""><a><img src="/public/img/mobile/base/go-top.jpg" alt=""></a></li>
        </ul>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {
            total_pages = '{$total_pages}';

            if (2 < total_pages) {
                $('#much').hide();
            }

            $(".search .input .butn").click(function () {
                $('.option-content ul').empty();
                data.keyword = $(".search .input input").val();
                data.pg = 0;
                $('#much').show();
                show_more();
            });
            $(".search .city li").click(function () {

                $('.option-content ul').empty();
                data.city_id = $(this).attr("id");
                data.pg = 0;
                $('#much').show();
                show_more();
            });
        });


        var init = '{$parameter.keyword}';
        $(".search .input input").val(init);

        var total_pages = 1;
        var data = {
            keyword: init,
            city_id: "",
            pg: 1,
        };


        $('.search  ul li').click(function () {
            $(this).siblings().removeClass('bold');
            $(this).addClass('bold');

        })

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
                var temp_str = '<a href="/news/detail?id=' + res.item[i].notice_id + '">';
                temp_str += '<li><div class="box pt-10 pb-10">';
                if (1 == res.item[i].web_stick) {
                    temp_str += '<img class="icon" src="/public/img/home/news/news-icon_03.png">';
                }
                if ("" != res.item[i].image_url1) {
                    temp_str += '<img class="content-img" src="' + res.item[i].image_url1 + '" traditional_image="' + res.item[i].image_url2 + '" simplified_image="' + res.item[i].image_url1 + '">';
                }
                temp_str += ' <span class="new-title">' + res.item[i].name + '</span>';

                var temp_desc = res.item[i].desc;
                if (23 < res.item[i].desc.length) {
                    temp_desc = res.item[i].desc.substring(0, 23) + "...";
                }

                temp_str += '<span class="new-content">' + temp_desc + '</span>';
                temp_str += '</div></li></a>';

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

                gradeChangeNew()

                loading_hide();
            }, function (err) {
                console.log('post error');
                loading_hide();
            });
        }
    </script>
</block>