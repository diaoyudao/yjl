<extend name="./Application/Admin/View/default/base/login.tpl"/>
<block name="login_name">雅居乐官网后台管理系统 - 后台登录</block>
<block name="body_main">
    <input type="hidden" id="TenantId" name="TenantId" value=""/>
    <div class="header">
        <div class="title" style="margin-left: 166px;">雅居乐官网后台管理系统 - 后台登录</div>
    </div>
    <div class="loginWraper">
        <div id="loginform" class="loginBox" style="padding-top:10px;">
            <form class="form form-horizontal" method="post" id="form-login">
                <div class="row cl">
                    <div class="formControls col-xs-7 col-xs-offset-4 skin-minimal">
                    <div class="radio-box">
                        <input type="radio" value="1" name="system-lang" id="system-lang-zh" checked>
                        <label for="system-lang-zh" class="f-16">中文版</label>
                    </div>
                    <div class="radio-box">
                        <input type="radio" value="2" name="system-lang" id="system-lang-en" >
                        <label for="system-lang-en" class="f-16 f-w">英文版</label>
                    </div>
                    </div>
                </div>

                <div class="row cl">
                    <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
                    <div class="formControls col-xs-8">
                        <input id="login_id" name="login_id" type="text" placeholder="账户" class="input-text size-L">
                    </div>
                </div>
                <div class="row cl">
                    <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
                    <div class="formControls col-xs-8">
                        <input id="password" name="password" type="password" placeholder="密码" class="input-text size-L">
                    </div>
                </div>
                <div class="row cl">
                    <div class="formControls col-xs-8 col-xs-offset-3">
                        <input name="verify" class="input-text size-L" type="text" placeholder="验证码" style="width:150px;"/>
                        <img id="verify_png" src="/1fd3ab97ee/verify/login/index" style="width:120px;height:40px;"/>
                        <a id="kanbuq" href="javascript:;" onclick="newVerify()">换一张</a></div>
                </div>
                <div class="row cl">
                    <div class="formControls col-xs-8 col-xs-offset-3 mt-10">
                        <input name="" type="button" onclick="loginProcess()" class="btn btn-success radius size-L"
                               value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
                        <input name="" type="reset" class="btn btn-default radius size-L"
                               value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="footer">Copyright 博拉网络股份有限公司</div>
</block>
<block name="footer_js">
    <script type="text/javascript">
        var newVerify = function () {
            var url = '/1fd3ab97ee/verify/login/index?rand=' + Math.random();
            document.getElementById('verify_png').src = url;
        }

        var loginProcess = function () {
            if('' == $('input[name=login_id]').val() || '' == $('input[name=password]').val() || '' == $('input[name=verify]').val() || '验证码' ==  $('input[name=verify]').val()) {
                layer.msg('请填写完整信息!', {icon: 2, time: 2000});
                return false;
            }

            url = window.location.href;

            success_func = function (response) {
                if (response.status && response.status == 'ok') {
                    var lang = $('input[type^=radio]:checked').val();

                    if(2 == lang) {
                        window.location.replace('/adminenglish/');
                    } else {
                        window.location.replace('/1fd3ab97ee/');
                    }
                    
                } else {
                    if (response.message) {
                        layer.msg(response.message, {icon: 2, time: 1500});
                    } else {
                        layer.msg('后台错误!', {icon: 2, time: 1500});
                    }
                    newVerify()
                }
            };

            error_func = function (response) {
                layer.msg('调用错误，请检查!', {icon: 2, time: 1500});
            };

            $.post(url, $('#form-login').serialize(), function (res) {
                if (success_func) {
                    success_func(res)
                }
            }).error(function (xhr) {
                if (error_func) {
                    error_func(xhr);
                }
            });
            return false;
        }

        $(function(){
            $('.skin-minimal input').iCheck({
                checkboxClass: 'icheckbox-blue',
                radioClass: 'iradio-blue',
                increaseArea: '20%'
            });
/*
            $('#system-lang-en').click(function(){
                window.location.replace('http://' + '{$Think.config.DOMAIN_ENGLISH}' + '/adminenglish/login/staff/login');
            });
            */
        });
    </script>
</block>
</body>
</html>