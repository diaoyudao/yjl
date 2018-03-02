<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/business/business_life_pro.css">
    <script type="text/javascript" src="/public_en/hui3/lib/swiper3.4.1/js/swiper.min.js"></script>
</block>
<block name="title">Property Management-Agile Group</block>
<block name="head_menu">
    <a class="tip" href="#">Property Management/</a>
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
                Founded in 1992, Agile Property Management Services Co., Ltd (Agile) is one of the first national-level
                qualification property management enterprise, with rotating presidency of Alliance for Quality
                Residential Properties in China. Currently, Agile owns 10 independent property companies and 50
                subsidiary companies with operations spanning over 40 cities and regions including Beijing, Guangzhou,
                Zhongshan, Shenzhen, Nanjing, Shanghai, Xi’an, Chengdu, Hainan and Yunnan, etc.. The Group establishes
                7functional centres including the Quality Centre, Business Management Centre, Entrepreneurship Centre,
                Human Resource &Administration Centre, Financial Centre, Intelligent Community Centre and Investment
                Operations Centre. Our service team of 20,000 staff manages property portfolio with contracted GFA of
                close to 60 million square meters, serving 230,000 households and over 1 million residents.
            </p>
            <div class="row mb-20 mt-20">
                <div class="main-btn" id="much">More</div>
            </div>
            <div class="more-txt me-hidden">
                <p class="mt-10">
                    Spurred on by our mission to exceed expectations of our distinguished customers through continued
                    betterment and innovation, our diverse property services cover mass-market and upscale residential,
                    tourism property, commercial, office and mixed-use development projects.
                </p>
                <p class="mt-10">
                    We have been reaping steady business growth in the course of development and reinvention with a view
                    to
                    better serving homeowners while buttressing our long-term development.
                </p>
                <p class="mt-10">
                    25 years of development has made Agilea renowned property management brand in China contributing
                    actively to the sound and marketised development of the Mainland property management industry while
                    consolidating our prestigious position as one of the first national-level qualification property
                    management enterprise. The company and its projects were accorded local, regional and national
                    accolades
                    such as "National Model Community of Property Management", "First 40 National-level Grade I
                    Qualified
                    Property Management Enterprise", "National Model Community of Commercial Area", "Provincial-level
                    Green
                    Community", "Provincial-level Security and Management Advanced Community" and etc..Agile ranked as
                    the
                    15th of the Top 100 National Property Management Enterprises in 2016, another honour that confirms
                    Agile's position as a trustworthy brand in society.
                </p>
            </div>
        </div>
    </div>
    <div class="more-txt me-hidden">
        <div class=" row cl container pt-20 pb-20 bg-c">
            <h2 class="txt-center ">Core Values</h2>
            <div class="mt-20">
                <p class="mt-10">
                    Upholdingour ‘putting people first and customer centric philosophy‘, we attach great importance to
                    the professional management of our team and the constant upgrading of our services. Through everyday
                    practise, we strive to build a property management service system that is unique to Agile, with a
                    keen eye on quality service standards that will add value to our property and achieve a harmonious
                    environment for all Agile property owners.
                </p>
                <div class="main mt-20 pb-20" style="position:relative">
                    <img src="/public_en/img/mobile/business/life/property-img1.jpg">
                </div>
            </div>
        </div>
        <div class=" row cl container pt-20 pb-20">
            <h2 class="txt-center ">Business Scopes</h2>
            <div class="main mt-20 pb-20" style="position:relative">
                <img src="/public_en/img/mobile/business/life/property-img2.jpg">
            </div>
            <div class="mt-20">
                <p class=" mb-10" style="color:#007069">1.Regular business scope</p>
                <p class="mt-10">
                    IncludingProperty management services, water and electricity maintenance, interior fittings,
                    landscaping, Chinese & Western catering, tea ceremony, swimming pool, billiard table, table tennis,
                    fitness, tennis, bowling alley, golf driving range, board game room, barbeque facilities, grass
                    skiing, lift maintenance, parking lot operation, domestic cleaning services, aerobic exercises,
                    squash, paddling, fishing facilities, foot spa, hair & beauty salon and real estate agency
                    services.
                </p>
                <p class=" mb-10 mt-10" style="color:#007069">2.Multiple business scope</p>
                <p class="mt-10">
                    Including residential, commercial and industrial project, as well as campuses, medical institutions
                    and corporate back-office operations.
                </p>
            </div>
        </div>
        <div class=" row cl container pt-20 pb-20 bg-c">
            <h2 class="txt-center ">Modes of Collaboration</h2>
            <div class="main mt-20 pb-20" style="position:relative">
                <img src="/public_en/img/mobile/business/life/property-img3.jpg">
            </div>
            <div class="mt-20">
                <p class=" mb-10" style="color:#007069">1.Full management takeover</p>
                <p class="mt-10">
                    There are two modes of full managementtakeover – by way of honoraria or contractor system.
                </p>
                <p class="mt-10">
                    Honoraria: Both parties agree on an agreed portion or amount is to be paid to the property
                    management company. The balance will be earmarked for the cost as set out in property services
                    contract. Any surplus or deficit will be shared among property owners.
                </p>
                <p class="mt-10">
                    Contractor system: A fixed amount will be paid to the management services provider, who will pocket
                    the surpluses or bear the losses, if any.
                </p>
                <p class=" mb-10 mt-20" style="color:#007069">2.Consultancy</p>
                <p class="mt-10">
                    Agile Property Management will appoint a team of consultants or on-site staff for technical support
                    under the management of the original service provider.
                </p>
                <p class=" mb-10 mt-20" style="color:#007069">3.Single Service Options</p>
                <p class="mt-10">
                    Offer single service options such as cleaning, security and landscaping for targeted solution.
                </p>
                <p class=" mb-10 mt-20" style="color:#007069">4.Joint Venture</p>
                <p class="mt-10">
                    Property management takeover by way of share right acquisition. Partners will benefit from the
                    synergy of collaborating with Agileby capitalising on the A-Stewardplatform.
                </p>
            </div>
        </div>
    </div>
</block>

<block name="body_side">
    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public_en/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box">400-698-3383</div>
            </li>
            <li class="side-xin"><img src="/public_en/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public_en/img/home/business/property/two-code-property.jpg" alt="">
                </div>
            </li>
            <li class=""><a><img src="/public_en/img/mobile/base/go-top.jpg" alt=""></a></li>
        </ul>
    </div>
</block>

<block name="footer_js">
    <script type="text/javascript">
        $('#much').click(function () {
            $(this).hide();
            $('.more-txt').show();
        });

        var swiper_banner = new Swiper('#banner-swiper', {
            pagination: '.swiper-pagination',
            paginationClickable: true,
            spaceBetween: 30,
            centeredSlides: true,
            autoplay: 2500,
            autoplayDisableOnInteraction: false
        });

    </script>
</block>