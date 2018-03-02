<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/business/business_education.css">
</block>

<block name="head_common2">
    <script type="text/javascript" src="/public_en/hui3/lib/jcarousellite.min.js"></script>
</block>
<block name="title">Education-Agile Group</block>
<block name="head_menu">
    <a class="tip">Education/</a>
</block>
<block name="body_main">
    <div class="pic-box">
        <div>
            <img src="{$mobile_head_images[0].image_url1}"
                 traditional_image="{$mobile_head_images[0].image_url2}"
                 simplified_image="{$mobile_head_images[0].image_url1}" class="tags-img">
        </div>

    </div>
    <div class="container mt-20 nav-wrap">
        <div class="cl row">
            <div class="left col-xs-8 box">
                <a href="javascript:void(0);" class="aler">
                <!--<a href="/en/business/educationbase?level_id=1000000185">-->
                    <img src="/public_en/img/mobile/business/education/nav-1.jpg" class="tags-img">
                </a>
                <div class="text aler">Primary Education</div>
            </div>
            <div class="right col-xs-4 box">
                <a href="javascript:void(0);" class="aler">
                    <img src="/public_en/img/mobile/business/education/nav-2.jpg" class="tags-img">
                </a>
                <div class="text aler">Tertiary Education</div>
            </div>

        </div>
        <div class="cl row mt-10  pb-20" style="border-bottom: #b0b0b0 1px solid;">
            <div class="left col-xs-8">
                <div class="left col-xs-5 box">
                    <a href="javascript:void(0);" class="aler">
                    <!--<a href="/en/business/educationpre?level_id=1000000184">-->
                        <img src="/public_en/img/mobile/business/education/nav-3.jpg" class="tags-img">
                    </a>
                    <div class="text">Pre-school Education</div>
                </div>
                <div class="right col-xs-5 box">
                    <a href="javascript:void(0);" class="aler">
                        <img src="/public_en/img/mobile/business/education/nav-4.jpg" class="tags-img">
                    </a>
                    <div class="text aler">International Education</div>
                </div>
            </div>

            <div class="right col-xs-4 box">
                <a href="javascript:void(0);" class="aler">
                <!--<a href="/en/business/educationcommunity?level_id=1000000196">-->
                    <img src="/public_en/img/mobile/business/education/nav-5.jpg" class="tags-img">
                </a>
                <div class="text ">Community Education</div>
            </div>

        </div>
    </div>
    <div class=" row cl container mt-30 mb-20">
        <h2 class="txt-center mb-20">About Agile Education Group</h2>
        <div class="main mt-20">
            <img src="/public_en/img/mobile/business/education/logo-jy.jpg" class="tags-img">
        </div>

        <div class="mt-20">
            <h3 class="">Professional Team</h3>
            <p class="mt-10">
                Spurred on by its intrinsic bond with education, Agile Group places education on a pivotal position in
                the Group's diversified development. Its subsidiary Agile Education Group is dedicated to developing
                bilingual education and prestigious international education.
            </p>
            <h3 class="mt-20">Passion for Education</h3>
            <p class="mt-10">
                In keeping with the family tradition of grooming young minds, Chairman Chen Zhuo Lin has been supporting
                the education of hundreds of thousands of students. Agile Group has donated a total amount in excess of
                RMB 1.2 billion to charitable causes over the past 15 years, of which RMB 440 million went to education.
                In recognition of his contribution, Chairman Chen Zhuo Lin was honoured with the title "Outstanding
                Educator of the Year in Zhongshan".
            </p>
        </div>
        <div id="show_btn" class="main-btn mt-20">More</div>
        <div id="show_txt" class="me-hidden">
            <h3 class="mt-20">Five Education Segments</h3>
            <p class="mt-10">
                Agile Education Group has been investing in education in five neatly defined areas, namely pre-school,
                primary, international, tertiary and community education. This distinctive system of Agile Education is
                developed along the line of innovation and inclusion, combining the Chinese and Western perspectives.
                Agile Education Group also joins hands with famous local and international institutes to forge an
                integrated Education Group with a competitive edge.
            </p>
            <p class="mt-10">
                Agile Education Group has opened more than 30 schools with the number of students hovering at 15,000 by
                end of 2016.
            </p>
            <p class="mt-10">
                Agile Education Group is determined to positioning itself as China's top education expert, thereby
                promoting a model for the Group's passion for education and leading the national education
                industry.
            </p>
        </div>


    </div>
    <div class="container">
        <a href="javascript:void(0);" class="a-color aler">
            <div class="row cl mt-20 main-btn mb-30">
                Visit Official Website
            </div>
        </a>
    </div>
    <div class="container  row cl bgc txt-center ">
        <h2 class="pt-20">School</h2>
        <div class="rollpic cl txt-center mt-20 mb-20"><a href="javascript:void(0)" class="prev"></a>
            <div class="rollpicshow txt-center">
                <ul>
                    <volist name="notice" id="item">
                        <li>
                            <!--<a href="/en/news/detail?id={$item.notice_id}">-->
                            <a onclick='show_expecting()'>
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
            <li class="side-xin"><img src="/public_en/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public_en/img/home/business/education/two-code-education.jpg" alt="">
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
            $('.aler').click(function () {
                show_expecting();
            });

        })


    </script>
</block>
