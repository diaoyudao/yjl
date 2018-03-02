<extend name="./Application/Homeen/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/invest/invest-directorate.css">
</block>
<block name="title">Board Diectors-Agile Group</block>

<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p style="float:left;margin-bottom: 34px;"><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span><a
                    href="/en/invest/index?level_id=1000000136">Investor Relations</a></span>
                &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<a
                        href="/en/invest/governance?level_id=1000000200">Corporate Governance</a></span>
                &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span>Board Diectors</span>
            </p>

            <h2 style="margin-bottom: 80px;text-align: center;margin-top: 60px;">Board Diectors</h2>

            <div class="left"><img src="/public_en/img/home/invest/directorate_p1.jpg" alt=""></div>
            <div class="right">
                <div class="box">
                    <div class="title">Executive Directors and Non-executive Directors</div>
                    <p>Mr. Chen Zhuo Lin  (Executive Director)(Chairman and President) </p>
                    <p>Mr. Chan Cheuk Yin  (Non -executive Director)(Vice Chairperson) </p>
                    <p>Madam Luk Sin Fong, Fion  (Non -executive Director)(Vice Chairperson)</p>
                    <p>Mr. Chan Cheuk Hung  (Executive Director) </p>
                    <p>Mr. Huang Fengchao  (Executive Director)</p>
                    <p>Mr. Chen Zhongqi  (Executive Director)</p>
                    <p>Mr. Chan CheukHei  (Non -executive Director)</p>
                    <p>Mr. Chan Cheuk Nam  (Non -executive Director)</p>
                </div>
                <div class="box" style="margin-top: 35px;">
                    <div class="title">Independent Non-executive Directors</div>
                    <p>Dr. Cheng Hon Kwan GBS, OBE, JP </p>
                    <p>Mr. KwongChe Keung, Gordon</p>
                    <p>Mr. Hui Chiu Chung, Stephen JP</p>
                    <p>Mr. Wong Shiu Hoi, Peter</p>
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