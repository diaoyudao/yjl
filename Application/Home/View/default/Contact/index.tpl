<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/contact/contact-index.css">
</block>
<block name="title">联系我们-雅居乐集团</block>

<block name="body_main">
    <div class="box section1">
        <div class="content container">
            <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span>联系我们</span></p>
            <h2>联系我们</h2>
            <div class="left">
                <div class="phone-list">
                    <ul style="overflow: hidden;">
                        <li style="margin-top: 0;">
                            <p style="font-size: 20px;">雅居乐地产</p>
                            <div class="c-999"><img src="/public/img/home/contact/icon4.png" alt="" style="height:25px;width:25px;margin-right: 10px;">电话: 400-698-3383</div>
                        </li>
                        <li style="margin-top: 0;">
                            <p style="font-size: 20px;">雅居乐物业</p>
                            <div class="c-999"><img src="/public/img/home/contact/icon4.png" alt="" style="height:25px;width:25px;margin-right: 10px;">电话: 400-698-3383</div>
                        </li>
                        <li>
                            <p style="font-size: 20px;">环保集团</p>
                            <div class="c-999"><img src="/public/img/home/contact/icon4.png" alt="" style="height:25px;width:25px;margin-right: 10px;">电话: (86)20-88839502</div>
                        </li>
                        <li>
                            <p style="font-size: 20px;">教育集团</p>
                            <div class="c-999"><img src="/public/img/home/contact/icon4.png" alt="" style="height:25px;width:25px;margin-right: 10px;">电话: (86)020-88839848</div>
                        </li>
                        <!--<li>-->
                            <!--<p style="font-size: 20px;">酒店集团</p>-->
                            <!--<div class="c-999"><img src="/public/img/home/contact/icon4.png" alt="" style="height:25px;width:25px;margin-right: 10px;">电话: (86)20-88839909</div>-->
                        <!--</li>-->
                    </ul>
                    <!--<div class="line"></div>-->
                </div>
                <div class="china">
                    <span class="title1">广州总部</span>
                    <ul class="chinaList">
                        <li>
                            <img src="/public/img/home/contact/icon1.png">
                            <span>地址:&nbsp;&nbsp;中国广东省广州市天河区珠江新城华夏路26号雅居乐中心33楼</span>
                        </li>
                        <li>
                            <img src="/public/img/home/contact/icon2.png">
                            <span>邮编:&nbsp;&nbsp;510623</span>
                        </li>
                        <li>
                            <img src="/public/img/home/contact/icon4.png">
                            <span>电话:&nbsp;&nbsp;(020) 8883 9888</span>
                        </li>
                        <li>
                            <img src="/public/img/home/contact/icon5.png">
                            <span>传真:&nbsp;&nbsp;(020) 8883 9566</span>
                        </li>
                    </ul>
                </div>
                <div class="HongKong">
                    <span class="title1">香港总部</span>
                    <ul class="hong_Kong">
                        <li>
                            <img src="/public/img/home/contact/icon1.png">
                            <span>地址:&nbsp;&nbsp;香港皇后大道东一号太古广场三期18楼</span>
                        </li>
                        <li>
                            <img src="/public/img/home/contact/icon4.png">
                            <span>电话:&nbsp;&nbsp;(852) 2847 3383</span>
                        </li>
                        <li>
                            <img src="/public/img/home/contact/icon5.png">
                            <span>传真:&nbsp;&nbsp;(852) 2780 8822</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="right">
                <a style="background-image: url('/public/img/home/contact/contact_bg1.png')" href="/contact/media?level_id=1000000151" class="btn-more">媒体登记</a>
                <a target="_blank" style="background-image: url('/public/img/home/contact/contact_bg2.png')" href="https://agile.mycaigou.com/" class="btn-more">招商招标</a>
                <a style="background-image: url('/public/img/home/contact/contact_bg3.png')" href="/contact/honest?level_id=1000000149" class="btn-more">廉洁举报</a>
            </div>
        </div>

    </div>
</block>


<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(6).addClass("active").siblings().removeClass("active");
        })
    </script>
</block>

