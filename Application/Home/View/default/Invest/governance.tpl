<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/invest/invest-governance.css">
</block>
<block name="title">企业管治-雅居乐集团</block>

<block name="body_main">
    <div class="top-box section1">
        <div class="pic-box">
            <img src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                 simplified_image="{$head_images[0]['image_url1']}" class="pic">
        </div>
    </div>

    <div class="content container section1">
        <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span><a
                href="/invest/index?level_id=1000000136">投资者关系</a></span>
            &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span>企业管治</span>
        </p>
    </div>
    <div class="contain">
        <a class="item" href="/invest/control?level_id=1000000197">
            <div class="cover"></div>
            <span class="word">管治理念</span>
        </a>
        <a class="item" href="/invest/directorate" style="margin-left: 28px;background-image: url('/public/img/home/invest/governance_p2.jpg')">
            <div class="cover"></div>
            <span class="word">董事会</span>
        </a>
        <a class="item" href="/invest/committee" style="background-image: url('/public/img/home/invest/governance_p3.jpg')">
            <div class="cover"></div>
            <span class="word">董事委员会</span>
        </a>
        <a class="item" href="/invest/monitored" style="margin-left: 28px;background-image: url('/public/img/home/invest/governance_p4.jpg')">
            <div class="cover"></div>
            <span class="word">内部监控</span>
        </a>
        <div class="clear"></div>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(3).addClass("active").siblings().removeClass("active");

            $(".item").mouseover(function () {
                $(this).find(".cover").css({visibility:"visible"});
                $(this).find(".word").css({visibility:"visible"});
            })
            $(".item").mouseout(function () {
                $(this).find(".cover").css({visibility:"hidden"});
                $(this).find(".word").css({visibility:"hidden"});
            })
        });
    </script>
</block>