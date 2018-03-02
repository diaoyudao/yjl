<extend name="./Application/Home/View/mobile/base/common.tpl"/>

<block name="title">管治理念-雅居乐集团</block>

<block name="head_menu">
    <a class="tip" href="#">管治理念/</a>
</block>

<block name="body_main">
    <div class="container mt-30 mb-30" >
        <div class="row txt-center main-title">管治理念</div>
        <img class="img-responsive mt-20" src="/public/img/mobile/invest/control/head-1.jpg">
        <p class="mt-10">
            本集团由本公司董事会领导和管理。董事会的主要职责是实现股东价值最大化，而且能在股东、顾客、雇员及本公司业务伙伴及大众等利益相关者之间取得平衡。
        </p>
        <p class="mt-10">
            本公司参照国际标准及香港联合交易所有限公司的企业管治守则，为本公司于企业管治原则的应用和推行提供适当的指引。董事会采纳本公司制定的企业管治政策，它不仅清楚列明董事会的职能及权责范围外，还设立四个董事委员会，包括审核委员会、提名委员会、薪酬委员会及风险管理委员会。各委员会均已制定明确的职权范围涵盖其责任、权力及功能。董事会及其委员会主要职责包括监管公司管治的执行、监督及建议管理层财务和业务发展策略及目标、监督涉及公众披露事项，和评定管理层表现是否达到公司营运目标。
        </p>
        <div class="me-hidden" id="more-p">
        <p class="mt-10">本集团通过向股东和投资者及时发布讯息来维持公司高透明度的管治机制。我们努力透过多种渠道披露公司相关讯息，包括年报、中期报告、公告及股东通函及新闻发布。这些资料可从集团网站下载。</p>
        <p class="mt-10">此外，集团在业绩公布后，随即举行新闻发布会及分析员简报会，由集团董事及管理层解答提问。分析员简报会亦会上载至本集团网站。本集团设有专责小组，由主席领导工作，负责处理投资者关系及传媒查询。管理层不时与股东、机构投资者及证券分析员会面，向他们讲解本集团业务最新发展情况及邀请他们进行实地考察。</p>
        <p class="mt-10">除董事委员会外，本集团也非常重视内部监控的工作，审计监察部主要是协助董事会及高级管理层管理企业风险、监察本集团遵守适用监管规定及指引的清况，以加强本集团内部监控机制的成效。</p>
        </div>
        <div class="row cl mt-20 main-btn" id="show-more">查看更多</div>
        <div class="row cl mt-15 main-btn" id="down-file2">《组织章程大纲及细则》</div>
        <div class="row cl mt-15 main-btn" id="down-file1">《股东提名人选参选董事程序》</div>
    </div>      
</block>

<block name="footer_js">
    <script type="text/javascript">
        $(function () {      
            $('#show-more').click(function(){
                $(this).hide();
                $('#more-p').show();
            });

            $('#down-file2').click(function(){
                var lang = $.cookie("lang_select");
                if(!lang || "t" == lang) {
                    window.open('/public/file/222.pdf');
                } else {
                    window.open('/public/file/222.pdf');
                }
            });

            $('#down-file1').click(function(){
                var lang = $.cookie("lang_select");
                if(lang && "t" == lang) {
                    window.open('/public/file/111_traditional.pdf');
                } else {
                    window.open('/public/file/111_single.pdf');
                }
            });
            
        });
    </script>
</block>