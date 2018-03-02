<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/business/business_enviroment.css">
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public/hui3/lib/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>
</block>
<block name="title">环保-雅居乐集团</block>

<block name="head_menu">
    <a class="tip">环保/</a>
</block>
<block name="body_main">

    <div class="row">
        <div id="slider-3">
            <div class="slider">
                <div class="bd">
                    <ul>
                        <volist name="mobile_head_images" id="item">
                            <li><a href="#">
                                    <img src="{$item.image_url1}"
                                         traditional_image="{$item.image_url2}"
                                         simplified_image="{$item.image_url1}" class="banner-img">
                                </a></li>

                        </volist>

                    </ul>
                </div>
                <ol class="hd cl">
                    <li class="land-house">
                        <div class="land me-hidden"><img
                                    src="/public/img/home/business/environment/environment_btn1.png"></div>
                        <div class="land-active "><img class="left"
                                                       src="/public/img/home/business/environment/btn_icon1.png"><span>固体废弃物处理</span>
                            <div class="clear"></div>
                        </div>
                    </li>
                    <li class="land-house">
                        <div class="land "><img src="/public/img/home/business/environment/environment_btn2.png"></div>
                        <div class="land-active me-hidden"><img class="left"
                                                                src="/public/img/home/business/environment/btn_icon2.png"><span>环境修复</span>
                            <div class="clear"></div>
                        </div>
                    </li>
                    <li class="land-house">
                        <div class="land "><img src="/public/img/home/business/environment/environment_btn3.png"></div>
                        <div class="land-active me-hidden"><img class="left"
                                                                src="/public/img/home/business/environment/btn_icon3.png"><span>水务</span>
                            <div class="clear"></div>
                        </div>
                    </li>
                </ol>
            </div>
        </div>
    </div>
    <div class=" mt-20">
        <h2 class="title-color main-title txt-center">雅生活环保集团</h2>
        <div class="mt-20">
            <img src="/public/img/mobile/business/environment/pic1.jpg" class="tags-img">
            <div class="container mt-20">
                <p>
                    雅居乐环保集团是雅居乐集团控股有限公司的全资子公司，是雅居乐控股多元化发展的战略支点。雅居乐环保集团注册资金10亿元人民币，集团总部位于香港，国内总部位于深圳前海自贸区。当前，雅居乐环保集团已经在华东、京津冀、山东、中西部、华南、海南六大区域全面布局，拥有多家行业内知名的项目公司。
                </p>
                <h3 class="title-color min-title mt-20">
                    领先的环境服务投资运营商
                </h3>
                <p class="mt-10">
                    雅居乐环保集团全面布局，聚焦固体废弃物、环境修复和水务三大领域，包括危险废弃物处理、生活垃圾处理、餐厨垃圾处理、污泥处理、土壤环境修复、水环境修复，污水处理以及自来水生产等，几乎涵盖除大气外所有的污染防治和资源再生利用，致力于成为领先的环境服务投资运营商，为城市及乡镇环境提供平台级的系统解决方案和综合环境服务。
                </p>

                <div id="show_more" class="row cl mt-20 main-btn mb-10">
                    查看更多
                </div>
            </div>

            <div id="txt-more" class="me-hidden container">
                <h3 class="title-color min-title mt-20">
                    净美家园，乐活一生
                </h3>
                <p class="mt-10">
                    雅居乐环保集团希望通过努力，以社会效益、环境效益和经济效益的均衡为前提，实现政府、企业、合作伙伴以及社会大众的多方共赢。最终能够褪尽污染，净美家园，把被污染了的、自然原本给予我们的最好的一切，再次呈现，让每一个人都能在优美的环境中，乐活一生，做一个幸福的人。
                </p>

                <div class="mt-20  ">
                    <div class="box cl">
                        <img src="/public/img/mobile/business/environment/pic2.jpg" class="tags-img">
                        <div class="text ">
                            固体废弃物处理
                        </div>
                    </div>
                    <div class="container mt-20">
                        <p>
                            雅居乐环保集团拥有成熟的固废垃圾处理技术和丰富的项目经验，除了传统的处理技术（填埋、焚烧等），在等
                            <span style="color: #0b766f">
                                离子气化、生物化再生利用
                            </span>
                            等方面有非常深入的研究。
                        </p>
                    </div>
                </div>
                <div class="mt-20  ">
                    <div class="box cl">
                        <img src="/public/img/mobile/business/environment/pic3.jpg" class="tags-img">
                        <div class="text">环境修复</div>
                    </div>
                    <div class="container mt-20">
                        <p>
                            雅居乐环保集团环境修复业务当前主要聚焦水环境修复。我们拥有完善的解决方案和创新的水体微生物活化技术，有着传统
                            <span style="color: #0b766f">
                               水环境修复
                            </span>
                            技术无可比拟的优势。
                        </p>
                    </div>
                </div>
                <div class="mt-20  ">
                    <div class="box cl">
                        <img src="/public/img/mobile/business/environment/pic4.jpg" class="tags-img">
                        <div class="text">水务</div>
                    </div>
                    <div class="container mt-20">
                        <p>
                            雅居乐环保集团的水务业务包括工业废水处理、自来水厂/污水处理厂，在海南、中山、佛山等地，雅居乐环保集团
                            <span style="color: #0b766f">
                               拥有多座自来水厂和污水处理厂。
                            </span>
                        </p>
                    </div>
                </div>
                <div class="container">
                    <a target="_blank" href="http://www.environ.agile.com.cn/" class="a-color ">
                        <div class="row cl mt-20 main-btn mb-30">
                            访问官网
                        </div>
                    </a>
                </div>
            </div>

        </div>
    </div>
</block>
<block name="body_side">
    <div class="side-list">
        <ul>
            <li class="side-tel">
                <img src="/public/img/home/business/estate/detail/estate_icon1.png" alt="">
                <div class="tel-box">(86)20-88839502</div>
            </li>
            <li class="side-xin"><img src="/public/img/home/business/estate/detail/estate_icon4.png" alt="">
                <div class="xin-box">
                    <div class="box-head"></div>
                    <img src="/public/img/home/business/environment/two-code-environment.jpg" alt="" >
                </div>
            </li>
            <li class=""><a><img src="/public/img/mobile/base/go-top.jpg" alt=""></a></li>
        </ul>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {

            $('#show_more').click(function () {
                $('#txt-more').show();
                $(this).hide();
            });

            $("#slider-3 .slider").slide({mainCell:".bd ul",titCell:".hd li",trigger:"click",effect:"leftLoop",autoPlay:false,delayTime:700,interTime:5000,pnLoop:false,titOnClassName:"active"});


            $('.land-house').click(function () {
                var me = $(this);
                me.find('.land-active').show();
                me.find('.land').hide();

                me.siblings().find('.land').show();
                me.siblings().find('.land-active').hide();
            });
            $('.aler').click(function () {
                show_expecting();
            });

        })
    </script>
</block>
