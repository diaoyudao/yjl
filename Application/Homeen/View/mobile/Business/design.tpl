<extend name="./Application/Homeen/View/default/base/common.tpl"/>
<block name="title">设计-雅居乐集团</block>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/business/business_life_design.css">
</block>
<block name="body_main">
    <div class="top-box section1">
        <div class="pic-box">
            <img  src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                  simplified_image="{$head_images[0]['image_url1']}" class="pic">
        </div>
        <!--<div class="word">-->
            <!--<p>原构设计</p>-->
        <!--</div>-->
    </div>

    <div class="content container">
        <p><span><a href="/en/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                href="/en/business/index?level_id=1000000125">多元业务</a></span>&nbsp;&nbsp;
            > &nbsp;&nbsp;<a href="/en/business/life?level_id=1000000130"><span>雅生活</span></a>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;<span>设计</span>
        </p>
        <h2>公司介绍</h2>
        <div class="word">
            <p>广州市原构设计有限公司成立于2015年，是拥有室内、景观、绿化等多项设计资质的专业化设计团队。</p>
            <p>公司通过不断融合和发展以及对房地产市场的深入理解，专注于为客户打造完美作品，</p>
            <p>致力于成为设计行业的标杆企业。</p>
        </div>
    </div>


    <div class="section3">
        <div class="pic-box">
            <img  src="{$middle_images[0]['image_url1']}" traditional_image="{$middle_images[0]['image_url2']}"
                  simplified_image="{$middle_images[0]['image_url1']}" class="pic">
        </div>
        <!--<div class="word">-->
            <!--<span>业务范围</span>-->
            <!--<p>目前主要从事室内、景观、绿化等专业设计。除承接设计业务，还通过与国际化设计公司合作拓展业务范围。</p>-->
            <!--<p>未来公司计划通过与其他设计公司并购、重组的拓展策略，不断提高设计能力、业务范围和行业竞争力，</p>-->
            <!--<p>着眼于打造一流的专业设计机构。</p>-->
        <!--</div>-->
    </div>


    <div class="section2">
        <div class="content container">

            <h2>核心价值</h2>
            <p>原构设计公司注重全程质量控制，始终贯彻设计质量第一和服务第一的原则。</p>
            <img src="/public_en/img/home/business/life/design/design_p1.jpg" alt="">

        </div>
    </div>

</block>

<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(2).addClass("active").siblings().removeClass("active");
        });
    </script>
</block>