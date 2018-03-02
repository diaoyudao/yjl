<extend name="./Application/Home/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/news/news-group.css">
</block>
<block name="head_common2">
    <script src="/public/js/lib/jquery.masonry.min.js"></script>
</block>
<block name="title">环保-雅居乐集团</block>

<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                    href="/news/index?level_id=1000000129">新闻中心</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span><a href="/news/media?level_id=1000000141">媒体报道</a></span>&nbsp;&nbsp; > &nbsp;&nbsp;<span>环保</span></p>
            <h2>环保</h2>

            <include file="./Application/Home/View/default/base/newslistsmain.tpl" />
        </div>
    </div>
</block>

<block name="footer_js">
    <include file="./Application/Home/View/default/base/newslistsjs.tpl" />
</block>