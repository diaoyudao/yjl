<extend name="./Application/Home/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/business/business_enviroment.css">
</block>

<block name="title">环保-雅居乐集团</block>


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
                            src="/public/img/home/business/environment/environment_btn1.png" alt=""></span>
                    <div class="item" style="width: 230px;">
                                <span class="icon"><img src="/public/img/home/business/environment/btn_icon1.png"
                                                        alt=""></span>
                        <span class="tip">固体废弃物处理</span>
                    </div>
                </div>
                <div class="btn2 btn-s">
                    <div class="mask"></div>
                    <span><img src="/public/img/home/business/environment/environment_btn2.png" alt=""></span>
                    <div class="item" style="display: none;">
                                <span class="icon"><img src="/public/img/home/business/environment/btn_icon2.png"
                                                        alt=""></span>
                        <span class="tip">环境修复</span>
                    </div>
                </div>
                <div class="btn2 btn-s">
                    <div class="mask"></div>
                    <span><img src="/public/img/home/business/environment/environment_btn3.png" alt=""></span>
                    <div class="item" style="display: none;">
                                <span class="icon"><img src="/public/img/home/business/environment/btn_icon3.png"
                                                        alt=""></span>
                        <span class="tip">水务</span>
                    </div>
                </div>
            </div>
        </div>


        <div class="content container" style="padding-bottom:80px;">
            <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                    href="/business/index?level_id=1000000125">多元业务</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span>环保</span></p>


            <img src="/public/img/home/business/environment/environment_p1.jpg" alt="" style="float: left;">

            <div class="box">
                <div class="title">雅居乐环保集团</div>
                <p>雅居乐环保集团是雅居乐集团控股有限公司的全资子公司，是雅居乐控股多元化发展的战略支点。雅居乐环保集团注册资金10亿元人民币，集团总部位于香港，国内总部位于深圳前海自贸区。当前，雅居乐环保集团已经在华东、京津冀、山东、中西部、华南、海南六大区域全面布局，拥有多家行业内知名的项目公司。</p>
                <div class="title">领先的环境服务投资运营商</div>
                <p>
                    雅居乐环保集团全面布局，聚焦固体废弃物、环境修复和水务三大领域，包括危险废弃物处理、生活垃圾处理、餐厨垃圾处理、污泥处理、土壤环境修复、水环境修复、污水处理以及自来水生产等，几乎涵盖除大气外所有的污染防治和资源再生利用。雅居乐环保集团致力于成为领先的环境服务投资运营商，为城市及乡镇环境提供平台级的系统解决方案和综合环境服务。
                </p>
                <div class="title">净美家园，乐活一生</div>
                <p>雅居乐环保集团希望通过努力，以社会效益、环境效益和经济效益的均衡为前提，实现政府、企业、合作伙伴以及社会大众的多方共赢。最终能够褪尽污染，净美家园，把被污染了的、自然原本给予我们的最好的一切，再次呈现，让每一个人都能在优美的环境中，乐活一生，做一个幸福的人。</p>
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
            <ul class="list1" >
                <li style="margin-left: 0;">
                    <p style="text-align: center;margin-bottom: 45px;">
                        <span class="name">固体废弃物处理</span>
                        <span class="border"></span>
                    </p>
                    <img src="/public/img/home/business/environment/environment_item1.jpg" alt="">
                    <p class="word">
                        雅居乐环保集团拥有成熟的固废垃圾处理技术和丰富的项目经验，除了传统的处理技术（填埋、焚烧等），在<span class="green">等离子气化、生物化再生利用</span>等方面有非常深入的研究。
                    </p>
                </li>
                <li>
                    <p style="text-align: center;margin-bottom: 45px;">
                        <span class="name">环境修复</span>
                        <span class="border"></span>
                    </p>
                    <img src="/public/img/home/business/environment/environment_item2.jpg" alt="">
                    <p class="word">
                        雅居乐环保集团环境修复业务当前主要聚焦<span class="green">水环境修复</span>。我们拥有完善的解决方案和创新的水体微生物活化技术，有着传统水环境修复技术无可比拟的优势。
                    </p>
                </li>
                <li>
                    <p style="text-align: center;margin-bottom: 45px;">
                        <span class="name">水务</span>
                        <span class="border"></span>
                    </p>
                    <img src="/public/img/home/business/environment/environment_item3.jpg" alt="">
                    <p class="word">
                        雅居乐环保集团的水务业务包括工业废水处理、自来水厂/污水处理厂，在海南、中山、佛山等地，雅居乐环保集团<span
                            class="green">拥有多座自来水厂和污水处理厂</span>。
                    </p>
                </li>
                <div class="clear"></div>
                <a target="_blank" href="http://www.environ.agile.com.cn/" class="btn-more">访问官网</a>

                <div class="side-list">
                    <ul>
                        <li class="side-tel">
                            <img src="/public/img/home/business/estate/detail/estate_icon1.png" alt="">
                            <div class="tel-box">(86)20-88839502</div>
                        </li>
                        <!--<li><a href=""><img src="/public/img/home/business/estate/detail/estate_icon2.png"-->
                                            <!--alt=""></a></li>-->
                        <!--<li><a href=""><img src="/public/img/home/business/estate/detail/estate_icon3.png"-->
                                            <!--alt=""></a></li>-->
                        <li class="side-xin"><img src="/public/img/home/business/estate/detail/estate_icon4.png"
                                            alt="">
                            <div class="xin-box">
                                <div class="box-head"></div>
                                <img src="/public/img/home/business/environment/two-code-environment.jpg" alt="" width="130">
                            </div>
                        </li>
                        <li class=""><a onclick="history.go(-1);"><img src="/public/img/home/business/estate/detail/estate_icon7.png" alt=""></a></li>
                        <li class="last"><a><img src="/public/img/home/business/estate/detail/estate_icon5.png" alt=""></a></li>

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
                onSlideChangeStart: function(swiper){
                    var index=swiper.activeLoopIndex;
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
