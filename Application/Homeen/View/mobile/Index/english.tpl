<extend name="./Application/Homeen/View/default/base/common.tpl"/>
<block name="head_common1">
    <style>
        .main{
            height: 700px;
            position: relative;
            overflow: hidden;
        }
        .main .word {
            position: absolute;
            width: 543px;
            height: 105px;
            text-align: center;
            left: 50%;
            margin-left: -270px;
            top: 312px;
            font-size: 50px;
            line-height: 105px;
            color: white;
            background:url("/public_en/img/home/index/english/jx.png") no-repeat ;

        }

        .main .word span{
            padding-top:33px;
        }

    </style>
</block>
<block name="body_main">
    <div class="main section1 pic-box">
        <img src="/public_en/img/home/index/english/english_bg.jpg" alt="" class="pic">
        <div class="word">
            <span>COMING SOON...</span></div>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {
            $("select[name=language]").val("english");
            $("select[name=language]").off("change");
            $("select[name=language]").on("change", function () {
                var value = $(this).val();
                if ("chinese" == value) {
//                    cantonese.zh_tran('s');
                    var lang = "s";
                    Cookie_img.cookie(lang, 1);
                    window.history.back();


                } else if ("cantonese" == value) {
//                    cantonese.zh_tran('t');
                    var lang = "t";
                    Cookie_img.cookie(lang, 1);
                    window.history.back();
                }
            })
        })
    </script>
</block>

