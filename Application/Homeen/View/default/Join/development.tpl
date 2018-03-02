<extend name="./Application/Homeen/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/news/news-group.css">
</block>
<block name="head_common2">
    <script src="/public_en/js/lib/jquery.masonry.min.js"></script>
</block>
<block name="title">Employee Development-Agile Group</block>

<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                    href="/join/index?level_id=1000000135">Join Agile</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span><a href="/en/join/staff?level_id=1000000148">Employee Development</a></span>&nbsp;&nbsp;
            > &nbsp;&nbsp;<span>Corporate Cultural Activities</span></p>
            <h2>Corporate Cultural Activities</h2>

            <include file="./Application/Homeen/View/default/base/newslistsmain.tpl" />

        </div>
    </div>
</block>
<block name="footer_js">
    <script src="/public_en/js/home/newsLists.js" type="text/javascript"></script>
    <script  type="text/javascript">
        $(function(){
            $(".header .nav li").eq(4).addClass("active").siblings().removeClass("active");
        });

        var initPages = {$total_pages};
    </script>
</block>