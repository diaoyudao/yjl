<extend name="./Application/Home/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/join/join-staff.css">
</block>
<block name="title">员工发展-雅居乐集团</block>

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
            <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                    href="/join/index?level_id=1000000135">加入雅居乐</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span>员工发展</span></p>
            <p class="text">雅居乐认为工作与生活是辩证的关系，在8小时工作时间内要实现制度化、规范化、<br>
                标准化、职业化、
                结果导向化，让工作更高效，让员工的价值取向与企业的价值取<br>向达成一致；8小时外，
                推行健康文化、运动文化，积极开展针对员工的幸福工程，<br>关注员工的生活和成长。</p>
        </div>
    </div>


    <div class="section5">
        <div class="content container">
            <a href="/join/development?level_id=1000000201" class="title">文化活动</a>

            <div class="news-box">
                <div class="left" style="width:551px;">
                    <volist name="notices" id="item" offset="0" length="1">
                        <a href="/news/detail?id={$item.notice_id}">
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
                                <li class="text"><img src="/public/img/home/news/point.png"><a
                                        href="/news/detail?id={$item.notice_id}">{$item.name}</a></li>
                                <li class="date">发布时间:
                                    <php>echo (new \DateTime($item['begin_time']))->format('Y年m月');</php>
                                </li>
                            </volist>
                        </ul>
                        <a href="/join/development?level_id=1000000201" style="float: right;font-size: 16px;color: #9d7cb3;margin-top: 60px;">查看更多></a>
                    </div>
                </div>
            </div>


            <!--<div class="newContent">-->
                <!--<div class="left">-->
                    <!--<volist name="notices" id="item" offset="0" length="2">-->
                        <!--<a href="/news/detail?id={$item.notice_id}">-->
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
                                <!--<li class="title"><img src="/public/img/home/news/point.png"><a-->
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
                                <!--<li class="title"><img src="/public/img/home/news/point.png"><a-->
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
            <h2>快乐工作</h2>
            <div class="box">
                <div class="left"><img src="/public/img/home/join/staff1.jpg" alt=""></div>
                <div class="right">
                    <img class="first" src="/public/img/home/join/staff2.jpg" alt="">
                    <img src="/public/img/home/join/staff3.jpg" alt="">
                    <p class="first">真诚合作：坦诚沟通、公平公正、互尊互助</p>
                    <p>合理回报：与业绩同步、与行业平衡、与贡献匹配</p>
                    <p>敬业乐业：统一的价值观、充分的参与度、强烈的事业心</p>
                </div>
            </div>
        </div>
    </div>
    <div class="section3">
        <div class="content container">
            <h2>快乐生活</h2>
            <div class="box">
                <div class="left"><img src="/public/img/home/join/staff4.jpg" alt=""></div>
                <div class="right">
                    <img class="first" src="/public/img/home/join/staff5.jpg" alt="">
                    <img src="/public/img/home/join/staff6.jpg" alt="">
                    <p class="first">健康身体：锻炼、饮食、休息</p>
                    <p>良好保障：优越的食住环境、丰富的业余生活、充足的资源配置</p>
                    <p>合适节奏：平和的心态、简约的工作、足够的休息</p>
                </div>
            </div>
        </div>
    </div>
    <div class="section4">
        <div class="content container">
            <h2>快乐成长</h2>
            <div class="box">
                <div class="left"><img src="/public/img/home/join/staff7.jpg" alt=""></div>
                <div class="right">
                    <img class="first" src="/public/img/home/join/staff8.jpg" alt="">
                    <img src="/public/img/home/join/staff9.jpg" alt="">
                    <p class="first">个人成长：心灵成长、事业成长</p>
                    <p>家庭成长：快乐亲子、关爱老人美满婚姻</p>
                    <p>社会成长：教育助学、节能环保、扶贫救灾</p>
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