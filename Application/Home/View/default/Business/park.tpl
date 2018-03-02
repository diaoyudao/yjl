<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/business/business_life_park.css">
</block>
<block name="title">园林-雅居乐集团</block>

<block name="body_main">
    <div class="top-box section1">
        <div class="pic-box">
            <img  src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                  simplified_image="{$head_images[0]['image_url1']}" class="pic">
        </div>
        <!--<div class="word">-->
            <!--<p>雅玥园林</p>-->
        <!--</div>-->
    </div>

    <div class="content container">
        <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                href="/business/index?level_id=1000000125">多元业务</a></span>&nbsp;&nbsp;
            > &nbsp;&nbsp;<a href="/business/life?level_id=1000000130"><span>雅生活</span></a>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;<span>园林</span>
        </p>
        <h2>公司介绍</h2>
        <div class="word">
            <p>广州市雅玥园林工程有限公司成立于2015年10月，是一家专业的园林工程公司。</p>
            <p>公司经济及技术力量雄厚，管理规范严谨，经营体制科学高效，拥有专业设计、施工团队和丰富苗圃资源。</p>
            <p>公司成立至今已承接70多个工程，签约面积约195万平方米，签约额达3.2亿元。</p>
            <p>目前业务已覆盖华南、华东、西南、华中、华北等地区。</p>
        </div>
    </div>


    <div class="section3">
        <div class="pic-box">
            <img  src="{$middle_images[0]['image_url1']}" traditional_image="{$middle_images[0]['image_url2']}"
                  simplified_image="{$middle_images[0]['image_url1']}" class="pic">        </div>
        <div class="word">
            <!--<span>业务范围</span>-->
            <!--<p>公司主营业务包括园林工程施工、园林景观设计、绿化养护和苗木生产、销售。</p>-->
        </div>
    </div>


    <div class="section2">
        <div class="content container">

            <h2>核心价值</h2>

            <div class="left">
                <img src="/public/img/home/business/life/park/park_p1.jpg" alt="">
            </div>
            <div class="right">
                <p>雅玥园林秉承着诚信为本，保质量、保安全的经营理念，致力于地产住宅园林绿化环境的建设和发展。</p>
                <p>公司本着“诚信、团结、务实”的本质，强调“以人才为资本、以服务为导向”的经营方针，奉行“坚持规范标准化，以精品求发展”的质量标准，提倡“科学、严谨、开拓、创新”的和谐、持续发展，始终追求卓越品质，力求塑造经典景观。</p>
            </div>
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