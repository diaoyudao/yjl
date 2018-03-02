<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/business/business_life_net.css">
    <script type="text/javascript" src="/public_en/hui3/lib/swiper3.4.1/js/swiper.min.js"></script>
</block>

<block name="title">Intelligent Community-Agile Group</block>
<block name="head_menu">
    <a class="tip" href="#">Intelligent Community/</a>
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
    <div class=" row cl container mt-40 mb-20">
        <h2 class="txt-center">About the Company</h2>
        <div class="mt-20">
            <p class="mt-10">
                A-Living Group keeps abreast with the "Internet and more" trend by founding the Internet and Technology
                company in 2015 to leverage technologies such as Mobile Internet and Internet of Things to integrate
                online and offline resources for an innovative community. A-Steward is the mobile community O2O service
                platform born of the brand-new Property Management 4.0, with the aim of offering specific community
                scenario-based services to meet residential needs, thereby supporting the strategic digitisation of
                A-Living Group for the service of a vibrant and harmonious community.
            </p>
            <div class="main mt-20 pb-20" style="position:relative">
                <img src="/public_en/img/mobile/business/life/net-img1.jpg">
            </div>
            <p class="mt-10 min-title title-color">
                Core Values
            </p>
            <p class="mt-10">
                We strive to upgrade traditional properties, enhance management capacity, service efficiency and client
                satisfaction.
            </p>
        </div>
    </div>

    <div class=" row cl container pt-20 pb-20 bg-c">
        <h2 class="txt-center ">Six Terminal Services Products</h2>
        <ul class="mt-20 app ">
            <li>
                <div class="box pt-10 pb-10 pl-10 pr-10">
                    <img class="icon" src="/public_en/img/mobile/business/life/product-icon1.png">
                    <span class="min-title title-color title">A-StewardApp <br>(Owner terminal)</span>
                    <span class="text">A multitasking butler that answers every need of owner anytime</span>
                </div>

            </li>
            <li>
                <div class="box pt-10 pb-10 pl-10 pr-10">
                    <img class="icon" src="/public_en/img/mobile/business/life/product-icon2.png">
                    <span class="min-title title-color title">A-Steward Assistant App <br>((Property terminal)</span>
                    <span class="text">Comprehensive enhancement to property management standards, efficiency and reputation</span>
                </div>

            </li>
            <li>
                <div class="box pt-10 pb-10 pl-10 pr-10">
                    <img class="icon" src="/public_en/img/mobile/business/life/product-icon3.png">
                    <span class="min-title title-color title">A-MerchantApp <br>((Merchant terminal)</span>
                    <span class="text">Customised mobile management platform for merchants</span>
                </div>

            </li>
            <li>
                <div class="box pt-10 pb-10 pl-10 pr-10">
                    <img class="icon" src="/public_en/img/mobile/business/life/product-icon4.png">
                    <span class="min-title title-color title">Angela intelligent device <br>((Off-line terminal)</span>
                    <span class="text">A24/7 off-line self-help services</span>
                </div>

            </li>
            <li>
                <div class="box pt-10 pb-10 pl-10 pr-10">
                    <img class="icon" src="/public_en/img/mobile/business/life/product-icon5.png">
                    <span class="min-title title-color title">A-StewardPublic Account <br>( (WeChat terminal)</span>
                    <span class="text">Assistant to community anywhere, anytime</span>
                </div>

            </li>
            <li>
                <div class="box pt-10 pb-10 pl-10 pr-10">
                    <img class="icon" src="/public_en/img/mobile/business/life/product-icon6.png">
                    <span class="min-title title-color title">A-StewardExperience CentreApp <br>((Delivery terminal)</span>
                    <span class="text">Cover the within 1 kilometre of door-to-door delivery in the community</span>
                </div>

            </li>
        </ul>
    </div>

    <div class=" row cl container mt-40 mb-20">
        <h2 class="txt-center">Business Scopes</h2>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public_en/img/mobile/business/life/icon1.png">Property
                management services</p>
            <p class="mt-10">
                Agile property owners enjoy exclusive butler services (contact butler) and errand services (property
                bill payment) with just one click. There is also instant notification functionality for community
                notices.
            </p>
        </div>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public_en/img/mobile/business/life/icon2.png">Neighbour
                relations</p>
            <p class="mt-10">
                Offer a networking platform for an inclusive and awarding community.
            </p>
        </div>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public_en/img/mobile/business/life/icon3.png">Neighbouring
                Business Districts</p>
            <p class="mt-10">
                Empower merchants within 1 kilometre from the community to enhance efficiency and competitiveness by
                offering payment functionality, discount offers, e-membership card and loan guarantee.
            </p>
        </div>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public_en/img/mobile/business/life/icon4.png">Daily life
                services</p>
            <p class="mt-10">
                Offer owners one-stop convenience with enriched platform contents about key community affairs.
            </p>
        </div>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public_en/img/mobile/business/life/icon5.png">Community
                e-commerce</p>
            <p class="mt-10">
                Identify robust e-commerce operators such as T-Mall andjd.com; explore in-community delivery services of
                high demand products with a view to fostering in-community e-commerce.
            </p>
        </div>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public_en/img/mobile/business/life/icon6.png">Community
                financial services</p>
            <p class="mt-10">
                Offer bespoke financial services built on community data in an inclusive environment, with a view to
                establishing a community credit system by stage for financial inclusion. This includes payment
                instalment scheme, investment opportunities, personal and corporate loans and other financial
                products.
            </p>
        </div>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public_en/img/mobile/business/life/icon7.png">Community insurance</p>
            <p class="mt-10">
                We champion bespoke community insurance andscene-centric insurance in the exploration on mutual community insurance.
            </p>
        </div>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public_en/img/mobile/business/life/icon8.png">Intelligent home</p>
            <p class="mt-10">
                We build intelligent homes from the perspectives of safety and health. We offer full-span home services (sales promotion, transaction, relocation, fitting, occupation).
            </p>
        </div>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public_en/img/mobile/business/life/icon9.png">Intelligent vehicle</p>
            <p class="mt-10">
                4S vehicle station offers highly efficient, seamless premium services (night wash, intelligent car key locker at lobby) for an all-round experience.
            </p>
        </div>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public_en/img/mobile/business/life/icon10.png">Intelligent travel</p>
            <p class="mt-10">
                Bespoke ‘door to door’ family tours for the community.
            </p>
        </div>
    </div>
</block>

<block name="body_side">
    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public_en/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box">（+86 ）020-88839995</div>
            </li>
            <li class="side-xin"><img src="/public_en/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public_en/img/home/business/life/net/two-code-net.jpg" alt="">
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