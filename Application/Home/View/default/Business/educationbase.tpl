<extend name="./Application/Home/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/business/business_educationbase.css">
</block>
<block name="title">K12教育-雅居乐集团</block>


<block name="body_main">
    <div id="education" class="section1">
        <div class="sliders">
            <div class="slider">
                <div class="pic-box">
                    <img src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                         simplified_image="{$head_images[0]['image_url1']}" class="pic">
                </div>
                <!--<div class="word">-->
                <!--<div class="title">雅教育 乐人生</div>-->
                <!--<div class="en">HAPPY  LIFE</div>-->
                <!--</div>-->
            </div>
        </div>


        <div class="content container">
            <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                            href="/business/index?level_id=1000000125">多元业务</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span><a href="/business/education?level_id=1000000133">教育</a></span>&nbsp;&nbsp;&nbsp; >
                &nbsp;&nbsp;<span>K12教育</span></p>

            <h2>雅居乐K12教育简介</h2>

            <div class="box">
                <p>
                    基础教育板块主要以双语教学和个性发展为特色，实施中国传统教育与国际先进教育相融合的双语教育，学校具有核心的德育特色、体能特色和信息化特色，让学生不仅在国内传统教育体系下拥有明显的竞争优势，又可在外语能力、学习方法和文化理念上实现与英美教育体系的无缝对接。 </p>
                <p>
                    雅居乐教育集团与中山市纪念中学合办的中山纪中雅居乐凯茵学校，连续两年中考成绩名列全省前茅，已成为当地教育的特色“名片”，更是雅居乐教育高水准办学的具体体现。
                </p>
                <p>
                    雅居乐纪中三鑫凯茵学校是雅居乐教育集团与中山市纪中三鑫双语学校强强联手创办的全日制民办学校（小学及幼儿园）。学校总占地面积38322.58平方米，绿地率超50%，按36个班国际标准小学和9个班省一级标准幼儿园设置及配备教育资源，立志培养具有高雅志趣、博雅学识、文雅风范的国际创新型人才。
                </p>
                <p>
                    海南雅居乐双语学校由雅居乐教育集团倾力创办，坐落于世界最美纬度--北纬18°、风光旖旎的海南清水湾畔，集幼儿园、小学、初中与高中四个学段为一体，是一所按国际教育办学标准建设的学校，拥有世界领先的教学设施和雄厚的师资队伍。
                </p>
                <p>
                    此外，西安、常州、贵阳、成都等地的雅居乐双语学校即将开办。
                </p>

            </div>


            <div class="side-list">
                <ul>
                    <li class="side-tel">
                        <img src="/public/img/home/business/estate/detail/estate_icon1.png" alt="">
                        <div class="tel-box">（86）020-88839848</div>
                    </li>
                    <!--<li><a href=""><img src="/public/img/home/business/estate/detail/estate_icon2.png" alt=""></a></li>-->
                    <!--<li><a href=""><img src="/public/img/home/business/estate/detail/estate_icon3.png" alt=""></a></li>-->
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
            <div class="container">
                <h2>代表学校</h2>

                <ul class="box">
                    <volist name="notice" id="item">
                        <li>
                            <a href="/news/detail?id={$item.notice_id}">
                                <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                     simplified_image="{$item.image_url1}" alt="">
                            </a>
                            <span class="name">{$item.name}</span>
                        </li>
                    </volist>


                </ul>
            </div>


        </div>

    </div>
</block>


<block name="footer_js">
    <script>
		$(function () {
			$(".header .nav li").eq(2).addClass("active").siblings().removeClass("active");
			SideList.top(600);
			SideList.tel();
			SideList.xin();
		})
    </script>
</block>
