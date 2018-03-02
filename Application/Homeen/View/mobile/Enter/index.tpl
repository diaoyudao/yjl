<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>

<block name="head_common1">
  <link rel="stylesheet" type="text/css" href="/public_en/css/mobile/enter/index.css">
  <script type="text/javascript" src="/public_en/hui3/lib/jcarousellite.min.js"></script>

</block>
<block name="head_common2">
    <link type="text/css" rel="stylesheet" href="/public_en/hui3/lib/swiper3.4.1/css/swiper.min.css"/>
    <script type="text/javascript" src="/public_en/hui3/lib/swiper3.4.1/js/swiper.min.js"></script>
</block>
<block name="title">A Glance at Agile-Agile Group</block>

<block name="body_main">
   <div class="row ">
        <div class="swiper-container" id="banner-swiper">
        <div class="swiper-wrapper">
            <volist name="mobile_head_images" id="item">
                <div class="swiper-slide">
                    <a href='/en/enter/group?level_id=1000000126'
                                ><img class="banner-img" src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                      simplified_image="{$item.image_url1}" alt="">
                    </a>
                </div>

            </volist>
        </div>
        <if condition="1 lt count($mobile_head_images)"><div class="swiper-pagination"></div></if>
        </div>
    </div>
<div class="container row cl mt-20 mb-20 pt-20 pb-20">
    <div class="mask-left">
        <div class="maskWraper" style=""> <a href="/en/enter/chair?level_id=1000000127">
            <img src="/public_en/img/mobile/enter/pic1.jpg" >
            <div class="me-maskBar text-c">Chen Zhuo Lin</div>
            </a>
        </div>
    </div>
    <div class="mask-right">
        <div class="maskWraper" style=""> 
        <a onclick="show_expecting()" href="javascript:;">
            <img src="/public_en/img/mobile/enter/pic2.jpg" >
            <div class="me-maskBar text-c">Social Responsibility</div>
            </a>
        </div>
    </div>
</div>
<div class="row cl news-bgc">
    <div class="row txt-center pb-30"><span class="main-title">Group Milestones</span></div>
    <div class="row cl news-bg">
        <volist name="history" id="item" offset="0" length='5'>
            <div class="row cl news-list">
                <a onclick="show_expecting()" href="javascript:;">
                <div class="year <if condition='$i == 5'>over</if>">{$item[0].tags}</div>
                <div class="tags"></div>
                <div class="right-txt">
                    <div class="row cl">
                        <div class="news-txt ">

                            {$item[0].name}
                        </div>
                        <div class="news-more"></div>
                    </div>
                </div>  
                </a>              
            </div>
        </volist>            
    </div>
    <a onclick="show_expecting()" href="javascript:;"><div class="row cl main-btn" >More</div></a>
</div>
<div class="container row cl mt-30 mb-30" >
    <div class="row txt-center pb-30"><span class="main-title">Awards & Recognitions</span></div>
    <div class="rollpic cl txt-center " style="width:100%;display: block;margin:0 auto;"> 
        <a href="javascript:void(0)" class="prev"></a>
      <div class="rollpicshow" style="margin:0 auto;">
        <ul>
            <volist name="honor" id="item" >
                <li>
                    <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                       simplified_image="{$item.image_url1}" alt="" />
                    <div class="mt-15 mb-40 txt-center">{$item.name}</div>
                </li>                
            </volist>
        </ul>
      </div>
    <a href="javascript:void(0)" class="next"></a>
    </div>
</div>


</block>


<block name="footer_js">
    <script type="text/javascript">
        $(function(){

                    // banner swiper 切换
        var swiper_banner = new Swiper('#banner-swiper', {
            pagination: '.swiper-pagination',
            paginationClickable: true,
            spaceBetween: 30,
            centeredSlides: true,
            autoplay: 2500,
            autoplayDisableOnInteraction: false
        });

            $(".rollpicshow").jCarouselLite({
                auto: 5000, /*自动播放间隔时间*/
                speed: 500, /*速度*/
                btnNext:".next",/*向前滚动*/
                btnPrev:".prev",/*向后滚动*/
                visible:1 /*显示数量*/
            })

           
        });
        

    </script>
</block>

