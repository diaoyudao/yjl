<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/business/business_enviroment.css">
    <style>
        p{
            font-size: 1.2rem;
        }
    </style>
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public_en/hui3/lib/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>
</block>
<block name="title">Environmental Protection-Agile Group</block>

<block name="head_menu">
    <a class="tip">Environmental Protection/</a>
</block>
<block name="body_main">

    <div class="row">
        <div id="slider-3">
            <div class="slider">
                <div class="bd">
                    <ul>
                        <volist name="mobile_head_images" id="item">
                            <li><a href="#">
                                    <img src="{$item.image_url1}"
                                         traditional_image="{$item.image_url2}"
                                         simplified_image="{$item.image_url1}" class="banner-img">
                                </a></li>

                        </volist>

                    </ul>
                </div>
                <ol class="hd cl">
                    <li class="land-house">
                        <div class="land me-hidden"><img
                                    src="/public_en/img/home/business/environment/environment_btn1.png"></div>
                        <div class="land-active "><img class="left"
                                                       src="/public_en/img/home/business/environment/btn_icon1.png"><span>Solid Waste Treatment</span>
                            <div class="clear"></div>
                        </div>
                    </li>
                    <li class="land-house">
                        <div class="land "><img src="/public_en/img/home/business/environment/environment_btn2.png"></div>
                        <div class="land-active me-hidden"><img class="left"
                                                                src="/public_en/img/home/business/environment/btn_icon2.png"><span>Environmental Restoration</span>
                            <div class="clear"></div>
                        </div>
                    </li>
                    <li class="land-house">
                        <div class="land "><img src="/public_en/img/home/business/environment/environment_btn3.png"></div>
                        <div class="land-active me-hidden"><img class="left"
                                                                src="/public_en/img/home/business/environment/btn_icon3.png"><span>Water Affairs</span>
                            <div class="clear"></div>
                        </div>
                    </li>
                </ol>
            </div>
        </div>
    </div>
    <div class=" mt-20">
        <h2 class="title-color main-title txt-center">Environmental Protection</h2>
        <div class="mt-20">
            <img src="/public_en/img/mobile/business/environment/pic1.jpg" class="tags-img">
            <div class="container mt-20">
                <p>
                    Environmental Protection, a wholly owned subsidiary of Agile Group Holdings Limited, is a strategic
                    pivot of the Group's diversified development with a registered capital of RMB 1 billion, with a
                    strategic and prominent presence spreading across 6 regions including East China,
                    Beijing-Tianjin-Hebei, Central and Western China, Southern China and Hainan.
                </p>
                <h3 class="title-color min-title mt-20">
                    A Leading Environmental Service Investment Operator
                </h3>
                <p class="mt-10">
                    Environmental Protection engages in every aspect of the environment, in particular solid waste
                    treatment, environmental restoration and water affairs. Our services cover all resource recycling
                    and pollution prevention aspects with the exception of air pollution from hazardous waste treatment,
                    daily waste treatment to commercial food waste treatment; and from sludge treatment, soil treatment,
                    water restoration to sewage treatment and water affairs, offering integrated platform-grade
                    environmental solutions. Environmental Protection strives to become a leading environmental services
                    investment operator at the urban and rural levels.
                </p>

                <div id="show_more" class="row cl mt-20 main-btn mb-10">
                    More
                </div>
            </div>

            <div id="txt-more" class="me-hidden container">
                <h3 class="title-color min-title mt-20">
                    Pursuit of a Clean and Pleasant Living Environment
                </h3>
                <p class="mt-10">
                    Environmental Protection is determined to identify win-win solutions that balance social,
                    environmental and economic impacts for all parties including the government, the Group, its partners
                    and the general public. Our ultimate goal is to restore nature to its original state and resurface
                    its beauty for the enjoyment of our residents.
                </p>

                <div class="mt-20  ">
                    <div class="box cl">
                        <img src="/public_en/img/mobile/business/environment/pic2.jpg" class="tags-img">
                        <div class="text ">
                            Solid Waste Treatment
                        </div>
                    </div>
                    <div class="container mt-20">
                        <p>
                            Environmental Protection has a mature Solid Waste Treatment technology and a wealth of
                            experience in the project, in addition to the traditional treatment technology (landfill,
                            incineration, etc.), in the plasma gasification, biochemical recycling and other aspects of
                            a very in-depth study.
                        </p>
                    </div>
                </div>
                <div class="mt-20  ">
                    <div class="box cl">
                        <img src="/public_en/img/mobile/business/environment/pic3.jpg" class="tags-img">
                        <div class="text">Environmental Restoration</div>
                    </div>
                    <div class="container mt-20">
                        <p>
                            Environmental Restoration currently focuses on water environment restoration. We have a
                            complete solution and innovative water microbial activation technology, with the traditional
                            water environment repair technology unparalleled advantages.
                        </p>
                    </div>
                </div>
                <div class="mt-20  ">
                    <div class="box cl">
                        <img src="/public_en/img/mobile/business/environment/pic4.jpg" class="tags-img">
                        <div class="text">Water Affairs</div>
                    </div>
                    <div class="container mt-20">
                        <p>
                            Water Affairs includes industrial wastewater treatment、water plant / sewage treatment plant.
                            In Hainan, Zhongshan, Foshan and other places, Environmental Protection has a number of
                            water plants and sewage treatment plants.
                        </p>
                    </div>
                </div>
                <div class="container">
                    <a target="_blank" href="http://www.environ.agile.com.cn/" class="a-color">
                        <div class="row cl mt-20 main-btn mb-30">
                            Visit Official Website
                        </div>
                    </a>
                </div>
            </div>

        </div>
    </div>
</block>
<block name="body_side">
    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public_en/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box">（+86 ）20-88839502</div>
            </li>
            <li class="side-xin"><img src="/public_en/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public_en/img/home/business/environment/two-code-environment.jpg" alt="">
                </div>
            </li>
            <li class=""><a><img src="/public_en/img/mobile/base/go-top.jpg" alt=""></a></li>
        </ul>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {

            $('#show_more').click(function () {
                $('#txt-more').show();
                $(this).hide();
            });

            $("#slider-3 .slider").slide({mainCell:".bd ul",titCell:".hd li",trigger:"click",effect:"leftLoop",autoPlay:false,delayTime:700,interTime:5000,pnLoop:false,titOnClassName:"active"});


            $('.land-house').click(function () {
                var me = $(this);
                me.find('.land-active').show();
                me.find('.land').hide();

                me.siblings().find('.land').show();
                me.siblings().find('.land-active').hide();
            });
            $('.aler').click(function () {
                show_expecting();
            });

        })
    </script>
</block>
