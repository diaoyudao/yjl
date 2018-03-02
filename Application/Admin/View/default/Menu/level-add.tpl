<extend name="./Application/Admin/View/default/base/context/add.tpl"/>
<block name="common_css">
    <link rel="stylesheet" type="text/css" href="/public/huiadmin/lib/webuploader/0.1.5/webuploader.css"/>
</block>
<block name="body_main">
    <article class="page-container">
        <form action="/1fd3ab97ee/menu/level/add" method="post" class="form form-horizontal" id="form-level-add"
              enctype="multipart/form-data">
            <input type="hidden" value="" name="image_url"/>
            <input type="hidden" value="" name="thumbnail_url"/>
            <input type="hidden" value="" name="pid"/>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>父节点：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="" placeholder="" name="pid_name"
                           disabled="disabled">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>节点名称：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="" placeholder="" name="name"
                    >
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>排序值：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="0" placeholder="" name="weight"
                    >
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">链接地址：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="#" placeholder="" name="link_url"   />
                </div>
            </div>
            <!--
            <div id="uploader" class="row cl">
                <label class="form-label col-xs-4 col-sm-3">图片：</label>
                <div class="formControls col-xs-8 col-sm-9">

                    <div id="uploader-demo"></div>
                    <div class="btns">
                        <div id="fileList" class="uploader-list"></div>
                        <div id="filePicker">选择图片</div>
                    </div>
                </div>
            </div>
            -->
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>状态：</label>
                <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                    <div class="radio-box">
                        <input name="status" type="radio" value="1" id="sex-1" checked>
                        <label for="sex-1">启用</label>
                    </div>
                    <div class="radio-box">
                        <input type="radio" value="0" name="status" id="sex-2">
                        <label for="sex-2">禁用</label>
                    </div>
                </div>
            </div>
            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                    <button type="submit" class="btn btn-success radius" id="admin-role-save" name="admin-role-save"><i
                                class="icon-ok"></i> 提交
                    </button>
                    <button onClick="K.removeIframe();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
                </div>
            </div>
        </form>
    </article>
</block>
<block name="footer_js">
    <script type="text/javascript" src="/public/huiadmin/lib/webuploader/0.1.5/webuploader.min.js"></script>
    <script type="text/javascript" src="/public/js/lib/uploadImage.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.skin-minimal input').iCheck({
                checkboxClass: 'icheckbox-blue',
                radioClass: 'iradio-blue',
                increaseArea: '20%'
            });

            var image = new IMAGE();
            image.init();

            $('input[name=pid_name]').val(parent.$('input[name=name]').val());
            $('input[name=pid]').val(parent.$('input[name=level_id]').val());

            $("#form-level-add").validate({
                rules: {
                    pid_name: {
                        required: true,
                        minlength: 2,
                    },
                    name: {
                        required: true,
                        rangelength:[2,10]
                    },
                    weight: {
                        required: true,
                        digits: true,
                    },
                },
                onkeyup: false,
                focusCleanup: true,
                success: "valid",
                submitHandler: function (form) {
                    K.doAjaxSubmit('#form-level-add', null, function (response) {
                        if (response.status && response.status == 'ok') {
                            parent.window.location.reload();
                        } else {
                            if (response.message) {
                                layer.msg(response.message, {icon: 2, time: 1500});
                            } else {
                                layer.msg('后台错误!', {icon: 2, time: 1500});
                            }
                        }
                    });
                }
            });
        });

    </script>
</block>