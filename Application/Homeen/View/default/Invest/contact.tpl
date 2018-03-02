<extend name="./Application/Homeen/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/invest/invest-contact.css">
</block>
<block name="title">Contact us-Agile Group</block>

<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span><a
                    href="/en/invest/index?level_id=1000000136">Investor Relations</a></span>
                &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span>Contact us</span>
            </p>

            <h2>Contact us</h2>

            <ul class="list">
                <li>
                    <img src="/public_en/img/home/invest/contact_icon1.png" alt="">
                    Telephone: (852) 2847 3383
                </li>
                <li>
                    <img src="/public_en/img/home/invest/contact_icon2.png" alt="">
                    Fax: (852) 2780 8822
                </li>
                <li>
                    <img src="/public_en/img/home/invest/contact_icon3.png" alt="">
                    Email: ir@agile.com.cn
                </li>
            </ul>
        </div>


    </div>
<!--
    <div class="box">
        <div class="content container">
            <h2>尊敬的投资者</h2>
            <h4>欢迎您到雅居乐参观调研，为了妥善安排您的来访，请填写如下信息，</h4>
            <h4 style="margin-bottom: 40px;">并建议您提前7个工作日预约，感谢您对雅居乐的关注！</h4>

            <form action="" id="form-add">
                <div class="row ">
                    <label class="">来访机构：</label>
                    <input type="text" name="organize" class="text " placeholder=""/></div>
                <div class="row ">
                    <label class="">来访者姓名：</label>
                    <input type="text" name="name" class="text " placeholder=""/></div>
                <div class="row ">
                    <label class="">联系邮箱：</label>
                    <input type="text" name="mail" class="text " placeholder=""/></div>
                <div class="row ">
                    <label class="">联系电话：</label>
                    <input type="text" name="tel" class="text " placeholder=""/></div>
                <div class="row ">
                    <label class="">拟参观项目名称：</label>
                    <input type="text" name="project" class="text " placeholder=""/></div>
                <div class="row ">
                    <label class="">拟参观项目所在城市：</label>
                    <input type="text" name="city" class="text " placeholder=""/></div>
                <div class="row">
                    <label class="">拟参观时间：</label>
                    <input type="text" name="times" class="text " placeholder=""/></div>
                <div class="row">
                    <label class="">请输入验证码：</label>
                    <input name="verify" class="text " type="text" placeholder="验证码"  style="width:250px;float:left;margin-left:10px;"/>
                        <img id="verify_png" src="/verify/index" style="width:120px;height:40px;border:1px solid #e4e4e4;margin-left:5px;"/>
                        <a id="kanbuq" href="javascript:;" onclick="newVerify()">换一张</a>
                </div>
                <div class="submit">
                    <a class="btn-more cursor" onclick="submit2()">提交信息</a>
                </div>
            </form>
        </div>
    </div>
-->
</block>
<block name="footer_js">
    <script type="text/javascript" src="/public_en/huiadmin/lib/layer/2.1/layer.js"></script>
    <script type="text/javascript" src="/public_en/huiadmin/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/public_en/huiadmin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
    <script type="text/javascript">

        $(function () {
            $(".header .nav li").eq(3).addClass("active").siblings().removeClass("active");
        })
        var newVerify = function () {
            var url = '/verify/index?rand=' + Math.random();
            document.getElementById('verify_png').src = url;
        }

        var submit2 = function () {
            if ('' == $('input[name=organize]').val()) {
                layer.msg('请输入机构名称', {icon: 2, time: 1500});
                return false;
            }
            if ('' == $('input[name=name]').val()) {
                layer.msg('请输入来访者姓名', {icon: 2, time: 1500});
                return false;
            }
            if ('' == $('input[name=mail]').val()) {
                layer.msg('请输入联系邮箱', {icon: 2, time: 1500});
                return false;
            }
            if ('' == $('input[name=tel]').val()) {
                layer.msg('请输入联系电话', {icon: 2, time: 1500});
                return false;
            }
            if ('' == $('input[name=project]').val()) {
                layer.msg('请输入拟参观项目名称', {icon: 2, time: 1500});
                return false;
            }
            if ('' == $('input[name=city]').val()) {
                layer.msg('请输入拟参观项目所在城市', {icon: 2, time: 1500});
                return false;
            }
            if ('' == $('input[name=times]').val()) {
                layer.msg('请输入拟参观时间', {icon: 2, time: 1500});
                return false;
            }
            if ('' == $('input[name=verify]').val()) {
                layer.msg('请输入验证码', {icon: 2, time: 1500});
                return false;
            }

            K.doAjaxSubmit('#form-add', window.location.href, function (response) {
                if (response.status && response.status == 'ok') {
                    layer.msg('添加成功！', {icon: 1, time: 2500});
                } else {
                    if (response.message) {
                        layer.msg(response.message, {icon: 2, time: 2500});
                    } else {
                        layer.msg('后台错误!', {icon: 2, time: 2500});
                    }
                }
            }, function (e) {
            });
        }

    </script>
</block>