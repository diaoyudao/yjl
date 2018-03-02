<extend name="./Application/Home/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/enter/enter-duty.css">
</block>
<block name="title">社会责任-雅居乐集团</block>
<block name="head_menu">
    <a class="tip" href="#">社会责任/</a>
</block>
<block name="body_main">
    <div class="">
        <img src="{$mobile_head_images[0].image_url1}" traditional_image="{$mobile_head_images[0].image_url2}"
             simplified_image="{$mobile_head_images[0].image_url1}" alt="" class="tags-img">
    </div>
    <div class="container pt-20 pb-20 bg-c">
        <div class="mt-20 bg-fff">
            <div class="top-box">
                <div class="web-stick">教育事业</div>
            </div>
            <div class="bottom-box">
                <div class="container pt-10 pb-10">
                    <div class="left col-xs-4">
                        <a href="/news/detail?id={$education_notices[0].notice_id}">
                            <img src="{$education_notices[0]['image_url1']}"
                                 traditional_image="{$education_notices[0]['image_url2']}"
                                 simplified_image="{$education_notices[0]['image_url1']}" class="image">
                        </a>
                    </div>
                    <div class="right col-xs-7">
                        <p class="">
                            <a href="/news/detail?id={$education_notices[0].notice_id}">
                                {$education_notices[0]['name']}
                            </a>
                        </p>

                        <a href="/enter/educationlists?level_id=1000000167" class="fff  ">
                            <div class="btn-more2 mt-15">
                                查看更多
                            </div>
                        </a>

                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="mt-20 bg-fff">
            <div class="top-box">
                <div class="web-stick">环境保护</div>
            </div>
            <div class="bottom-box">
                <div class="container pt-10 pb-10">
                    <div class="left col-xs-4">
                        <a href="/news/detail?id={$environment_notices[0].notice_id}">
                            <img src="{$environment_notices[0]['image_url1']}"
                                 traditional_image="{$environment_notices[0]['image_url2']}"
                                 simplified_image="{$environment_notices[0]['image_url1']}" class="image">
                        </a>
                    </div>
                    <div class="right col-xs-7">
                        <p>
                            <a href="/news/detail?id={$environment_notices[0].notice_id}">
                                {$environment_notices[0]['name']}
                            </a>
                        </p>

                        <a href="/enter/environmentlists?level_id=1000000168" class="fff">
                            <div class="btn-more2 mt-15">
                                查看更多
                            </div>
                        </a>

                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="mt-20 bg-fff">
            <div class="top-box">
                <div class="web-stick">其他</div>
            </div>
            <div class="bottom-box">
                <div class="container pt-10 pb-10">
                    <div class="left col-xs-4">
                        <a href="/news/detail?id={$other_notices[0].notice_id}">
                            <img src="{$other_notices[0]['image_url1']}"
                                 traditional_image="{$other_notices[0]['image_url2']}"
                                 simplified_image="{$other_notices[0]['image_url1']}" class="image">
                        </a>
                    </div>
                    <div class="right col-xs-7">
                        <p class="">
                            <a href="/news/detail?id={$other_notices[0].notice_id}">
                                {$other_notices[0]['name']}
                            </a>
                        </p>

                        <a href="/enter/otherlists?level_id=1000000169" class="fff">
                            <div class="btn-more2 mt-15">
                                查看更多
                            </div>
                        </a>

                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>

    </div>
</block>


<block name="footer_js">
    <script>
        $(function () {

        })
    </script>
</block>
