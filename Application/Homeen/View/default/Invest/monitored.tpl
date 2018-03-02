<extend name="./Application/Homeen/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/invest/invest-monitored.css">
</block>
<block name="title">Internal Control-Agile Group</block>

<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p style="float:left;margin-bottom: 34px;"><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span><a
                            href="/en/invest/index?level_id=1000000136">Investor Relations</a></span>
                &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<a
                        href="/en/invest/governance?level_id=1000000200">Corporate Governance</a></span>
                &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span>Internal Control</span>
            </p>

            <h2 style="margin-bottom: 80px;text-align: center;margin-top: 60px;">Internal Control</h2>

            <div class="main">
                <p>
                    The Board is responsible for formulating proper internal control and risk management system for the
                    Group, and reviewing its effectiveness regularly through the audit committee.
                </p>
                <p style="margin-bottom: 75px;">
                    The internal audit department of the Company reports directly to the audit committee, responsible
                    for constantly supervising the work flow and risk assessment of each department of the Group, to
                    assist the Board and senior management complying with the applicable supervising requirements and
                    guidelines in risk control and supervision, so as to improve the efficiency of internal control
                    system. Through continuous internal audit and reporting from time to time, the internal audit
                    department will ensure the effective operation of the internal control system.
                </p>
                <img src="/public_en/img/home/invest/monitored_p1.jpg" alt="">
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