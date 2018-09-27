<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/enter/enter-group.css">
</block>
<block name="title">集团介绍-雅居乐集团</block>

<block name="body_main">
    <div class="section1">
        <img src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
             simplified_image="{$head_images[0]['image_url1']}" alt="" class="pic">

    </div>
    <div class="content container">
        <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                        href="/enter/index?level_id=1000000123">走进雅居乐</a></span>&nbsp;&nbsp;
            > &nbsp;&nbsp;<span>集团介绍</span></p>
        <h2>集团介绍</h2>


        <div class="word-box right">
            <p>
                雅居乐是一家以地产为主，多元业务并行的综合性企业集团。一直以来，雅居乐始终关注人们对美好生活的追求，致力于成为优质生活服务商。
            </p>
            <p>
                目前，雅居乐已形成地产、雅生活等八大产业集团并行运营的格局。旗下的雅居乐集团控股有限公司(HK3383)与雅生活集团(HK3319)已分别于2005年和2018年在香港上市。HK3383现为恒生综合指数、恒生环球综合指数、恒生港股通指数系列、恒生高股息率指数、恒生中国内地地产指数、恒生增幅指数及摩根士丹利中国指数和力宝专选中港地产指数的成份股。
            </p>
            <p>
                雅居乐的品牌理念是“一生乐活”。
            </p>
            <div class="title" style="font-size: 24px;margin-bottom:25px;">事实与数据</div>
            <img src="/public/img/home/enter/group/group1-s.jpg" traditional_image="/public/img/home/enter/group/group1-t.jpg" simplified_image="/public/img/home/enter/group/group1-s.jpg" alt="" style="width: 100%;">

            <div class="title" style="font-size: 24px;margin-bottom:25px;">八大产业集团</div>
            <div class="title">地产</div>
            <p>
                覆盖国内外60多个城市，近200个项目，打造的广州富春山居及海南清水湾等作品在海内外享有盛誉。
            </p>
            <div class="title">雅生活</div>
            <p>
                截至2018年6月，管理的物业覆盖全国27个省市自治区。总建筑面积为18563万平方米，拥有200多个项目，服务业主逾100万人。
            </p>
            <div class="title">环保</div>
            <p>
                聚焦固体废弃物、环境修复和水务三大领域，30多家下属企业和工厂，危废细分行业排名第一。
            </p>
            <div class="title">教育</div>
            <p>
                截至 2018 年 7 月，已在全国 18 个省（直辖市）、43个重点城市，开办运营各类办学机构近200所。
            </p>
            <div class="title">建设</div>
            <p>
                构筑贯穿建筑全产业链的“专业+系统”综合建设服务体系，为社会提供建筑与空间更优质、更智能的服务及综合解决方案。
            </p>
            <div class="title">房管</div>
            <p>
                向市场提供不动产全过程管理服务，为委托方打造高品质的产品和服务，从而实现项目价值最大化。
            </p>
            <div class="title">资本</div>
            <p>
                以基金管理、股权投资、金融资产投资和证券交易为主要业务方向，灵活运用多样化的金融产品和资本工具。
            </p>
            <div class="title">商业管理</div>
            <p>
                覆盖全国50多个城市，拥有购物中心、长租公寓、酒店及高尔夫等 100多个项目，总体量超300万方。
            </p>


        </div>
    </div>
</block>

<block name="footer_js">
    <script>
		$(function () {
			$(".header .nav li").eq(1).addClass("active").siblings().removeClass("active");
		});
    </script>
</block>