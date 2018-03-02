<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/news/news-group.css">
</block>
<block name="head_common2">
    <script src="/public_en/js/lib/jquery.masonry.min.js"></script>
</block>
<block name="title">A-Living-Agile Group</block>

<block name="head_menu">
    <a class="tip" href="#">A-Living/</a>
</block>

<block name="body_main">
    <div class="content container bg-c">     
        <div class="row"><span class="main-title">A-Living</span></div>

        <include file="./Application/Homeen/View/mobile/base/newslistsmain.tpl" />
    </div>
</block>

<block name="footer_js">
    <include file="./Application/Homeen/View/mobile/base/newslistsjs.tpl" />
</block>