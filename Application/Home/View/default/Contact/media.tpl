<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/contact/honestform.css">
</block>
<block name="title">媒体登记-雅居乐集团</block>

<block name="body_main">
    <style>

    </style>
    <div class="box section1">
        <div class="content container">
            <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span><a
                            href="/contact/index">联系我们</a></span>
                &nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;<span>媒体登记</span>
            </p>
            <h2>媒体登记</h2>
            <h4>尊敬的记者朋友：欢迎您访问雅居乐，为了妥善安排您的采访需求，请填写如下信息。 感谢您对雅居乐的关注。</h4>
            <form action="#" id="form-add" onsubmit="return false;">
                <div class="row ">
                <label class="">机构名称：</label>
                <input type="text" name="organize" class="text " placeholder=""/></div>
                <div class="row ">
                <label class="">采访者姓名：</label>
                <input type="text" name="name" class="text " placeholder=""/></div>
                <div class="row ">
                <label class="">联系方式：</label>
                <input type="text" name="tel" class="text " placeholder=""/></div>
                <div class="row ">
                <label class="">内容提纲：</label>
                <textarea name="note" class=""></textarea></div>
                <div class="row">
                    <label class="">请输入验证码：</label>
                    <input name="verify" class="text " type="text" placeholder="验证码"  style="width:250px;float:left;margin-left:12px;"/>
                        <img id="verify_png" src="/verify/index" style="width:120px;height:40px;border:1px solid #e4e4e4;margin-left:5px;"/>
                        <a id="kanbuq" href="javascript:;" onclick="newVerify()">换一张</a>
                </div>
                <div class="submit">
                <a class="btn-more cursor" onclick="submit2();" >提交信息</a>
                </div>
            </form>
        </div>
    </div>
</block>
<block name="footer_js">
<script type="text/javascript" src="/public/huiadmin/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="/public/huiadmin/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="/public/huiadmin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".header .nav li").eq(6).addClass("active").siblings().removeClass("active");
        })
        var newVerify = function () {
            var url = '/verify/index?rand=' + Math.random();
            document.getElementById('verify_png').src = url;
        }

        var submit2 = function() {
            if('' == $('input[name=organize]').val()) {
                layer.msg('请输入机构名称', {icon: 2, time: 1500});
                return false;
            }
            if('' == $('input[name=name]').val()) {
                layer.msg('请输入采访者姓名', {icon: 2, time: 1500});
                return false;
            }
            if('' == $('input[name=tel]').val()) {
                layer.msg('请输入联系方式', {icon: 2, time: 1500});
                return false;
            }
            if('' == $('textarea[name=note]').val()) {
                layer.msg('请输入内容提纲', {icon: 2, time: 1500});
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
            },function(e){});
            
            return false;
        };
        
    </script>
</block>