<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/join/staff.css">
</block>
<block name="title">Employee Development-Agile Group</block>
<block name="head_menu">
     <a class="tip" href="#" style="font-size: 1.2rem">Employee Development/</a>
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
            <div class="row txt-center mt-15"><span class="main-title">Employee Development</span></div>
            <volist name="notices" id="item" offset="0" length="5">
                <div class="row cl news-list mt-20">
                    <div class="col-xs-1">
                        <img class="img" src="/public_en/img/mobile/enter/point-bg.png">
                    </div>
                    <div class="col-xs-11 ">
                        <a href="/en/news/detail?id={$item.notice_id}"><div class="row title c-666">
                            {$item['name']}
                        </div></a>
                        <div class="row txt c-999">
                            Release Time: <php>echo (new \DateTime($item['begin_time']))->format('Y-m');</php>
                        </div>
                    </div>
                </div>
            </volist>
            <a href="/en/join/development?level_id=1000000201"><div class="row cl mt-20 main-btn">More</div></a>
        </div>
    </div>

    <div class="row pt-20 pb-30 ">
        <div class="container">
            <div class="row txt-center mt-15"><span class="main-title">Work happy</span></div>
            <div class="row cl image3 mt-20">
                <img class="img img-r" src="/public_en/img/mobile/join/staff/staff-1.jpg">
                <img class="img img-r" src="/public_en/img/mobile/join/staff/staff-2.jpg">
                <img class="img" src="/public_en/img/mobile/join/staff/staff-3.jpg">
            </div>
            <div class="row mt-15">
                <p class="" style="font-size: 1rem">
                    Genuine collaboration: One that thrive on communication, integrity and respect<br><br>
                    Reasonable return: On a par with business performance, industry standards and end results<br><br>
                    Professional dedication: With shared values, passion and ambition
                </p>
            </div>

        </div>
    </div>
    <div class="row pt-20 pb-30 bgc-ef">
        <div class="container">
            <div class="row txt-center mt-15"><span class="main-title">Live Happy</span></div>
            <div class="row cl image3 mt-20">
                <img class="img img-r" src="/public_en/img/mobile/join/staff/staff-4.jpg">
                <img class="img img-r" src="/public_en/img/mobile/join/staff/staff-5.jpg">
                <img class="img" src="/public_en/img/mobile/join/staff/staff-6.jpg">
            </div>
            <div class="row mt-15">
                <p class="" style="font-size: 1rem">
                    Health: Exercise, diet, rest<br><br>
                    Secured life: Life at the crossroad of material affluence and environmental beauty<br><br>
                    Optimal pace: Work-life balance in total peace of mind
                </p>
            </div>

        </div>
    </div>

    <div class="row pt-20 pb-30 news-bgc">
        <div class="container">
            <div class="row txt-center mt-15"><span class="main-title">Grow Happy</span></div>
            <div class="row cl image3 mt-20">
                <img class="img img-r" src="/public_en/img/mobile/join/staff/staff-7.jpg">
                <img class="img img-r" src="/public_en/img/mobile/join/staff/staff-8.jpg">
                <img class="img" src="/public_en/img/mobile/join/staff/staff-9.jpg">
            </div>
            <div class="row mt-15">
                <p class="" style="font-size: 1rem">
                    Personal growth: Spiritual and professional fulfilment<br><br>
                    Family growth: Care for the young and old, live a happy married life<br><br>
                    Society growth: Education, Environmental Protection and Poverty and Emergency Relief
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