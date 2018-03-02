<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/join/join-index.css">
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public/hui3/lib/jcarousellite.min.js"></script>
    <script type="text/javascript" src="/public/hui3/lib/swiper3.4.1/js/swiper.min.js"></script>
</block>
<block name="title">加入雅居乐-雅居乐集团</block>

<block name="body_main">

    <div class="row">  
        <div class="swiper-container" id="banner-swiper">
        <div class="swiper-wrapper">
            <volist name="mobile_head_images" id="item">
                <div class="swiper-slide">
                    <a <notempty name="item.link_url1"> href='{$item.link_url1}'</notempty>
                                ><img class="banner-img" src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                      simplified_image="{$item.image_url1}" alt="">
                    </a>
                </div>

            </volist>
        </div>
        <!-- Add Pagination -->
        <if condition="1 lt count($mobile_head_images)"><div class="swiper-pagination"></div></if>
        <!-- Add Arrows 
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div> 
        -->
        </div>        
    </div>

    <div class=" container mt-20 mb-30">
        <div class="txt-center pic">
            <img class="pic" src="/public/img/mobile/join/index/join-1.jpg">

        </div>
        <div class="pl-5">
            <p class="title">企业使命</p>
            <span class="text">
                本着将心比心的态度经营，务求从细微处了解每个客户的需求，一点一滴改善生活的每个细节，为客户创造产品的服务
            </span>
        </div>

    </div>
    <div class=" txt-center nav-bar" >
        <p class="title2">
            品牌精神
        </p>
        <ul>
            <li class="">
                <img src="/public/img/mobile/join/index/join-2-1.jpg">
                <span>远见</span>
            </li>
            <li class="">
                <img src="/public/img/mobile/join/index/join-2-2.jpg">
                <span>衷诚</span>
            </li>
            <li class="">
                <img src="/public/img/mobile/join/index/join-2-3.jpg">
                <span>协作</span>
            </li>
            <li class="">
                <img src="/public/img/mobile/join/index/join-2-4.jpg">
                <span>尊重</span>
            </li>
        </ul>

    </div>
    <div class="row">
        <div class="pic-box">
            <div>
                <img src="{$mobile_development_images[0].image_url1}" traditional_image="{$mobile_development_images[0].image_url2}"
                     simplified_image="{$mobile_development_images[0].image_url1}" alt=""  class="pic">
            </div>

            <div class="s3_content">
                <a class="btn-more1" href="/join/staff?level_id=1000000148">了解更多</a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="pic-box">
            <div>
                <img src="{$mobile_join_images[0].image_url1}"
                     traditional_image="{$mobile_join_images[0].image_url2}"
                     simplified_image="{$mobile_join_images[0].image_url1}" alt=""
                     class="pic">
            </div>
            <div class="s3_content">
                <!--href="http://jobagile.com.cn/"-->
                <a class="btn-more1 " target="_blank" href="http://agile.zhiye.com/Social">社会招聘</a>
                <a class="btn-more1 " target="_blank" style="margin-left:17px;" href="http://campus.51job.com/agile2018">校园招聘</a>
            </div>
        </div>
    </div>


    <div class="container txt-center  cl mt-20 mb-20">
        <p class="title3">
            2016
        </p>
        <p class="title4">文化活动</p>
        <div class="rollpic  txt-center "><a href="javascript:void(0)" class="prev"></a>
            <div class="rollpicshow txt-center" >
                <ul>
                    <volist name="notices" id="item">
                        <a href="/news/detail?id={$item.notice_id}"><li><img src="{$item.image_url1}"
                                 traditional_image="{$item.image_url2}"
                                 simplified_image="{$item.image_url1}" alt="" >
                            <p class="mt-5  pb-20 txt-center">{$item.name}</p>
                        </li>

                    </volist>
                </ul>
            </div>
            <a href="javascript:void(0)" class="next"></a>
        </div>
    </div>
</block>


<block name="footer_js">

    <script>
        $(function () {
            var swiper_banner = new Swiper('#banner-swiper', {
            pagination: '.swiper-pagination',
            paginationClickable: true,
            spaceBetween: 30,
            centeredSlides: true,
            autoplay: 3000,
            autoplayDisableOnInteraction: false
        });

            $(".rollpic .rollpicshow").jCarouselLite({
                auto: 2000, /*自动播放间隔时间*/
                speed: 500, /*速度*/
                btnNext: ".next", /*向前滚动*/
                btnPrev: ".prev", /*向后滚动*/
                visible: 1 /*显示数量*/
                });


        })
    </script>
</block>
