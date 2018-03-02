<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/business/business_education.css">
</block>

<block name="head_common2">
    <script type="text/javascript" src="/public/hui3/lib/jcarousellite.min.js"></script>
</block>
<block name="title">教育-雅居乐集团</block>
<block name="head_menu">
    <a class="tip">教育/</a>
</block>
<block name="body_main">
    <div class="pic-box">
        <div>
            <img src="{$mobile_head_images[0].image_url1}"
                 traditional_image="{$mobile_head_images[0].image_url2}"
                 simplified_image="{$mobile_head_images[0].image_url1}" class="tags-img">
        </div>

    </div>
    <div class="container mt-20 nav-wrap" >
        <div class="cl row">
            <div class="left col-xs-8 box">
                <a href="/business/educationbase?level_id=1000000185">
                    <img src="/public/img/mobile/business/education/nav-1.jpg" class="tags-img">
                </a>
                <div class="text">K12教育</div>
            </div>
            <div class="right col-xs-4 box">
                <a href="javascript:void(0);" class="aler">
                    <img src="/public/img/mobile/business/education/nav-2.jpg" class="tags-img">
                </a>
                <div class="text">高等教育</div>
            </div>

        </div>
        <div class="cl row mt-10  pb-20" style="border-bottom: #b0b0b0 1px solid;">
            <div class="left col-xs-8">
                <div class="left col-xs-5 box">
                    <a href="/business/educationpre?level_id=1000000184">
                        <img src="/public/img/mobile/business/education/nav-3.jpg" class="tags-img">
                    </a>
                    <div class="text">学前教育</div>
                </div>
                <div class="right col-xs-5 box" >
                    <a href="/business/educationinternational?level_id=1000000195">
                        <img src="/public/img/mobile/business/education/nav-4.jpg" class="tags-img">
                    </a>
                    <div class="text">国际教育</div>
                </div>
            </div>

            <div class="right col-xs-4 box">
                <a href="/business/educationcommunity?level_id=1000000196">
                    <img src="/public/img/mobile/business/education/nav-5.jpg" class="tags-img">
                </a>
                <div class="text">培训教育</div>
            </div>

        </div>
    </div>
    <div class=" row cl container mt-30 mb-20" >
        <h2 class="txt-center mb-20">雅居乐教育集团简介</h2>
        <div class="main mt-20">
            <img src="/public/img/mobile/business/education/logo-jy.jpg" class="tags-img">
        </div>

        <div class="mt-20">
            <h3 class="">专业集团</h3>
            <p class="mt-10">
                雅居乐集团具有深远的家学渊源，将教育作为集团多元发展的重要战略支点，旗下的子公司雅居乐教育集团更是致力于发展优质双语教育和高端国际教育。
            </p>
            <h3 class="mt-20">教育情怀</h3>
            <p class="mt-10">
                陈卓林主席发扬家族的重教之风，大力支持教育慈善活动，广布甘霖润泽万千学子，近十五年来,雅居乐慈善公益捐赠金额累计高达12亿元，其中教育单项捐赠4.4亿多元。陈卓林主席更荣获“中山教育年度人物”称号。
            </p>
        </div>
        <div id="show_btn" class="main-btn mt-20">查看更多</div>
        <div id="show_txt" class="me-hidden">
            <h3 class="mt-20">五大教育板块</h3>
            <p class="mt-10">
                雅居乐教育集团集重资布局教育产业，现已逐步构建起以学前教育、K12教育、国际教育、高等教育、培训教育为核心的五大教育产业板块，形成了独具雅居乐特色的教育体系，秉承中西汇通、创新包容的教育理念，携手国内外知名教育机构，共同建设具有核心竞争力的综合性的教育集团。
            </p>
            <p class="mt-10">
                截止2017年，雅居乐教育集团共开办学校（园）五十余所，学生规模两万五千余人。
            </p>
            <p class="mt-10">
                雅居教育集团立志要成为中国优质教育专家，为中国的教育事业树立光辉典范，真正让雅居乐百年树人的教育情怀，落地生根！
            </p>
        </div>


    </div>
    <div class="container">
        <a href="javascript:void(0);" class="a-color aler">
            <div class="row cl mt-20 main-btn mb-30">
                访问官网
            </div>
        </a>
    </div>
    <div class="container  row cl bgc txt-center ">
        <h2 class="pt-20">代表学校</h2>
        <div class="rollpic cl txt-center mt-20 mb-20"><a href="javascript:void(0)" class="prev"></a>
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
                <div class="tel-box">（+86 ）020-88839848</div>
            </li>
            <li class="side-xin"><img src="/public/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public/img/home/business/education/two-code-education.jpg" alt="" >
                </div>
            </li>
            <li class=""><a><img src="/public/img/mobile/base/go-top.jpg" alt=""></a></li>
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
