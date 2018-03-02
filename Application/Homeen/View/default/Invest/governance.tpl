<extend name="./Application/Homeen/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/invest/invest-governance.css">
</block>
<block name="title">Corporate Governance-Agile Group</block>

<block name="body_main">
    <div class="top-box section1">
        <div class="pic-box">
            <img src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                 simplified_image="{$head_images[0]['image_url1']}" class="pic">
        </div>
    </div>

    <div class="content container section1">
        <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span><a
                href="/en/invest/index?level_id=1000000136">Investor Relations</a></span>
            &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span>Corporate Governance</span>
        </p>
    </div>
    <div class="contain">
        <a class="item" href="/en/invest/control?level_id=1000000197">
            <div class="cover"></div>
            <span class="word">Corporate Governance</span>
        </a>
        <a class="item" href="/en/invest/directorate" style="margin-left: 28px;background-image: url('/public_en/img/home/invest/governance_p2.jpg')">
            <div class="cover"></div>
            <span class="word">Board of Directors</span>
        </a>
        <a class="item" href="/en/invest/committee" style="background-image: url('/public_en/img/home/invest/governance_p3.jpg')">
            <div class="cover"></div>
            <span class="word">Board Committees</span>
        </a>
        <a class="item" href="/en/invest/monitored" style="margin-left: 28px;background-image: url('/public_en/img/home/invest/governance_p4.jpg')">
            <div class="cover"></div>
            <span class="word">Internal Control</span>
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