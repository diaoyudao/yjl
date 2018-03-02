<extend name="./Application/Admin/View/default/base/context/add.tpl"/>
<block name="body_main">
    <article class="page-container">
        <form class="form form-horizontal" id="form-change" enctype="multipart/form-data">
            <volist name="configs" id="item">
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>{$item.desc}</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$item.value}" placeholder="" id="" name="{$item.name}" required>
                </div>
            </div>
            </volist>
            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                    <button onClick="article_save_submit();" class="btn btn-primary radius" type="submit">保存</button>
                </div>
            </div>
        </form>
    </article>
</block>
<block name="footer_js">
    <script type="text/javascript" src="/public/huiadmin/lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
        $("#form-change").validate({
            rules: {
                name: {
                    required: true,
                    rangelength: [1, 40]
                },
                show_flag: {
                    required: true,
                },
                weight: {
                    required: true,
                    digits: true
                },
                link_url: {
                    required: false,
                    url: true
                },
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
                K.doAjaxSubmit('#form-change', null, function (response) {
                    if (response.status && response.status == 'ok') {
                        layer.msg('保存成功', {icon: 1, time: 2000});
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

    </script>
</block>