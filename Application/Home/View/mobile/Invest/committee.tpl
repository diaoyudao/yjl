<extend name="./Application/Home/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/invest/committee.css">
</block>
<block name="title">董事委员会-雅居乐集团</block>

<block name="head_menu">
    <a class="tip" href="#">董事委员会/</a>
</block>

<block name="body_main">
    <div class="container mt-30 mb-30 text-c" >
        <div class="row txt-center main-title">董事委员会</div>

        <div class="top-title">审核委员会</div>
        <p class="mt-15">
            邝志强先生（委员会主席）<br>
            郑汉钧博士 GBS，OBE，JP<br>
            许照中先生 JP<br>
            黄绍开先生
        </p>
        <div class="bottom-btn" id="btn-1">审核委员会职权范围书 ></div>
        <hr class="hr-oper"/>
        <div class="top-title">薪酬委员会</div>
        <p class="mt-15">
            郑汉钧博士 GBS，OBE，JP（委员会主席）<br>
            邝志强先生<br>
            陆倩芳女士<br>
            许照中先生 JP<br>
            黄绍开先生
        </p>
        <div class="bottom-btn" id="btn-2">薪酬委员会职权范围书 ></div>
        <hr class="hr-oper"/>
        <div class="top-title">提名委员会</div>
        <p class="mt-15">
            许照中先生 JP（委员会主席）<br>
            郑汉钧博士 GBS，OBE，JP<br>
            邝志强先生<br>
            陆倩芳女士<br>
            黄绍开先生
        </p>
        <div class="bottom-btn" id="btn-3">提名委员会职权范围书 ></div>
        <hr class="hr-oper"/>
        <div class="top-title">风险管理委员会</div>
        <p class="mt-15">
            黄奉潮先生 （委员会主席）<br>
            陈卓雄先生<br>
            陈忠其先生<br>
            黄绍开先生
        </p>
        <div class="bottom-btn" id="btn-4">风险管理委员会职权范围书 ></div>
    </div>
</block>

<block name="footer_js">
    <script type="text/javascript">
        $(function () {
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