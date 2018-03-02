<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/business/business_educationcommunity.css">
</block>

<block name="head_common2">
    <script type="text/javascript" src="/public_en/hui3/lib/jcarousellite.min.js"></script>
</block>
<block name="title">社区教育-雅居乐集团</block>
<block name="head_menu">
    <a class="tip" href="#">社区教育/</a>
</block>

<block name="body_main">
    <div class="main" style="position:relative">
        <img src="{$mobile_head_images[0].image_url1}"
             traditional_image="{$mobile_head_images[0].image_url2}"
             simplified_image="{$mobile_head_images[0].image_url1}" class="tags-img">
    </div>
    <div class=" row cl container mt-40 mb-40">
        <h2 class="txt-center">雅居乐社区教育中心简介</h2>
        <div class="main mt-20 mb-20" style="position:relative">
            <img src="/public_en/img/mobile/business/education/educationcommunity-img1.jpg">
        </div>
        <div class="mt-20">
            <p class="mt-10">
                雅居乐集团具有深远的家学渊源，将教育作为集团多元发展的重要战略支点，旗下的子公司雅居乐教育集团更是致力于发展优质双语教育和高端国际教育。
            </p>

            <p class="mt-20" style="color:#007069">事业部电话：020-88839538</p>
            <p style="color:#007069">邮箱：zhujin@agile.com.cn</p>
        </div>

    </div>
    <div class=" row cl container pt-20  bg-c">
        <h2 class="txt-center">雅学堂系列</h2>
        <div class="main mt-20 mb-20" style="position:relative">
            <img src="/public_en/img/mobile/business/education/educationcommunity-img2.jpg">
        </div>
        <div class="mt-20 mb-20">
            <p class="mt-10">
                雅居乐集团具有深远的家学渊源，将教育作为集团多元发展的重要战略支点，旗下的子公司雅居乐教育集团更是致力于发展优质双语教育和高端国际教育。
            </p>
        </div>

    </div>
    <div class=" row cl container pt-20 ">
        <h2 class="txt-center">培训教育系列</h2>
        <div class="main mt-20 mb-20" style="position:relative">
            <img src="/public_en/img/mobile/business/education/educationcommunity-img3.jpg">
        </div>
        <div class="mt-20 mb-20">
            <p class="mt-10">
                雅居乐集团具有深远的家学渊源，将教育作为集团多元发展的重要战略支点，旗下的子公司雅居乐教育集团更是致力于发展优质双语教育和高端国际教育。
            </p>
            <p class="min-title title-color mt-10 mb-10">思维逻辑培训</p>
            <p>数学思维、乐高、机器人、手工、发明、科学实验等课程</p>
            <p class="min-title title-color mt-10 mb-10">素质培训</p>
            <p>数学思维、乐高、机器人、手工、发明、科学实验等课程</p>
            <p class="min-title title-color mt-10 mb-10">学科培优</p>
            <p>语数外等课程培训</p>
        </div>

    </div>
    <div class=" row cl container pt-20  bg-c">
        <h2 class="txt-center">社群部落系列</h2>
        <div class="main mt-20 mb-20" style="position:relative">
            <img src="/public_en/img/mobile/business/education/educationcommunity-img4.jpg">
        </div>
        <div class="mt-20 mb-20">
            <p class="mt-10">
                雅居乐集团具有深远的家学渊源，将教育作为集团多元发展的重要战略支点，旗下的子公司雅居乐教育集团更是致力于发展优质双语教育和高端国际教育。
            </p>
            <p class="min-title title-color mt-10 mb-10">父母邦</p>
            <p>数学思维、乐高、机器人、手工、发明、科学实验等课程</p>
            <p class="min-title title-color mt-10 mb-10">家庭教育</p>
            <p>数学思维、乐高、机器人、手工、发明、科学实验等课程</p>
            <p class="min-title title-color mt-10 mb-10">户外探索</p>
            <p>语数外等课程培训</p>
            <p class="min-title title-color mt-10 mb-10">公益文化活动</p>
            <p>语数外等课程培训</p>
        </div>

    </div>
    <div class="container  row cl bgc txt-center pt-30 ">
        <h2 class="pt-20">代表学校</h2>
        <div class="rollpic  txt-center mt-20"><a href="javascript:void(0)" class="prev"></a>
            <div class="rollpicshow txt-center">
                <ul>
                    <volist name="notice" id="item">
                        <li><a href="/en/news/detail?id={$item.notice_id}">
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
                <img src="/public_en/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box">（86 ）020-88839538</div>
            </li>
            <!--<li><a href=""><img src="/public_en/img/home/business/estate/detail/estate_icon2.png" alt=""></a></li>-->
            <!--<li><a href=""><img src="/public_en/img/home/business/estate/detail/estate_icon3.png" alt=""></a></li>-->
            <li class="side-xin"><img src="/public_en/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public_en/img/home/business/education/two-code-education.jpg" alt="" >
                </div>
            </li>
            <li class="last"><a><img src="/public_en/img/mobile/base/go-top.jpg" alt=""></a></li>
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