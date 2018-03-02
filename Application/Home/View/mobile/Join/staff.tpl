<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/join/staff.css">
</block>
<block name="title">员工发展-雅居乐集团</block>
<block name="head_menu">
     <a class="tip" href="#">员工发展/</a>
</block>
<block name="body_main">
    <div class="row ">
        <div class="swiper-container" id="banner-swiper">
        <div class="swiper-wrapper">
            <volist name="mobile_head_images" id="item">
                <div class="swiper-slide">
                    <a <notempty name="item.link_url1"> href='{$item.link_url1}'</notempty>
                                ><img class="banner-img" src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                      simplified_image="{$item.image_url1}" alt="">
                    </a>
                </div>

            </volist>            
        </div>
        <if condition="1 lt count($mobile_head_images)"><div class="swiper-pagination"></div></if>
        </div>
    </div>  
    <div class="row pt-20 pb-30 bgc-ef">
        <div class="container">
            <div class="row txt-center mt-15"><span class="main-title">员工发展</span></div>
            <volist name="notices" id="item" offset="0" length="5">
                <div class="row cl news-list mt-20">
                    <div class="col-xs-1">
                        <img class="img" src="/public/img/mobile/enter/point-bg.png">
                    </div>
                    <div class="col-xs-11 ">
                        <a href="/news/detail?id={$item.notice_id}"><div class="row title c-666">
                            {$item['name']}
                        </div></a>
                        <div class="row txt c-999">
                            发布时间:<php>echo (new \DateTime($item['begin_time']))->format('Y年m月');</php>
                        </div>
                    </div>
                </div>
            </volist>
            <a href="/join/development?level_id=1000000201"><div class="row cl mt-20 main-btn">查看更多</div></a>
        </div>
    </div>

    <div class="row pt-20 pb-30 ">
        <div class="container">
            <div class="row txt-center mt-15"><span class="main-title">快乐工作</span></div>
            <div class="row cl image3 mt-20">
                <img class="img img-r" src="/public/img/mobile/join/staff/staff-1.jpg">
                <img class="img img-r" src="/public/img/mobile/join/staff/staff-2.jpg">
                <img class="img" src="/public/img/mobile/join/staff/staff-3.jpg">
            </div>
            <div class="row mt-15">
                <p class="">
                    真诚合作：坦诚沟通、公平公正、互尊互助<br>
                    合理回报：与业绩同步、与行业平衡、与贡献匹配<br>
                    敬业乐业：统一的价值观、充分的参与度、强烈的事业心
                </p>
            </div>

        </div>
    </div>
    <div class="row pt-20 pb-30 bgc-ef">
        <div class="container">
            <div class="row txt-center mt-15"><span class="main-title">快乐生活</span></div>
            <div class="row cl image3 mt-20">
                <img class="img img-r" src="/public/img/mobile/join/staff/staff-4.jpg">
                <img class="img img-r" src="/public/img/mobile/join/staff/staff-5.jpg">
                <img class="img" src="/public/img/mobile/join/staff/staff-6.jpg">
            </div>
            <div class="row mt-15">
                <p class="">
                    健康身体：锻炼、饮食、休息<br>
                    良好保障：优越的食住环境、丰富的业余生活、充足的资源配置<br>
                    合适节奏：平和的心态、简约的工作、足够的休息
                </p>
            </div>

        </div>
    </div>

    <div class="row pt-20 pb-30 news-bgc">
        <div class="container">
            <div class="row txt-center mt-15"><span class="main-title">快乐成长</span></div>
            <div class="row cl image3 mt-20">
                <img class="img img-r" src="/public/img/mobile/join/staff/staff-7.jpg">
                <img class="img img-r" src="/public/img/mobile/join/staff/staff-8.jpg">
                <img class="img" src="/public/img/mobile/join/staff/staff-9.jpg">
            </div>
            <div class="row mt-15">
                <p class="">
                    个人成长：心灵成长、事业成长<br>
                    家庭成长：快乐亲子、关爱老人美满婚姻<br>
                    社会成长：教育助学、节能环保、扶贫救灾
                </p>
            </div>

        </div>
    </div>


</block>
<block name="footer_js">
                    <script type="text/javascript">
                        $(function () {
                            
                        });
                    </script>
</block>