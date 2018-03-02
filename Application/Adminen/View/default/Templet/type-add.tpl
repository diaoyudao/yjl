<extend name="./Application/Adminen/View/default/base/context/add.tpl"/>
<block name="body_main">
    <article class="page-container">
        <form class="form form-horizontal" id="form-add" enctype="multipart/form-data">
            <input type="hidden" value="{$type.type_id}" name="type_id"/>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>栏目名称：</label>
                <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="level_id" class="select">
                    <option value=""></option>
                    <volist name="select_levels" id="item">
                        <option value="{$item.level_id}"
                        <php>if($type['level_id'] == $item['level_id']) {echo 'selected';}</php>
                        >{$item.name}</option>
                    </volist>
                </select>
				</span></div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">分类标记：</label>
                <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
                <select name="tags" class="select">
                    <option value=""></option>
                    <volist name="lists" id="item">
                        <option value="{$item}"
                        <php>if($type['tags'] == $item) {echo 'selected';}</php>
                        >{$item}</option>
                    </volist>
                </select>
                    </span></div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>分类名称：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$type.name}" placeholder="" id="" name="name">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">描述：</label>
                <div class="formControls col-xs-8 col-sm-9">
							<textarea name="note" cols="" rows="6" class="textarea" placeholder="500个字符以内"
                                      style="height:200px;" dragonfly="true">{$type.note}</textarea>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>排序权重：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$type.weight|default='0'}" placeholder="数字，值越大排序越靠前"
                           name="weight">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>状态：</label>
                <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                    <div class="radio-box">
                        <input name="status" type="radio" value="1" id="sex-1"
                        <php> if(empty($type) || ((!empty($type)) && $type['status'] == 1) )
                            {echo ' checked ';} </php>
                        >
                        <label for="sex-1">发布</label>
                    </div>
                    <div class="radio-box">
                        <input type="radio" value="0" name="status" id="sex-2"
                        <php> if((!empty($type)) && $type['status'] == 0){echo ' checked ';} </php>
                        >
                        <label for="sex-2">待审核</label>
                    </div>
                </div>
            </div>
            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                    <button class="btn btn-primary radius" type="submit">保存</button>
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

            $("#form-add").validate({
                rules: {
                    level_id: {
                        required: true,
                    },
                    name: {
                        required: true,
                        rangelength: [1, 100]
                    },
                    tags: {
                        required: false,
                        rangelength: [1, 50]
                    },
                    weight: {
                        required: true,
                        digits: true
                    },
                    note: {
                        required: false,
                        rangelength: [1, 500]
                    },
                },
                onkeyup: false,
                focusCleanup: true,
                success: "valid",
                submitHandler: function (form) {

                    if ($('input[name=type_id]').val()) {
                        var url = '/adminenglish/templet/type/change';
                    } else {
                        var url = '/adminenglish/templet/type/add';
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
            });
        });

        function removeIframe() {
            K.removeIframe();
        }

    </script>
</block>