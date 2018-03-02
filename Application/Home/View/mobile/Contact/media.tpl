<extend name="./Application/Home/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/contact/honestform.css">
</block>
<block name="title">媒体登记-雅居乐集团</block>
<block name="head_menu">
     <a class="tip" href="#">媒体登记/</a>
</block>
<block name="body_main">
    <div class="row pt-20 bgc-ef">
        <div class="container">
            <div class="row txt-center mt-20"><span class="main-title">媒体登记</span></div>
            <div class="row txt-center mt-15">
            <p class="f-14">
                尊敬的记者朋友：<br>
                欢迎您访问雅居乐，为了妥善安排您的采访需求，请填写如下信息。 感谢您对雅居乐的关注。
            </p>
            </div>            
            <div class="row cl form mt-20">
                <form action="#" id="form-add" >
                <label class="row mt-20 ">机构名称：</label>
                <input type="text" name="organize" class="" placeholder=""/>
                <label class="row mt-20">采访者姓名：</label>
                <input type="text" name="name" class=" " placeholder=""/>
                <label class="row mt-20">联系方式：</label>
                <input type="text" name="tel" class=" " placeholder=""/>
                <label class="row mt-20">内容提纲：</label>
                <textarea name="note" class=""></textarea>
                <label class="row mt-30">请输入验证码：</label>
                <img class="verify" id="verify_png" src="/verify/index" style=""/>
                <input name="verify" class="mb-10" type="text" placeholder="验证码" />
 
                <a onclick="submit2();"><div class="row cl mt-20 mb-30 main-btn">提交信息</div></a>

            </form>
            </div>
            
        </div>
    </div>
</block>
<block name="footer_js">
<script type="text/javascript" src="/public/huiadmin/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="/public/huiadmin/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="/public/huiadmin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#verify_png').click( function () {
                var url = '/verify/index?rand=' + Math.random();
                document.getElementById('verify_png').src = url;
            });
        });

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