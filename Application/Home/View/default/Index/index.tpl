<extend name="./Application/Home/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/index/index.css">
</block>
<block name="title">首页-雅居乐集团</block>

<block name="body_main">
    <div class="section1">
        <div class="banner" id="slider1">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <volist name="head_images" id="item">
                        <div class="swiper-slide swiper-no-swiping">
                            <a target="_blank" <notempty name="item.link_url1"> href='{$item.link_url1}'</notempty> ><img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                 simplified_image="{$item.image_url1}" alt=""></a>
                        </div>
                    </volist>
                </div>
            </div>
            <span class="prev arrow-left"><img src="/public/img/home/common/btn_prev.png" alt=""></span>
            <span class="next arrow-right"><img src="/public/img/home/common/btn_next.png" alt=""></span>
            <div class="pagination"></div>
        </div>


        <div class="tip">
            <p>我们尊重每个人的生活方式，<br>
                悉心聆听顾客所需，精心雕琢最宜人的居住环境，一点一滴改善生活的每处细节，<br>
                实现每个人的心之归属，这种态度，让雅居乐，与别不同。</p>
        </div>
    </div>

    <div class="section2">
        <div class="banner" id="slider2">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <volist name="nav_images" id="item">
                        <div class="swiper-slide swiper-no-swiping">
                            <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                 simplified_image="{$item.image_url1}" alt="">
                        </div>
                    </volist>

                </div>
            </div>
            <span class="prev arrow-left"><img src="/public/img/home/common/btn_prev.png" alt=""></span>
            <span class="next arrow-right"><img src="/public/img/home/common/btn_next.png" alt=""></span>
            <div class="pagination"></div>
            <div class="butn">
                <div class="btn1 btn-s">
                    <a href="business/estate?level_id=1000000128">
                        <div class="mask"></div>
                        <span style="display:none"><img src="/public/img/home/business/estate/estate_btn1.png"
                                                        alt=""></span>
                        <div class="item" style=" width: 200px;">
                            <span class="icon"><img src="/public/img/home/index/btn_icon1.png" alt=""></span>
                            <span class="tip">房地产</span>
                        </div>
                    </a>
                </div>
                <div class="btn2 btn-s">
                    <a href="/business/hotel?level_id=1000000131">
                        <div class="mask"></div>
                        <span><img src="/public/img/home/business/estate/estate_btn5.png" alt=""></span>
                        <div class="item" style="display: none;">
                            <span class="icon"><img src="/public/img/home/index/btn_icon5.png" alt=""></span>
                            <span class="tip">酒店</span>
                        </div>
                    </a>
                </div>
                <div class="btn2 btn-s">
                    <a href="/business/education?level_id=1000000133">
                        <div class="mask"></div>
                        <span><img src="/public/img/home/business/estate/estate_btn3.png" alt=""></span>
                        <div class="item" style="display: none;">
                            <span class="icon"><img src="/public/img/home/index/btn_icon3.png" alt=""></span>
                            <span class="tip">教育</span>
                        </div>
                    </a>
                </div>
                <div class="btn2 btn-s">
                    <a href="/business/environment?level_id=1000000132">
                        <div class="mask"></div>
                        <span><img src="/public/img/home/business/estate/estate_btn4.png" alt=""></span>
                        <div class="item" style="display: none;">
                            <span class="icon"><img src="/public/img/home/index/btn_icon4.png" alt=""></span>
                            <span class="tip">环保</span>
                        </div>
                    </a>
                </div>
                <div class="btn2 btn-s ">
                    <a href="/business/life?level_id=1000000130">
                        <div class="mask"></div>
                        <span><img src="/public/img/home/business/estate/estate_btn2.png" alt=""></span>
                        <div class="item" style="display: none;">
                            <span class="icon"><img src="/public/img/home/index/btn_icon2.png" alt=""></span>
                            <span class="tip">雅生活</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>


        <div class="news container">
            <h2><a href="/news/index?level_id=1000000129">新闻动态</a></h2>
            <div class="content">
                <div class="left">
                    <a style="float: none" href="/news/detail?id={$group_notices[0].notice_id}">
                        <img src="{$group_notices[0].image_url1}" traditional_image="{$group_notices[0].image_url2}"
                             simplified_image="{$group_notices[0].image_url1}" alt="">
                    </a>
                </div>
                <div class="word left">
                    <p class="title"><a style="float: none" href="/news/detail?id={$group_notices[0].notice_id}">
                        {$group_notices[0].name}
                    </a>
                    </p>
                    <p>{$group_notices[0].desc}</p>
                </div>
                <div class="more"><a href="/news/detail?id={$group_notices[0].notice_id}">了解详情 </a><span
                        class="icon"></span>
                </div>
            </div>
            <a href="/news/index?level_id=1000000129" style="margin-top: 30px;display: inline-block;font-size: 16px;color: #9d7cb3;float: right;">查看更多></a>
        </div>

        <div class="build container">
            <h2><a href="/business/estateexpresslists?level_id=1000000171">楼盘速递</a></h2>
            <div class="content">
                <div class="right">
                    <div class="title">
                        <span><a style="text-decoration: none"
                                 href="/business/estateexpresslists?level_id=1000000171&id={$lastmonth_notices[0].level_id}&year={$lastmonth_notices[0].tags}">{$lastmonth_notices[0].tags}年{$lastmonth}</a></span>

                        <div class="more"><a href="/business/estateexpresslists?level_id=1000000171&id={$lastmonth_notices[0].level_id}&year={$lastmonth_notices[0].tags}">查看更多></a></div>
                    </div>
                    <div class="left">
                        <a href="/news/detail?id={$lastmonth_notices[0].notice_id}">
                            <img src="{$lastmonth_notices[0].image_url1}"
                                 traditional_image="{$lastmonth_notices[0].image_url2}"
                                 simplified_image="{$lastmonth_notices[0].image_url1}" alt="">
                        </a>
                        <div class="word">
                            <span>
                                <a href="/news/detail?id={$lastmonth_notices[0].notice_id}">
                                    <php>
                                        $leng=mb_strlen($lastmonth_notices[0]['name'],'utf-8');
                                        $string=$leng>20?mb_substr($lastmonth_notices[0]['name'],
                                        0, 20,
                                        'utf-8'):$lastmonth_notices[0]['name'];
                                        echo $string;
                                    </php>
                                </a>
                            </span>
                            <p>
                                <php>
                                    $leng=mb_strlen($lastmonth_notices[0]['desc'],'utf-8');
                                    $string=$leng>30?mb_substr($lastmonth_notices[0]['desc'], 0, 30,
                                    'utf-8').'...':$lastmonth_notices[0]['desc'];
                                    echo $string;
                                </php>
                            </p>
                        </div>
                    </div>
                    <div class="left last">
                        <a href="/news/detail?id={$lastmonth_notices[1].notice_id}">
                            <img src="{$lastmonth_notices[1].image_url1}"
                                 traditional_image="{$lastmonth_notices[1].image_url2}"
                                 simplified_image="{$lastmonth_notices[1].image_url1}" alt="">
                        </a>
                        <div class="word">
                            <span>
                                 <a href="/news/detail?id={$lastmonth_notices[1].notice_id}">
                                     <php>
                                         $leng=mb_strlen($lastmonth_notices[1]['name'],'utf-8');
                                         $string=$leng>20?mb_substr($lastmonth_notices[1]['name'], 0, 20,
                                         'utf-8'):$lastmonth_notices[1]['name'];
                                         echo $string;
                                     </php>
                                 </a>
                            </span>
                            <p>
                                <php>
                                    $leng=mb_strlen($lastmonth_notices[1]['desc'],'utf-8');
                                    $string=$leng>30?mb_substr($lastmonth_notices[1]['desc'], 0, 30,
                                    'utf-8').'...':$lastmonth_notices[1]['desc'];
                                    echo $string;
                                </php>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="left">
                    <div class="title">
                        <span><a style="text-decoration: none"
                                 href="/business/estateexpresslists?level_id=1000000171&id={$thismonth_notices[0].level_id}&year={$thismonth_notices[0].tags}">{$thismonth_notices[0].tags}年{$thismonth}</a></span>
                        <div class="more"><a href="/business/estateexpresslists?level_id=1000000171&id={$thismonth_notices[0].level_id}&year={$thismonth_notices[0].tags}">查看更多></a></div>
                    </div>
                    <div class="left">
                        <a href="/news/detail?id={$thismonth_notices[0].notice_id}">
                            <img src="{$thismonth_notices[0].image_url1}"
                                 traditional_image="{$thismonth_notices[0].image_url2}"
                                 simplified_image="{$thismonth_notices[0].image_url1}" alt="">
                        </a>
                        <div class="word">
                            <span>
                                <a href="/news/detail?id={$thismonth_notices[0].notice_id}">
                                    <php>
                                        $leng=mb_strlen($thismonth_notices[0]['name'],'utf-8');
                                        $string=$leng>20?mb_substr($thismonth_notices[0]['name'], 0, 20,
                                        'utf-8'):$thismonth_notices[0]['name'];
                                        echo $string;
                                    </php>
                                </a>
                                </span><br>
                            <p>
                                <php>
                                    $leng=mb_strlen($thismonth_notices[0]['desc'],'utf-8');
                                    $string=$leng>30?mb_substr($thismonth_notices[0]['desc'], 0, 30,
                                    'utf-8').'...':$thismonth_notices[0]['desc'];
                                    echo $string;
                                </php>
                            </p>
                        </div>
                    </div>
                    <div class="left last">
                        <a href="/news/detail?id={$thismonth_notices[1].notice_id}">
                            <img src="{$thismonth_notices[1].image_url1}"
                                 traditional_image="{$thismonth_notices[1].image_url2}"
                                 simplified_image="{$thismonth_notices[1].image_url1}" alt="">
                        </a>
                        <div class="word">
                            <span>
                                <a href="/news/detail?id={$thismonth_notices[1].notice_id}">
                                    <php>
                                        $leng=mb_strlen($thismonth_notices[1]['name'],'utf-8');
                                        $string=$leng>20?mb_substr($thismonth_notices[1]['name'], 0, 20,
                                        'utf-8'):$thismonth_notices[1]['name'];
                                        echo $string;
                                    </php>
                                </a>
                                </span><br>
                            <p>
                                <php>
                                    $leng=mb_strlen($thismonth_notices[1]['desc'],'utf-8');
                                    $string=$leng>30?mb_substr($thismonth_notices[1]['desc'], 0, 30,
                                    'utf-8').'...':$thismonth_notices[1]['desc'];
                                    echo $string;
                                </php>
                            </p>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <div class="section3">
        <div class="box">
            <img src="{$join_images[0].image_url1}" traditional_image="{$join_images[0].image_url2}"
                 simplified_image="{$join_images[0].image_url1}" alt="">
            <!--<div class="word">-->
                <!--<span class="title">致青春 · 加入雅居乐</span><br>-->
                <!--<span class="join">JOIN US</span>-->
            <!--</div>-->
            <div class="btns">
                <a target="_blank" href="http://agile.zhiye.com/Social" class="btn-more ">
                    社会招聘
                </a>
                <a target="_blank" href="http://campus.51job.com/agile2018" class="btn-more " style="margin-left:17px;">
                    校园招聘
                </a>
            </div>
        </div>
        <div class="shares">

            <img src="{$market_images[0].image_url1}" traditional_image="{$market_images[0].image_url2}"
                 simplified_image="{$market_images[0].image_url1}" alt="">
            <div class="content container">
                <div class="cover"></div>
                <div class="title"><span id="val06"></span><span id="val09"></span></div>
                <div style="overflow: hidden;position: relative;">
                    <div class="now"><span>$</span><span class="now-num" id="val01">4.230</span>
                        <span class="icon"><img id="share_image"
                                                src="/public/img/home/invest/main_shares_icon.png"
                                                alt=""></span><span
                                class="index">HKD</span>
                    </div>
                    <div class="item">
                        <div class="title">最高</div>
                        $<span class="max" id="val03"></span><span class="index">HKD</span>
                    </div>
                    <div class="item">
                        <div class="title">最低</div>
                        $<span class="min" id="val04"></span><span class="index">HKD</span>
                    </div>
                    <div class="item">
                        <div class="title">成交量</div>
                        <span class="volume" id="val11"></span><span class="index">万</span></div>
                    <div class="item">
                        <div class="title">成交额</div>
                        $<span class="trunover" id="val12"></span><span class="index">万</span></div>
                </div>
                <div class="alteration" style="color: #a5c2bf;font-size: 14px;">
                        变动 &nbsp;<img class="share_image2"
                                                src="/public/img/home/invest/main_shares_up.png"
                                                alt="" style="margin-bottom: 5px;padding-right: 2px;"><span class="" id="val13"  ></span>
                        （<img class="share_image2"
                                   src="/public/img/home/invest/main_shares_up.png"
                                   alt="" style="margin-bottom: 5px;padding-right: 2px;"><span class="" id="val14" ></span>%）
                    </div>
                <span class="time">
                        截至 &nbsp;<span class="time-to" id="val07" style="padding-left: 4px;"></span>
                    </span>
                <p><span></span></p>
            </div>
            <div class="content1 container">
                <span class="text" style="float: right;color:#999;position: relative;z-index: 10">*报价有15分钟或以上延迟。 资料来源：新浪股票指数</span>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal-old-web">
        <div class="modal-dialog modal-old-web" style="">
            <div class="old-web-btn-box " >                
                <a onclick="close_old_web();" style="margin-left:68px;cursor:pointer;"><img src="/public/img/home/index/go-new-btn.png" style=""></a>
                <a href="http://web.agile.com.cn/" style="margin-left:10px;"><img src="/public/img/home/index/go-old-btn.png" style=""></a>
            </div>
        </div>
    </div>

</block>


<block name="footer_js">
    <script>
        function close_old_web() {
            $('#modal-old-web').modal('hide');
        }

        $(function () {
            var $new_first_search = '{$new_first_search}';
            if('' != $new_first_search) {
                // $('#modal-old-web').modal({backdrop: 'static', keyboard: true});
            }


//            $(".butn>div:not(.btn1)").find(".mask").one("mouseover", function () {
//                $(".btn1").find(".item").animate({width: "80px"}, 200, function () {
//                    $(this).hide().siblings("span").show();
//                });
//            })
            if ($('#slider1 .swiper-slide').length != 1) {
                var mySwiper1 = $('#slider1 .swiper-container').swiper({
                    loop: true,
                    noSwiping: true,
//                loop: true,
                    autoplay: 5000,
//                autoplayDisableOnInteraction:true,
                    speed: 1000,
                    pagination: '#slider1 .pagination',
                    paginationClickable: true,

//                pagination: '#bannerpagination',
//                paginationClickable: true,
//                grabCursor: true,
//                parallax: true,
                    //其他设置
                });
            } else {
                NoSwiper.bind("slider1");
            }

            var mySwiper2 = $('#slider2 .swiper-container').swiper({
                loop: true,
                noSwiping: true,
                autoplay: 3000,
                speed: 1000,
                onSlideChangeStart: function(swiper){
                    var index=swiper.activeLoopIndex;
                    $(".btn-s").find(".item").hide().siblings("span").show();
                    $(".btn-s").eq(index).find(".item").show().siblings("span").hide();
                }
//                paginationClickable: true,
//                pagination: '#bannerpagination',
//                paginationClickable: true,
//                grabCursor: true,
//                parallax: true,
                //其他设置
            });
            $('#slider1 .prev').click(function () {
                mySwiper1.swipePrev();
            })
            $('#slider1 .next').click(function () {
                mySwiper1.swipeNext();
            })

            $('#slider2 .prev').click(function () {
                mySwiper2.swipePrev();
            })
            $('#slider2 .next').click(function () {
                mySwiper2.swipeNext();
            })


            $(".mask").on("mouseover", function (e) {
                e.stopPropagation();
                var index = $(this).parents(".btn-s").index();
                $(".btn-s").find(".item").hide().siblings("span").show();
                $(this).siblings(".item").show().siblings("span").hide();
                mySwiper2.swipeTo(index, 1000, true);
                mySwiper2.stopAutoplay();
            })

//            $(".mask").mouseout(function (e) {
//                e.stopPropagation()
//                var index = $(this).index();
//                $(this).siblings(".item").animate({width: "80px"}, 200, function () {
//                    $(this).hide().siblings("span").show();
//                });
//            });
        })


    </script>

    <script src="http://hq.sinajs.cn/list=hk03383" id="src_code"></script>
    <script>
        function sear(code) {
            var rettag = eval("hq_str_" + code);
            var elements = rettag.split(",");
//            var volume = parseFloat(elements[12] / 10000).toFixed(2);
//            var turnover = parseInt(elements[11] / 10000);
//            var val1 = parseInt(elements[]).;
//            var val3 = parseInt(elements[11] / 10000);
//            var val4 = parseInt(elements[11] / 10000);
            var volume = parseFloat(elements[12] / 10000).toFixed(1);
            var turnover = parseInt(elements[11] / 10000);
            var val1=parseFloat(elements[6]).toFixed(2);


            var val3=parseFloat(elements[4]).toFixed(2);
            var val4=parseFloat(elements[5]).toFixed(2);
            var val5=parseFloat(elements[7]).toFixed(2);
            var val6=parseFloat(elements[8]).toFixed(2);
            if(0 == elements[6]){
                val1=parseFloat(elements[3]).toFixed(2);
                val5=0.00;
                val6=0.00;
                val3=parseFloat(elements[3]).toFixed(2);
                val4=parseFloat(elements[3]).toFixed(2);
            }
            document.getElementById('val01').innerText = val1;
            document.getElementById('val03').innerText = val3;
            document.getElementById('val04').innerText = val4;
//            document.getElementById('val01').innerText = elements[6];
//            document.getElementById('val03').innerText = elements[4];
//            document.getElementById('val04').innerText = elements[5];
            document.getElementById('val06').innerText = elements[1];
            document.getElementById('val07').innerText = elements[17] + ' ' + elements[18];
//            document.getElementById('val09').innerText = code;
            document.getElementById('val09').innerText = '（3383.HK）';
            document.getElementById('val11').innerText = volume;
            document.getElementById('val12').innerText = turnover;
            document.getElementById('val13').innerText = val5;
            document.getElementById('val14').innerText = val6;

            if (parseFloat(elements[3]) > parseFloat(elements[6])) {
                var temp = $('#share_image');
                temp.html("");
                temp.attr("src", "/public/img/home/index/main_shares_icon1.png");
                $('.share_image2').attr("src", "/public/img/home/invest/main_shares_down.png");
            }
        }
    </script>
    <script>sear("hk03383");</script>
</block>