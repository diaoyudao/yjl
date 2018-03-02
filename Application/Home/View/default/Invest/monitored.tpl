<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/invest/invest-monitored.css">
</block>
<block name="title">内部监控-雅居乐集团</block>

<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p style="float:left;margin-bottom: 34px;"><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span><a
                    href="/invest/index?level_id=1000000136">投资者关系</a></span>
                &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<a
                        href="/invest/governance?level_id=1000000200">企业管治</a></span>
                &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span>内部监控</span>
            </p>

            <h2 style="margin-bottom: 80px;text-align: center;margin-top: 60px;">内部监控</h2>

            <div class="main">
            <p>董事会负责为本集团设立合适的内部控制及风险管理机制，并透过审核委员会定期检讨其成效。</p>
            <p>本公司的审计监察部直属审核委员会，负责持续监控本集团各部门的流程及评估风险，以协助董事会及高级管理层于风险管理及监督遵守</p>
            <p style="margin-bottom: 75px;">适用的监管要求及指引，从以加强内部管治机制的效率。通过持续性的内部审计及不时的汇报，审计监察部会确保了内部监控机制的有效运作。</p>
            <img src="/public/img/home/invest/monitored_p1.jpg" alt="">
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