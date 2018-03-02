<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>

<block name="title">Corporate Governance-Agile Group</block>

<block name="head_menu">
    <a class="tip" href="#">Corporate Governance/</a>
</block>

<block name="body_main">
    <div class="container mt-30 mb-30" >
        <div class="row txt-center main-title">Corporate Governance</div>
        <img class="img-responsive mt-20" src="/public_en/img/mobile/invest/control/head-1.jpg">
        <p class="mt-10">
            The Group is managed under the direction of the Board of Directors (the "Board"), whose purpose is to
            maximize long-term shareholder value for our shareholders by addressing and balancing the concerns of
            our shareholders, customers, employees, business partners and the public at large.
        </p>
        <p class="mt-10">
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
        <div class="me-hidden" id="more-p">
        <p class="mt-10">The Group maintains high transparency with timely release of information to shareholders and investors.
            We strive to disclose relevant corporate information, including annual reports, interim reports,
            announcements and shareholder circulars as well as press releases. These information can also be
            downloaded from the Group's website.
        </p>
        <p class="mt-10">The Group also convenes post-results press conference and analyst meetings, with directors and
            management present to answer questions. Analyst briefings are posted onto the Group's website. The Group
            also established a specific team led by Chairman responsible for dealing with investor relations and
            media enquiries. From time to time, the management conduct meetings with shareholders, institutional
            investors and securities analysts, with an aim to elaborate the latest business development of the Group
            and invite them to have site visit.        </p>
        <p class="mt-10">Apart from the Board committees, the Group places a great emphasis on the work of internal control. It
            established the internal audit department to assist the Board and the senior management in risk
            management and in monitoring compliance with applicable regulatory requirements and guidelines with a
            view to enhance the effectiveness of our internal control mechanisms.
        </p>
        </div>
        <div class="row cl mt-20 main-btn" id="show-more">More</div>
        <div class="row cl mt-15 main-btn" id="down-file2">《Memorandum and Articles of Association》</div>
        <div class="row cl mt-15 main-btn" id="down-file1">《Procedures for a member to propose a person for election as director》</div>
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
                    window.open('/public_en/file/222.pdf');
                } else {
                    window.open('/public_en/file/222.pdf');
                }
            });

            $('#down-file1').click(function(){
                var lang = $.cookie("lang_select");
                if(lang && "t" == lang) {
                    window.open('/public_en/file/111_traditional.pdf');
                } else {
                    window.open('/public_en/file/111_single.pdf');
                }
            });
            
        });
    </script>
</block>