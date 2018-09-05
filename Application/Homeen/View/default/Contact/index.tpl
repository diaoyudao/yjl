<extend name="./Application/Homeen/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/contact/contact-index.css">
</block>
<block name="title">Contact Us- Agile Group</block>

<block name="body_main">
    <div class="box section1">
        <div class="content container">
            <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span>Contact Us</span></p>
            <h2>Contact Us</h2>
            <div class="left">
                <div class="phone-list">
                    <ul style="overflow: hidden;">
                        <li style="margin-top: 0;">
                            <p style="font-size: 20px;">Agile Property</p>
                            <div class="c-999"><img src="/public_en/img/home/contact/icon4.png" alt=""
                                                    style="height:25px;width:25px;margin-right: 10px;">Tel: 400-698-3383
                            </div>
                        </li>
                        <li style="margin-top: 0;">
                            <p style="font-size: 20px;">Agile Property Management</p>
                            <div class="c-999"><img src="/public_en/img/home/contact/icon4.png" alt=""
                                                    style="height:25px;width:25px;margin-right: 10px;">Tel: 400-698-3383
                            </div>
                        </li>
                        <li>
                            <p style="font-size: 20px;">Environmental Protection</p>
                            <div class="c-999"><img src="/public_en/img/home/contact/icon4.png" alt=""
                                                    style="height:25px;width:25px;margin-right: 10px;">Tel:
                                (86)20-88839502
                            </div>
                        </li>
                        <li>
                            <p style="font-size: 20px;">Education Group</p>
                            <div class="c-999"><img src="/public_en/img/home/contact/icon4.png" alt=""
                                                    style="height:25px;width:25px;margin-right: 10px;">Tel:
                                (86)20-88839848
                            </div>
                        </li>
                        <!--<li>-->
                        <!--<p style="font-size: 20px;">酒店集团</p>-->
                        <!--<div class="c-999"><img src="/public_en/img/home/contact/icon4.png" alt="" style="height:25px;width:25px;margin-right: 10px;">Tel: (86)20-88839909</div>-->
                        <!--</li>-->
                    </ul>
                    <!--<div class="line"></div>-->
                </div>
                <div class="china">
                    <span class="title1">Headquarters in Guangzhou</span>
                    <ul class="chinaList">
                        <li>
                            <img src="/public_en/img/home/contact/icon1.png">
                            <span class="address">
                                Address: 33/F, Agile Center, 26Huaxia Road, Zhujiang New Town, TianheDistrict, Guangzhou City, Guangdong Province, China                            </span>
                        </li>
                        <li>
                            <img src="/public_en/img/home/contact/icon2.png">
                            <span>Postal code:&nbsp;&nbsp;510623</span>
                        </li>
                        <li>
                            <img src="/public_en/img/home/contact/icon4.png">
                            <span>Tel:&nbsp;&nbsp;(020) 8883 9888</span>
                        </li>
                        <li>
                            <img src="/public_en/img/home/contact/icon5.png">
                            <span>Fax:&nbsp;&nbsp;(020) 8883 9566</span>
                        </li>
                    </ul>
                </div>
                <div class="HongKong">
                    <span class="title1">Headquarters in Hong Kong</span>
                    <ul class="hong_Kong">
                        <li>
                            <img src="/public_en/img/home/contact/icon1.png">
                            <span>Address: 18/F, Three Pacific Place, 1 Queen's Road East, Hong Kong</span>
                        </li>
                        <li>
                            <img src="/public_en/img/home/contact/icon4.png">
                            <span>Tel:&nbsp;&nbsp;(852) 2847 3383</span>
                        </li>
                        <li>
                            <img src="/public_en/img/home/contact/icon5.png">
                            <span>Fax:&nbsp;&nbsp;(852) 2780 8822</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="right">
                <a style="background-image: url('/public_en/img/home/contact/contact_bg1.png')"
                   href="/en/contact/media?level_id=1000000151" class="btn-more">Media Registration</a>
                <a target="_blank" style="background-image: url('/public_en/img/home/contact/contact_bg2.png')"
                   href="https://agile.mycaigou.com/" class="btn-more">Solicitation of Tenders</a>
                <a style="background-image: url('/public_en/img/home/contact/contact_bg3.png')"
                   href="/en/contact/honest?level_id=1000000149" class="btn-more">Report Corruption</a>
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

