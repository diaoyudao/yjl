<extend name="./Application/Admin/View/default/base/context/add.tpl"/>
<block name="common_css">
    <link rel="stylesheet" type="text/css" href="/public/huiadmin/lib/webuploader/0.1.5/webuploader.css"/>
</block>
<block name="body_main">
    <article class="page-container">
        <form action="" method="post" class="form form-horizontal" id="form-add">

            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2 "><span class="c-red">*</span>更新日期：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="text" onfocus="WdatePicker()" id="datemax" name="update_time"
                           value="<php> echo (isset($credit['update_time']) && $credit['update_time'] != '0000-00-00')? $credit['update_time'] : ''; </php>"
                           class="input-text Wdate">
                </div>
            </div>
            <div class="row cl">
                <div class="col-xs-9 col-sm-10 col-xs-offset-3 col-sm-offset-2">
                    <button onclick="firmware_save()" class="btn btn-success radius" id="admin-save" type="button"
                            name="admin-role-save"><i class="icon-ok"></i> 提交
                    </button>
                    <button onClick="K.removeIframe();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
                </div>
            </div>
        </form>
    </article>
</block>
<block name="footer_js">
    <script type="text/javascript" src="/public/huiadmin/lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">

        $(function () {
            $('.skin-minimal input').iCheck({
                checkboxClass: 'icheckbox-blue',
                radioClass: 'iradio-blue',
                increaseArea: '20%'
            });
        });

        function firmware_save() {

            var url = '/1fd3ab97ee/invest/credit/save';
            K.doAjaxSubmit('#form-add', url, function (response) {
                if (response.status && response.status === 'ok') {
                    parent.window.location.reload(parent.window.location.href);
                } else {
                    if (response.message) {
                        layer.msg(response.message, {icon: 2, time: 1500});
                    } else {
                        layer.msg('后台错误!', {icon: 2, time: 1500});
                    }
                }
            });

        }
    </script>
</block>