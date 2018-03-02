<extend name="./Application/Admin/View/default/base/context/add.tpl"/>
<block name="common_css">
    <link rel="stylesheet" type="text/css" href="/public/huiadmin/lib/webuploader/0.1.5/webuploader.css"/>
</block>
<block name="body_main">
    <article class="page-container">
        <form action="" method="post" class="form form-horizontal" id="form-add"
              enctype="multipart/form-data">
            <input type="hidden" value="{$credit.credit_id}" name="credit_id"/>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>信用评级机构：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$credit.institution}" placeholder="" name="institution">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>企业家族评级：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$credit.grade}" placeholder="" name="grade">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>评级展望：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$credit.forecast}"  name="forecast">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>评定日期：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" onfocus="WdatePicker()" id="datemax" name="begin_time"
                           value="<php> echo (isset($credit['begin_time']) && $credit['begin_time'] != '0000-00-00')? $credit['begin_time'] : ''; </php>"
                           class="input-text Wdate">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>排序权重：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$credit.weight|default='0'}" placeholder="数字，值越大排序越靠前"
                           name="weight">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>状态：</label>
                <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                    <php>$var=$credit;</php>
                    <include file="./Application/Admin/View/default/base/context/auditor-add.tpl"/>
                </div>
            </div>
            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                    <button onclick="firmware_save()" class="btn btn-success radius" id="admin-save"
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

            var temp = "{$credit.status}";
            (temp == "0") ? $('#status-0').iCheck('check') : $('#status-1').iCheck('check') ;

            $("#form-add").validate({
                debug:true,
                rules: {
                    institution: {
                        required: true,
                        rangelength:[1,30]
                    },
                    forecast: {
                        required: true,
                        rangelength:[1,50]
                    },
                    grade: {
                        required: true,
                        rangelength:[1,20]
                    },
                    weight: {
                        required: true,
                        digits: true
                    },
                },
                onkeyup: false,
                focusCleanup: true,
                success: "valid",
                submitHandler: function (form) {

                    return false;
                }
            });
        });

        function firmware_save() {
            if ($('input[name=credit_id]').val()) {
                var url = '/1fd3ab97ee/invest/credit/change';
            } else {
                var url = '/1fd3ab97ee/invest/credit/add';
            }

            K.doAjaxSubmit('#form-add', url, function (response) {
                if (response.status && response.status == 'ok') {
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