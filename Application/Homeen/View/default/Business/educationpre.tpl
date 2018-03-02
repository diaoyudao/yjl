<extend name="./Application/Homeen/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/business/business_educationpre.css">
</block>

<block name="title">学前教育-雅居乐集团</block>


<block name="body_main">
    <div id="education" class="section1">
        <div class="sliders">
            <div class="slider">
                <div class="pic-box">
                <img  src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                      simplified_image="{$head_images[0]['image_url1']}" class="pic">
                </div>
                <!--<div class="word">-->
                    <!--<div class="title">雅教育 乐人生</div>-->
                    <!--<div class="en">HAPPY  LIFE</div>-->
                <!--</div>-->
            </div>
        </div>


        <div class="content container">
            <p><span><a href="/en/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a href="/en/business/index?level_id=1000000125">多元业务</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span><a href="/en/business/education?level_id=1000000133">教育</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span>学前教育</span></p>

            <h2>雅居乐学前教育简介</h2>

            <div class="box">
                <p style="margin-bottom: 10x;">
                    雅居乐幼儿园隶属于雅居乐教育集团，旗下34所幼儿园，分布于广东省各市区和海南省。雅居乐幼儿园以"在体验中学习，在快乐中成长，中西教育优化结合，培养身心健康的全面发展的孩子"的办学理念，实施普惠，双语和国际多层次办学的模式，具有独特的不同办学层次的课程特色。雅居乐幼儿园以雅居乐地产为依托，幼儿园的数量正在快速的增加中。
                </p>
                <p style="margin-bottom: 0px">
                办学特色：</p>
                <p style="margin-bottom: 0px">1．双语幼儿园"英文＋"特色：每个幼儿园均开设国际班，让国际化品质和氛围着陆。</p>
                <p >2. 普惠幼儿园"阳光体育+"特色：加强三浴锻炼（日光、空气、水），保证孩子健康成长。</p>
                
                <p style="margin-bottom: 50px;">
                雅居乐幼儿园还将开办周末早教班、4:30学堂、少儿艺术团等课余课堂，为孩子们提供丰富多彩的成长体验。
                </p>

                <p style="color: #007069;">本事业部电话：020-88839308</p>
                <p style="color: #007069;">邮箱：zhaoxiaojie1@agile.com.cn</p>
            </div>
            

            <div class="side-list">
                <ul>
                    <li class="side-tel">
                        <img src="/public_en/img/home/business/estate/detail/estate_icon1.png" alt="">
                        <div class="tel-box">（86）020-88839308</div>
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
        </div>

        <div class="main">
            <div class="container" style="padding: 0;">
                <h2>代表园所</h2>

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

    </div>
</block>


<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(2).addClass("active").siblings().removeClass("active");
            SideList.top(600);
            SideList.tel();
            SideList.xin();
        })
    </script>
</block>
