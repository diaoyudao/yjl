<extend name="./Application/Homeen/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/join/join-index.css">
</block>
<block name="body_main">
    <div class="section1">
        <div class="slider">
            <img src="/public_en/img/home/join/join1.png">
        </div>
    </div>
    <div class="section2">
        <div class="content container">
            <span>员工发展</span>
            <div class="switch">
                <img class="first" src="/public_en/img/home/join/join_p1.png">
                <div class="page">
                    <a href=""><img src="/public_en/img/home/join/prev.png"></a>
                    <img src="/public_en/img/home/join/join_p2.png">
                    <img src="/public_en/img/home/join/join_p3.png">
                    <img src="/public_en/img/home/join/join_p4.png">
                    <img src="/public_en/img/home/join/join_p5.png">
                    <img src="/public_en/img/home/join/join_p6.png">
                    <a href=""><img src="/public_en/img/home/join/next.png"></a>
                </div>
                <span class="first">漫步戈壁滩</span>
                <span class="second">10月13日，雅居乐集团控股有限公司董事会欣然公布，于2016年9月份，本公司及其附属公司的预售金额为人民币66.0亿元；预售建筑面积为61.3万平方米；平均预售价为每平方米人民币10,775元。</span>
                <span class="last"><a href=""><img src="/public_en/img/home/join/more.png"></a></span>
            </div>
        </div>
    </div>
    <div class="section3">
        <div class="slider">
            <img class="first" src="/public_en/img/home/join/join2.png">
            <div class="s3_content">
                <a href=""><img src="/public_en/img/home/join/btn1.png"></a>
                <a href=""><img src="/public_en/img/home/join/btn2.png"></a>
            </div>
        </div>
    </div>
</block>


<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(4).addClass("active").siblings().removeClass("active");
        })
    </script>
</block>
