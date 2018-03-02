<extend name="./Application/Homeen/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/business/business_life_tour.css">
</block>
<block name="title">Tourism Management-Agile Group</block>

<block name="body_main">
    <div class="top-box section1">
        <div class="pic-box">
            <img src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                 simplified_image="{$head_images[0]['image_url1']}" class="pic">
        </div>
        <!--<div class="word">-->
        <!--<p>雅方旅游</p>-->
        <!--<p class="en">TOURISM</p>-->
        <!--</div>-->
    </div>

    <div class="content container">
        <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                        href="/en/business/index?level_id=1000000125">Diversification of Business</a></span>&nbsp;&nbsp;
            > &nbsp;&nbsp;<a href="/en/business/life?level_id=1000000130"><span>A-Living</span></a>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;<span>Tourism Management</span>
        </p>
        <h2>About the Company</h2>
        <div class="word">
            <p>
                Afa Tourism, established in October 2015, leverages the O2O communityplatform ‘A-Steward’ to integrate
                tourism resources for the development of exclusive sightseeing routes, offering Agile homeowners,
                employees and potential buyers a distinctive tourist experience. We engage consumers in seamless
                communication through digital messaging, with a view to building a multifaceted virtual tourism and
                consumer ecosystem.
            </p>

        </div>
        <div style="margin-top: 70px; ">
            <img src="/public_en/img/home/business/life/tour/tour_yafang.jpg" alt="">
        </div>
    </div>


    <div class="section3">
        <div class="pic-box">
            <img src="{$middle_images[0]['image_url1']}" traditional_image="{$middle_images[0]['image_url2']}"
                 simplified_image="{$middle_images[0]['image_url1']}" class="pic"></div>
        <!--<div class="word">-->
        <!--<span>业务范围</span>-->
        <!--<p>雅方旅游公司突破传统跟团游的旅游模式，以主题游、亲子游、邮轮旅游、度假村产品</p>-->
        <!--<p>为主要线路产品；半自助游推出了攻略配酒店、景点门票、签证办理单订服务；</p>-->
        <!--<p>自助游、个性化定制也将会成为雅方旅游的特色业务。</p>-->
        <!--</div>-->
    </div>


    <div class="section2">
        <div class="content container">

            <h2>Core Value</h2>

            <div class="left">
                <img src="/public_en/img/home/business/life/tour/tour_p1.jpg" alt="">
            </div>
            <div class="right">
                <p>
                    A-Tourcombines travel and community under the ethos of ‘the world is your neighbour’. It is a
                    service platform where community, property and travel converge to form a targeted suite of rich,
                    personal and coherent travel solutions that based on the in-depth analysis of community data. </p>
                <p>
                    Moreover, A-Tour Consultantoffers customised services that combines the perspectives of a personal
                    butler and a travel consultant. The result is a seamless travel experience like no other.
                </p>
            </div>
            <div class="clear"></div>
            <a target="_blank" href="http://yfb2c.4006983383.com/" class="btn-more-s" style="margin-top: 70px; ">Visit
                Official Website</a>
        </div>

    </div>

    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public_en/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box">（86）020-88839247</div>
            </li>
            <!--<li><a href=""><img src="/public_en/img/home/business/estate/detail/estate_icon2.png" alt=""></a></li>-->
            <!--<li><a href=""><img src="/public_en/img/home/business/estate/detail/estate_icon3.png" alt=""></a></li>-->
            <li class="side-xin"><img src="/public_en/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public_en/img/home/business/life/tour/two-code-tour.jpg" alt="" width="130">
                </div>
            </li>
            <li class=""><a onclick="history.go(-1);"><img
                            src="/public_en/img/home/business/estate/detail/estate_icon7.png" alt=""></a></li>
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