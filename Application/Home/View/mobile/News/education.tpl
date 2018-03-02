<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/news/news-group.css">
</block>
<block name="head_common2">
    <script src="/public/js/lib/jquery.masonry.min.js"></script>
</block>
<block name="title">教育-雅居乐集团</block>

<block name="head_menu">
    <a class="tip" href="#">教育/</a>
</block>

<block name="body_main">
    <div class="content container bg-c">     
        <div class="row"><span class="main-title">教育</span></div>

        <include file="./Application/Home/View/mobile/base/newslistsmain.tpl" /> 
    </div>
</block>

<block name="footer_js">
    <include file="./Application/Home/View/mobile/base/newslistsjs.tpl" />
</block>