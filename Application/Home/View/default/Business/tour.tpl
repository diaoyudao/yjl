<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/business/business_life_tour.css">
</block>
<block name="title">旅游-雅居乐集团</block>

<block name="body_main">
    <div class="top-box section1">
        <div class="pic-box">
            <img  src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                  simplified_image="{$head_images[0]['image_url1']}" class="pic">
        </div>
        <!--<div class="word">-->
            <!--<p>雅方旅游</p>-->
            <!--<p class="en">TOURISM</p>-->
        <!--</div>-->
    </div>

    <div class="content container">
        <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                href="/business/index?level_id=1000000125">多元业务</a></span>&nbsp;&nbsp;
            > &nbsp;&nbsp;<a href="/business/life?level_id=1000000130"><span>雅生活</span></a>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;<span>旅游</span>
        </p>
        <h2>公司介绍</h2>
        <div class="word">
            <p>广州市雅方旅游有限公司成立于2015年10月。公司借助“雅管家”社区O2O生活平台，整合优质旅游资源，开发专属旅游线</p>
            <p>路为核心产品，为雅居乐社区业主、集团内部员工及购房潜在客户提供独立性旅游体验。通过数字化信息实现</p>
            <p>与消费者之间的无缝交互，并引导建立网络化、立体化的旅游生态与消费圈。</p>
        </div>
        <div style="margin-top: 70px; ">
            <img src="/public/img/home/business/life/tour/tour_yafang.jpg" alt="">
        </div>
    </div>


    <div class="section3">
        <div class="pic-box">
            <img  src="{$middle_images[0]['image_url1']}" traditional_image="{$middle_images[0]['image_url2']}"
                  simplified_image="{$middle_images[0]['image_url1']}" class="pic">        </div>
        <!--<div class="word">-->
            <!--<span>业务范围</span>-->
            <!--<p>雅方旅游公司突破传统跟团游的旅游模式，以主题游、亲子游、邮轮旅游、度假村产品</p>-->
            <!--<p>为主要线路产品；半自助游推出了攻略配酒店、景点门票、签证办理单订服务；</p>-->
            <!--<p>自助游、个性化定制也将会成为雅方旅游的特色业务。</p>-->
        <!--</div>-->
    </div>


    <div class="section2">
        <div class="content container">

            <h2>核心价值</h2>

            <div class="left">
                <img src="/public/img/home/business/life/tour/tour_p1.jpg" alt="">
            </div>
            <div class="right">
                <p>
                    雅方旅游将旅游与社区进行融合，以“结伴邻里”为理念，致力于打造特色“社区+物业+旅游”的综合服务平台。通过精准分析社区家庭的个性化需求，提供一整套“精准的需求+丰富的产品+零距离的服务+基于同一场景的关联服务”的出行方案。</p>
                <p>此外，“雅方旅程管家”专人服务，集物业服务管家和旅程管家于一体,为业主提供一体化旅程服务。</p>
            </div>
            <div class="clear"></div>
            <a target="_blank" href="http://yfb2c.4006983383.com/" class="btn-more" style="margin-top: 70px; ">访问官网</a>
        </div>

    </div>

    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box">（86）020-88839247</div>
            </li>
            <!--<li><a href=""><img src="/public/img/home/business/estate/detail/estate_icon2.png" alt=""></a></li>-->
            <!--<li><a href=""><img src="/public/img/home/business/estate/detail/estate_icon3.png" alt=""></a></li>-->
            <li class="side-xin"><img src="/public/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public/img/home/business/life/tour/two-code-tour.jpg" alt="" width="130">
                </div>
            </li>
            <li class=""><a onclick="history.go(-1);"><img src="/public/img/home/business/estate/detail/estate_icon7.png" alt=""></a></li>
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