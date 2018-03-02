<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/business/easte_detail.css">

</block>
<block name="head_common2">
    <script type="text/javascript" src="/public_en/hui3/lib/jcarousellite.min.js"></script>

</block>
<block name="title">{$estate[0].name}-Agile Group</block>
<block name="head_menu">
    <a class="tip" href="#">{$estate[0].name}/</a>
</block>
<block name="body_main">
    <div class="">
        <img src="{$mobile_head_images[0]['image_url1']}" traditional_image="{$mobile_head_images[0]['image_url2']}"
             simplified_image="{$mobile_head_images[0]['image_url1']}" alt="" class="tags-img">
    </div>

    <div class="container mt-20">
        <h2 class="title-color main-title txt-center ">{$estate[0].name}</h2>

        <div class="content mt-20">
            {$estate[0].note}
        </div>


        <div class="box">
            <div class="container mt-10 mb-10">
                <div class="left" style="width: 30%">
                    <img src="{$code_images[0]['image_url1']}"
                         traditional_image="{$code_images[0]['image_url2']}"
                         simplified_image="{$code_images[0]['image_url1']}" class="tags-img mt-5"></div>
                <div class="right" style="width: 60%">
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
                <div class="cl"></div>
            </div>
        </div>


    </div>

    <div class="bgc-ef mt-20 container ">
        <ul class="tabs pt-20">
            <li class="active">户型图</li>
            <li class="">规划图</li>
            <li class="">实景图</li>
        </ul>
        <div class="mt-20 pb-20" id="pic">
            <div class="rollpic  txt-center ">
                <a href="javascript:void(0)" class="prev"></a>
                <div class="rollpicshow txt-center ">
                    <ul>
                        <volist name="room_images" id="item">
                            <li><img src="{$item.image_url1}"
                                     traditional_image="{$item.image_url2}"
                                     simplified_image="{$item.image_url1}" alt="" onclick="showImage(this)">
                            </li>

                        </volist>
                    </ul>
                </div>
                <a href="javascript:void(0)" class="next"></a>
            </div>

            <div class="rollpic  txt-center ">
                <a href="javascript:void(0)" class="prev"></a>
                <div class="rollpicshow txt-center">
                    <ul>
                        <volist name="plan_images" id="item">
                            <li><img src="{$item.image_url1}"
                                     traditional_image="{$item.image_url2}"
                                     simplified_image="{$item.image_url1}" alt="" onclick="showImage(this)">

                            </li>

                        </volist>
                    </ul>
                </div>
                <a href="javascript:void(0)" class="next"></a>
            </div>


            <div class="rollpic  txt-center">
                <a href="javascript:void(0)" class="prev"></a>
                <div class="rollpicshow txt-center">
                    <ul>
                        <volist name="real_images" id="item">
                            <li><img src="{$item.image_url1}"
                                     traditional_image="{$item.image_url2}"
                                     simplified_image="{$item.image_url1}" alt="" onclick="showImage(this)">

                            </li>

                        </volist>
                    </ul>
                </div>
                <a href="javascript:void(0)" class="next"></a>
            </div>
        </div>


        <div class="clear pt-20"></div>

    </div>
    <div class="mt-20 container pb-20">
        <h2 class="title-color main-title txt-center">楼盘地图周边</h2>
        <div class="mt-20">
            <a href="/en/business/landmapsearch?x={$estate[0]['positon_x']}&y={$estate[0]['positon_y']}&name={$estate[0].name}">
                <img src="/public_en/img/mobile/business/easte/eastedetail/map-search.png" class="tags-img">
            </a>
        </div>
    </div>
    <div class="pt-20 pb-20 bgc-ef" id="sales">
        <h2 class="title-color main-title txt-center">Hot Sales</h2>
        <div id="sales" class="rollpic  txt-center mt-20">
            <a href="javascript:void(0)" class="prev"></a>
            <div class="rollpicshow txt-center">
                <ul>
                    <volist name="sales" id="item">
                        <li>
                            <a href="/en/business/estatedetail?land_id={$item.land_id}">
                                <img src="{$item.image_url1}"
                                     traditional_image="{$item.image_url2}"
                                     simplified_image="{$item.image_url1}" alt="">
                            </a>
                        </li>

                    </volist>
                </ul>
            </div>
            <a href="javascript:void(0)" class="next"></a>
        </div>
        <div class="clear"></div>
    </div>

    <div class="modal fade" id="modal-source-image">
        <div class="modal-dialog" style="width:96%;">
            <div class="modal-content" style="background-color: #666;text-align: center;">
                <div class="" style="height:30px;line-height:30px;width:100%;">
                    <button type="button" data-dismiss="modal" class="close" style="margin-left:93%;color:#fff;">
                        <span class="Hui-iconfont" style="font-size:20px;">&#xe6a6;</span>
                    </button>
                </div>
                <div class="modal-body" style="padding-top:0px;">
                    <img id="modal-img" src="/datas/image/source/357dfb7fe7aac560f31421551421c20d.jpg"
                         class="tags-img"/>
                </div>
            </div>
        </div>
    </div>
</block>

<block name="body_side">
    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public_en/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box"><a href="tel://{$estate[0].tel}">{$estate[0].tel}</a></div>
            </li>
            <li class="side-xin"><img src="/public_en/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="{$code_images[0]['image_url1']}"
                         traditional_image="{$code_images[0]['image_url2']}"
                         simplified_image="{$code_images[0]['image_url1']}" alt="">
                </div>
            </li>
            <li class=""><a><img src="/public_en/img/mobile/base/go-top.jpg" alt=""></a></li>
        </ul>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {


            $(' #pic .rollpic:eq(0) .rollpicshow').jCarouselLite({
                auto: 5000, /*自动播放间隔时间*/
                speed: 1000, /*速度*/
                btnNext: "#pic .next", /*向前滚动*/
                btnPrev: "#pic .prev", /*向后滚动*/
                visible: 2, /*显示数量*/
            });
            $(' #pic .rollpic:eq(1) .rollpicshow').jCarouselLite({
                auto: 5000, /*自动播放间隔时间*/
                speed: 1000, /*速度*/
                btnNext: "#pic .next", /*向前滚动*/
                btnPrev: "#pic .prev", /*向后滚动*/
                visible: 2, /*显示数量*/
            });
            $(' #pic .rollpic:eq(2) .rollpicshow').jCarouselLite({
                auto: 5000, /*自动播放间隔时间*/
                speed: 1000, /*速度*/
                btnNext: "#pic .next", /*向前滚动*/
                btnPrev: "#pic .prev", /*向后滚动*/
                visible: 2, /*显示数量*/
            });
            $(' #pic .rollpic:eq(1)').hide();
            $(' #pic .rollpic:eq(2)').hide();
            $(' #sales .rollpic .rollpicshow').jCarouselLite({
                auto: 8000, /*自动播放间隔时间*/
                speed: 1000, /*速度*/
                btnNext: "#sales .next", /*向前滚动*/
                btnPrev: "#sales .prev", /*向后滚动*/
                visible: 2, /*显示数量*/
            });

            $('.tabs li').click(function () {
                $(this).addClass("active").siblings().removeClass("active");
                var index = $(this).index();
                $(' #pic .rollpic').eq(index).show().siblings().hide();
            });

        });
        function showImage(img) {
            var temp = img.src;
            if (!temp) {
                return;
            }
            $('#modal-img').attr('src', temp);

//            var height = $(window).height();
            height = 100;
            width = 2;
            $('#modal-source-image .modal-dialog').css('margin-top', height + 'px');
            $('#modal-source-image .modal-dialog').css('margin-left', width + '%');
            $('#modal-source-image .modal-dialog').css('margin-right', width + '%');
            $('#modal-source-image').modal({keyboard: true});
        }


    </script>
</block>