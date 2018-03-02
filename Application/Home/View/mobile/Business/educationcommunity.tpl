<extend name="./Application/Home/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/business/business_educationcommunity.css">
</block>

<block name="head_common2">
    <script type="text/javascript" src="/public/hui3/lib/jcarousellite.min.js"></script>
</block>
<block name="title">培训教育-雅居乐集团</block>
<block name="head_menu">
    <a class="tip" href="#">培训教育/</a>
</block>

<block name="body_main">
    <div class="main" style="position:relative">
        <img src="{$mobile_head_images[0].image_url1}"
             traditional_image="{$mobile_head_images[0].image_url2}"
             simplified_image="{$mobile_head_images[0].image_url1}" class="tags-img">
    </div>
    <div class=" row cl container mt-40 mb-40">
        <h2 class="txt-center">雅居乐培训教育简介</h2>
        <div class="mt-20">
            <p class="mt-10">
                培训教育板块致力于打造雅居乐教育集团体制外“全年龄段、全产品链条”的培训教育业务生态体系，通过优质教育培训产品的输出，落地不同业态的培训项目，无缝对接培训教育市场最前端资源，助力教育集团综合服务业务的发展。
            </p>

        </div>

    </div>
    <div class=" row cl container pt-20  bg-c">
        <h2 class="txt-center">社区教育中心</h2>

        <div class="mt-20 mb-20">
            <p class="mt-10">
                打造“家门口一站式的优质教育文化活动中心”，主要提供社区教育、社区文化、社区公益服务。
                如：社区公益图书馆、社区托管服务、素质教育培训等。
            </p>
        </div>
        <div class="main mt-20 mb-20" style="position:relative">
            <img src="/public/img/mobile/business/education/community-p1.jpg">
        </div>

    </div>
    <div class=" row cl container pt-20 ">
        <h2 class="txt-center">户外教育中心</h2>

        <div class="mt-20 mb-20">
            <p class="mt-10">
                以“孩子的可能，超乎你的想象”为中心，打造全体验式优质的户外教育。
                主要提供社群部落、周末营地、夏令营、冬令营等户外探索活动。
            </p>
        </div>
        <div class="main mt-20 mb-20" style="position:relative">
            <img src="/public/img/mobile/business/education/community-p2.jpg">
        </div>
    </div>
    <div class=" row cl container pt-20  bg-c">
        <h2 class="txt-center">培训教育生态中心</h2>
        <div class="mt-20 mb-20">
            <p class="mt-10">
                整合培训市场优质项目资源，集成优秀项目、产品、师资、基地为一体的培训生态体系。
                如：体育教育培训体系、托管产品培训体系、语言（考试）培训体系、教师能力培训中心等。
            </p>
        </div>
        <div class="main mt-20 mb-20" style="position:relative">
            <img src="/public/img/mobile/business/education/community-p3.jpg">
        </div>
    </div>
    <div class="container  row cl bgc txt-center pt-30 ">
        <h2 class="pt-20">代表学校</h2>
        <div class="rollpic  txt-center mt-20"><a href="javascript:void(0)" class="prev"></a>
            <div class="rollpicshow txt-center">
                <ul>
                    <volist name="notice" id="item">
                        <li><a href="/news/detail?id={$item.notice_id}">
                                <img src="{$item.image_url1}"
                                     traditional_image="{$item.image_url2}"
                                     simplified_image="{$item.image_url1}" alt="">
                                <p class="mt-5  pb-20 txt-center">{$item.name}</p>
                            </a>
                        </li>

                    </volist>
                </ul>
            </div>
            <a href="javascript:void(0)" class="next"></a>
        </div>
    </div>
</block>

<block name="body_side">
    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box">（86 ）020-88839538</div>
            </li>
            <!--<li><a href=""><img src="/public/img/home/business/estate/detail/estate_icon2.png" alt=""></a></li>-->
            <!--<li><a href=""><img src="/public/img/home/business/estate/detail/estate_icon3.png" alt=""></a></li>-->
            <li class="side-xin"><img src="/public/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public/img/home/business/education/two-code-education.jpg" alt="" >
                </div>
            </li>
            <li class="last"><a><img src="/public/img/mobile/base/go-top.jpg" alt=""></a></li>
        </ul>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {


            $(".rollpic .rollpicshow").jCarouselLite({
                auto: 5000, /*自动播放间隔时间*/
                speed: 500, /*速度*/
                btnNext: ".next", /*向前滚动*/
                btnPrev: ".prev", /*向后滚动*/
                visible: 1 /*显示数量*/
            });

        })


    </script>
</block>