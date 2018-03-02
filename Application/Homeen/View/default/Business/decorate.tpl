<extend name="./Application/Homeen/View/default/base/common.tpl"/>
<block name="title">装饰-雅居乐集团</block>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/business/business_life_tour.css">
</block>
<block name="body_main">
    <div class="top-box section1">
        <div class="pic-box">
            <img  src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                  simplified_image="{$head_images[0]['image_url1']}" class="pic">
        </div>
        <!--<div class="word" style="width: 100%;top:200px;left: 0;margin: 0;">-->
            <!--<p>时兴装饰</p>-->
        <!--</div>-->
    </div>

    <div class="content container">
        <p><span><a href="/en/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                href="/en/business/index?level_id=1000000125">多元业务</a></span>&nbsp;&nbsp;
            > &nbsp;&nbsp;<a href="/en/business/life?level_id=1000000130"><span>雅生活</span></a>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;<span>装饰</span>
        </p>
        <h2>公司介绍</h2>
        <div class="word">
            <p>中山市时兴装饰有限公司成立于2000年3月，是集木制品制造服务与装饰工程于一体的专业化装饰公司。</p>
            <p>现有厂房50000平方米，位于中山市三乡镇105国道广珠路段，地理环境优越。</p>
        </div>
    </div>


    <div class="section3">
        <div class="pic-box">
            <img  src="{$middle_images[0]['image_url1']}" traditional_image="{$middle_images[0]['image_url2']}"
                  simplified_image="{$middle_images[0]['image_url1']}" class="pic">
        </div>
        <!--<div class="word">-->
            <!--<span>业务范围</span>-->
            <!--<p>司引进现代化生产线及机械设备，设有实木车间、喷漆车间、板式车间，</p>-->
            <!--<p>生产及销售橱柜、衣柜、洗手台、木门、吸塑门、固装木饰面、板式家具等全屋定制家具；</p>-->
            <!--<p>承接外环境工程、批量室内装修工程、木制品配套、房屋精装修、</p>-->
            <!--<p>酒店装修设计与施工等业务</p>-->
        <!--</div>-->
    </div>


    <div class="section2" style="text-align: center;overflow: hidden;padding-bottom: 100px;">
        <h2 style="margin-top: 80px;margin-bottom: 30px;">核心价值</h2>
        <p style="margin-bottom: 50px;font-size: 15px">时兴装饰公司凭借一流的产品质量和独特的设计理念，为客户提供优质的产品和居住体验。</p>
        <img src="/public_en/img/home/business/life/decorate/p1.jpg" alt="">
    </div>

    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public_en/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box">（86）0760-86368023</div>
            </li>
            <!--<li><a href=""><img src="/public_en/img/home/business/estate/detail/estate_icon2.png" alt=""></a></li>-->
            <!--<li><a href=""><img src="/public_en/img/home/business/estate/detail/estate_icon3.png" alt=""></a></li>-->
            <li class="side-xin"><img src="/public_en/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public_en/img/home/business/decorate/two-code-decorate.jpg" alt="" width="130">
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