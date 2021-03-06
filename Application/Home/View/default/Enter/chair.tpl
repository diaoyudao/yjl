<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/enter/enter-chair.css">
</block>
<block name="title">主席专区-雅居乐集团</block>

<block name="body_main">
    <div class="content container section1">
        <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a href="/enter/index?level_id=1000000123">走进雅居乐</a></span>&nbsp;&nbsp;
            > &nbsp;&nbsp;<span>主席专区</span></p>
        <h2>主席专区</h2>


        <div class="left">
            <img src="/public/img/home/enter/president/president_p1.jpg" alt="">
            <div class="honor">
                <span class="title">社会荣誉</span>
                <ul>
                    <li>荣获“世界杰出华人奖”</li>
                    <li>荣获“中华慈善突出贡献人物”奖</li>
                    <li>荣获“改革开放30年，华人慈善30人”</li>
                    <li>荣获“中国企业十大卓越管理年度人物”</li>
                    <li>荣获“中山教育年度人物”奖</li>
                    <li>获授“中山市荣誉市民”称号、“中山市志愿服务贡献奖”</li>
                    <li>荣获“中山教育年度人物”奖</li>
                </ul>
            </div>
        </div>


        <div class="right">
            <span class="name">陈卓林</span>
            <span class="introduce">雅居乐集团创始人</span>
            <p>
                陈卓林，男，1962年3月生，祖籍广东中山，现任雅居乐集团控股有限公司董事局主席兼总裁。同时兼任中国侨商投资企业协会常务副会长、中国华文教育基金会名誉副会长、广东省侨商投资企业协会副会长、中山市侨资企业商会副会长、香港中山三乡同乡会荣誉首席会长。</p>
            <span class="title persen">个人经历</span>
            <ul>
                <li>1985年，在广东省中山市创办时代家具有限公司，所制造的家具时尚新颖，畅销全国。</li>
                <li>1992年，在广东省中山市创办雅居乐地产，正式进军房地产行业，开发了面向港澳客户的大型度假社区“中山雅居乐花园”；
                    打造了高端豪宅“雍景园”，被国家建设部评定为“小康住宅示范小区”；陈卓林率先在全国引入港式物业管理，率先聘请国际知名设计团队为项目做规划、建筑、园林及室内装饰设计，是当时中国房地产业的佼佼者。
                </li>
                <li>1997年，在广东省中山市建设了中国第二个36洞高尔夫球场“长江高尔夫球会”，获得良好口碑，一直享誉“中国十大高尔夫球会”。</li>
                <li>2000年，陈卓林带领雅居乐进军广州，同时开发四大豪宅项目，良好的产品质量，获得广州客户的高度认同。</li>
                <li>2005年，雅居乐地产控股有限公司在香港联合交易所主板上市（股票代码HK3383），陈卓林任董事会主席。</li>
                <li>2006年，陈卓林展开了雅居乐全国的发展蓝图，在各大城市和地区进行项目布局。</li>
                <li>2014年，雅居乐进军海外市场，在马来西亚吉隆坡核心地段收购2个住宅项目，首次跨出国门。</li>
                <li>2016年，陈卓林启动多元化发展战略，公司名称改为“雅居乐集团控股有限公司”，除主营业务地产板块以外，成立雅生活集团、环保集团、教育集团等，形成了多种业务联动的发展模式。</li>
            </ul>

            <span class="title">公益事业</span>
            <div class="public">
                <p>
                    陈卓林一直秉承“取之于社会、回馈于社会”的企业发展理念，在公司内部积极倡导良好的工作氛围，注重员工关怀；在社会上，致力于救灾、扶贫、助学等慈善活动，同时鼓励各地区公司成立义工队，鼓励员工积极参与义工活动，树立良好的社会责任感。自企业创办以来，累计向社会各界捐赠已超过12亿元。</p>
                <p>2008年，即成立“雅居乐员工互助会”，并身体力行，每年私人捐赠注入资金，以帮助每一位遇到困难的员工，爱心普及每个角落。</p>
                <p>2008年，汶川地震捐款1.56亿元。<br>
                    2008年， 成立“中国华文教育基金会”，历年累计捐赠7000万元。<br>
                    2010年，青海玉树地震捐款2000万元，并设立“雅居乐青海奖教助学基金”。<br>
                    2016年，支持海南热带海洋大学发展，捐赠1亿元。<br>
                </p>
            </div>
        </div>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(1).addClass("active").siblings().removeClass("active");
        });
    </script>
</block>