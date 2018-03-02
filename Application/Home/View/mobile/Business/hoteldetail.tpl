<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/business/hotel_detail.css">
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public/hui3/lib/jcarousellite.min.js"></script>

</block>
<block name="title">{$hotel[0].name}-雅居乐集团</block>
<block name="head_menu">
    <a class="tip" href="#">{$hotel[0].name}/</a>
</block>
<block name="body_main">

    <div class="">
        <img src="{$mobile_head_images[0]['image_url1']}" traditional_image="{$mobile_head_images[0]['image_url2']}"
             simplified_image="{$mobile_head_images[0]['image_url1']}" alt="" class="tags-img">
    </div>

    <div class="container mt-20">
        <h2 class="title-color main-title txt-center ">{$hotel[0].name}</h2>

        <div class="content mt-20">
            {$hotel[0].note}
        </div>


        <div class="box">
            <div class="container mt-10 mb-10">
                <div class="left" style="width: 30%">
                    <img src="{$code_images[0]['image_url1']}"
                         traditional_image="{$code_images[0]['image_url2']}"
                         simplified_image="{$code_images[0]['image_url1']}" class="tags-img mt-5"></div>
                <div class="right" style="width: 60%">
                    <p>所在城市：{$hotel[0].city_name}</p>
                    <p>属性：{$property[0].property_name}</p>
                    <p class="">地址：{$hotel[0].address}</p>

                    <p>
                        <span class="">{$hotel[0].tel}</span>
                    </p>

                </div>
                <div class="cl"></div>
            </div>
        </div>


    </div>
    <div class="bgc-ef mt-20 container ">
        <ul class="tabs pt-20">
            <li class="active">房间图</li>
            <li class="">外景图</li>
            <li class="">内景图</li>
        </ul>
        <div class=" row cl mt-20 pb-20">

            <div id="scroll1" class="rollpic cl txt-center ">
                <a href="javascript:void(0)" class="prev"></a>
                <div class="rollpicshow  txt-center">
                    <ul class="">
                        <volist name="room_images" id="item">
                            <li><img src="{$item.image_url1}"
                                     traditional_image="{$item.image_url2}"
                                     simplified_image="{$item.image_url1}" alt="" onclick="showImage(this)">
                                <div class="txt">
                                    <p class=" txt-center">{$item.name}</p>

                                </div>
                            </li>

                        </volist>
                    </ul>
                </div>

                <a href="javascript:void(0)" class="next"></a>
            </div>
            <div id="scroll2" class=" rollpic cl  txt-center  ">
                <a href="javascript:void(0)" class="prev"></a>
                <div class="rollpicshow   txt-center">
                    <ul class="">
                        <volist name="location_images" id="item">
                            <li><img src="{$item.image_url1}"
                                     traditional_image="{$item.image_url2}"
                                     simplified_image="{$item.image_url1}" alt="" onclick="showImage(this)">
                                <div class="txt">
                                    <p class=" txt-center">{$item.name}</p>

                                </div>
                            </li>

                        </volist>
                    </ul>
                </div>

                <a href="javascript:void(0)" class="next"></a>
            </div>

            <div id="scroll3" class=" rollpic cl txt-center ">
                <a href="javascript:void(0)" class="prev"></a>
                <div class="rollpicshow   txt-center">
                    <ul class="">
                        <volist name="interior_images" id="item">
                            <li><img src="{$item.image_url1}"
                                     traditional_image="{$item.image_url2}"
                                     simplified_image="{$item.image_url1}" alt="" onclick="showImage(this)">
                                <div class="txt">
                                    <p class=" txt-center">{$item.name}</p>

                                </div>
                            </li>

                        </volist>
                    </ul>
                </div>
                <a href="javascript:void(0)" class="next"></a>
            </div>

        </div>


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
                <img src="/public/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box"><a href="tel://{$hotel[0].tel}">{$hotel[0].tel}</a></div>
            </li>
            <li class="side-xin"><img src="/public/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="{$code_images[0]['image_url1']}"
                         traditional_image="{$code_images[0]['image_url2']}"
                         simplified_image="{$code_images[0]['image_url1']}" alt="">
                </div>
            </li>
            <li class=""><a><img src="/public/img/mobile/base/go-top.jpg" alt=""></a></li>
        </ul>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {

            $('#scroll1 .rollpicshow').jCarouselLite({
                auto: 5000, /*自动播放间隔时间*/
                speed: 1000, /*速度*/
                btnNext: ".next", /*向前滚动*/
                btnPrev: ".prev", /*向后滚动*/
                visible: 2, /*显示数量*/
                scroll: 2,
            });
            $('#scroll2 .rollpicshow').jCarouselLite({
                auto: 5000, /*自动播放间隔时间*/
                speed: 1000, /*速度*/
                btnNext: ".next", /*向前滚动*/
                btnPrev: ".prev", /*向后滚动*/
                visible: 2, /*显示数量*/
            });
            $('#scroll3 .rollpicshow').jCarouselLite({
                auto: 5000, /*自动播放间隔时间*/
                speed: 1000, /*速度*/
                btnNext: ".next", /*向前滚动*/
                btnPrev: ".prev", /*向后滚动*/
                visible: 2, /*显示数量*/
            });
            $('#scroll2').hide();
            $('#scroll3').hide();
        });
        $('.tabs li').click(function () {
            $(this).addClass("active").siblings().removeClass("active");
            var index = $(this).index();

            $('.rollpic').eq(index).show().siblings().hide();


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