<extend name="./Application/Home/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/business/business_life_tour.css">
    <script type="text/javascript" src="/public/hui3/lib/swiper3.4.1/js/swiper.min.js"></script>
</block>
<block name="title">旅游-雅居乐集团</block>

<block name="head_menu">
    <a class="tip" href="#">旅游/</a>
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
        <h2 class="txt-center">公司介绍</h2>
        <div class="mt-20">
            <p class="mt-10">
                广州市雅方旅游有限公司成立于2015年10月。公司借助“雅管家”社区O2O生活平台，整合优质旅游资源，开发专属旅游线
                路为核心产品，为雅居乐社区业主、集团内部员工及购房潜在客户提供独立性旅游体验。通过数字化信息实现
                与消费者之间的无缝交互，并引导建立网络化、立体化的旅游生态与消费圈。
            </p>
        </div>
        <div class="main" style="position:relative">
            <img src="/public/img/mobile/business/life/tour-img1.png">
        </div>
    </div>
    <div class="main" style="position:relative">
        <img  src="{$mobile_middle_images[0]['image_url1']}" traditional_image="{$mobile_middle_images[0]['image_url2']}"
              simplified_image="{$mobile_middle_images[0]['image_url1']}" class="banner-img">
    </div>
    <div class=" row cl container mt-40 mb-20">
        <h2 class="txt-center">核心价值</h2>
        <div class="mt-20">
            <p class="mt-10">
                雅方旅游将旅游与社区进行融合，以“结伴邻里”为理念，致力于打造特色“社区+物业+旅游”的综合服务平台。通过精准分析社区家庭的个性化需求，提供一整套“精准的需求+丰富的产品+零距离的服务+基于同一场景的关联服务”的出行方案。
            </p>
            <p class="mt-10">
                此外，“雅方旅程管家”专人服务，集物业服务管家和旅程管家于一体,为业主提供一体化旅程服务。
            </p>

        </div>
        <div class="main mt-20" style="position:relative">
            <img src="/public/img/mobile/business/life/tour-img3.jpg">
        </div>
    </div>
    <div class="row container mb-20">
        <a href="http://yfb2c.4006983383.com/">
            <div class="main-btn">访问官网</div>
        </a>
    </div>
</block>

<block name="body_side">
    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box">（+86 ）020-88839247</div>
            </li>
            <li class="side-xin"><img src="/public/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public/img/home/business/life/tour/two-code-tour.jpg" alt="" >
                </div>
            </li>
            <li class=""><a><img src="/public/img/mobile/base/go-top.jpg" alt=""></a></li>
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