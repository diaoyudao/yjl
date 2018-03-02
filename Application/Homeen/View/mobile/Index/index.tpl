<extend name="./Application/Homeen/View/mobile/base/common.tpl" xmlns="http://www.w3.org/1999/html"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/index/index.css">
    <link type="text/css" rel="stylesheet" href="/public_en/hui3/lib/swiper3.4.1/css/swiper.min.css"/>
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public_en/hui3/lib/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>
    <script type="text/javascript" src="/public_en/hui3/lib/swiper3.4.1/js/swiper.min.js"></script>
</block>
<block name="title">Home-Agile Group</block>

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
                    <div class="row"><img class="main-image" src="/public_en/img/mobile/index/index_icon1.png"
                                          change-url="/public_en/img/mobile/index/index_btn1.png"></div>
                    <div class="row title">Property Development</div>
                </div>
                <div class="row"><img class="btn-jt " src="/public_en/img/mobile/index/btn-jt.png"></div>
            </div>
            <div class="col-xs-2 ">
                <div class="row img-change">
                    <div class="row"><img class="main-image" src="/public_en/img/mobile/index/index_btn2.png"
                                          change-url="/public_en/img/mobile/index/index_icon2.png"></div>
                    <div class="row title main-color">Hotels Operations</div>
                </div>
                <div class="row"><img class="btn-jt hidden" src="/public_en/img/mobile/index/btn-jt.png"></div>
            </div>
            <div class="col-xs-2 ">
                <div class="row img-change">
                    <div class="row"><img class="main-image" src="/public_en/img/mobile/index/index_btn3.png"
                                          change-url="/public_en/img/mobile/index/index_icon3.png"></div>
                    <div class="row title main-color">Education</div>
                </div>
                <div class="row"><img class="btn-jt hidden" src="/public_en/img/mobile/index/btn-jt.png"></div>
            </div>
            <div class="col-xs-2 ">
                <div class="row img-change">
                    <div class="row"><img class="main-image" src="/public_en/img/mobile/index/index_btn4.png"
                                          change-url="/public_en/img/mobile/index/index_icon4.png"></div>
                    <div class="row title main-color">Environmental Protection</div>
                </div>
                <div class="row"><img class="btn-jt hidden" src="/public_en/img/mobile/index/btn-jt.png"></div>
            </div>
            <div class="col-xs-2 ">
                <div class="row img-change">
                    <div class="row"><img class="main-image" src="/public_en/img/mobile/index/index_btn5.png"
                                          change-url="/public_en/img/mobile/index/index_icon5.png"></div>
                    <div class="row title main-color">A-Living</div>
                </div>
                <div class="row"><img class="btn-jt hidden" src="/public_en/img/mobile/index/btn-jt.png"></div>
            </div>
            <div class="col-xs-2 ">
                <div class="row img-change">
                    <div class="row"><img class="main-image" src="/public_en/img/mobile/index/index_btn6.png"
                                          change-url="/public_en/img/mobile/index/index_icon6.png"></div>
                    <div class="row title main-color">construction</div>
                </div>
                <div class="row"><img class="btn-jt hidden" src="/public_en/img/mobile/index/btn-jt.png"></div>
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
            <div class="row txt-center mt-15"><span class="main-title">Group News</span></div>
            <div class="row cl news-list mt-20">
                <div class="col-xs-3">
                    <a  onclick="show_expecting()" href="javascript:;">
                        <img src="{$group_notices[0].image_url1}" traditional_image="{$group_notices[0].image_url2}"
                             simplified_image="{$group_notices[0].image_url1}" alt="" class="image">
                    </a>
                </div>
                <div class="col-xs-9 pl-10">
                    <div class="row title c-666">
                        <a onclick="show_expecting()" href="javascript:;">{$group_notices[0]['name']}</a>

                    </div>
                    <div class="row txt c-999">
                        <php>
                            $leng=strlen($group_notices[0]['desc'],'utf-8');
                            $string=$leng>30?substr($group_notices[0]['desc'], 0, 30,
                            'utf-8').'...':$group_notices[0]['desc'];
                            echo $string;
                        </php>
                    </div>
                </div>
            </div>
            <a onclick="show_expecting()" href="javascript:;"><div class="row cl mt-20 main-btn">More</div></a>
        </div>
    </div>

    <div class="row mt-10 pt-20 pb-30 news-bgc">
        <div class="container">
            <div class="row txt-center mt-15"><span class="main-title">Projects Updates</span></div>
            <div class="row cl news-list mt-20 ">
                <div class="web-stick">{$thismonth}</div>
                <div class="col-xs-3">
                    <!--<a href="/en/news/detail?id={$thismonth_notices[0].notice_id}">-->
                    <a onclick='show_expecting()'>
                        <img src="{$thismonth_notices[0].image_url1}"
                             traditional_image="{$thismonth_notices[0].image_url2}"
                             simplified_image="{$thismonth_notices[0].image_url1}" alt="" class="image">
                    </a>
                </div>
                <div class="col-xs-9 pl-10 ">
                    <div class="row title c-666">
                        <!--<a href="/en/news/detail?id={$thismonth_notices[0].notice_id}">-->
                            <a onclick='show_expecting()'>
                            <php>
                            $leng=strlen($thismonth_notices[0]['name'],'utf-8');
                            $string=$leng>15?substr($thismonth_notices[0]['name'], 0, 15,
                            'utf-8'):$thismonth_notices[0]['name'];
                            echo $string;
                        </php></a>
                    </div>
                    <div class="row txt c-999">
                        <php>
                            $leng=strlen($thismonth_notices[0]['desc'],'utf-8');
                            $string=$leng>30?substr($thismonth_notices[0]['desc'], 0, 30,
                            'utf-8').'...':$thismonth_notices[0]['desc'];
                            echo $string;
                        </php>
                    </div>
                </div>
            </div>
            <div class="row cl news-list mt-15">
                <div class="web-stick">{$lastmonth}</div>
                <div class="col-xs-3">
                    <!--<a href="/en/news/detail?id={$lastmonth_notices[0].notice_id}">-->
                    <a onclick='show_expecting()'>
                    <img src="{$lastmonth_notices[0].image_url1}"
                             traditional_image="{$lastmonth_notices[0].image_url2}"
                             simplified_image="{$lastmonth_notices[0].image_url1}" alt="" class="image">
                    </a>
                </div>
                <div class="col-xs-9  pl-10">
                    <div class="row title c-666">
                        <!--<a href="/en/news/detail?id={$lastmonth_notices[0].notice_id}">-->
                            <a onclick='show_expecting()'>
                            <php>
                            $leng=strlen($lastmonth_notices[0]['name'],'utf-8');
                            $string=$leng>15?substr($lastmonth_notices[0]['name'], 0, 15,
                            'utf-8'):$lastmonth_notices[0]['name'];
                            echo $string;
                        </php></a>
                    </div>
                    <div class="row txt c-999">
                        <php>
                            $leng=strlen($lastmonth_notices[0]['desc'],'utf-8');
                            $string=$leng>30?substr($lastmonth_notices[0]['desc'], 0, 30,
                            'utf-8').'...':$lastmonth_notices[0]['desc'];
                            echo $string;
                        </php>
                    </div>
                </div>
            </div>
            <a onclick="show_expecting()" href="javascript:;"><div class="row cl mt-20 main-btn">More</div></a>
        </div>
    </div>
    <div class="container mt-20">
        <div class="row cl job">
            <div class="col-xs-8 pr-5">
                <div class="row cl">
                    <img src="/public_en/img/mobile/index/job-head.jpg" alt="" class="job-img">
                    <span class="job-txt text-c">Join Agile</span>
                </div>
            </div>
            <div class="col-xs-4 pl-10">
                <div class="row cl main-btn-m"><a href="http://agile.zhiye.com/Social" target="_blank"><img class="job-btn-img" src="/public_en/img/mobile/index/job-1.jpg">&nbsp;Open Recruitment</a>
                </div>
                <div class="row mt-10 main-btn-m"><a href="http://campus.51job.com/agile2018" target="_blank"><img class="job-btn-img" src="/public_en/img/mobile/index/job-2.jpg">&nbsp;Campus Recruitment</a>
                </div>
            </div>
        </div>
        <div class="row cl  mt-15 mb-30">
            <div class="shares">
                <div class="row cl">
                    <div class="col-xs-7">
                        <div class="row f-10">Agile Group(3383.HK)</div>
                        <div class="row cur-price">
                            <div class="share-price " ><span class="f-18">$</span><span id="val01" class="f-18">4.23</span></div>
                            <div class="share-tags">
                                <div class="row"><img class="share-tags-img"
                                                      src="/public_en/img/home/invest/main_shares_icon.png"></div>
                                <div class="row f-9">HKD</div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="row f-9 c-999" >As as&nbsp;<span id="shares-time">2018-10-28 15:28:03</span></div>
                    </div>
                    <div class="col-xs-5 c-999 txt-center right">
                        <div class="row f-9">Turnover<br>（hundred million）</div>
                        <div class="row ">$<span id="val12">4.23</span></div>
                    </div>
                </div>
                <div class="row f-9 c-999">Price will be delayed for15 minutes or more.
                    Source: Sina Stock Price
                </div>
            </div>
            <img class="shares-bg" src="/public_en/img/mobile/index/test-2.jpg">
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
                temp.attr("src", "/public_en/img/home/index/main_shares_icon1.png");
//                $('.share_image2').attr("src", "/public_en/img/home/invest/main_shares_down.png");
            }
        }
    </script>
    <script>sear("hk03383");</script>
</block>