<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/invest/invest-committee.css">
</block>
<block name="title">董事委员会-雅居乐集团</block>

<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p style="float:left;margin-bottom: 34px;"><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span><a
                    href="/invest/index?level_id=1000000136">投资者关系</a></span>
                &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<a
                        href="/invest/governance?level_id=1000000200">企业管治</a></span>
                &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span>董事委员会</span>
            </p>

            <h2 style="margin-bottom: 80px;text-align: center;margin-top: 60px;">董事委员会</h2>

            <ul class="main">
                <li>
                    <div class="top">审核委员会</div>
                    <p>邝志强先生（委员会主席）</p>
                    <p>郑汉钧博士 GBS，OBE，JP</p>
                    <p>许照中先生 JP</p>
		    <p>黄绍开先生</p>
                    <div class="bottom" id="btn-1">审核委员会职权范围书</div>
                </li>
                <li>
                    <div class="top">薪酬委员会</div>
                    <p>郑汉钧博士 GBS，OBE，JP（委员会主席）</p>
                    <p>邝志强先生</p>
                    <p>陆倩芳女士</p>
                    <p>许照中先生 JP</p>
                    <p>黄绍开先生</p>
                    <div class="bottom" id="btn-2">薪酬委员会职权范围书</div>
                </li>
                <li>
                    <div class="top">提名委员会</div>
                    <p>许照中先生 JP（委员会主席）</p>
                    <p>郑汉钧博士 GBS，OBE，JP</p>
                    <p>邝志强先生</p>
                    <p>陆倩芳女士</p>
                    <p>黄绍开先生</p>
                    <div class="bottom" id="btn-3">提名委员会职权范围书</div>
                </li>
                <li>
                    <div class="top">风险管理委员会</div>
                    <p>黄奉潮先生 （委员会主席）</p>
                    <p>陈卓雄先生</p>
                    <p>陈忠其先生</p>
                    <p>黄绍开先生</p>
                    <div class="bottom" id="btn-4">风险管理委员会职权范围书</div>
                </li>
                <div class="clear"></div>
            </ul>

        </div>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(3).addClass("active").siblings().removeClass("active");

            $('#btn-1').click(function(){
                var lang = $.cookie("lang_select");
                if(lang && "t" == lang) {
                    window.open('/public/file/committee-1-traditional.pdf');
                } else {
                    window.open('/public/file/committee-1.pdf');
                }
            });

            $('#btn-2').click(function(){
                var lang = $.cookie("lang_select");
                if(lang && "t" == lang) {
                    window.open('/public/file/committee-2.pdf');
                } else {
                    window.open('/public/file/committee-2.pdf');
                }
            });

            $('#btn-3').click(function(){
                var lang = $.cookie("lang_select");
                if(lang && "t" == lang) {
                    window.open('/public/file/committee-3.pdf');
                } else {
                    window.open('/public/file/committee-3.pdf');
                }
            });

            $('#btn-4').click(function(){
                var lang = $.cookie("lang_select");
                if(lang && "t" == lang) {
                    window.open('/public/file/committee-4.pdf');
                } else {
                    window.open('/public/file/committee-4.pdf');
                }
            });
        })
    </script>
</block>