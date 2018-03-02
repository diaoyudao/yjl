<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/index/index.css">
    <link type="text/css" rel="stylesheet" href="/public/hui3/lib/swiper3.4.1/css/swiper.min.css"/>
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public/hui3/lib/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>
    <script type="text/javascript" src="/public/hui3/lib/swiper3.4.1/js/swiper.min.js"></script>
</block>
<block name="title">首页-雅居乐集团</block>

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
        <!-- Add Pagination -->
        <if condition="1 lt count($mobile_head_images)"><div class="swiper-pagination"></div></if>
        <!-- Add Arrows 
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div> 
        -->
        </div>
    </div>    
    <div class="container mt-20">
        <div class="row cl">
            <div class="col-xs-2 ">
                <div class="row img-change main-bgc">
                    <div class="row"><img class="main-image" src="/public/img/mobile/index/index_icon1.png"
                                          change-url="/public/img/mobile/index/index_btn1.png"></div>
                    <div class="row title">房地产</div>
                </div>
                <div class="row"><img class="btn-jt " src="/public/img/mobile/index/btn-jt.png"></div>
            </div>
            <div class="col-xs-2 ">
                <div class="row img-change">
                    <div class="row"><img class="main-image" src="/public/img/mobile/index/index_btn2.png"
                                          change-url="/public/img/mobile/index/index_icon2.png"></div>
                    <div class="row title main-color">酒店</div>
                </div>
                <div class="row"><img class="btn-jt hidden" src="/public/img/mobile/index/btn-jt.png"></div>
            </div>
            <div class="col-xs-2 ">
                <div class="row img-change">
                    <div class="row"><img class="main-image" src="/public/img/mobile/index/index_btn3.png"
                                          change-url="/public/img/mobile/index/index_icon3.png"></div>
                    <div class="row title main-color">教育</div>
                </div>
                <div class="row"><img class="btn-jt hidden" src="/public/img/mobile/index/btn-jt.png"></div>
            </div>
            <div class="col-xs-2 ">
                <div class="row img-change">
                    <div class="row"><img class="main-image" src="/public/img/mobile/index/index_btn4.png"
                                          change-url="/public/img/mobile/index/index_icon4.png"></div>
                    <div class="row title main-color">环保</div>
                </div>
                <div class="row"><img class="btn-jt hidden" src="/public/img/mobile/index/btn-jt.png"></div>
            </div>
            <div class="col-xs-2 ">
                <div class="row img-change">
                    <div class="row"><img class="main-image" src="/public/img/mobile/index/index_btn5.png"
                                          change-url="/public/img/mobile/index/index_icon5.png"></div>
                    <div class="row title main-color">雅生活</div>
                </div>
                <div class="row"><img class="btn-jt hidden" src="/public/img/mobile/index/btn-jt.png"></div>
            </div>
            <div class="col-xs-2 ">
                <div class="row img-change">
                    <div class="row"><img class="main-image" src="/public/img/mobile/index/index_btn6.png"
                                          change-url="/public/img/mobile/index/index_icon6.png"></div>
                    <div class="row title main-color">建设</div>
                </div>
                <div class="row"><img class="btn-jt hidden" src="/public/img/mobile/index/btn-jt.png"></div>
            </div>
        </div>
    </div>
    <div class="row mt-10" id="change-img">
        <volist name="mobile_nav_images" id="item">
            <a <notempty name="item.link_url1">href="{$item.link_url1}"</notempty> ><img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                 simplified_image="{$item.image_url1}" alt="" class="img-responsive <if condition=" $key neq
                 0">hidden</if> "></a>

        </volist>
    </div>
    <div class="row pt-20 pb-30 news-bgc">
        <div class="container">
            <div class="row txt-center mt-15"><span class="main-title">新闻动态</span></div>
            <div class="row cl news-list mt-20">
                <div class="web-stick">头条</div>
                <div class="col-xs-3">
                    <a  href="/news/detail?id={$group_notices[0].notice_id}">
                        <img src="{$group_notices[0].image_url1}" traditional_image="{$group_notices[0].image_url2}"
                             simplified_image="{$group_notices[0].image_url1}" alt="" class="image">
                    </a>
                </div>
                <div class="col-xs-9 pl-10">
                    <div class="row title c-666">
                        <a href="/news/detail?id={$group_notices[0].notice_id}">{$group_notices[0]['name']}</a>

                    </div>
                    <div class="row txt c-999">
                        <php>
                            $leng=mb_strlen($group_notices[0]['desc'],'utf-8');
                            $string=$leng>30?mb_substr($group_notices[0]['desc'], 0, 30,
                            'utf-8').'...':$group_notices[0]['desc'];
                            echo $string;
                        </php>
                    </div>
                </div>
            </div>
            <a href="/news/index?level_id=1000000129"><div class="row cl mt-20 main-btn">查看更多</div></a>
        </div>
    </div>

    <div class="row mt-10 pt-20 pb-30 news-bgc">
        <div class="container">
            <div class="row txt-center mt-15"><span class="main-title">楼盘速递</span></div>
            <div class="row cl news-list mt-20 ">
                <div class="web-stick">{$thismonth}</div>
                <div class="col-xs-3">
                    <a href="/news/detail?id={$thismonth_notices[0].notice_id}">
                        <img src="{$thismonth_notices[0].image_url1}"
                             traditional_image="{$thismonth_notices[0].image_url2}"
                             simplified_image="{$thismonth_notices[0].image_url1}" alt="" class="image">
                    </a>
                </div>
                <div class="col-xs-9 pl-10 ">
                    <div class="row title c-666">
                        <a href="/news/detail?id={$thismonth_notices[0].notice_id}"><php>
                            $leng=mb_strlen($thismonth_notices[0]['name'],'utf-8');
                            $string=$leng>15?mb_substr($thismonth_notices[0]['name'], 0, 15,
                            'utf-8'):$thismonth_notices[0]['name'];
                            echo $string;
                        </php></a>
                    </div>
                    <div class="row txt c-999">
                        <php>
                            $leng=mb_strlen($thismonth_notices[0]['desc'],'utf-8');
                            $string=$leng>30?mb_substr($thismonth_notices[0]['desc'], 0, 30,
                            'utf-8').'...':$thismonth_notices[0]['desc'];
                            echo $string;
                        </php>
                    </div>
                </div>
            </div>
            <div class="row cl news-list mt-15">
                <div class="web-stick">{$lastmonth}</div>
                <div class="col-xs-3">
                    <a href="/news/detail?id={$lastmonth_notices[0].notice_id}">
                        <img src="{$lastmonth_notices[0].image_url1}"
                             traditional_image="{$lastmonth_notices[0].image_url2}"
                             simplified_image="{$lastmonth_notices[0].image_url1}" alt="" class="image">
                    </a>
                </div>
                <div class="col-xs-9  pl-10">
                    <div class="row title c-666">
                        <a href="/news/detail?id={$lastmonth_notices[0].notice_id}"><php>
                            $leng=mb_strlen($lastmonth_notices[0]['name'],'utf-8');
                            $string=$leng>15?mb_substr($lastmonth_notices[0]['name'], 0, 15,
                            'utf-8'):$lastmonth_notices[0]['name'];
                            echo $string;
                        </php></a>
                    </div>
                    <div class="row txt c-999">
                        <php>
                            $leng=mb_strlen($lastmonth_notices[0]['desc'],'utf-8');
                            $string=$leng>30?mb_substr($lastmonth_notices[0]['desc'], 0, 30,
                            'utf-8').'...':$lastmonth_notices[0]['desc'];
                            echo $string;
                        </php>
                    </div>
                </div>
            </div>
            <a href="/business/estateexpresslists?level_id=1000000171"><div class="row cl mt-20 main-btn">查看更多</div></a>
        </div>
    </div>
    <div class="container mt-20">
        <div class="row cl job">
            <div class="col-xs-8 pr-5">
                <div class="row cl">
                    <img src="/public/img/mobile/index/job-head.jpg" alt="" class="job-img">
                    <span class="job-txt text-c">致青春.加入雅居乐</span>
                </div>
            </div>
            <div class="col-xs-4 pl-10">
                <div class="row cl main-btn"><a class="" target="_blank" href="http://agile.zhiye.com/Social"><img class="job-btn-img" src="/public/img/mobile/index/job-1.jpg">&nbsp;社会招聘</a>
                </div>
                <div class="row mt-10 main-btn"><a class="" target="_blank" href="http://campus.51job.com/agile2018"><img class="job-btn-img" src="/public/img/mobile/index/job-2.jpg">&nbsp;校园招聘</a>
                </div>
            </div>
        </div>
        <div class="row cl  mt-15 mb-30">
            <div class="shares">
                <div class="row cl">
                    <div class="col-xs-7">
                        <div class="row">雅居乐HK03383</div>
                        <div class="row cur-price">
                            <div class="share-price" >$<span id="val01">4.23</span></div>
                            <div class="share-tags">
                                <div class="row"><img class="share-tags-img"
                                                      src="/public/img/home/invest/main_shares_icon.png"></div>
                                <div class="row f-9">HKD</div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="row f-9 c-999" >截止&nbsp;<span id="shares-time">2018-10-28 15:28:03</span></div>
                    </div>
                    <div class="col-xs-5 c-999 txt-center right">
                        <div class="row ">成交额（亿）</div>
                        <div class="row f-18">$<span id="val12">4.23</span></div>
                    </div>
                </div>
                <div class="row f-9 c-999">报价有15分钟或以上延迟，资料来源：新浪股票指数</div>
            </div>
            <img class="shares-bg" src="/public/img/mobile/index/test-2.jpg">
        </div>
    </div>
</block>
<block name="footer_js">
    <script src="http://hq.sinajs.cn/list=hk03383" id="src_code"></script>

    <script type="text/javascript">
        $(function () {

                    // banner swiper 切换，所以页面共享
        var swiper_banner = new Swiper('#banner-swiper', {
            pagination: '.swiper-pagination',
            paginationClickable: true,
            spaceBetween: 30,
            centeredSlides: true,
            autoplay: 2500,
            autoplayDisableOnInteraction: false
        });
           

            $('.img-change').click(function () {
                var me = $(this);
                if (me.hasClass("main-bgc")) {
                    return;
                }
                if(5 == $(this).parent().index()) {
                    show_expecting();
                    return;
                }

                $('.main-bgc').next().find('.btn-jt').addClass('hidden');

                $(".main-bgc .title").addClass('main-color');
                me.find('.title').removeClass('main-color');

                var new_i = $('.main-bgc .main-image');

                var temp = new_i.attr('change-url');
                new_i.attr('change-url', new_i.attr('src'));
                new_i.attr('src', temp);

                var old_i = me.find('.main-image');
                temp = old_i.attr('change-url');
                old_i.attr('change-url', old_i.attr('src'));
                old_i.attr('src', temp);

                temp = $(".main-bgc").parent().index();

                $(".main-bgc").removeClass('main-bgc');
                $(me).addClass("main-bgc");

                me.next().find('.btn-jt').removeClass('hidden');


                $('#change-img img').eq(temp).addClass('hidden');
                $('#change-img img').eq(me.parent().index()).removeClass('hidden');



            });
        });

    </script>
    <script>

        function sear(code) {
            var rettag = eval("hq_str_" + code);
            var elements = rettag.split(",");
            var turnover = parseFloat(elements[11] / 100000000).toFixed(3);
            var val1=parseFloat(elements[6]).toFixed(2);

            if(0 == elements[6]){
                val1=parseFloat(elements[3]).toFixed(2);

            }
            document.getElementById('val01').innerText = val1;
            document.getElementById('shares-time').innerText = elements[17] + ' ' + elements[18];
            document.getElementById('val12').innerText = turnover;

            if (parseFloat(elements[3]) > parseFloat(elements[6])) {
                var temp = $('.share-tags-img');
                temp.html("");
                temp.attr("src", "/public/img/home/index/main_shares_icon1.png");
//                $('.share_image2').attr("src", "/public/img/home/invest/main_shares_down.png");
            }
        }
    </script>
    <script>sear("hk03383");</script>
</block>