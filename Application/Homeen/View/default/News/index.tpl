<extend name="./Application/Homeen/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/news/news-index.css">
</block>

<block name="title">News Centre-Agile Group</block>

<block name="body_main">
    <div class="section1">
        <div class="slider">
            <div class="content container">
                <div class="left">
                    <img src="{$head_notice.image_url1}" traditional_image="{$head_notice.image_url2}"
                         simplified_image="{$head_notice.image_url1}" class="first" alt="">
                    <img class="second" src="/public_en/img/home/news/new3.png">
                </div>
                <div class="right" style="width: 460px;">
                    <a href="/en/news/detail?id={$head_notice.notice_id}"><span class="text1">{$head_notice.name}</span></a>
                    <span class="text2">{$head_notice.desc}</span>
                    <span><a href="/en/news/detail?id={$head_notice.notice_id}">Details  <img
                                    src="/public_en/img/home/index/main_icon.png"></a></span>
                </div>
            </div>
        </div>
    </div>
    <div class="section2">
        <div class="content container">
            <a href="/en/news/media?level_id=1000000141"><span class="title">Media Reports</span></a>
            <div style="margin: 0 auto">
                <ul class="item" style="display: inline-block">
                    <!--<li class="active first"><img src="/public_en/img/home/news/icon1.png" alt="">全部</li>-->
                    <li class="active"><img src="/public_en/img/home/news/icon2.png" alt="">Property Development<span class="icon icon0"></span></li>
                    <li class=""><img src="/public_en/img/home/news/icon3.png" alt="">A-Living<span class="icon icon1" style="display: none;"></span></li>
                    <li class=""><img src="/public_en/img/home/news/icon4.png" alt="">Education<span class="icon icon2" style="display: none;"></span></li>
                    <li class=""><img src="/public_en/img/home/news/icon5.png" alt="">Environmental Protection<span class="icon icon3" style="display: none;"></span></li>
                    <li class="aler" style="height: 42px"><img src="/public_en/img/home/news/icon6.png"  alt="">Construction<span class="icon icon4" style="display: none;"></span></li>
                </ul>
            </div>



            <!--<div class="news-box">
                <div class="left" style="width:551px;">
                    <volist name="media_notices" id="item" offset="0" length="1">
                        <a href="/en/news/detail?id={$item.notice_id}">
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
                            <volist name="media_notices" id="item" offset="1" length="6">
                                <li class="text"><img src="/public_en/img/home/news/point.png"><a
                                        href="/news/detail?id={$item.notice_id}">{$item.name}</a></li>
                                <li class="date">Release Time:
                                    <php>echo (new \DateTime($item['begin_time']))->format('Y-m');</php>
                                </li>
                            </volist>
                        </ul>
                        <a href="/en/news/media?level_id=1000000141" style="float: right;font-size: 16px;color: #9d7cb3;margin-top: 60px;">查看更多></a>
                    </div>
                </div>
            </div>-->

            <div class="news-box" style="">
                <div class="left" style="width:551px;">
                    <volist name="one_estate_notices" id="item" offset="0" length="1">
                        <a href="/en/news/detail?id={$item.notice_id}">
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
                            <volist name="estate_notices" id="item" offset="0" length="6">
                                <li class="text"><img src="/public_en/img/home/news/point.png"><a
                                        href="/news/detail?id={$item.notice_id}">{$item.name}</a></li>
                                <li class="date">Release Time:
                                    <php>echo (new \DateTime($item['begin_time']))->format('Y-m');</php>
                                </li>
                            </volist>
                        </ul>
                        <a href="/en/news/estate?level_id=1000000164" style="float: right;font-size: 16px;color: #9d7cb3;margin-top: 60px;">More></a>
                    </div>
                </div>
            </div>
            <div class="news-box" style="display: none;">
                <div class="left" style="width:551px;">
                    <volist name="one_life_notices" id="item" offset="0" length="1">
                        <a href="/en/news/detail?id={$item.notice_id}">
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
                            <volist name="life_notices" id="item" offset="0" length="6">
                                <li class="text"><img src="/public_en/img/home/news/point.png"><a
                                        href="/news/detail?id={$item.notice_id}">{$item.name}</a></li>
                                <li class="date">Release Time:
                                    <php>echo (new \DateTime($item['begin_time']))->format('Y-m');</php>
                                </li>
                            </volist>
                        </ul>
                        <a href="/en/news/life?level_id=1000000163" style="float: right;font-size: 16px;color: #9d7cb3;margin-top: 60px;">More></a>
                    </div>
                </div>
            </div>
            <div class="news-box" style="display: none;">
                <div class="left" style="width:551px;">
                    <volist name="one_education_notices" id="item" offset="0" length="1">
                        <a href="/en/news/detail?id={$item.notice_id}">
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
                            <volist name="education_notices" id="item" offset="0" length="6">
                                <li class="text"><img src="/public_en/img/home/news/point.png"><a
                                        href="/news/detail?id={$item.notice_id}">{$item.name}</a></li>
                                <li class="date">Release Time:
                                    <php>echo (new \DateTime($item['begin_time']))->format('Y-m');</php>
                                </li>
                            </volist>
                        </ul>
                        <a href="/en/news/education?level_id=1000000162" style="float: right;font-size: 16px;color: #9d7cb3;margin-top: 60px;">More></a>
                    </div>
                </div>
            </div>
            <div class="news-box" style="display: none;">
                <div class="left" style="width:551px;">
                    <volist name="one_environment_notices" id="item" offset="0" length="1">
                        <a href="/en/news/detail?id={$item.notice_id}">
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
                            <volist name="environment_notices" id="item" offset="0" length="6">
                                <li class="text"><img src="/public_en/img/home/news/point.png"><a
                                        href="/news/detail?id={$item.notice_id}">{$item.name}</a></li>
                                <li class="date">Release Time:
                                    <php>echo (new \DateTime($item['begin_time']))->format('Y-m');</php>
                                </li>
                            </volist>
                        </ul>
                        <a href="/en/news/environment?level_id=1000000161" style="float: right;font-size: 16px;color: #9d7cb3;margin-top: 60px;">More></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="section3">
        <div class="content container">
            <a href="/en/news/group?level_id=1000000142"><span class="title">Group News</span></a>

            <div class="news-box">
                <div class="left" style="width:551px;">
                    <volist name="one_group_notices" id="item" >
                        <a href="/en/news/detail?id={$item.notice_id}">
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
                            <volist name="group_notices" id="item" offset="0" length="6">
                                <li class="text"><img src="/public_en/img/home/news/point.png"><a
                                        href="/news/detail?id={$item.notice_id}">{$item.name}</a></li>
                                <li class="date">Release Time:
                                    <php>echo (new \DateTime($item['begin_time']))->format('Y-m');</php>
                                </li>
                            </volist>
                        </ul>
                        <a href="/en/news/group?level_id=1000000142" style="float: right;font-size: 16px;color: #9d7cb3;margin-top: 60px;">More></a>
                    </div>
                </div>
            </div>


        </div>
    </div>
</block>


<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(5).addClass("active").siblings().removeClass("active");

            $(".item li").on("click",function () {
                var index = $(this).index();
                $(".section2 .content .news-box").eq(index).show().siblings(".news-box").hide();
                $(".icon").hide();
                $(this).find(".icon").show();
//                $(".item li").removeClass("active");
                $(this).addClass("active").siblings().removeClass("active");
            })
        })
    </script>
</block>