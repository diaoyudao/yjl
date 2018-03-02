<extend name="./Application/Home/View/mobile/base/common.tpl"/>

<block name="head_common1">
  <link rel="stylesheet" type="text/css" href="/public/css/mobile/enter/index.css">
   <link type="text/css" rel="stylesheet" href="/public/hui3/lib/swiper3.4.1/css/swiper.min.css"/>
    
</block>
<block name="head_common2">
    
</block>
<block name="body_main">

    <style>
    html, body {
        position: relative;
        height: 100%;
    }
    body {
        background: #eee;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color:#000;
        margin: 0;
        padding: 0;
    }
    .swiper-container {
        width: 100%;
        height: 300px;
        
    }
    .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        
        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
    }
    </style>

    <!-- Swiper -->
    <div class="row cl">
        <img class="img-responsive" src="/public/img/mobile/enter/header-enter.jpg" traditional_image="/public/img/mobile/enter/header-enter.jpg"
             simplified_image="/public/img/mobile/enter/header-enter.jpg" alt="">
        <div class="head-more">
            <a href="/enter/group?level_id=1000000126"><div class="main-btn">了解更多</div></a>
        </div>
    </div>
    <div class="container row cl mt-20 mb-20 pt-20 pb-20">
        <div class="mask-left">
            <div class="maskWraper" style=""> <img src="/public/img/mobile/enter/pic1.jpg" >
                <a href="/enter/chair?level_id=1000000127"><div class="maskBar text-c">陈卓林专区</div></a>
            </div>
        </div>
        <div class="mask-right">
            <div class="maskWraper" style=""> <img src="/public/img/mobile/enter/pic2.jpg" >
                <a href="/enter/duty?level_id=1000000138"><div class="maskBar text-c">社会责任</div></a>
            </div>
        </div>
    </div>
    <div class="row cl news-bgc">
        <div class="row txt-center pb-30"><span class="main-title">集团发展历程</span></div>
        <div class="row cl news-bg">
        <volist name="history" id="item" offset="1" length='4'>
            <div class="row cl news-list">
                <div class="col-xs-2 year <if condition='$i == 4'>over</if>">{$item[0].tags}</div>
                <div class="tags"></div>
                <div class="col-xs-10 right-txt">
                    <div class="container row cl">
                        <div class="col-xs-11 news-txt ">{$item[0].name}</div>
                        <div class="col-xs-1 news-more"></div>
                    </div>
                </div>                
            </div>
            </volist>            
        </div>
        <div class="row cl main-btn">查看更多</div>
    </div>
    

    <div class="swiper-container" style="margin-top:50px;">
        <div class="swiper-wrapper">
            <div class="swiper-slide">Slide 1</div>
            <div class="swiper-slide">Slide 2</div>
            <div class="swiper-slide">Slide 3</div>
            <div class="swiper-slide">Slide 4</div>
            <div class="swiper-slide">Slide 5</div>
            <div class="swiper-slide">Slide 6</div>
            <div class="swiper-slide">Slide 7</div>
            <div class="swiper-slide">Slide 8</div>
            <div class="swiper-slide">Slide 9</div>
            <div class="swiper-slide">Slide 10</div>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
        <!-- Add Arrows -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
</block>

<block name="footer_js">
<script type="text/javascript" src="/public/hui3/lib/swiper3.4.1/js/swiper.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
    $(function(){
            $.Huihover('.maskWraper');

           
/*
            $('#slider1 .swiper-button-prev').click(function () {
                mySwiper1.swipePrev();
            })
            $('#slider1 .swiper-button-next').click(function () {
                mySwiper1.swipeNext();
            })            
*/
        });

    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        paginationClickable: true,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: 2500,
        autoplayDisableOnInteraction: false
    });
    </script>
</block>