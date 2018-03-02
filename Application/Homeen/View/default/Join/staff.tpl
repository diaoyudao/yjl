<extend name="./Application/Homeen/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/join/join-staff.css">
</block>
<block name="title">Join Agile-Agile Group</block>

<block name="body_main">
    <div class="section1">
        <div class="pic-box">
            <img src="{$head_images[0].image_url1}" traditional_image="{$head_images[0].image_url2}"
                 simplified_image="{$head_images[0].image_url1}" alt="" class="pic">
            <div class="container" style="position: relative;">
                <!--<div class="head-txt">-->
                    <!--<p class="fir">员工发展</p>-->
                    <!--<p>学习卓越 加速成长</p>-->
                <!--</div>-->
            </div>
        </div>
        <div class="content container">
            <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                    href="/join/index?level_id=1000000135">Join Agile</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span>Employee Development</span></p>
            <p class="text" style="font-size: 15px">At Agile, we believe that work and life are closely knitted together, in particular when it comes to personal growth. We strive for excellence and efficiency as one team under one set of guiding principles that emphasises on systematic, professional, regulated and result-oriented operations on every organisational level at work. Outside of the workplace, we promote well-being and sports to ensure a wholesome growth and happiness for all members of our employees.</p>
        </div>
    </div>


    <div class="section5">
        <div class="content container">
            <a href="/en/join/development?level_id=1000000201" class="title">Corporate Cultural Activities</a>

            <div class="news-box">
                <div class="left" style="width:551px;">
                    <volist name="notices" id="item" offset="0" length="1">
                        <a href="/en/news/detail?id={$item.notice_id}">
                            <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                 simplified_image="{$item.image_url1}" alt="">
                        </a>
                        <span style=""><a
                                href="/news/detail?id={$item.notice_id}">{$item.name}</a></span>
                    </volist>
                </div>
                <div class="right">
                    <div class="items1">
                        <ul>
                            <volist name="notices" id="item" offset="1" length="6">
                                <li class="text"><img src="/public_en/img/home/news/point.png"><a
                                        href="/news/detail?id={$item.notice_id}">{$item.name}</a></li>
                                <li class="date">Release Time:
                                    <php>echo (new \DateTime($item['begin_time']))->format('Y-m');</php>
                                </li>
                            </volist>
                        </ul>
                        <a href="/en/join/development?level_id=1000000201" style="float: right;font-size: 16px;color: #9d7cb3;margin-top: 60px;">More></a>
                    </div>
                </div>
            </div>


            <!--<div class="newContent">-->
                <!--<div class="left">-->
                    <!--<volist name="notices" id="item" offset="0" length="2">-->
                        <!--<a href="/en/news/detail?id={$item.notice_id}">-->
                            <!--<img src="{$item.image_url1}" traditional_image="{$item.image_url2}"-->
                                 <!--simplified_image="{$item.image_url1}" alt="">-->
                        <!--</a>-->
                        <!--<span class="<if condition='2 EQ $i'>last</if>"><a-->
                                <!--href="/news/detail?id={$item.notice_id}">{$item.name}</a></span>-->
                    <!--</volist>-->
                <!--</div>-->
                <!--<div class="right">-->
                    <!--<div class="items1">-->
                        <!--<ul>-->
                            <!--<volist name="notices" id="item" offset="2" length="3">-->
                                <!--<li class="title"><img src="/public_en/img/home/news/point.png"><a-->
                                        <!--href="/news/detail?id={$item.notice_id}">{$item.name}</a></li>-->
                                <!--<li class="date <if condition='3 EQ $i'>last</if>">发布时间:-->
                                    <!--<php>echo (new \DateTime($item['begin_time']))->format('Y年m月');</php>-->
                                <!--</li>-->
                            <!--</volist>-->
                        <!--</ul>-->
                    <!--</div>-->
                    <!--<div class="items2">-->
                        <!--<ul>-->
                            <!--<volist name="notices" id="item" offset="5" length="3">-->
                                <!--<li class="title"><img src="/public_en/img/home/news/point.png"><a-->
                                        <!--href="/news/detail?id={$item.notice_id}">{$item.name}</a></li>-->
                                <!--<li class="date <if condition='3 EQ $i'>last</if>">发布时间:-->
                                    <!--<php>echo (new \DateTime($item['begin_time']))->format('Y年m月');</php>-->
                                <!--</li>-->
                            <!--</volist>-->
                        <!--</ul>-->
                        <!--<p style="text-align: center;margin-top: 70px;">-->
                        <!--<a class="btn-more" style="margin: 0;"-->
                           <!--href="/join/development?level_id=1000000148">更多</a>-->
                        <!--</p>-->
                    <!--</div>-->
                <!--</div>-->
            <!--</div>-->
        </div>
    </div>


    <div class="section2">
        <div class="content container">
            <h2>Work happy</h2>
            <div class="box">
                <div class="left"><img src="/public_en/img/home/join/staff1.jpg" alt=""></div>
                <div class="right">
                    <img class="first" src="/public_en/img/home/join/staff2.jpg" alt="">
                    <img src="/public_en/img/home/join/staff3.jpg" alt="">
                    <p class="first" style="font-size: 15px">Genuine collaboration: One that thrive on communication, integrity and respect</p>
                    <p style="font-size: 15px">Reasonable return: On a par with business performance, industry standards and end results</p>
                    <p style="font-size: 15px">Professional dedication: With shared values, passion and ambition</p>
                </div>
            </div>
        </div>
    </div>
    <div class="section3">
        <div class="content container">
            <h2>Live Happy</h2>
            <div class="box">
                <div class="left"><img src="/public_en/img/home/join/staff4.jpg" alt=""></div>
                <div class="right">
                    <img class="first" src="/public_en/img/home/join/staff5.jpg" alt="">
                    <img src="/public_en/img/home/join/staff6.jpg" alt="">
                    <p class="first" style="font-size: 15px">Health: Exercise, diet, rest</p>
                    <p style="font-size: 15px">Secured life: Life at the crossroad of material affluence and environmental beauty</p>
                    <p style="font-size: 15px">Optimal pace: Work-life balance in total peace of mind</p>
                </div>
            </div>
        </div>
    </div>
    <div class="section4">
        <div class="content container">
            <h2>Grow Happy</h2>
            <div class="box">
                <div class="left"><img src="/public_en/img/home/join/staff7.jpg" alt=""></div>
                <div class="right">
                    <img class="first" src="/public_en/img/home/join/staff8.jpg" alt="">
                    <img src="/public_en/img/home/join/staff9.jpg" alt="">
                    <p class="first" style="font-size: 15px">Personal growth: Spiritual and professional fulfilment</p>
                    <p style="font-size: 15px">Family growth: Care for the young and old, live a happy married life</p>
                    <p style="font-size: 15px">Society growth: Education, Environmental Protection and Poverty and Emergency Relief</p>
                </div>
            </div>
        </div>
    </div>
</block>
<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(4).addClass("active").siblings().removeClass("active");
        });
    </script>
</block>