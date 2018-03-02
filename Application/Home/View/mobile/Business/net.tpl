<extend name="./Application/Home/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/business/business_life_net.css">
    <script type="text/javascript" src="/public/hui3/lib/swiper3.4.1/js/swiper.min.js"></script>
</block>

<block name="title">智慧园区-雅居乐集团</block>
<block name="head_menu">
    <a class="tip" href="#">智慧园区/</a>
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
        <h2 class="txt-center">公司介绍</h2>
        <div class="mt-20">
            <p class="mt-10">
                雅生活集团紧跟“互联网+”时代潮流，于2015年成立广州市雅天网络科技有限公司。利用移动互联网、物联网等技术,
                整合社区线上、线下优质资源，致力于打造新型社区生态圈。雅管家平台是雅生活服务集团全新物业4.0理念下
                的移动社区O2O服务平台。其以住户需求为核心，结合社区特性定制场景式服务，助力雅生活集团战略转型，
                全面实现互联网化，最终构建最具活力的和谐社区。
            </p>
            <div class="main mt-20 pb-20" style="position:relative">
                <img src="/public/img/mobile/business/life/net-img1.jpg">
            </div>
            <p class="mt-10 min-title title-color">
                核心价值
            </p>
            <p class="mt-10">
                助力传统物业升级，提高管理能力和服务效率，提升客户满意度。
            </p>
        </div>
    </div>

    <div class=" row cl container pt-20 pb-20 bg-c">
        <h2 class="txt-center ">6大终端服务产品</h2>
        <ul class="mt-20 app ">
            <li>
                <div class="box pt-10 pb-10 pl-10 pr-10">
                    <img class="icon" src="/public/img/mobile/business/life/product-icon1.png">
                    <span class="min-title title-color title">雅管家App(业主端)</span>
                    <span class="text">一个随时回应业主需求的全能管家</span>
                </div>

            </li>
            <li>
                <div class="box pt-10 pb-10 pl-10 pr-10">
                    <img class="icon" src="/public/img/mobile/business/life/product-icon2.png">
                    <span class="min-title title-color title">雅管家App(物业端)</span>
                    <span class="text">全面提升物业管理水平、效率、口碑</span>
                </div>

            </li>
            <li>
                <div class="box pt-10 pb-10 pl-10 pr-10">
                    <img class="icon" src="/public/img/mobile/business/life/product-icon3.png">
                    <span class="min-title title-color title">雅管家App(商家端)</span>
                    <span class="text">平台入驻商家的移动管理平台</span>
                </div>

            </li>
            <li>
                <div class="box pt-10 pb-10 pl-10 pr-10">
                    <img class="icon" src="/public/img/mobile/business/life/product-icon4.png">
                    <span class="min-title title-color title">安吉拉智能设备（线下端）</span>
                    <span class="text">实现社区7 x 24小时的线下自助服务</span>
                </div>

            </li>
            <li>
                <div class="box pt-10 pb-10 pl-10 pr-10">
                    <img class="icon" src="/public/img/mobile/business/life/product-icon5.png">
                    <span class="min-title title-color title">雅管家公众号（微信端）</span>
                    <span class="text">随时随地的社区生活助手</span>
                </div>

            </li>
            <li>
                <div class="box pt-10 pb-10 pl-10 pr-10">
                    <img class="icon" src="/public/img/mobile/business/life/product-icon6.png">
                    <span class="min-title title-color title">小雅到家App（配送端）</span>
                    <span class="text">致力解决社区最后一公里配送难点</span>
                </div>

            </li>
        </ul>
    </div>

    <div class=" row cl container mt-40 mb-20">
        <h2 class="txt-center">业务范围</h2>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public/img/mobile/business/life/icon1.png">物业服务</p>
            <p class="mt-10">
                提供雅居乐住户专属管家服务（联络管家），一键搞定所有琐事（物业缴费），及时知晓小区通知等等。
            </p>
        </div>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public/img/mobile/business/life/icon2.png">邻里社交</p>
            <p class="mt-10">
                打造邻里社交圈，推进邻里关系，增加平台黏性，提高业主满意度。
            </p>
        </div>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public/img/mobile/business/life/icon3.png">周边商圈</p>
            <p class="mt-10">
                赋能社区1公里商圈商家，提升服务效率，增强社区商家竞争力；提供支付、优惠、电子会员卡、商圈贷等功能。
            </p>
        </div>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public/img/mobile/business/life/icon4.png">生活服务</p>
            <p class="mt-10">
                丰富平台内容、便捷业主生活，为垂直020成长提供土壤，孵化社区关键业务。
            </p>
        </div>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public/img/mobile/business/life/icon5.png">社区电商</p>
            <p class="mt-10">
                区别天猫、京东平台型电商，聚焦社区高频刚需品类，探索雅生活专供，研究社区微仓+小雅快送模式，构建社区电商护城河。
            </p>
        </div>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public/img/mobile/business/life/icon6.png">社区金融</p>
            <p class="mt-10">
                结合社区场景，定制金融服务；依托社区数据，构建社区信用体系，践行普惠金融；分阶段尝试：分期购、投资送、邻里贷、员工贷、商圈贷等金融产品。
            </p>
        </div>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public/img/mobile/business/life/icon7.png">社区保险</p>
            <p class="mt-10">
                社区定制保险，场景式保险，探索社区相互保险。
            </p>
        </div>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public/img/mobile/business/life/icon8.png">智慧家</p>
            <p class="mt-10">
                以“安全、健康”刚需切入智慧家居，构建高粘性入口；提供全生命周期房屋服务（新房宣传、房屋交易、拎包入住、装饰装修、入伙收楼）。
            </p>
        </div>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public/img/mobile/business/life/icon9.png">智慧车</p>
            <p class="mt-10">
                社区高效移动汽车4S服务站，打造差异化、无缝化服务体验（夜间洗车、大堂车匙智能柜），构建用车服务闭环。
            </p>
        </div>
        <div class="mt-20">
            <p style="color:#02766e;" class="min-title"><img style="width:25px;margin-right:5px"
                                                             src="/public/img/mobile/business/life/icon10.png">智慧游</p>
            <p class="mt-10">
                社区定制旅游，提供“门到门”家庭出游服务。
            </p>
        </div>
    </div>
</block>

<block name="body_side">
    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box">（+86 ）020-88839995</div>
            </li>
            <li class="side-xin"><img src="/public/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public/img/home/business/life/net/two-code-net.jpg" alt="">
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