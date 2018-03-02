<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/business/business_hotel.css">
</block>
<block name="title">酒店-雅居乐集团</block>
<block name="head_menu">
    <a class="tip">酒店/</a>
</block>
<block name="body_main">
    <div class="">
        <img src="{$mobile_head_images[0].image_url1}" traditional_image="{$mobile_head_images[0].image_url2}"
             simplified_image="{$mobile_head_images[0].image_url1}" alt="" class="tags-img">
    </div>
    <div class="bgc container cl  pt-20 pb-20">
        <div class="search">
            <input placeholder="请输入酒店名或关键词" class="txt-center input left">
            <span class="butn txt-center left">查询</span>
        </div>
    </div>
    <div>
        <img src="/public/img/mobile/business/hotel/logo-hotel.jpg" class="tags-img">
    </div>
    <div class="container mt-20 mb-30">
        <h2 class="txt-center">雅居乐集团酒店管理公司</h2>
        <div class="mt-20">
            <img src="/public/img/mobile/business/hotel/hotel-pic.jpg" class="tags-img">
        </div>
        <div class="mt-10">
            <p>
                雅居乐集团酒店管理公司成立于2008年,总部位于广州。
            </p>
            <h3 class="mt-20">
                品牌
            </h3>
            <p class="mt-15">
                拥有超过 20
                间品牌酒店,位于广东、上海、江苏、海南、四川、湖南、云南等地,并与全球十多个知名国际酒店集团合作,包括洲际酒店集团、雅高酒店集团、卓美亚酒店集团、万豪国际酒店集团、喜达屋酒店集团、希尔顿酒店集团、豪生国际酒店集团、嘉佩乐酒店集团、凯悦酒店集团及豪瑞格酒店集团等。
            </p>
        </div>
        <div id="much" class="row cl mt-20 main-btn">
            查看更多
        </div>
        <div id="text_more" class="me-hidden">
            <h3 class="mt-20">
                特色
            </h3>
            <p class="mt-15">
                雅居乐酒店致力为客人提供最舒适入住体验,并融合当地特色文化,创造别具特色的项目,深受广大客人欢迎。凭借专业的服务和经营,雅居乐集团在酒店营运业务取得理想的成绩。
            </p>
            <h3 class="mt-20">
                详情
            </h3>
            <p class="mt-15">
                酒店管理公司经营的多间酒店持续提供稳定收入,分别是上海雅居乐万豪酒店、海南雅居莱佛士酒店、惠州白鹭湖雅居乐喜来登度假酒店、成都雅居乐豪生大酒店、海南清水湾假日度假酒店、佛山雅居乐酒店、中山雅居乐酒店及腾冲雅居乐原乡客栈,还有逾10间酒店正处于规划、兴建及装修阶段,包括广西南宁希尔顿酒店/希尔顿花园酒店、海南清水湾
                JW万豪酒店、海南清水湾希尔顿酒店、扬州凯乐嘉轩酒店、长沙灰汤豪生温泉大酒店、海南卓美亚酒店、海南文昌假日酒店、腾冲嘉佩乐酒店、无锡豪生行政公寓、海南豪瑞格酒店、腾冲希尔顿酒店等。
            </p>

        </div>
    </div>
</block>

<block name="body_side">
    <div class="side-list">
        <ul>

            <li class="side-xin"><img src="/public/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public/img/home/business/hotel/two-code-hotel.jpg" alt="">
                </div>
            </li>
            <li class=""><a><img src="/public/img/mobile/base/go-top.jpg" alt=""></a></li>
        </ul>
    </div>
</block>

<block name="footer_js">
    <script>

        $(function () {
//            查询按钮点击事件
            $(".search .butn").click(function () {
                var keyword = $(".search .input").val();
                if ("请输入酒店名称或关键词" == keyword) {
                    keyword = "";
                }
                location.href = "/business/hotellists?level_id=1000000131&keyword=" + keyword;
            })

            $(" #much").click(function () {
                $("#text_more").show();
                $(this).hide();
            })

        })

    </script>
</block>