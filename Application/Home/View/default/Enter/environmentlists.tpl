<extend name="./Application/Home/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/news/news-group.css">
</block>
<block name="head_common2">
    <script src="/public/js/lib/jquery.masonry.min.js"></script>
</block>
<block name="title">环境保护-雅居乐集团</block>

<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                    href="/enter/index?level_id=1000000123">走进雅居乐</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span><a href="/enter/duty?level_id=1000000138">社会责任</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span>环境保护</span>
            <h2>环境保护</h2>

            <include file="./Application/Home/View/default/base/newslistsmain.tpl" />

        </div>
    </div>
</block>
<block name="footer_js">
    <script src="/public/js/home/newsLists.js" type="text/javascript"></script>
    <script  type="text/javascript">
        $(function(){
               $(".header .nav li").eq(1).addClass("active").siblings().removeClass("active");
        });

        var initPages = {$total_pages};
    </script>
</block>