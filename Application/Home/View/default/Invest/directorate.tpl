<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/invest/invest-directorate.css">
</block>
<block name="title">董事会-雅居乐集团</block>

<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p style="float:left;margin-bottom: 34px;"><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span><a
                    href="/invest/index?level_id=1000000136">投资者关系</a></span>
                &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<a
                        href="/invest/governance?level_id=1000000200">企业管治</a></span>
                &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span>董事会</span>
            </p>

            <h2 style="margin-bottom: 80px;text-align: center;margin-top: 60px;">董事会</h2>

            <div class="left"><img src="/public/img/home/invest/directorate_p1.jpg" alt=""></div>
            <div class="right">
                <div class="box">
                    <div class="title">执行董事与非执行董事</div>
                    <p>陈卓林先生（执行董事） （主席兼总裁） </p>
                    <p>陈卓贤先生（非执行董事） （副主席）</p>
                    <p>陆倩芳女士（非执行董事） （副主席）</p>
                    <p>陈卓雄先生（执行董事）</p>
                    <p>黄奉潮先生（执行董事）</p>
                    <p>陈忠其先生（执行董事）</p>
                    <p>陈卓喜先生（非执行董事） </p>
                    <p>陈卓南先生（非执行董事）</p>
                </div>
                <div class="box" style="margin-top: 35px;">
                    <div class="title">独立非执行董事</div>
                    <p>郑汉钧博士 GBS，OBE，JP </p>
                    <p>邝志强先生 </p>
                    <p>许照中先生 JP </p>
                    <p>黄绍开先生  </p>
                </div>
            </div>

        </div>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(3).addClass("active").siblings().removeClass("active");
        })
    </script>
</block>