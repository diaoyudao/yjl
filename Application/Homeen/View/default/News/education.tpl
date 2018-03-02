<extend name="./Application/Homeen/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/news/news-group.css">
</block>
<block name="head_common2">
    <script src="/public_en/js/lib/jquery.masonry.min.js"></script>
</block>
<block name="title">Education-Agile Group</block>

<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                            href="/news/index?level_id=1000000129">News Centre</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span><a href="/en/news/media?level_id=1000000141">Media Reports</a></span>&nbsp;&nbsp; > &nbsp;&nbsp;<span>Education</span>
            </p>
            <h2>Education</h2>

            <include file="./Application/Homeen/View/default/base/newslistsmain.tpl" />
        </div>
    </div>
</block>

<block name="footer_js">
    <include file="./Application/Homeen/View/default/base/newslistsjs.tpl" />
</block>