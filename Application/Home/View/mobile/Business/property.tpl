<extend name="./Application/Home/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/business/business_life_pro.css">
    <script type="text/javascript" src="/public/hui3/lib/swiper3.4.1/js/swiper.min.js"></script>
</block>
<block name="title">物业-雅居乐集团</block>
<block name="head_menu">
    <a class="tip" href="#">物业/</a>
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
                雅居乐物业管理服务有限公司成立于1992年,是国家首批一级资质物业企业，中国品质住宅联盟轮值主席单 位。迄今为止，已成立10家独立物业公司及50家分公司，形成了十大管理城市区域,包括北京、广州、中山
                、深圳、南京、上海、西安、成都、海南、云南城市区域，管理范围覆盖全国40座城市和地区。集团公司本 部下设品质中心、商业经营中心、企业发展中心、人力行政中心、财务中心、智慧园区中心、投资运营中心
                7大职能中心，公司服务团队约2万人，管理各类物业的总建筑面积近6000万平方米，总户数约23万户，服务 业户逾100万人。
            </p>
            <div class="row mb-20 mt-20">
                <div class="main-btn" id="much">查看更多</div>
            </div>
            <div class="more-txt me-hidden">
                <p class="mt-10">
                    物业服务类型涵盖主流住宅、高端豪宅、旅游地产、商业、写字楼和房地产综合体等多种物业形态，已 形成了多元化的经营服务格局，为尊贵的客户提供贴合需求的优质服务是公司持续追求的目标和创新的动力 。
                </p>
                <p>
                    公司近年业绩保持稳健持续增长，同时公司不断致力业务拓展与创新，在为业主提供最优质服务的同谋求自 身更为稳健长远的发展篇章。
                </p>
                <p>
                    伴随25载发展征程，雅居乐物业发展成为中国知名物业管理品牌企业，为中国物业管理行业的健康发展 、物业管理市场化作出了积极贡献，在物业管理行业中奠定了坚实的地位，成为国家建设部首批认定的物业
                    管理一级资质企业之一。自成立以来，公司及旗下多个项目被授予“全国物业管理示范住宅社区”、“全国 首批40家物业管理一级资质企业”、“全国社区商业示范社区” 、“省绿色社区”、“省社会治安综合治
                    理先进集体”等国家、省、市各级荣誉称号；2016年在全国百强物业管理企业中排名第15名；无一不凝聚了 社会各界对雅居乐品牌的充分信赖。
                </p>
            </div>

        </div>
    </div>
    <div class="more-txt me-hidden">
        <div class=" row cl container pt-20 pb-20 bg-c">
            <h2 class="txt-center ">核心价值</h2>
            <div class="mt-20">
                <p class="mt-10">
                    公司一直秉承“以人为本、以客为尊”的服务理念，注重服务团队的专业化管理和自身服务水准的提升，在实践中积累具有雅居乐物业服务特色的管理服务体系，全力保障优质的管理服务水平，确保物业的保值、增值，为雅居乐业户打造和谐人居环境。
                </p>
                <div class="main mt-20 pb-20" style="position:relative">
                    <img src="/public/img/mobile/business/life/property-img1.jpg">
                </div>
            </div>
        </div>
        <div class=" row cl container pt-20 pb-20">
            <h2 class="txt-center ">业务范围</h2>
            <div class="main mt-20 pb-20" style="position:relative">
                <img src="/public/img/mobile/business/life/property-img2.jpg">
            </div>
            <div class="mt-20">
                <p class=" mb-10" style="color:#007069">1.常规业务范围</p>
                <p class="mt-10">
                    物业管理服务、水电维修、室内装饰工程、园林绿化工程、中餐、西餐类制售、茶艺、游泳、桌球、乒乓球、 健身、网球、保龄球、高尔夫球场练习场、棋牌、烧烤、滑草、电梯维修、停车场经营、家居清洁服务、健
                    美操、壁球、划船、钓鱼场；足浴、美容美发、房地产中介服务。
                </p>
                <p class=" mb-10 mt-10" style="color:#007069">2.多种业务范围</p>
                <p class="mt-10">
                    包括住宅、商业、工业、院校、医疗机构 、企业后勤.
                </p>
            </div>
        </div>
        <div class=" row cl container pt-20 pb-20 bg-c">
            <h2 class="txt-center ">合作模式</h2>
            <div class="main mt-20 pb-20" style="position:relative">
                <img src="/public/img/mobile/business/life/property-img3.jpg">
            </div>
            <div class="mt-20">
                <p class=" mb-10" style="color:#007069">1.全面接管</p>
                <p class="mt-10">
                    全面接管包括两大模式：酬金制、包干制。
                </p>
                <p class="mt-10">
                    酬金制：双方约定比例或者约定数额提取酬金，支付给物管公司，其余全部用于物业服务合同约定的支出， 结余或者不足均由业主享有或者承担的物业服务计费方式。
                </p>
                <p class="mt-10">
                    包干制：固定物业服务费用，盈余或亏损均由物 管公司享有或承担的物业服务计费方式。
                </p>
                <p class=" mb-10 mt-20" style="color:#007069">2.顾问服务</p>
                <p class="mt-10">
                    在不改变原物管公司管理主体的前提下,雅居乐物业派驻顾问团队或驻场人员给予合作方技术支 持。
                </p>
                <p class=" mb-10 mt-20" style="color:#007069">3.单项服务</p>
                <p class="mt-10">
                    提供清洁、保安、绿化等单项服务，为合作方排忧解难。
                </p>
                <p class=" mb-10 mt-20" style="color:#007069">4.股权合作</p>
                <p class="mt-10">
                    通过收购股权,实现由雅居乐物业经营管理。利用“雅管家”互联网平台的优势，共同承担，分享经营成果。
                </p>
            </div>
        </div>
    </div>
</block>

<block name="body_side">
    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box">400-698-3383</div>
            </li>
            <li class="side-xin"><img src="/public/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public/img/home/business/property/two-code-property.jpg" alt="">
                </div>
            </li>
            <li class=""><a><img src="/public/img/mobile/base/go-top.jpg" alt=""></a></li>
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