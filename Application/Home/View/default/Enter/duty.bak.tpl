<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/enter/enter-duty.css">
</block>
<block name="title">社会责任-雅居乐集团</block>

<block name="body_main">
    <div id="duty" class="section1">
        <div class="pic-box">
            <img src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                 simplified_image="{$head_images[0]['image_url1']}" alt="" class="pic">

        </div>
        <!--<div class="word">-->
            <!--<span class="title">坚持可持续发展</span><br>-->
            <!--<span class="en">HABITAT ART</span>-->
        <!--</div>-->
        <div class="content container">
            <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                            href="/enter/index?level_id=1000000123">走进雅居乐</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span>社会责任</span></p>
            <h2>社会责任</h2>


            <ul class="list1">
                <li class="col-xs-4">
                    <p>
                        <a href="/enter/educationlists?level_id={$education_notices[0]['level_id']}"><span class="name">教育事业</span></a>
                        <a href="/enter/educationlists?level_id=1000000167" style="line-height: 47px;float: right;font-size: 16px;color: #9d7cb3;vertical-align: middle;">查看更多></a>

                    </p>
                    <a href="/news/detail?id={$education_notices[0].notice_id}">
                        <img src="{$education_notices[0]['image_url1']}"
                             traditional_image="{$education_notices[0]['image_url2']}"
                             simplified_image="{$education_notices[0]['image_url1']}" alt="">
                    </a>
                    <p class="title"><a href="/news/detail?id={$education_notices[0].notice_id}">
                            {$education_notices[0]['name']}</a></p>
                    <ul class="list2">
                        <li class="last"><div class="li-left">·</div><div class="li-right"><a
                                    href="/news/detail?id={$education_notices[1].notice_id}">{$education_notices[1]['name']}</a></div>
                        </li>
                        <li class="last"><div class="li-left">·</div><div class="li-right"><a
                                    href="/news/detail?id={$education_notices[2].notice_id}">{$education_notices[2]['name']}</a></div></li>
                    </ul>
                </li>
                <li class="col-xs-4">
                    <p>
                        <a href="/enter/environmentlists?level_id={$environment_notices[0]['level_id']}"><span
                                    class="name">环境保护</span></a>
                        <a href="/enter/environmentlists?level_id=1000000168" style="line-height: 47px;float: right;font-size: 16px;color: #9d7cb3;vertical-align: middle;">查看更多></a>

                    </p>
                    <a href="/news/detail?id={$environment_notices[0].notice_id}">
                        <img src="{$environment_notices[0]['image_url1']}"
                             traditional_image="{$environment_notices[0]['image_url2']}"
                             simplified_image="{$environment_notices[0]['image_url1']}" alt="">
                    </a>
                    <p class="title">
                        <a href="/news/detail?id={$environment_notices[0].notice_id}">{$environment_notices[0].name}</a>
                    </p>
                    <ul class="list2">
                        <li class="last"><div class="li-left">·</div><div class="li-right"><a
                                    href="/news/detail?id={$environment_notices[1].notice_id}">{$environment_notices[1].name}</div></a>
                        </li>
                        <li class="last"><div class="li-left">·</div><div class="li-right"><a
                                    href="/news/detail?id={$environment_notices[2].notice_id}">{$environment_notices[2].name}</a></div></li>
                    </ul>
                </li>
                <li class="col-xs-4">
                    <p>
                        <a href="/enter/otherlists?level_id={$other_notices[0]['level_id']}"><span
                                    class="name">其他</span></a>
                        <a href="/enter/otherlists?level_id=1000000169" style="line-height: 47px;float: right;font-size: 16px;color: #9d7cb3;vertical-align: middle;">查看更多></a>

                    </p>
                    <a href="/news/detail?id={$other_notices[0].notice_id}">
                        <img src="{$other_notices[0]['image_url1']}"
                             traditional_image="{$other_notices[0]['image_url2']}"
                             simplified_image="{$other_notices[0]['image_url1']}" alt="">
                    </a>
                    <p class="title">
                        <a href="/news/detail?id={$other_notices[0].notice_id}">{$other_notices[0]['name']}</a>
                    </p>
                    <ul class="list2">
                        <li class="last "><div class="li-left ">· </div><div class="li-right "><a href="/news/detail?id={$other_notices[1].notice_id}">{$other_notices[1]['name']}</a></div></li>
                        <li class="last "><div class="li-left">·</div><div class="li-right"><a href="/news/detail?id={$other_notices[2].notice_id}">{$other_notices[2]['name']}</a></div></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</block>


<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(1).addClass("active").siblings().removeClass("active");
        })
    </script>
</block>
