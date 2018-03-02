<extend name="./Application/Homeen/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/invest/invest-committee.css">
</block>
<block name="title">Board Committees-Agile Group</block>
<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p style="float:left;margin-bottom: 34px;"><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span><a
                    href="/en/invest/index?level_id=1000000136">Investor Relations</a></span>
                &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<a
                        href="/en/invest/governance?level_id=1000000200">Corporate Governance</a></span>
                &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span>Board Committees</span>
            </p>

            <h2 style="margin-bottom: 80px;text-align: center;margin-top: 60px;">Board Committees</h2>

            <ul class="main">
                <li>
                    <div class="top">Audit Committee</div>
                    <p>Mr. KwongChe Keung, Gordon (Committee Chairperson)</p>
                    <p>Dr. Cheng Hon Kwan GBS，OBE，JP</p>
		    <p>Mr. Hui Chiu Chung, Stephen JP</p>
                    <p>Mr. Wong Shiu Hoi, Peter</p>
                    <div class="bottom" id="btn-1">Terms of Reference for Audit Committee</div>
                </li>
                <li>
                    <div class="top">Remuneration Committee</div>
                    <p>Dr. Cheng Hon Kwan GBS，OBE，JP (Committee Chairperson)</p>
                    <p>Mr. KwongChe Keung, Gordon</p>
                    <p>Ms. Luk Sin Fong, Fion</p>
                    <p>Mr. Hui Chiu Chung, Stephen JP</p>
                    <p>Mr. Wong Shiu Hoi, Peter</p>
                    <div class="bottom" id="btn-2">Terms of Reference for Remuneration Committee</div>
                </li>
                <li>
                    <div class="top">Nomination Committee</div>
                    <p>Mr. Hui Chiu Chung, Stephen JP (Committee Chairperson)</p>
                    <p>Dr. Cheng Hon Kwan GBS, OBE, JP</p>
                    <p>Mr. KwongChe Keung, Gordon</p>
                    <p>Madam Luk Sin Fong, Fion</p>
                    <p>Mr. Wong Shiu Hoi, Peter</p>
                    <div class="bottom" id="btn-3">Terms of Reference for Nomination Committee</div>
                </li>

                <li>
                    <div class="top">Risk Management Committee</div>
                    <p>Mr. Huang Fengchao <br>(Committee Chairperson)</p>
                    <p>Mr. Chan Cheuk Hung</p>
                    <p>Mr. Chen Zhongqi</p>
                    <p>Mr. Wong Shiu Hoi, Peter</p>
                    <div class="bottom" id="btn-4">Terms of Reference for Risk Management Committee</div>
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