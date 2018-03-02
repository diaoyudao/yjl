<extend name="./Application/Home/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/join/join-index.css">
</block>
<block name="head_common2">
    <script src="/public/js/lib/preview.js"></script>
</block>
<block name="title">加入雅居乐-雅居乐集团</block>

<block name="body_main">
    <div class="section1">
        <div class="slider">
            <div class="pic-box">
                <a target="_blank" <notempty name="item.link_url1"> href='{$item.link_url1}'</notempty> >
                <img src="{$head_images[0].image_url1}" traditional_image="{$head_images[0].image_url2}"
                     simplified_image="{$head_images[0].image_url1}" alt="" class="pic">
                     </a>
            </div>
            <!--<img class="first" src="{$notices.image_url1}">-->
            <!--<div class="box">-->
                <!--<span class="title">不强求最优秀的人</span><br>-->
                <!--<span class="word">但强调任用<span style="background: #007069;display: inline-block;padding:5px;">最合适</span>的人</span>-->
            <!--</div>-->
        </div>

        <div class="items">
            <ul class="container">
                <li style="margin-left: 0;">
                    <div class="coverbox">
                        <img src="/public/img/home/join/index_sec1_p1.jpg" alt="">
                        <div class="cover" style="visibility: hidden"></div>
                    </div>
                    <div class="box">
                        <div class="title">企业远景</div>
                    </div>
                    <div class="hide-box" style="display: none;">
                        <div class="title">企业远景</div>
                        <p>为客户创建一个高枕无忧的人生</p>
                    </div>
                </li>
                <li class="sce">
                    <div class="coverbox">
                        <img src="/public/img/home/join/index_sec1_p2.jpg" alt="">
                        <div class="cover" style="visibility: hidden"></div>
                    </div>
                    <div class="box">
                        <div class="title">企业使命</div>
                    </div>
                    <div class="hide-box" style="display: none;">
                        <div class="title">企业使命</div>
                        <p>本着将心比心的态度经营，务求从细微处了解每个客户的需求，一点一滴改善生活的每个细节，为客户创造产品的服务。</p>
                    </div>
                </li>
                <li class="tri">
                    <div class="coverbox">
                        <img src="/public/img/home/join/index_sec1_p3.jpg" alt="">
                        <div class="cover" style="visibility: hidden"></div>
                    </div>
                    <div class="box">
                        <div class="title">企业主张</div>
                    </div>
                    <div class="hide-box" style="display: none;">
                        <div class="title">企业主张</div>
                        <p>让住户生活的更自在、无忧、快乐。为业主和投资者，带来永续的回报价值。</p>
                    </div>
                </li>
            </ul>
        </div>
    </div>




    <div class="join-nav">
        <div class="container">
            <p style="font-size: 30px;color: white;margin-top: 75px;text-align: center;">企业精神</p>
            <ul>
                <li style="margin-left: 0;">
                    <div class="cover"></div>
                    <img src="/public/img/home/join/icon1.png" alt="">
                    <p>远见</p>
                    <!--<div class="contain" style="display: none;">-->
                        <!--<a href="/business/property" class="btn-more">了解更多</a>-->
                    <!--</div>-->
                </li>
                <li>
                    <div class="cover"></div>
                    <img src="/public/img/home/join/icon2.png" alt="">
                    <p>衷诚</p>
                </li>
                <li>
                    <div class="cover"></div>
                    <img src="/public/img/home/join/icon6.png" alt="">
                    <p>协作</p>
                </li>
                <li>
                    <div class="cover"></div>
                    <img src="/public/img/home/join/icon7.png" alt="" style="height: 56px;">
                    <p>尊重</p>
                </li>
            </ul>
        </div>
    </div>

    <div class="section3">
        <div class="slider">
            <div class="pic-box">
                <img src="{$development_images[0].image_url1}" traditional_image="{$development_images[0].image_url2}"
                     simplified_image="{$development_images[0].image_url1}" alt="" class="pic">
            </div>
            <!--<div class="box">-->
                <!--<span class="title">致青春·加入雅居乐</span><br>-->
                <!--<span class="word">JOIN US</span>-->
            <!--</div>-->
            <div class="s3_content">
                <a class="btn-more1"  href="/join/staff?level_id=1000000148">了解更多</a>
            </div>
        </div>
    </div>
    <div class="section3">
        <div class="slider">
            <div class="pic-box">
                <img src="{$join_images[0].image_url1}" traditional_image="{$join_images[0].image_url2}"
                     simplified_image="{$join_images[0].image_url1}" alt="" class="pic">
            </div>
            <!--<div class="box">-->
                <!--<span class="title">致青春·加入雅居乐</span><br>-->
                <!--<span class="word">JOIN US</span>-->
            <!--</div>-->
            <div class="s3_content">

                <a target="_blank" href="http://agile.zhiye.com/Social" class="btn-more1 ">
                    社会招聘
                </a>
                <a target="_blank" href="http://campus.51job.com/agile2018" class="btn-more1 " style="margin-left:17px;">
                    校园招聘
                </a>
            </div>
        </div>
    </div>


    <div class="section2">
        <div class="content container">
            <span style="font-size: 40px;color: #007069;margin-top: 50px;margin-bottom: 30px;display: inline-block;">文化活动</span><br>
            <div class="box" id="image-lists">
                <a href="">
                    <div class="photo"></div>
                </a>
                <div class="list">
                    <i class="prev"></i>
                    <div class="warp"></div>
                    <i class="next"></i>
                </div>
                <div class="text">
                    <div class="item" style="display: block;" id="image-context">
                        <div class="title"><a id="develop-title" href=""></a></div>
                        <p></p>
                        <br>
                        <a href="/join/development?level_id=1000000201" class="btn-more">更多</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</block>


<block name="footer_js">
    <script>

        $(function () {


            $(".header .nav li").eq(4).addClass("active").siblings().removeClass("active");

//            $(".join-nav li").mouseover(function () {
//                var index = $(this).index();
//                $(this).find(".contain").show().parent().siblings().find(".contain").hide();
//            });

            $(".section1 .items li").on("mouseover", function () {
                $(this).find(".cover").css({visibility: "visible"});
                $(this).find(".box").hide();
                $(this).find(".hide-box").show();
            })

            $(".section1 .items li").on("mouseout", function () {
                $(this).find(".cover").css({visibility: "hidden"});
                $(this).find(".box").show();
                $(this).find(".hide-box").hide();
            })


            var temp = JSON.parse('<php>echo json_encode($notices);</php>');
            acImageText.init(temp);
            var head_images = JSON.parse('<php>echo json_encode($head_images);</php>');
        })
    </script>
</block>
