<extend name="./Application/Home/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/news/news-index.css">
</block>
<block name="head_common2">
    <!--<script src="/public/js/lib/tab.js"></script>-->
</block>
<block name="title">新闻中心-雅居乐集团</block>

<block name="body_main">
    <div class="section1">
        <div class="slider">
            <div class="content container">
                <div class="left">
                    <img src="{$head_notice.image_url1}" traditional_image="{$head_notice.image_url2}"
                         simplified_image="{$head_notice.image_url1}" class="first" alt="">
                    <img class="second" src="/public/img/home/news/new3.png">
                </div>
                <div class="right" style="width: 460px;">
                    <a href="/news/detail?id={$head_notice.notice_id}"><span class="text1">{$head_notice.name}</span></a>
                    <span class="text2">{$head_notice.desc}</span>
                    <span><a href="/news/detail?id={$head_notice.notice_id}">了解详情 <img
                                    src="/public/img/home/index/main_icon.png"></a></span>
                </div>
            </div>
        </div>
    </div>
    <div class="section2">
        <div class="content container">
            <a href="/news/media?level_id=1000000141"><span class="title">媒体报道</span></a>
            <ul class="item">
                <!--<li class="active first"><img src="/public/img/home/news/icon1.png" alt="">全部</li>-->
                <li class="active first"><img src="/public/img/home/news/icon2.png" alt="">地产</li>
                <!--<li class="live"><img src="/public/img/home/news/icon3.png" alt="">雅生活</li>
                <li><img src="/public/img/home/news/icon4.png" alt="">教育</li>
                <li><img src="/public/img/home/news/icon5.png" alt="">环保</li>
                <li class="aler"><img src="/public/img/home/news/icon6.png"  alt="">建设</li>-->
                <li class="live"><a target="_blank" href="http://agile-living.agile.com.cn/yjl/News/index" style="color: #fff;"><img src="/public/img/home/news/icon3.png" alt="">雅生活</a></li>
                <li><a target="_blank" href="http://www.agile-edu.cn/news" style="color: #fff;"><img src="/public/img/home/news/icon4.png" alt="">教育</a></li>
                <li><a target="_blank" href="http://www.environ.agile.com.cn/index.php?m=Group&pid=2" style="color: #fff;"><img src="/public/img/home/news/icon5.png" alt="">环保</a></li>
                <li><a target="_blank" href="http://www.agilebuild.com.cn/HTML/dist/newsCenter_groupList.html" style="color: #fff;"><img src="/public/img/home/news/icon6.png"  alt="">建设</a></li>

            </ul>
            <span class="icon icon0"></span>
            <span class="icon icon1" style="display: none;"></span>
            <span class="icon icon2" style="display: none;"></span>
            <span class="icon icon3" style="display: none;"></span>
            <span class="icon icon4" style="display: none;"></span>


            <!--<div class="news-box">
                <div class="left" style="width:551px;">
                    <volist name="media_notices" id="item" offset="0" length="1">
                        <a href="/news/detail?id={$item.notice_id}">
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
                                <li class="text"><img src="/public/img/home/news/point.png"><a
                                        href="/news/detail?id={$item.notice_id}">{$item.name}</a></li>
                                <li class="date">发布时间:
                                    <php>echo (new \DateTime($item['begin_time']))->format('Y年m月');</php>
                                </li>
                            </volist>
                        </ul>
                        <a href="/news/media?level_id=1000000141" style="float: right;font-size: 16px;color: #9d7cb3;margin-top: 60px;">查看更多></a>
                    </div>
                </div>
            </div>-->

            <div class="news-box" style="">
                <div class="left" style="width:551px;">
                    <volist name="one_estate_notices" id="item" offset="0" length="1">
                        <a href="/news/detail?id={$item.notice_id}">
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
                                <li class="text"><img src="/public/img/home/news/point.png"><a
                                        href="/news/detail?id={$item.notice_id}">{$item.name}</a></li>
                                <li class="date">发布时间:
                                    <php>echo (new \DateTime($item['begin_time']))->format('Y年m月');</php>
                                </li>
                            </volist>
                        </ul>
                        <a href="/news/estate?level_id=1000000164" style="float: right;font-size: 16px;color: #9d7cb3;margin-top: 60px;">查看更多></a>
                    </div>
                </div>
            </div>
            <div class="news-box" style="display: none;">
                <div class="left" style="width:551px;">
                    <volist name="one_life_notices" id="item" offset="0" length="1">
                        <a href="/news/detail?id={$item.notice_id}">
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
                                <li class="text"><img src="/public/img/home/news/point.png"><a
                                        href="/news/detail?id={$item.notice_id}">{$item.name}</a></li>
                                <li class="date">发布时间:
                                    <php>echo (new \DateTime($item['begin_time']))->format('Y年m月');</php>
                                </li>
                            </volist>
                        </ul>
                        <a href="/news/life?level_id=1000000163" style="float: right;font-size: 16px;color: #9d7cb3;margin-top: 60px;">查看更多></a>
                    </div>
                </div>
            </div>
            <div class="news-box" style="display: none;">
                <div class="left" style="width:551px;">
                    <volist name="one_education_notices" id="item" offset="0" length="1">
                        <a href="/news/detail?id={$item.notice_id}">
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
                                <li class="text"><img src="/public/img/home/news/point.png"><a
                                        href="/news/detail?id={$item.notice_id}">{$item.name}</a></li>
                                <li class="date">发布时间:
                                    <php>echo (new \DateTime($item['begin_time']))->format('Y年m月');</php>
                                </li>
                            </volist>
                        </ul>
                        <a href="/news/education?level_id=1000000162" style="float: right;font-size: 16px;color: #9d7cb3;margin-top: 60px;">查看更多></a>
                    </div>
                </div>
            </div>
            <div class="news-box" style="display: none;">
                <div class="left" style="width:551px;">
                    <volist name="one_environment_notices" id="item" offset="0" length="1">
                        <a href="/news/detail?id={$item.notice_id}">
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
                                <li class="text"><img src="/public/img/home/news/point.png"><a
                                        href="/news/detail?id={$item.notice_id}">{$item.name}</a></li>
                                <li class="date">发布时间:
                                    <php>echo (new \DateTime($item['begin_time']))->format('Y年m月');</php>
                                </li>
                            </volist>
                        </ul>
                        <a href="/news/environment?level_id=1000000161" style="float: right;font-size: 16px;color: #9d7cb3;margin-top: 60px;">查看更多></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="section3">
        <div class="content container">
            <a href="/news/group?level_id=1000000142"><span class="title">集团新闻</span></a>

            <div class="news-box">
                <div class="left" style="width:551px;">
                    <volist name="one_group_notices" id="item" >
                        <a href="/news/detail?id={$item.notice_id}">
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
                                <li class="text"><img src="/public/img/home/news/point.png"><a
                                        href="/news/detail?id={$item.notice_id}">{$item.name}</a></li>
                                <li class="date">发布时间:
                                    <php>echo (new \DateTime($item['begin_time']))->format('Y年m月');</php>
                                </li>
                            </volist>
                        </ul>
                        <a href="/news/group?level_id=1000000142" style="float: right;font-size: 16px;color: #9d7cb3;margin-top: 60px;">查看更多></a>
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
        })
    </script>
</block>