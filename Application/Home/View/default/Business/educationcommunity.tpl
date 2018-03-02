<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/business/business_educationcommunity.css">
</block>
<block name="title">培训教育-雅居乐集团</block>


<block name="body_main">
    <div class="top-box section1">
        <div class="pic-box">
            <img src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                 simplified_image="{$head_images[0]['image_url1']}" class="pic">
        </div>
        <!--<div class="word">-->
        <!--<p>社区教育·小红花送给你</p>-->
        <!--<p class="en">领先的环境服务投资运营商</p>-->
        <!--</div>-->
    </div>

    <div class="content container">
        <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                        href="/business/index?level_id=1000000125">多元业务</a></span>&nbsp;&nbsp;
            > &nbsp;&nbsp;<span><a href="/business/education?level_id=1000000133">教育</a></span>&nbsp;&nbsp;&nbsp; >
            &nbsp;&nbsp;<span>培训教育</span></p>

        <!--<h2>社区教育介绍</h2>-->
        <!--<div class="word">-->
        <!--<p>-->
        <!--雅居乐社区教育（雅学堂）是雅居乐教育投资管理有限公司旗下核心业务之一。立足于社区，打造高品质社区服务，成为社区内一站式教育文化中心。雅学堂的发展始终坚持开放式、共享式、专业式为办学思路。整合业内优秀资源，打造优质的社区教育生态系统。</p>-->
        <!--<p style="margin-top: 30px;">雅学堂根据不同的受众人群，全面覆盖社区中有教育需求的群体，开展三大板块：面向社区幼儿的雅学堂、面向社区家庭的社区部落以及面向全体社区群众的社区公益站。</p>-->
        <!--</div>-->
        <div class="box">
            <h2>雅居乐培训教育简介</h2>
            <p>
                培训教育板块致力于打造雅居乐教育集团体制外“全年龄段、全产品链条”的培训教育业务生态体系，通过优质教育培训产品的输出，落地不同业态的培训项目，无缝对接培训教育市场最前端资源，助力教育集团综合服务业务的发展。
            </p>
        </div>
    </div>

    <div class="section2">
        <div class="p-box">
            <h2 style="margin-bottom: 10px;">社区教育中心</h2>
            <p>
                打造“家门口一站式的优质教育文化活动中心”，主要提供社区教育、社区文化、社区公益服务。
                如：社区公益图书馆、社区托管服务、素质教育培训等。
            </p>
        </div>

        <img src="/public/img/home/business/education/educationcommunity/community-p1.jpg" alt="">

    </div>

    <div class="section3">
        <div class="p-box">
            <h2>户外教育中心</h2>
            <p>
                以“孩子的可能，超乎你的想象”为中心，打造全体验式优质的户外教育。
                主要提供社群部落、周末营地、夏令营、冬令营等户外探索活动。
            </p>
        </div>
        <img src="/public/img/home/business/education/educationcommunity/community-p2.jpg" alt="">

    </div>
    <div class="section4">

            <div class="p-box">
                <h2>培训教育生态中心</h2>
                <p>
                    整合培训市场优质项目资源，集成优秀项目、产品、师资、基地为一体的培训生态体系。
                    如：体育教育培训体系、托管产品培训体系、语言（考试）培训体系、教师能力培训中心等。
                </p>
            </div>
        <img src="/public/img/home/business/education/educationcommunity/community-p3.jpg" alt="">

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

    <!--<div class="section2">-->
    <!--<div class="container">-->
    <!--<h2>雅学堂</h2>-->
    <!--<img src="/public/img/home/business/education/educationcommunity/sec2_p1.jpg" alt=""-->
    <!--style="margin-top: 30px;margin-bottom: 45px;">-->
    <!--<div class="word">-->
    <!--<p>-->
    <!--雅学堂的出现，第一，很好的解决了社区内业主对教育的需求。例如孩子的择校问题、放学后无人看管、培训班报名难与体验差、好的教育机构点太分散、寒暑假的孩子安置问题等等一系列的教育痛点。第二，雅学堂传承教育使命：立足培养孩子自身的思维逻辑、独立的人格、实践动手能力，和对创新的渴望。通过丰富多样的教育活动和教育内容，建立孩子的自信心、团队合作能力以及知识整合能力。</p>-->
    <!--<p style="margin-top: 30px;">雅学堂作为集团化、全国性的业务，未来三年将开展50+所不同的教育营地，为不同的城市的家庭提供优质教育的服务。</p>-->
    <!--<p style="margin-top: 30px;">-->
    <!--雅学堂作为雅居乐教育集团社区教育板块的主营业务，也是社区教育板块的代表。主要为0-12岁少儿提供高端教育资源。与国知名机构和教育职能部门建立合作关系，拥有教育核心资源及运营渠道。为孩子提供全方位的培训课程，全面提高孩子自身的思维逻辑、语言能力、心理和身体素质、健全的人格以及优秀的自我管理养成。为孩子创造一个优质全面的学习环境！同时也为放学后且没有人照看的少儿提供一个安全且有意义的场所。完美解决“放学去哪儿”的问题。</p>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->

    <!--<div class="section3">-->
    <!--<div class="container">-->
    <!--<h2 style="margin-bottom: 40px;">社区部落</h2>-->
    <!--<div class="word">-->
    <!--<p style="margin-bottom: 35px;">-->
    <!--90后日渐成为年轻的父母一代，新一代家庭大量涌现。如何正确地扮演父母的角色、处理亲子关系……都是90后父母需要学习的问题。雅居乐社区教育提供社区部落这款教育套装，通过丰富多姿的户外课程，不仅在建立孩子从自我，他人，自然世界这三个维度的认知，也在拓展眼界和知识面的同时，满足了家庭学习需求，从而进一步增加亲子之间的关系。也完美解决“周末家庭去哪儿”的问题。</p>-->
    <!--<div class="word-box">-->
    <!--<img src="/public/img/home/business/education/educationcommunity/sec3_p1.jpg" alt="">-->
    <!--<div class="box">-->
    <!--<div class="title">亲子课堂</div>-->
    <!--<p style="margin-top: 20px;">针对年轻父母的课程，教授育儿知识、沟通技巧，众多亲子沟通相处技巧；增进亲子互动、沟通，从小培养孩子与父母的沟通技巧。</p>-->
    <!--</div>-->
    <!--</div>-->
    <!--<div class="word-box">-->
    <!--<img src="/public/img/home/business/education/educationcommunity/sec3_p2.jpg" alt="">-->
    <!--<div class="box" style="left: 0;">-->
    <!--<div class="title">父母课堂</div>-->
    <!--<p style="margin-top: 20px;">开设父母沙龙：包括针对女性的烘培、插画、陶艺等课程;针对男士的音乐课堂、手工作坊等。</p>-->
    <!--</div>-->
    <!--</div>-->
    <!--<div class="word-box">-->
    <!--<img src="/public/img/home/business/education/educationcommunity/sec3_p3.jpg" alt="">-->
    <!--<div class="box">-->
    <!--<div class="title">户外课堂</div>-->
    <!--<p style="margin-top: 20px;">-->
    <!--依托雅居乐旅游地产的优势，开展游艇、高尔夫、马术培训，在海南、云南等各地开展游学活动，在寒暑假进行冬令营和夏令营活动。游玩中学习，游玩中增进亲子互动，开阔孩子的视野，从小培养健康的体魄，包容多元的心态和好奇心的培养。</p>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->

    <!--<div class="section4">-->
    <!--<div class="container" style="padding: 0;">-->
    <!--<h2>文化公益</h2>-->
    <!--<p style="margin-bottom: 44px;">-->
    <!--在顾及少儿教育发展的同时，社区教育本着提供优质的、全方位的社区教育服务理念。面向全社区甚至街道不同年龄段的客户也有相应的公益项目。设立社区文化站、街道文化站、社区志愿者、老年人志愿者站等多个文化公益站点，联动举办读书节、设立图书馆一系列举动，满足客户需求。</p>-->
    <!--<div class="left">-->
    <!--<div class="box" style="margin-bottom: 17px;">-->
    <!--<img src="/public/img/home/business/education/educationcommunity/sec4_p1.jpg" alt="">-->
    <!--<p>社区志愿者中心</p>-->
    <!--</div>-->

    <!--<div class="box">-->
    <!--<div style="position: relative;float: left;">-->
    <!--<img src="/public/img/home/business/education/educationcommunity/sec4_p2.jpg" alt="">-->
    <!--<p>社区文化站</p>-->
    <!--</div>-->
    <!--<div class="right" style="position: relative;">-->
    <!--<img src="/public/img/home/business/education/educationcommunity/sec4_p3.jpg" alt="">-->
    <!--<p>街道文化站</p>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <!--<div class="right"style="position: relative;">-->
    <!--<img src="/public/img/home/business/education/educationcommunity/sec4_p4.jpg" alt="">-->
    <!--<p>老年人志愿者中心</p>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->


    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box">（86）020-88839538</div>
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