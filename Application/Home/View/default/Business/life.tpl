<extend name="./Application/Home/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/business/business_life.css">
</block>
<block name="title">雅生活-雅居乐集团</block>

<block name="body_main">
    <div id="bu-life" class="section1">
        <div class="sliders">
            <img src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                 simplified_image="{$head_images[0]['image_url1']}" class="pic">
            <!--<div class="box">-->
            <!--<span class="title" style="color:#007069;">雅生活</span><br>-->
            <!--<span class="" style="color:#007069;font-size:24px;">让自然、建筑、人在充满归属感的空间中和谐共生</span><br>-->
            <!--<span class="word">AGILE LIVING</span>-->
            <!--</div>-->
        </div>

        <div class="main">
            <div class="nav-life">
                <!--<div class="bg-box">-->
                <!--<img src="/public/img/home/business/index/index_main_bg1.jpg" alt="" style="visibility: hidden">-->
                <!--<img src="/public/img/home/business/index/index_main_bg2.jpg" alt="" style="visibility: hidden">-->
                <!--<img src="/public/img/home/business/index/index_main_bg3.jpg" alt="" style="visibility: hidden">-->
                <!--<img src="/public/img/home/business/index/index_main_bg4.jpg" alt="" style="visibility: hidden">-->
                <!--<img src="/public/img/home/business/index/index_main_bg5.jpg" alt="" style="visibility: visible">-->
                <!--<img src="/public/img/home/business/index/index_main_bg6.jpg" alt="" style="visibility: hidden">-->
                <!--<img src="/public/img/home/business/index/index_main_bg7.jpg" alt="" style="visibility: hidden">-->
                <!--<img src="/public/img/home/business/index/index_main_bg8.jpg" alt="" style="visibility: hidden">-->
                <!--<img src="/public/img/home/business/index/index_main_bg9.jpg" alt="" style="visibility: hidden">-->
                <!--</div>-->
                <ul>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon1.png" alt="">
                        <span>物业</span>
                        <div class="contain" style="display: none;">
                            <!--<a href="/business/property?level_id=1000000186" class="btn-more">了解更多</a>-->
                            <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Service/index/type/5"
                               class="btn-more ">了解更多</a>
                        </div>
                    </li>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon2.png" alt="">
                        <span>智慧园区</span>
                        <div class="contain" style="display: none;">
                            <!--<a href="/business/net?level_id=1000000191"  class="btn-more">了解更多</a>-->
                            <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/1"
                               class="btn-more ">了解更多</a>
                        </div>
                    </li>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon5.png" alt="">
                        <span>旅游</span>
                        <div class="contain" style="display: none;">
                            <!-- <a href="/business/tour?level_id=1000000190"  class="btn-more">了解更多</a>-->
                            <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/2"
                               class="btn-more ">了解更多</a>
                        </div>
                    </li>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon8.png" alt="">
                        <span>广告</span>
                        <div class="contain" style="display: none;">
                            <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/3"
                               class="btn-more ">了解更多</a>
                        </div>
                    </li>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon3.png" alt="">
                        <span>验房</span>
                        <div class="contain" style="display: none;">
                            <!--<a href="/business/design?level_id=1000000188"  class="btn-more">了解更多</a>-->
                            <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/5"
                               class="btn-more ">了解更多</a>
                        </div>
                    </li>
                    <li class="col-xs-2">
                        <div class="cover"></div>
                        <img src="/public/img/home/business/index/index_icon9.png" alt="">
                        <span>营销</span>
                        <div class="contain" style="display: none;">
                            <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Business/index/type/4"
                               class="btn-more ">了解更多</a>
                        </div>
                    </li>
                    <!-- <li class="col-xs-2">
                         <div class="cover"></div>
                         <img src="/public/img/home/business/index/index_icon4.png" alt="">
                         <span>装饰</span>
                         <div class="contain" style="display: none;">
                             <a href="/business/decorate?level_id=1000000189"  class="btn-more">了解更多</a>
                         </div>
                     </li>
                     <li class="col-xs-2">
                         <div class="cover"></div>
                         <img src="/public/img/home/business/index/index_icon6.png" alt="">
                         <span>网络</span>
                         <div class="contain" style="display: none;">
                             <a href="/business/net?level_id=1000000191"  class="btn-more">了解更多</a>
                         </div>
                     </li>
                     <li class="col-xs-2">
                         <div class="cover"></div>
                         <img src="/public/img/home/business/index/index_icon7.png" alt="">
                         <span>智能</span>
                         <div class="contain" style="display: none;">
                             <a class="btn-more">敬请期待</a>
                         </div>
                     </li>-->
                </ul>
            </div>
        </div>

        <div class="content container">
            <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; &gt; &nbsp;&nbsp;<span><a
                            href="/business/index?level_id=1000000125">多元业务</a></span>&nbsp;&nbsp;
                &gt; &nbsp;&nbsp;<span>雅生活</span></p>
            <h2>雅生活介绍</h2>


            <div class="box">
                <div class="left">
                    <img src="/public/img/home/business/life/life_p1.png" alt="">
                </div>
                <div class="right">
                    <div class="title">多元模块</div>
                    <p>
                        “人是雅居乐关注的核心，雅居乐不仅要盖好房子，更希望全方位呵护业主的一生。”作为雅居乐集团“以地产为主，多元业务并行”战略规划下的首个产业集团，雅生活集团竭诚为业主提供全面的居家生活解决方案，目前已集结物业服务、网络科技、旅游、广告、营销、验房六大业务舰队。</p>
                    <div class="title">发展规模</div>
                    <p>
                        截止2018年6月30日，雅生活集团管理范围覆盖全国27个省市自治区，服务类型涵盖主流住宅、高端豪宅、旅游地产、商业、写字楼等多种业态，合约总建筑面积为18563万平方米，拥有200多个项目，服务业主逾100万人。                    </p>
                    <div class="title">企业荣誉</div>
                    <p>
                        依托“管理数字化、服务专业化、流程标准化和操作机械化”的发展战略，雅生活集团荣膺2018中国社区服务商TOP10、2018中国社区服务商·客户满意度模范企业、2018中国社区服务商·竞争力十强、2018中国社区服务商·资本市场关注度十强。
                    </p>
                </div>
            </div>

            <div class="side-list">
                <ul>
                    <li class="side-tel">
                        <img src="/public/img/home/business/estate/detail/estate_icon1.png" alt="">
                        <div class="tel-box">（86）020-88839995</div>
                    </li>
                    <!--<li><a href=""><img src="/public/img/home/business/estate/detail/estate_icon2.png" alt=""></a></li>-->
                    <!--<li><a href=""><img src="/public/img/home/business/estate/detail/estate_icon3.png" alt=""></a></li>-->
                    <li class="side-xin"><img src="/public/img/home/business/estate/detail/estate_icon4.png" alt="">
                        <div class="xin-box">
                            <div class="box-head"></div>
                            <img src="/public/img/home/business/life/two-code-life.jpg" alt="" width="130">
                        </div>
                    </li>
                    <li class=""><a onclick="history.go(-1);"><img
                                    src="/public/img/home/business/estate/detail/estate_icon7.png" alt=""></a></li>
                    <li class="last"><a><img src="/public/img/home/business/estate/detail/estate_icon5.png" alt=""></a>
                    </li>

                </ul>
            </div>
            <div class="clear"></div>
            <a target="_blank" href="http://agile-living.agile.com.cn/yjl/Index/index" class="btn-more "
               style="margin-top: 30px; ">访问官网</a>
        </div>
    </div>
</block>


<block name="footer_js">
    <script>
		$(function () {
			$(".header .nav li").eq(2).addClass("active").siblings().removeClass("active");
			SideList.top(1000);
			SideList.tel();
			SideList.xin();

			$(".main .nav-life li").mouseover(function () {
				var index = $(this).index();
				$(this).find(".contain").show().parent().siblings().find(".contain").hide();
			});

			$(".main .nav-life li").mouseout(function () {
				var index = $(this).index();
				$(this).find(".contain").hide();
			})
		})
    </script>
</block>
