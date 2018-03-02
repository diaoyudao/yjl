<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/business/business_education.css">
</block>

<block name="head_common2">
    <script type="text/javascript" src="/public/hui3/lib/jcarousellite.min.js"></script>
</block>
<block name="title">国际教育-雅居乐集团</block>
<block name="head_menu">
    <a class="tip">国际教育/</a>
</block>
<block name="body_main">
    <div class="pic-box">
        <div>
            <notempty name="mobile_head_images[0].image_url1'">
                <img src="{$mobile_head_images[0].image_url1}"
                     traditional_image="{$mobile_head_images[0].image_url2}"
                     simplified_image="{$mobile_head_images[0].image_url1}" class="tags-img">
            </notempty>
        </div>

    </div>

    <div class=" row cl container mt-40 mb-20">
        <h2 class="txt-center mb-20">国际教育简介</h2>


        <div class="">
            <p class="mt-10">
                雅居乐国际教育是雅居乐教育集团旗下从事中外合作办学、国际教育管理和项目咨询的板块,秉承提供优质双语教育和高端国际教育的战略定位，实施全人教育，扩展学生的国际视野，培养面向世界的精英人才和适应不同文化背景的全球公民。
            </p>

            <p class="mt-10">
                雅居乐国际教育涵盖国际学校、国际教育项目(双语学校国际部)、留学语培、海外游学、出国留学等方面，覆盖从国际幼儿园、国际双语小学、国际初、高中及大学预科等K15全年龄段的国际教育领域。
            </p>
            <p class="mt-10">
                雅居乐国际教育涵盖国际学校、国际教育项目(双语学校国际部)、留学语培、海外游学、出国留学等方面，覆盖从国际幼儿园、国际双语小学、国际初、高中及大学预科等K15全年龄段的国际教育领域。
            </p>
        </div>


    </div>

</block>
<block name="body_side">
    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box">（+86 ）020-88839848</div>
            </li>
            <!--<li><a href=""><img src="/public/img/home/business/estate/detail/estate_icon2.png" alt=""></a></li>-->
            <!--<li><a href=""><img src="/public/img/home/business/estate/detail/estate_icon3.png" alt=""></a></li>-->
            <li class="side-xin"><img src="/public/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public/img/home/business/education/two-code-education.jpg" alt="">
                </div>
            </li>
            <li class="last"><a><img src="/public/img/mobile/base/go-top.jpg" alt=""></a></li>

        </ul>
    </div>
</block>
<block name="footer_js">

</block>
