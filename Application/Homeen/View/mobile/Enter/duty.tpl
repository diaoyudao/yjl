<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/enter/enter-duty.css">
</block>
<block name="title">Social Responsibilities-Agile Group</block>
<block name="head_menu">
    <a class="tip" href="#">Social Responsibilities/</a>
</block>
<block name="body_main">
    <div class="">
        <img src="{$mobile_head_images[0].image_url1}" traditional_image="{$mobile_head_images[0].image_url2}"
             simplified_image="{$mobile_head_images[0].image_url1}" alt="" class="tags-img">
    </div>
    <div class="container pt-20 pb-20 bg-c">
        <div class="mt-20 bg-fff">
            <div class="top-box">
                <div class="web-stick" style="font-size: 1.1rem">Education</div>
            </div>
            <div class="bottom-box">
                <div class="container pt-10 pb-10">
                    <div class="left col-xs-4">
                        <a href="/en/news/detail?id={$education_notices[0].notice_id}">
                            <img src="{$education_notices[0]['image_url1']}"
                                 traditional_image="{$education_notices[0]['image_url2']}"
                                 simplified_image="{$education_notices[0]['image_url1']}" class="image">
                        </a>
                    </div>
                    <div class="right col-xs-7">
                        <p class="">
                            <a href="/en/news/detail?id={$education_notices[0].notice_id}">
                                {$education_notices[0]['name']}
                            </a>
                        </p>

                        <a href="/en/enter/educationlists?level_id=1000000167" class="fff  ">
                            <div class="btn-more2 mt-15">
                                More
                            </div>
                        </a>

                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="mt-20 bg-fff">
            <div class="top-box">
                <div class="web-stick" style="font-size: 1.1rem">Environment</div>
            </div>
            <div class="bottom-box">
                <div class="container pt-10 pb-10">
                    <div class="left col-xs-4">
                        <a href="/en/news/detail?id={$environment_notices[0].notice_id}">
                            <img src="{$environment_notices[0]['image_url1']}"
                                 traditional_image="{$environment_notices[0]['image_url2']}"
                                 simplified_image="{$environment_notices[0]['image_url1']}" class="image">
                        </a>
                    </div>
                    <div class="right col-xs-7">
                        <p>
                            <a href="/en/news/detail?id={$environment_notices[0].notice_id}">
                                {$environment_notices[0]['name']}
                            </a>
                        </p>

                        <a href="/en/enter/environmentlists?level_id=1000000168" class="fff">
                            <div class="btn-more2 mt-15">
                                More
                            </div>
                        </a>

                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="mt-20 bg-fff">
            <div class="top-box">
                <div class="web-stick" style="font-size: 1.1rem">Other</div>
            </div>
            <div class="bottom-box">
                <div class="container pt-10 pb-10">
                    <div class="left col-xs-4">
                        <a href="/en/news/detail?id={$other_notices[0].notice_id}">
                            <img src="{$other_notices[0]['image_url1']}"
                                 traditional_image="{$other_notices[0]['image_url2']}"
                                 simplified_image="{$other_notices[0]['image_url1']}" class="image">
                        </a>
                    </div>
                    <div class="right col-xs-7">
                        <p class="">
                            <a href="/en/news/detail?id={$other_notices[0].notice_id}">
                                {$other_notices[0]['name']}
                            </a>
                        </p>

                        <a href="/en/enter/otherlists?level_id=1000000169" class="fff">
                            <div class="btn-more2 mt-15">
                                More
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
