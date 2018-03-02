<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/business/business_educationpre.css">
</block>

<block name="head_common2">
    <script type="text/javascript" src="/public_en/hui3/lib/jcarousellite.min.js"></script>
</block>

<block name="title">学前教育-雅居乐集团</block>
<block name="head_menu">
    <a class="tip" href="#">学前教育/</a>
</block>

<block name="body_main">
     <div class="main" style="position:relative">
         <img src="{$mobile_head_images[0].image_url1}"
              traditional_image="{$mobile_head_images[0].image_url2}"
              simplified_image="{$mobile_head_images[0].image_url1}" class="tags-img">
     </div>
    <div class=" row cl container mt-40 mb-40">
        <h2 class="txt-center">雅居乐学前教育简介</h2>
        <div class="mt-20">
            <p class="mt-10">
                雅居乐集团具有深远的家学渊源，将教育作为集团多元发展的重要战略支点，旗下的子公司雅居乐教育集团更是致力于发展优质双语教育和高端国际教育。
            </p>
            <p class="mt-10 mb-10">办学特色：</p>
            <p class="mt-10 mb-10">1.双语幼儿园"英文+"特色：每个幼儿园均开国际班，让国际化品质和氛围着陆</p>
            <p class="mt-10 mb-10">2.双语幼儿园"英文+"特色：每个幼儿园均开国际班，让国际化品质和氛围着陆</p>
            <p class="mt-10 mb-10">雅居乐幼儿园还将开办周末早教班、4:30学堂、少儿艺术团等课余课堂，为孩子们提供丰富多彩的课余体验</p>
            <p class="mt-20" style="color:#007069">事业部电话：020-88839538</p>
            <p  style="color:#007069">邮箱：zhujin@agile.com.cn</p>

        </div>

    </div>
     <div class="container  row cl bg-c txt-center pt-30 ">
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
                <div class="tel-box">（+86 ）020-88839308</div>
            </li>
            <li class="side-xin"><img src="/public_en/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public_en/img/home/business/education/two-code-education.jpg" alt="" width="130">
                </div>
            </li>
            <li class=""><a><img src="/public_en/img/mobile/base/go-top.jpg" alt=""></a></li>
        </ul>
    </div>
</block>
<block name="footer_js">
    <script>
        $(function () {


            $(".rollpic .rollpicshow").jCarouselLite({
                auto: 2000, /*自动播放间隔时间*/
                speed: 500, /*速度*/
                btnNext: ".next", /*向前滚动*/
                btnPrev: ".prev", /*向后滚动*/
                visible: 1 /*显示数量*/
            });

        })


    </script>
</block>
