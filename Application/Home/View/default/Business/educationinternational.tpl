<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/business/business_educationinternational.css">
</block>

<block name="title">国际教育-雅居乐集团</block>


<block name="body_main">
    <div class="top-box section1">
        <div class="pic-box">
            <notempty name="head_images[0].image_url1">
                <img src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                     simplified_image="{$head_images[0]['image_url1']}" class="pic">
            </notempty>
        </div>
        <!--<div class="word">-->
        <!--<p>国际教育·赛过欧美人</p>-->
        <!--<p class="en">领先的环境服务投资运营商</p>-->
        <!--</div>-->
    </div>

    <div class="content container">
        <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                        href="/business/index?level_id=1000000125">多元业务</a></span>&nbsp;&nbsp;
            > &nbsp;&nbsp;<span><a href="/business/education?level_id=1000000133">教育</a></span>&nbsp;&nbsp;&nbsp; >
            &nbsp;&nbsp;<span>国际教育</span></p>

        <h2>国际教育简介</h2>
        <div class="word">
            <p>
                雅居乐国际教育是雅居乐教育集团旗下从事中外合作办学、国际教育管理和项目咨询的板块,秉承提供优质双语教育和高端国际教育的战略定位，实施全人教育，扩展学生的国际视野，培养面向世界的精英人才和适应不同文化背景的全球公民。
            </p>
            <p>
                雅居乐国际教育涵盖国际学校、国际教育项目(双语学校国际部)、留学语培、海外游学、出国留学等方面，覆盖从国际幼儿园、国际双语小学、国际初、高中及大学预科等K15全年龄段的国际教育领域。
            </p>
            <p>
                2017年7月，雅居乐教育集团与剑桥国际考试委员会（Cambridge International Examinations）签署战略合作协议，双方将在国际课程、教师培训和校际合作等方面展开更多交流。
            </p>
        </div>
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
            <li class="last"><a><img src="/public/img/home/business/estate/detail/estate_icon5.png" alt=""></a></li>

        </ul>
    </div>
</block>

<block name="footer_js">
    <script>
		$(function () {
			$(".header .nav li").eq(2).addClass("active").siblings().removeClass("active");
			SideList.top(400);
			SideList.tel();
			SideList.xin();
		});
    </script>
</block>