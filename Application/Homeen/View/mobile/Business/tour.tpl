<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/business/business_life_tour.css">
    <script type="text/javascript" src="/public_en/hui3/lib/swiper3.4.1/js/swiper.min.js"></script>
</block>
<block name="title">Tourism Management-Agile Group</block>

<block name="head_menu">
    <a class="tip" href="#">Tourism Management/</a>
</block>
<block name="body_main">
    <div class="row ">
        <div class="swiper-container" id="banner-swiper">
            <div class="swiper-wrapper">
                <volist name="mobile_head_images" id="item">
                    <div class="swiper-slide">
                        <a><img class="banner-img" src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                simplified_image="{$item.image_url1}" alt="">
                        </a>
                    </div>
                </volist>
            </div>
            <!-- Add Pagination -->
            <if condition="1 lt count($mobile_head_images)">
                <div class="swiper-pagination"></div>
            </if>
            <!-- Add Arrows
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            -->
        </div>
    </div>
    <div class=" row cl container mt-40 mb-40">
        <h2 class="txt-center">About the Company</h2>
        <div class="mt-20">
            <p class="mt-10">
                Afa Tourism, established in October 2015, leverages the O2O communityplatform ‘A-Steward’ to integrate
                tourism resources for the development of exclusive sightseeing routes, offering Agile homeowners,
                employees and potential buyers a distinctive tourist experience. We engage consumers in seamless
                communication through digital messaging, with a view to building a multifaceted virtual tourism and
                consumer ecosystem.
            </p>
        </div>
        <div class="main" style="position:relative">
            <img src="/public_en/img/mobile/business/life/tour-img1.png">
        </div>
    </div>
    <div class="main" style="position:relative">
        <img src="{$mobile_middle_images[0]['image_url1']}" traditional_image="{$mobile_middle_images[0]['image_url2']}"
             simplified_image="{$mobile_middle_images[0]['image_url1']}" class="banner-img">
    </div>
    <div class=" row cl container mt-40 mb-20">
        <h2 class="txt-center">Core Value</h2>
        <div class="mt-20">
            <p class="mt-10">
                A-Tourcombines travel and community under the ethos of ‘the world is your neighbour’. It is a service
                platform where community, property and travel converge to form a targeted suite of rich, personal and
                coherent travel solutions that based on the in-depth analysis of community data.
            </p>
            <p class="mt-10">
                Moreover, A-Tour Consultantoffers customised services that combines the perspectives of a personal
                butler and a travel consultant. The result is a seamless travel experience like no other.
            </p>

        </div>
        <div class="main mt-20" style="position:relative">
            <img src="/public_en/img/mobile/business/life/tour-img3.jpg">
        </div>
    </div>
    <div class="row container mb-20">
        <a href="http://yfb2c.4006983383.com/">
            <div class="main-btn">Visit Official Website</div>
        </a>
    </div>
</block>

<block name="body_side">
    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public_en/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box">（+86 ）020-88839247</div>
            </li>
            <li class="side-xin"><img src="/public_en/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public_en/img/home/business/life/tour/two-code-tour.jpg" alt="">
                </div>
            </li>
            <li class=""><a><img src="/public_en/img/mobile/base/go-top.jpg" alt=""></a></li>
        </ul>
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
                autoplay: 2500,
                autoplayDisableOnInteraction: false
            });
        })
    </script>
</block>