<extend name="./Application/Homeen/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/business/business_enviroment.css">
</block>

<block name="title">Environmental Protection-Agile Group</block>


<block name="body_main">
    <div id="environment" class="section1">
        <div id="slider1" style="height: 490px;position: relative;overflow: hidden;">

            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <volist name="head_images" id="item">
                        <div class="swiper-slide swiper-no-swiping">
                            <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                 simplified_image="{$item.image_url1}" alt="">
                        </div>
                    </volist>
                </div>

            </div>

            <div class="butn">
                <div class="btn1 btn-s">
                    <div class="mask"></div>
                    <span style="display: none"><img
                                src="/public_en/img/home/business/environment/environment_btn1.png" alt=""></span>
                    <div class="item" style="">
                                <span class="icon"><img src="/public_en/img/home/business/environment/btn_icon1.png"
                                                        alt=""></span>
                        <span class="tip">Solid Waste Treatment</span>
                    </div>
                </div>
                <div class="btn2 btn-s">
                    <div class="mask"></div>
                    <span><img src="/public_en/img/home/business/environment/environment_btn2.png" alt=""></span>
                    <div class="item" style="display: none;">
                                <span class="icon"><img src="/public_en/img/home/business/environment/btn_icon2.png"
                                                        alt=""></span>
                        <span class="tip">Environmental Restoration</span>
                    </div>
                </div>
                <div class="btn2 btn-s">
                    <div class="mask"></div>
                    <span><img src="/public_en/img/home/business/environment/environment_btn3.png" alt=""></span>
                    <div class="item" style="display: none;">
                                <span class="icon"><img src="/public_en/img/home/business/environment/btn_icon3.png"
                                                        alt=""></span>
                        <span class="tip">Water Affairs</span>
                    </div>
                </div>
            </div>
        </div>


        <div class="content container" style="padding-bottom:80px;">
            <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                            href="/en/business/index?level_id=1000000125">Diversification of Business</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span>Environmental Protection</span></p>


            <img src="/public_en/img/home/business/environment/environment_p1.jpg" alt="" style="float: left;">

            <div class="box">
                <div class="title">Environmental Protection</div>
                <p>
                    Environmental Protection, a wholly owned subsidiary of Agile Group Holdings Limited, is a strategic
                    pivot of the Group's diversified development with a registered capital of RMB 1 billion, with a
                    strategic and prominent presence spreading across 6 regions including East China,
                    Beijing-Tianjin-Hebei, Central and Western China, Southern China and Hainan.
                </p>
                <div class="title">A Leading Environmental Service Investment Operator</div>
                <p>
                    Environmental Protection engages in every aspect of the environment, in particular solid waste
                    treatment, environmental restoration and water affairs. Our services cover all resource recycling
                    and pollution prevention aspects with the exception of air pollution from hazardous waste treatment,
                    daily waste treatment to commercial food waste treatment; and from sludge treatment, soil treatment,
                    water restoration to sewage treatment and water affairs, offering integrated platform-grade
                    environmental solutions. Environmental Protection strives to become a leading environmental services
                    investment operator at the urban and rural levels.
                </p>
                <div class="title">Pursuit of a Clean and Pleasant Living Environment</div>
                <p>
                    Environmental Protection is determined to identify win-win solutions that balance social,
                    environmental and economic impacts for all parties including the government, the Group, its partners
                    and the general public. Our ultimate goal is to restore nature to its original state and resurface
                    its beauty for the enjoyment of our residents.
                </p>
            </div>
            <div class="clear"></div>

            <!--<div style="margin-top:0px;"><h3 style="font-weight:700;color:#666;">雅居乐环保集团</h3></div>-->
            <!--<div style="margin-top:40px;margin-bottom:0px;color:#999;line-height:1.7em;text-align: center">雅居乐环保集团是雅居乐集团控股有限公司的全资子公司，是雅居乐控股多元化发展的战略支点。<br>-->
            <!--雅居乐环保集团致力于成为领先的环境服务投资运营商。<br>-->
            <!--雅居乐环保集团全面布局，聚焦固体废弃物、环境修复和水务三大领域，<br>-->
            <!--包括危险废弃物处理、生活垃圾处理、餐厨垃圾处理、污泥处理、土壤环境修复、水环境修复，<br>-->
            <!--污水处理以及自来水生产等，几乎涵盖除大气外所有的污染防治和资源再生利用。</div>-->
        </div>
        <div class="main" style="width:100%;background-color: #efefef;margin-top:0;padding-top:80px;">
            <div class="content container">
                <ul class="list1">
                    <li style="margin-left: 0;">
                        <p style="text-align: center;margin-bottom: 45px;">
                            <span class="name">Solid Waste Treatment</span>
                            <span class="border"></span>
                        </p>
                        <img src="/public_en/img/home/business/environment/environment_item1.jpg" alt="">
                        <p class="word">
                            Environmental Protection has a mature Solid Waste Treatment technology and a wealth of
                            experience in the project, in addition to the traditional treatment technology (landfill,
                            incineration, etc.), in the plasma gasification, biochemical recycling and other aspects of
                            a very in-depth study.
                        </p>
                    </li>
                    <li>
                        <p style="text-align: center;margin-bottom: 45px;">
                            <span class="name">Environmental Restoration</span>
                            <span class="border"></span>
                        </p>
                        <img src="/public_en/img/home/business/environment/environment_item2.jpg" alt="">
                        <p class="word">
                            Environmental Restoration currently focuses on water environment restoration. We have a
                            complete solution and innovative water microbial activation technology, with the traditional
                            water environment repair technology unparalleled advantages.
                        </p>
                    </li>
                    <li>
                        <p style="text-align: center;margin-bottom: 45px;">
                            <span class="name">Water Affairs</span>
                            <span class="border"></span>
                        </p>
                        <img src="/public_en/img/home/business/environment/environment_item3.jpg" alt="">
                        <p class="word">
                            Water Affairs includes industrial wastewater treatment、water plant / sewage treatment plant.
                            In Hainan, Zhongshan, Foshan and other places, Environmental Protection has a number of
                            water plants and sewage treatment plants.
                        </p>
                    </li>
                    <div class="clear"></div>
                    <a target="_blank" href="http://www.environ.agile.com.cn/" class="btn-more-s ">Visit Official Website</a>

                    <div class="side-list">
                        <ul>
                            <li class="side-tel">
                                <img src="/public_en/img/home/business/estate/detail/estate_icon1.png" alt="">
                                <div class="tel-box">（86）20-88839502</div>
                            </li>
                            <!--<li><a href=""><img src="/public_en/img/home/business/estate/detail/estate_icon2.png"-->
                            <!--alt=""></a></li>-->
                            <!--<li><a href=""><img src="/public_en/img/home/business/estate/detail/estate_icon3.png"-->
                            <!--alt=""></a></li>-->
                            <li class="side-xin"><img src="/public_en/img/home/business/estate/detail/estate_icon4.png"
                                                      alt="">
                                <div class="xin-box">
                                    <div class="box-head"></div>
                                    <img src="/public_en/img/home/business/environment/two-code-environment.jpg" alt=""
                                         width="130">
                                </div>
                            </li>
                            <li class=""><a onclick="history.go(-1);"><img
                                            src="/public_en/img/home/business/estate/detail/estate_icon7.png" alt=""></a>
                            </li>
                            <li class="last"><a><img src="/public_en/img/home/business/estate/detail/estate_icon5.png"
                                                     alt=""></a></li>

                        </ul>
                    </div>
                </ul>
            </div>

        </div>

    </div>
</block>


<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(2).addClass("active").siblings().removeClass("active");
            SideList.top(550);
            SideList.tel();
            SideList.xin();


            var mySwiper1 = $('#slider1 .swiper-container').swiper({
                loop: true,
                noSwiping: true,
                autoplay: 3000,
                speed: 1000,
                onSlideChangeStart: function (swiper) {
                    var index = swiper.activeLoopIndex;
                    $(".btn-s").find(".item").hide().siblings("span").show();
                    $(".btn-s").eq(index).find(".item").show().siblings("span").hide();
                }
//                pagination: '#bannerpagination',
//                paginationClickable: true,
//                grabCursor: true,
//                parallax: true,
                //其他设置
            });


            //            按钮动画
//            $("#environment .butn>div:not(.btn1)").find(".mask").one("mouseover", function () {
//                $(".btn1").find(".item").animate({width: "80px"}, 200, function () {
//                    $(this).hide().siblings("span").show();
//                });
//            })

            $("#environment .butn .mask").on("mouseover", function (e) {
                e.stopPropagation()
                var index = $(this).parents(".btn-s").index();
                $(".btn-s").find(".item").hide().siblings("span").show();
                $(this).siblings(".item").show().siblings("span").hide();
                mySwiper1.swipeTo(index, 1000, true);
                mySwiper1.stopAutoplay();
            })

//            $("#environment .butn .mask").on("mouseout", function (e) {
//                e.stopPropagation()
//                var index = $(this).index();
//                $(this).siblings(".item").animate({width: "80px"}, 200, function () {
//                    $(this).hide().siblings("span").show();
//                });
//            })

        })
    </script>
</block>
