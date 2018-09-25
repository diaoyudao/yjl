<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/business/index.css">
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public/hui3/lib/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>
</block>
<block name="title">多元业务-雅居乐集团</block>

<block name="body_main">
    <div class="row">
        <div id="slider-3">
            <div class="slider">
                <div class="bd">
                    <ul>
                        <volist name="mobile_head_images" id="item" offset="0" length="2">
                        <li><a href="/business/estate?level_id=1000000128" ><img class="banner-img" src="{$item.image_url1}" traditional_image="{$item.image_url2}" simplified_image="{$item.image_url1}" ></a></li>                        
                    </volist>
                    </ul>
                </div>
                <ol class="hd cl">
                    <li class="land-house">
                        <div class="land me-hidden"><img src="/public/img/home/business/index/index_btn1.png"></div>
                        <div class="land-active "><img class="left" src="/public/img/home/business/index/btn_icon1.png"><span>住宅地产</span><div class="clear"></div></div>
                    </li>
                    <li class="land-house">
                        <div class="land "><img src="/public/img/home/business/index/index_btn2.png"></div>
                        <div class="land-active me-hidden"><img class="left" src="/public/img/home/business/index/btn_icon2.png"><span>商业地产</span><div class="clear"></div></div>
                    </li>
                </ol>
            </div>
        </div>
    </div>
    <div class="row list-bg pt-10">
        <div class="row txt-center mt-20"><span class="main-title c-white">雅生活</span></div>
        <ol class="container life-list cl">
           <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Service/index/type/5#point"><li><div class="lift-btn oper"><img src="/public/img/home/business/index/index_icon1.png"><div class="row f-7 txt-center main-color">物业</div></li></a>
           <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/1" ><li><div class="lift-btn oper"><img src="/public/img/home/business/index/index_icon2.png"><div class="row f-7 txt-center main-color">智慧园区</div></li></a>
           <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/2"><li><div class="lift-btn oper"><img src="/public/img/home/business/index/index_icon5.png"><div class="row f-7 txt-center main-color">旅游</div></li></a>
             <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/3"><li><div class="lift-btn oper"><img src="/public/img/home/business/index/index_icon8.png"><div class="row f-7 txt-center main-color">广告</div></li></a>
             <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/5"><li><div class="lift-btn oper"><img src="/public/img/home/business/index/index_icon3.png"><div class="row f-7 txt-center main-color">验房</div></li></a>
             <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/4"><li><div class="lift-btn "><img src="/public/img/home/business/index/index_icon9.png"><div class="row f-7 txt-center main-color">营销</div></li></a>
        </ol>
    </div>    
    <div class="row ">
        <img class="img-responsive" src="{$mobile_education_images[0]['image_url1']}" traditional_image="">
        <a href="/business/education?level_id=1000000133"><div class="btn-more main-btn-s">了解更多</div></a>
    </div>
    <div class="row ">
        <img class="img-responsive" src="{$mobile_build_images[0].image_url1}" traditional_image="{$mobile_build_images[0].image_url2}" simplified_image="{$mobile_build_images[0].image_url1}">
        <a href="http://www.agilebuild.com.cn" target="_blank"><div class="btn-more main-btn-s">了解更多</div>   </a>
    </div>
    <div class="row ">
        <img class="img-responsive" src="{$mobile_environment_images[0].image_url1}" traditional_image="{$mobile_environment_images[0].image_url2}" simplified_image="{$mobile_environment_images[0].image_url1}">
        <a href="/business/environment?level_id=1000000132"><div class="btn-more main-btn-s">了解更多</div></a>
    </div>
    <div class="row ">
        <img class="img-responsive" src="{$mobile_hotel_images[0].image_url1}" traditional_image="{$mobile_hotel_images[0].image_url2}" simplified_image="{$mobile_hotel_images[0].image_url1}">
        <a href="/business/hotel?level_id=1000000131"><div class="btn-more main-btn-s">了解更多</div></a>
    </div>
    <div class="row ">
        <img class="img-responsive" src="{$mobile_agency_images[0].image_url1}" traditional_image="{$mobile_agency_images[0].image_url2}" simplified_image="{$mobile_agency_images[0].image_url1}">
        <a href="javascript:;" ><div class="btn-more main-btn-s aler">了解更多</div>   </a>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function() {
            $("#slider-3 .slider").slide({mainCell:".bd ul",titCell:".hd li",trigger:"click",effect:"leftLoop",autoPlay:false,delayTime:700,interTime:5000,pnLoop:false,titOnClassName:"active"});


            $('.land-house').click(function(){
                var me = $(this);
                me.find('.land-active').show();
                me.find('.land').hide();

                me.siblings().find('.land').show();
                me.siblings().find('.land-active').hide();
            });

            var image_life = "url({$mobile_life_images[0]['image_url1']})";
            $('.list-bg').css('background-image', image_life);

        });
    </script>
</block>