<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/business/life.css">
</block>
<block name="title">雅生活-雅居乐集团</block>

<block name="head_menu">
    <a class="tip" href="#">雅生活/</a>
</block>

<block name="body_main">

    <div class="row ">
        <img class="img-responsive" src="{$mobile_head_images[0].image_url1}"
             traditional_image="{$mobile_head_images[0].image_url2}"
             simplified_image="{$mobile_head_images[0].image_url1}">
    </div>
    <div class="row main-bgc">
        <ol class="container life-list cl">
            <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Service/index/type/5">
                <li>
                    <div class="lift-btn oper"><img src="/public/img/home/business/index/index_icon1.png">
                        <div class="row f-7 txt-center main-color">物业</div>
                </li>
            </a>
            <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/1">
                <li>
                    <div class="lift-btn oper"><img src="/public/img/home/business/index/index_icon2.png">
                        <div class="row f-7 txt-center main-color">智慧园区</div>
                </li>
            </a>
            <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/2">
                <li>
                    <div class="lift-btn oper"><img src="/public/img/home/business/index/index_icon5.png">
                        <div class="row f-7 txt-center main-color">旅游</div>
                </li>
            </a>
            <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/3">
                <li>
                    <div class="lift-btn oper"><img src="/public/img/home/business/index/index_icon8.png">
                        <div class="row f-7 txt-center main-color">广告</div>
                </li>
            </a>
            <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/5">
                <li>
                    <div class="lift-btn oper"><img src="/public/img/home/business/index/index_icon3.png">
                        <div class="row f-7 txt-center main-color">验房</div>
                </li>
            </a>
            <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/4">
                <li>
                    <div class="lift-btn "><img src="/public/img/home/business/index/index_icon9.png">
                        <div class="row f-7 txt-center main-color">营销</div>
                </li>
            </a>
        </ol>
    </div>
    <div class="row txt-center mt-15"><span class="main-title">雅生活介绍</span></div>
    <div class="row mt-20">
        <img class="img-responsive" src="/public/img/mobile/business/life/life-1.jpg">
    </div>

    <div class="row container mb-30">
        <p class="mt-20"><strong>多元模块</strong></p>
        <p class="mt-10">
            “人是雅居乐关注的核心，雅居乐不仅要盖好房子，更希望全方位呵护业主的一生。”作为雅居乐集团“以地产为主，多元业务并行”战略规划下的首个产业集团，雅生活集团竭诚为业主提供全面的居家生活解决方案，目前已集结物业服务、网络科技、旅游、广告、营销、验房六大业务舰队。</p>
        <p class="mt-20"><strong>发展规模</strong></p>
        <p class="mt-10">
            截止2018年6月30日，雅生活集团管理范围覆盖全国27个省市自治区，服务类型涵盖主流住宅、高端豪宅、旅游地产、商业、写字楼等多种业态，合约总建筑面积为18563万平方米，拥有200多个项目，服务业主逾100万人。
        </p>
        <p class="mt-20"><strong>企业荣誉</strong></p>
        <p class="mt-10">
            依托“管理数字化、服务专业化、流程标准化和操作机械化”的发展战略，雅生活集团荣膺2018中国社区服务商TOP10、2018中国社区服务商·客户满意度模范企业、2018中国社区服务商·竞争力十强、2018中国社区服务商·资本市场关注度十强。
        </p>
    </div>
</block>

<block name="body_side">
    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box">（+86 ）020-88839995</div>
            </li>
            <li class="side-xin"><img src="/public/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public/img/home/business/life/two-code-life.jpg" alt="">
                </div>
            </li>
            <li class=""><a><img src="/public/img/mobile/base/go-top.jpg" alt=""></a></li>
        </ul>
    </div>
</block>

<block name="footer_js">
    <script>
		$(function () {

		})
    </script>
</block>
