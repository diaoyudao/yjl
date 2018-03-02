<extend name="./Application/Homeen/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/news/news-group.css">
</block>
<block name="head_common2">
    <script src="/public_en/js/lib/jquery.masonry.min.js"></script>
</block>
<block name="title">Environment-Agile Group</block>

<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                    href="/en/enter/index?level_id=1000000123">A Glance at Agile</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span><a href="/en/enter/duty?level_id=1000000138">Social Responsibilities</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span>Environment</span>
            <h2>Environment</h2>

            <include file="./Application/Homeen/View/default/base/newslistsmain.tpl" />

        </div>
    </div>
</block>
<block name="footer_js">
    <script src="/public_en/js/home/newsLists.js" type="text/javascript"></script>
    <script  type="text/javascript">
        $(function(){
               $(".header .nav li").eq(1).addClass("active").siblings().removeClass("active");
        });

        var initPages = {$total_pages};
    </script>
</block>