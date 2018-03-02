<extend name="./Application/Homeen/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/business/business_educationcommunity.css">
</block>
<block name="title">社区教育-雅居乐集团</block>


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
        <p><span><a href="/en/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                href="/en/business/index?level_id=1000000125">多元业务</a></span>&nbsp;&nbsp;
            > &nbsp;&nbsp;<span><a href="/en/business/education?level_id=1000000133">教育</a></span>&nbsp;&nbsp;&nbsp; >
            &nbsp;&nbsp;<span>社区教育</span></p>

        <!--<h2>社区教育介绍</h2>-->
        <!--<div class="word">-->
        <!--<p>-->
        <!--雅居乐社区教育（雅学堂）是雅居乐教育投资管理有限公司旗下核心业务之一。立足于社区，打造高品质社区服务，成为社区内一站式教育文化中心。雅学堂的发展始终坚持开放式、共享式、专业式为办学思路。整合业内优秀资源，打造优质的社区教育生态系统。</p>-->
        <!--<p style="margin-top: 30px;">雅学堂根据不同的受众人群，全面覆盖社区中有教育需求的群体，开展三大板块：面向社区幼儿的雅学堂、面向社区家庭的社区部落以及面向全体社区群众的社区公益站。</p>-->
        <!--</div>-->
        <img src="/public_en/img/home/business/education/educationcommunity/community_p1.jpg" alt="" style="float: left;">
        <div class="box">
            <h2>雅居乐社区教育中心简介</h2>
            <p>
                雅居乐社区教育业务作为教育集团非体制教育业务重要的组成部分，立足雅居乐社区，并放眼城市，打造社区一站式优质的补充教育服务平台。对社区内不同的年龄人群开展不同的教育系列，致力于社区文化建设以及社区教育生态系统的完善。目前雅居乐社区教育中心拟开设三大业务系列，分别是：
                <span class="b">雅学堂系列</span>、<span class="b">培训教育系列</span>、<span class="b">社群部落系列</span>，通过三大业务系列的联动，为社区民众打造更完整的社区教育生态圈，为孩子提供专业、优质的成长环境，成为广大家长最贴心的教育服务管家！
            </p>
            <span class="tip">事业部电话：020-88839538</span><br>
            <span class="tip">邮箱：zhujin@agile.com.cn</span>
        </div>
    </div>

    <div class="section2">
        <h2 style="margin-bottom: 10px;">雅学堂系列</h2>
        <p>学堂板块是专门为0-12岁的孩设立的托辅系列。利用优质的早教服务机构和专业的师资力量，成立Day care学堂和430学堂。不仅可以为宝贝提供一个安全、快乐的早教环境，还能为家长解决孩子放学没人接等多种烦恼。</p>
        <img src="/public_en/img/home/business/education/educationcommunity/community_p2.jpg" alt="">
    </div>

    <div class="section3">
        <img src="/public_en/img/home/business/education/educationcommunity/community_p3.jpg" alt="" style="float: left;">
        <div class="box">
            <h2>培训教育系列</h2>
            <p>兴趣与素质的培训一直是家长在孩子成长过程中着重思考的事情。培训教育系列可通过种类繁多的优质兴趣课程为家长和孩子找到兴趣所在。成为孩子安全、优质的第二学校。培训教育系列开设课程有：</p>
            <div class="title">思维逻辑培训</div>
            <p>数学思维、乐高、机器人、手工、发明、科学实验等课程。</p>
            <div class="title">素质培训</div>
            <p>器乐、美术、舞蹈、声乐、表演、围棋、小主持人、模特等课程。</p>
            <div class="title">学科培优</div>
            <p>语数外等课程补习。</p>
        </div>
    </div>
    <div class="section4">
        <div style="width: 1000px;margin: auto">
            <img src="/public_en/img/home/business/education/educationcommunity/community_p4.jpg" alt=""
                 style="float: left;">
            <div class="box">
                <h2>社群部落系列</h2>
                <p>为了更好地完善社区文化建设和社区教育生态系统，雅居乐社区教育中心专门设立了社群部落系列。主要有:</p>
                <div class="title">父母邦</div>
                <p>烘焙、插花、美术、油画、摄影、马术、高尔夫等成人系列课程。</p>
                <div class="title">家庭教育</div>
                <p>亲子课堂、知识讲座等。</p>
                <div class="title">户外探索</div>
                <p>自然探索、冬令营、夏令营、周末营等户外探索活动。</p>
                <div class="title">公益文化活动</div>
                <p>社区图书馆、社区公益站、社区志愿者中心、老年人活动志愿者中心等。</p>
            </div>
            <div class="clear"></div>
        </div>
    </div>


    <div class="main">
        <div class="container">
            <h2>代表学校</h2>

            <ul class="box">
                <volist name="notice" id="item">
                    <li>
                        <a href="/en/news/detail?id={$item.notice_id}">
                            <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"  simplified_image="{$item.image_url1}" alt="">
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
    <!--<img src="/public_en/img/home/business/education/educationcommunity/sec2_p1.jpg" alt=""-->
    <!--style="margin-top: 30px;margin-bottom: 45px;">-->
    <!--<div class="word">-->
    <!--<p>-->
    <!--雅学堂的出现，第一，很好的解决了社区内业主对教育的需求。例如孩子的择校问题、放学后无人看管、培训班报名难与体验差、好的教育机构点太分散、寒暑假的孩子安置问题等等一系列的教育痛点。第二，雅学堂传承教育使命：立足培养孩子自身的思维逻辑、独立的人格、实践动手能力，和对创新的渴望。通过丰富多样的教育活动和教育内容，建立孩子的自信心、团队合作能力以及知识整合能力。</p>-->
    <!--<p style="margin-top: 30px;">雅学堂作为集团化、全国性的业务，未来三年将开展50+所不同的教育营地，为不同的城市的家庭提供优质教育的服务。</p>-->
    <!--<p style="margin-top: 30px;">-->
    <!--雅学堂作为雅居乐教育集团社区教育板块的主营业务，也是社区教育板块的代表。主要为0-12岁少儿提供高端教育资源。与国知名机构和教育职能部门建立合作关系，拥有教育核心资源及运营渠道。为孩子提供全方位的培训课程，全面提高孩子自身的思维逻辑、语言能力、心理和身体素质、健全的人格以及优秀的自我管理养成。为孩子创造一个优质全面的学习环境！同时也为放学后且没有人照看的少儿提供一个安全且有意义的场所。完美解决"放学去哪儿"的问题。</p>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->

    <!--<div class="section3">-->
    <!--<div class="container">-->
    <!--<h2 style="margin-bottom: 40px;">社区部落</h2>-->
    <!--<div class="word">-->
    <!--<p style="margin-bottom: 35px;">-->
    <!--90后日渐成为年轻的父母一代，新一代家庭大量涌现。如何正确地扮演父母的角色、处理亲子关系……都是90后父母需要学习的问题。雅居乐社区教育提供社区部落这款教育套装，通过丰富多姿的户外课程，不仅在建立孩子从自我，他人，自然世界这三个维度的认知，也在拓展眼界和知识面的同时，满足了家庭学习需求，从而进一步增加亲子之间的关系。也完美解决"周末家庭去哪儿"的问题。</p>-->
    <!--<div class="word-box">-->
    <!--<img src="/public_en/img/home/business/education/educationcommunity/sec3_p1.jpg" alt="">-->
    <!--<div class="box">-->
    <!--<div class="title">亲子课堂</div>-->
    <!--<p style="margin-top: 20px;">针对年轻父母的课程，教授育儿知识、沟通技巧，众多亲子沟通相处技巧；增进亲子互动、沟通，从小培养孩子与父母的沟通技巧。</p>-->
    <!--</div>-->
    <!--</div>-->
    <!--<div class="word-box">-->
    <!--<img src="/public_en/img/home/business/education/educationcommunity/sec3_p2.jpg" alt="">-->
    <!--<div class="box" style="left: 0;">-->
    <!--<div class="title">父母课堂</div>-->
    <!--<p style="margin-top: 20px;">开设父母沙龙：包括针对女性的烘培、插画、陶艺等课程;针对男士的音乐课堂、手工作坊等。</p>-->
    <!--</div>-->
    <!--</div>-->
    <!--<div class="word-box">-->
    <!--<img src="/public_en/img/home/business/education/educationcommunity/sec3_p3.jpg" alt="">-->
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
    <!--<img src="/public_en/img/home/business/education/educationcommunity/sec4_p1.jpg" alt="">-->
    <!--<p>社区志愿者中心</p>-->
    <!--</div>-->

    <!--<div class="box">-->
    <!--<div style="position: relative;float: left;">-->
    <!--<img src="/public_en/img/home/business/education/educationcommunity/sec4_p2.jpg" alt="">-->
    <!--<p>社区文化站</p>-->
    <!--</div>-->
    <!--<div class="right" style="position: relative;">-->
    <!--<img src="/public_en/img/home/business/education/educationcommunity/sec4_p3.jpg" alt="">-->
    <!--<p>街道文化站</p>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <!--<div class="right"style="position: relative;">-->
    <!--<img src="/public_en/img/home/business/education/educationcommunity/sec4_p4.jpg" alt="">-->
    <!--<p>老年人志愿者中心</p>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->


    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public_en/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box">（86）020-88839538</div>
            </li>
            <!--<li><a href=""><img src="/public_en/img/home/business/estate/detail/estate_icon2.png" alt=""></a></li>-->
            <!--<li><a href=""><img src="/public_en/img/home/business/estate/detail/estate_icon3.png" alt=""></a></li>-->
            <li class="side-xin"><img src="/public_en/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public_en/img/home/business/education/two-code-education.jpg" alt="" width="130">
                </div>
            </li>
            <li class=""><a onclick="history.go(-1);"><img src="/public_en/img/home/business/estate/detail/estate_icon7.png" alt=""></a></li>
            <li class="last"><a><img src="/public_en/img/home/business/estate/detail/estate_icon5.png" alt=""></a></li>
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