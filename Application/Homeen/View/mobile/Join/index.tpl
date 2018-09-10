<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/join/join-index.css">
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public_en/hui3/lib/jcarousellite.min.js"></script>
    <script type="text/javascript" src="/public_en/hui3/lib/swiper3.4.1/js/swiper.min.js"></script>
</block>
<block name="title">Join Agile-Agile Group</block>

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
            <img class="pic" src="/public_en/img/mobile/join/index/join-1.jpg">

        </div>
        <div class="pl-5">
            <p class="title">Corporate Mission</p>
            <span class="text" style="font-size: 1rem">
                We strive for consistent breakthroughs in quality services with every astute addition that stems from a customer-centric philosophy to answer every need in every aspect of life.
            </span>
        </div>

    </div>
    <div class=" txt-center nav-bar" >
        <p class="title2">
            Corporate Spirit
        </p>
        <ul>
            <li class="">
                <img src="/public_en/img/mobile/join/index/join-2-1.jpg">
                <span style="font-size: 0.8rem;left: 21%">Vision</span>
            </li>
            <li class="">
                <img src="/public_en/img/mobile/join/index/join-2-2.jpg">
                <span style="font-size: 0.8rem;left: 12%;">Sincerity</span>
            </li>
            <li class="">
                <img src="/public_en/img/mobile/join/index/join-2-3.jpg">
                <span style="font-size: 0.8rem;left: -2%">Collaboration</span>
            </li>
            <li class="">
                <img src="/public_en/img/mobile/join/index/join-2-4.jpg">
                <span style="font-size: 0.8rem;left: 17%">Respect</span>
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
                <a class="btn-more1" href="/join/staff?level_id=1000000148">More</a>
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
                <a class="btn-more1 " style="font-size: 0.8rem;padding: 0.5rem 1rem" target="_blank" href="http://agile.zhiye.com/Social">Open Recruitment</a>
                <a class="btn-more1 " style="margin-left:17px;font-size: 0.8rem;padding: 0.5rem 1rem" target="_blank" href="http://agilezp.zhiye.com/">Campus Recruitment</a>
            </div>
        </div>
    </div>


    <div class="container txt-center  cl mt-20 mb-20">
        <p class="title3">
            2016
        </p>
        <p class="title4" style="font-size: 1.4rem">Corporate Cultural Activities</p>
        <div class="rollpic  txt-center "><a href="javascript:void(0)" class="prev"></a>
            <div class="rollpicshow txt-center" >
                <ul>
                    <volist name="notices" id="item">
                        <a href="/en/news/detail?id={$item.notice_id}"><li><img src="{$item.image_url1}"
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
