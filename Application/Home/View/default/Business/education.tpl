<extend name="./Application/Home/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/business/business_education.css">
</block>
<block name="title">教育-雅居乐集团</block>

<block name="body_main">
    <div id="education" class="section1">
        <div id="slider1" style="height: 490px;position: relative;overflow: hidden;">
            <!-- <div class="swiper-container">
                <div class="swiper-wrapper">
                    <volist name="head_images" id="item">
                        <div class="swiper-slide swiper-no-swiping">
                            <img src="{$item.image_url1}"
                                 traditional_image="{$item.image_url2}"
                                 simplified_image="{$item.image_url1}">
                        </div>
                    </volist>
                </div>
            </div>-->
            <div>
                <img src="{$head_image.image_url1}"
                     traditional_image="{$head_image.image_url2}"
                     simplified_image="{$head_image.image_url1}" class="pic">
            </div>

            <div class="butn">
                <div class="btn1 btn-s">
                    <a href="/business/educationpre?level_id=1000000184">
                        <div class="mask"></div>
                        <span style="display: none;"><img src="/public/img/home/business/education/education_btn1.png"
                                                          alt=""></span>
                        <div class="item" style="width: 200px;">
                            <span class="icon"><img src="/public/img/home/business/education/btn_icon1.png"
                                                    alt=""></span>
                            <span class="tip">学前教育</span>
                        </div>
                    </a>
                </div>
                <div class="btn2 btn-s">
                    <a href="/business/educationbase?level_id=1000000185">
                        <div class="mask"></div>
                        <span><img src="/public/img/home/business/education/education_btn2.png" alt=""></span>
                        <div class="item" style="display: none;">
                            <span class="icon"><img src="/public/img/home/business/education/btn_icon2.png"
                                                    alt=""></span>
                            <span class="tip">K12教育</span>
                        </div>
                    </a>
                </div>
                <div class="btn2 btn-s">
                    <a href="/business/educationinternational?level_id=1000000195">
                        <div class="mask"></div>
                        <span><img src="/public/img/home/business/education/education_btn3.png" alt=""></span>
                        <div class="item" style="display: none;">
                            <span class="icon"><img src="/public/img/home/business/education/btn_icon3.png"
                                                    alt=""></span>
                            <span class="tip">国际教育</span>
                        </div>
                    </a>
                </div>
                <div class="btn2 btn-s">
                    <a href="/business/educationcommunity?level_id=1000000196">
                        <div class="mask"></div>
                        <span><img src="/public/img/home/business/education/education_btn5.png" alt=""></span>
                        <div class="item" style="display: none;">
                            <span class="icon"><img src="/public/img/home/business/education/btn_icon5.png"
                                                    alt=""></span>
                            <span class="tip">培训教育</span>
                        </div>
                    </a>
                </div>
                <div class="btn2 btn-s">
                    <a class="aler">
                        <div class="mask"></div>
                        <span><img src="/public/img/home/business/education/education_btn6.png" alt=""></span>
                        <div class="item" style="display: none;">
                            <span class="icon"><img src="/public/img/home/business/education/btn_icon6.png"
                                                    alt=""></span>
                            <span class="tip">高等教育</span>
                        </div>
                    </a>
                </div>

            </div>
        </div>

        <div class="content container">
            <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                            href="/business/index?level_id=1000000125">多元业务</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span>教育</span></p>

            <h2>雅居乐教育集团简介</h2>

            <img src="/public/img/home/business/education/education_logo.jpg" alt="" style="float: left;">

            <div class="box">
                <div class="title">专业集团</div>
                <p>
                    雅居乐集团具有深远的家学渊源，将教育作为集团多元发展的重要战略支点，旗下的子公司雅居乐教育集团更是致力于发展优质双语教育和高端国际教育。
                </p>
                <div class="title">教育情怀</div>
                <p>
                    陈卓林主席发扬家族的重教之风，大力支持教育慈善活动，广布甘霖润泽万千学子，近十五年来,雅居乐慈善公益捐赠金额累计高达12亿元，其中教育单项捐赠4.4亿多元。陈卓林主席更荣获“中山教育年度人物”称号。
                </p>
                <div class="title">五大教育板块</div>
                <p>
                    雅居乐教育集团集重资布局教育产业，现已逐步构建起以学前教育、K12教育、国际教育、高等教育、培训教育为核心的五大教育产业板块，形成了独具雅居乐特色的教育体系，秉承中西汇通、创新包容的教育理念，携手国内外知名教育机构，共同建设具有核心竞争力的综合性的教育集团。
                </p>
                <p>截止2017年，雅居乐教育集团共开办学校（园）五十余所，学生规模两万五千余人。</p>
                <p>雅居教育集团立志要成为中国优质教育专家，为中国的教育事业树立光辉典范，真正让雅居乐百年树人的教育情怀，落地生根！</p>
            </div>
            <div class="clear"></div>
            <a target="_blank" href="http://www.agile-edu.cn/" class="btn-more">访问官网</a>

            <div class="side-list">
                <ul>
                    <li class="side-tel">
                        <img src="/public/img/home/business/estate/detail/estate_icon1.png" alt="">
                        <div class="tel-box">（86）020-88839848</div>
                    </li>
                    <!--<li><a href=""><img src="/public/img/home/business/estate/detail/estate_icon2.png" alt=""></a>-->
                    <!--</li>-->
                    <!--<li><a href=""><img src="/public/img/home/business/estate/detail/estate_icon3.png" alt=""></a>-->
                    <!--</li>-->
                    <li class="side-xin"><img src="/public/img/home/business/estate/detail/estate_icon4.png" alt="">
                        <div class="xin-box">
                            <div class="box-head"></div>
                            <img src="/public/img/home/business/education/two-code-education.jpg" alt="" width="130">
                        </div>
                    </li>
                    <li class=""><a onclick="history.go(-1);"><img
                                    src="/public/img/home/business/estate/detail/estate_icon7.png" alt=""></a></li>
                    <li class="last"><a><img src="/public/img/home/business/estate/detail/estate_icon5.png" alt=""></a>
                    </li>
                </ul>
            </div>
        </div>


        <div class="main">
            <div class="container" style="width: 1274px;">
                <h2>代表学校</h2>

                <!-- <ul class="box">
                    <volist name="notice" id="item">
                        <li>
                            <a href="/news/detail?id={$item.notice_id}">
                                <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                     simplified_image="{$item.image_url1}" alt="">
                            </a>
                            <span class="name">{$item.name}</span>
                        </li>
                    </volist>


                </ul>-->
                <div class="banner" id="slider2" style="height: 320px;overflow: hidden;">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <volist name="notice" id="item">

                                <div class="swiper-slide swiper-no-swiping">
                                    <div class="box" style=" position: relative;margin:0 7px;">
                                        <a href="/news/detail?id={$item.notice_id}">
                                            <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                                 simplified_image="{$item.image_url1}" alt=""
                                                 style="width: 320px;height: 250px;left: 0;margin: 0;">
                                        </a>
                                        <span class="name">{$item.name}</span>
                                    </div>

                                </div>
                            </volist>
                        </div>
                    </div>

                </div>
                <span class="prev"><img src="/public/img/home/common/btn_prev1.png" alt=""></span>
                <span class="next"><img src="/public/img/home/common/btn_next1.png" alt=""></span>
                <div class="pagination"></div>
            </div>


        </div>

    </div>
</block>


<block name="footer_js">
    <script>
		$(function () {
			$(".header .nav li").eq(2).addClass("active").siblings().removeClass("active");
			SideList.top(400);
			SideList.tel();
			SideList.xin();

//            var mySwiper1 = $('#slider1 .swiper-container').swiper({
//                loop: true,
//                noSwiping: true,
//                autoplay: 3000,
//                speed: 1000,
//                onSlideChangeStart: function (swiper) {
//                    var index = swiper.activeLoopIndex;
//                    $(".btn-s").find(".item").hide().siblings("span").show();
//                    $(".btn-s").eq(index).find(".item").show().siblings("span").hide();
//                }
////                pagination: '#bannerpagination',
////                paginationClickable: true,
////                grabCursor: true,
////                parallax: true,
//                //其他设置
//            });

			//            按钮动画
//            $("#education .butn>div:not(.btn1)").find(".mask").one("mouseover", function () {
//                $(".btn1").find(".item").animate({width: "80px"}, 200, function () {
//                    $(this).hide().siblings("span").show();
//                });
//            })

			$("#education .butn .mask").on("mouseover", function (e) {
				e.stopPropagation()
				var index = $(this).parents(".btn-s").index();
				$(".btn-s").find(".item").hide().siblings("span").show();
				$(this).siblings(".item").show().siblings("span").hide();
//                mySwiper1.swipeTo(index, 1000, true);
//                mySwiper1.stopAutoplay();
			})

			var mySwiper2 = $('#slider2 .swiper-container').swiper({
				loop: true,
				noSwiping: true,
				autoplay: 3000,
				speed: 300,
				slidesPerView: 3,
				pagination: '.main .container .pagination',
				paginationClickable: true,
//                grabCursor: true,
//                parallax: true,
				//其他设置
			});


//            var mySwiper2 = $('#slider2 .swiper-container').swiper({
//                loop: true,
//                noSwiping: true,
//                autoplay: 3000,
//                speed: 1000,
////                onSlideChangeStart: function (swiper) {
////                    var index = swiper.activeLoopIndex;
////                    $(".btn-s").find(".item").hide().siblings("span").show();
////                    $(".btn-s").eq(index).find(".item").show().siblings("span").hide();
////                }
////                pagination: '#bannerpagination',
////                paginationClickable: true,
////                grabCursor: true,
////                parallax: true,
//                //其他设置
//            });
			$('.main .container .prev').click(function () {
				mySwiper2.swipePrev();
			});
			$('.main .container .next').click(function () {
				mySwiper2.swipeNext();
			});


//            $("#education .butn .mask").on("mouseout", function (e) {
//                e.stopPropagation()
//                var index = $(this).index();
//                $(this).siblings(".item").animate({width: "80px"}, 200, function () {
//                    $(this).hide().siblings("span").show();
//                });
//            })
		})
    </script>
</block>
