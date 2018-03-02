<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/business/business_education.css">
</block>

<block name="head_common2">
    <script type="text/javascript" src="/public_en/hui3/lib/jcarousellite.min.js"></script>
</block>
<block name="title">基础教育-雅居乐集团</block>
<block name="head_menu">
    <a class="tip">基础教育/</a>
</block>
<block name="body_main">
    <div class="pic-box">
        <div>
            <img src="{$mobile_head_images[0].image_url1}"
                 traditional_image="{$mobile_head_images[0].image_url2}"
                 simplified_image="{$mobile_head_images[0].image_url1}" class="tags-img">
        </div>

    </div>

    <div class=" row cl container mt-40 mb-20">
        <h2 class="txt-center mb-20">雅居乐基础教育简介</h2>


        <div class="">
            <p class="mt-10">
                基础教育板块主要以双语教学和个性发展为特色，实施中国传统教育与国际先进教育相融合的双语教育，学校具有核心的德育特色、体能特色和信息化特色，让学生不仅在国内传统教育体系下拥有明显的竞争优势，又可在外语能力、学习方法和文化理念上实现与英美教育体系的无缝对接。
            </p>

            <p class="mt-10">
                雅居乐教育集团与中山市纪念中学合办的中山纪中雅居乐凯茵学校，连续两年中考成绩名列全省前茅，已成为当地教育的特色"名片"，更是雅居乐教育高水准办学的具体体现。 </p>
        </div>
        <div id="show_btn" class="main-btn mt-20 me-hidden">查看更多</div>
        <div id="show_txt" class="">
            <p class="mt-10">
                雅居乐纪中三鑫凯茵学校是雅居乐教育集团与中山市纪中三鑫双语学校强强联手创办的全日制民办学校（小学及幼儿园）。学校总占地面积38322.58平方米，绿地率超50%，按36个班国际标准小学和9个班省一级标准幼儿园设置及配备教育资源，立志培养具有高雅志趣、博雅学识、文雅风范的国际创新型人才。 </p>
            <p class="mt-10">
                雅居乐教育集团与北大培文携手共同创办的北大培文雅居乐双语学校，坐落于世界最美纬度--北纬18°、风光旖旎的海南清水湾畔，集幼儿园、小学、初中与高中四个学段为一体，是一所按国际教育办学标准建设的学校，拥有世界领先的教学设施和雄厚的师资队伍，2016年9月1日顺利开学，并已成功申办海南省卓越校长工作基地。该校获得业界与学生家长的高度认可，更将成为海南基础教育的标杆。
            </p>
            <p class="mt-10">
                此外，西安、常州、贵阳、成都等地的雅居乐双语学校即将开办。
            </p>
        </div>


    </div>
    <div class="container  row cl bgc txt-center ">
        <h2 class="pt-20">代表学校</h2>
        <div class="rollpic cl txt-center mt-20 mb-20"><a href="javascript:void(0)" class="prev"></a>
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
                <div class="tel-box">（+86 ）020-88839848</div>
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
            $('#show_btn').click(function () {
                $('#show_txt').show();
                $(this).hide();
            });

        })


    </script>
</block>
