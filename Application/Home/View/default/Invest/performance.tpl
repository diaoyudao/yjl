<extend name="./Application/Home/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/invest/invest-notice.css">
</block>
<block name="head_common2">
    <script src="/public/js/lib/page.js"></script>
</block>
<block name="title">业绩发布材料-雅居乐集团</block>

<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                            href="/invest/index?level_id=1000000136">投资者关系</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span>业绩发布材料</span></p>
            <h2>业绩发布材料</h2>

        </div>
        <div style="text-align: center;color: #727272;margin-bottom: 30px;font-size: 18px; ">
            投资者推介会网上广播
        </div>
    </div>
    <div style="padding-bottom: 150px;">
        <div style="text-align: center;">
            <a target="_blank" href="{$image[0]['link_url1']}">
                {$image['image_url1']}
                <img src="{$image[0]['image_url1']}" traditional_image="{$image[0]['image_url2']}"
                     simplified_image="{$image[0]['image_url1']}" style="width: 797px;height: 595px;">
            </a>

        </div>

    </div>


</block>
<block name="footer_js">
</block>