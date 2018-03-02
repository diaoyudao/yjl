<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/invest/committee.css">
</block>
<block name="title">Board Committees-Agile Group</block>

<block name="head_menu">
    <a class="tip" href="#">Board Committees/</a>
</block>

<block name="body_main">
    <div class="container mt-30 mb-30 text-c" >
        <div class="row txt-center main-title">Board Committees</div>

        <div class="top-title">Audit Committee</div>
        <p class="mt-15">
            Mr. KwongChe Keung, Gordon (Committee Chairperson)<br>
            Dr. Cheng Hon Kwan GBS，OBE，JP<br>
            Mr. Hui Chiu Chung, Stephen JP<br>
            Mr. Wong Shiu Hoi, Peter
        </p>
        <div class="bottom-btn" id="btn-1">Terms of Reference for Audit Committee ></div>
        <hr class="hr-oper"/>
        <div class="top-title">Remuneration Committee</div>
        <p class="mt-15">
            Dr. Cheng Hon Kwan GBS，OBE，JP (Committee Chairperson)<br>
            Mr. KwongChe Keung, Gordon<br>
            Ms. Luk Sin Fong, Fion<br>
            Mr. Hui Chiu Chung, Stephen JP<br>
            Mr. Wong Shiu Hoi, Peter
        </p>
        <div class="bottom-btn" id="btn-2">Terms of Reference for Remuneration Committee ></div>
        <hr class="hr-oper"/>
        <div class="top-title">Nomination Committee</div>
        <p class="mt-15">
            Mr. Hui Chiu Chung, Stephen JP (Committee Chairperson)<br>
            Dr. Cheng Hon Kwan GBS, OBE, JP<br>
            Mr. KwongChe Keung, Gordon<br>
            Madam Luk Sin Fong, Fion<br>
            Mr. Wong Shiu Hoi, Peter
        </p>
        <div class="bottom-btn" id="btn-3">Terms of Reference for Nomination Committee ></div>
        <hr class="hr-oper"/>
        <div class="top-title">Risk Management Committee</div>
        <p class="mt-15">
            Mr. Huang Fengchao (Committee Chairperson) <br>
            Mr. Chan Cheuk Hung<br>
            Mr. Chen Zhongqi<br>
            Mr. Wong Shiu Hoi, Peter
        </p>
        <div class="bottom-btn" id="btn-4">Terms of Reference for Risk Management Committee ></div>
    </div>
</block>

<block name="footer_js">
    <script type="text/javascript">
        $(function () {
            $('#btn-1').click(function(){
                    window.open('/public_en/file/committee-1.pdf');

            });

            $('#btn-2').click(function(){

                    window.open('/public_en/file/committee-2.pdf');

            });

            $('#btn-3').click(function(){
                    window.open('/public_en/file/committee-3.pdf');
            });

            $('#btn-4').click(function(){

                    window.open('/public_en/file/committee-4.pdf');

            });
        })
    </script>
</block>