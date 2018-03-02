<extend name="./Application/Home/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/news/news-group.css">
</block>
<block name="head_common2">
    <script src="/public/js/lib/jquery.masonry.min.js"></script>
</block>
<block name="title">员工发展-雅居乐集团</block>

<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                    href="/join/index?level_id=1000000135">加入雅居乐</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span><a href="/join/staff?level_id=1000000148">员工发展</a></span>&nbsp;&nbsp;
            > &nbsp;&nbsp;<span>文化活动</span></p>
            <h2>文化活动</h2>

            <include file="./Application/Home/View/default/base/newslistsmain.tpl" />

        </div>
    </div>
</block>
<block name="footer_js">
    <script src="/public/js/home/newsLists.js" type="text/javascript"></script>
    <script  type="text/javascript">
        $(function(){
            $(".header .nav li").eq(4).addClass("active").siblings().removeClass("active");
        });

        var initPages = {$total_pages};
    </script>
</block>