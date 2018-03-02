<extend name="./Application/Homeen/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/invest/invest-control.css">
</block>
<block name="title">Corporate Governance-Agile Group</block>

<block name="body_main">
    <!--<div class="top-box section1">-->
    <!--<div class="pic-box">-->
    <!--<img  src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"-->
    <!--simplified_image="{$head_images[0]['image_url1']}" class="pic">-->
    <!--</div>-->
    <!--</div>-->

    <div class="content container section1">
        <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span><a
                        href="/en/invest/index?level_id=1000000136">Investor Relations</a></span>
            &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<a
                    href="/en/invest/governance?level_id=1000000200">Corporate Governance</a></span>
            &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span>Corporate Governance</span>
        </p>
        <h2>Corporate Governance</h2>

        <!--<div class="word">-->
        <!--<p>本集团由本公司董事会领导和管理。董事会的主要职责是实现股东价值最大化，而且能在股东、顾客、雇员及本公司业务伙伴及大众等利益相关者之间取得平衡。 </p>-->
        <!--<p>-->
        <!--本公司参照国际标准及香港联合交易所有限公司的企业管治守则，为本公司于企业管治原则的应用和推行提供适当的指引。董事会采纳本公司制定的企业管治政策，它不仅清楚列明董事会的职能及权责范围外，还设立四个董事委员会，包括审核委员会及风险管理委员会。各委员会均已制定明确的职权范围涵盖其责任、权力及功能。董事会及其委员会主要职责包括监管公司管治的执行、监督及建议管理层财务和业务发展策略及目标、监督涉及公众披露事项，和评定管理层表现是否达到公司营运目标。</p>-->
        <!--<p>本集团通过向股东和投资者及时发布讯息来维持公司高透明度的管治机制。我们努力透过多种渠道披露公司相关讯息，包括年报、中期报告、公告及股东通函及新闻发布。这些资料可从集团网站下载。</p>-->
        <!--<p>-->
        <!--此外，集团在业绩公布后，随即举行新闻发布会及分析员简报会，由集团董事及管理层解答提问。分析员简报会亦会上载至本集团网站。本集团设有专责小组，由主席领导工作，负责处理投资者关系及传媒查询。管理层不时与股东、机构投资者及证券分析员会面，向他们讲解本集团业务最新发展情况及邀请他们进行实地考察。</p>-->
        <!--<p style="margin-bottom: 75px;">除董事委员会外，本集团也非常重视内部监控的工作，审计监察部主要是协助董事会及高级管理层管理企业风险、监察本集团遵守适用监管规定及指引的清况，以加强本集团内部监控机制的成效。</p>-->
        <!--</div>-->

        <!--<div class="btns">-->
        <!--<a target="_blank" href="/public_en/file/222.pdf">《组织章程大纲及细则》</a>-->
        <!--<a target="_blank" href="/public_en/file/111.pdf" style="margin-left: 57px;">《股东提名人选参选董事程序》</a>-->
        <!--</div>-->

        <div class="left af">
            <img src="/public_en/img/home/invest/control_p1.jpg" alt=""><br>
            <a target="_blank" id="down-file2" style="margin-top: 35px;margin-bottom: 30px;">《Memorandum and Articles of Association》</a><br>
            <a target="_blank" id="down-file1" style="">《Procedures for a member to propose a person for election as director》</a>
        </div>
        <div class="left word">
            <p>
                The Group is managed under the direction of the Board of Directors (the "Board"), whose purpose is to
                maximize long-term shareholder value for our shareholders by addressing and balancing the concerns of
                our shareholders, customers, employees, business partners and the public at large.
            <p>
                With reference to international practices and corporate governance code of The Stock Exchange of Hong
                Kong Limited, it provides appropriate guidance on how the corporate governance principles are applied
                and promoted in the Company. The Board adopted its own Statement of Policy for Corporate Governance,
                which not only states clearly the responsibilities and terms of reference of the Board but also sets up
                three Board committees, namely, Audit Committee, Remuneration Committee and Nomination Committee. Each
                of them has its own defined terms of reference covering its duties, powers and functions. The main
                responsibilities of the Board and its committees are overseeing the issue on corporate governance,
                overseeing and advising the management in developing our financial and business goals, overseeing our
                public disclosures,and evaluating management's performance in pursuing and achieving these goals.
            </p>
            <p>
                The Group maintains high transparency with timely release of information to shareholders and investors.
                We strive to disclose relevant corporate information, including annual reports, interim reports,
                announcements and shareholder circulars as well as press releases. These information can also be
                downloaded from the Group's website.
            </p>
            <p>
                The Group also convenes post-results press conference and analyst meetings, with directors and
                management present to answer questions. Analyst briefings are posted onto the Group's website. The Group
                also established a specific team led by Chairman responsible for dealing with investor relations and
                media enquiries. From time to time, the management conduct meetings with shareholders, institutional
                investors and securities analysts, with an aim to elaborate the latest business development of the Group
                and invite them to have site visit.
            </p>
            <p>
                Apart from the Board committees, the Group places a great emphasis on the work of internal control. It
                established the internal audit department to assist the Board and the senior management in risk
                management and in monitoring compliance with applicable regulatory requirements and guidelines with a
                view to enhance the effectiveness of our internal control mechanisms.
            </p>
        </div>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(3).addClass("active").siblings().removeClass("active");

            $('#down-file2').click(function () {
                var lang = $.cookie("lang_select");
                if (!lang || "t" == lang) {
                    window.open('/public_en/file/222.pdf');
                } else {
                    window.open('/public_en/file/222.pdf');
                }
            });

            $('#down-file1').click(function () {
                var lang = $.cookie("lang_select");
                if (lang && "t" == lang) {
                    window.open('/public_en/file/111_traditional.pdf');
                } else {
                    window.open('/public_en/file/111_single.pdf');
                }
            });

        });
    </script>
</block>