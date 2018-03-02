<extend name="./Application/Admin/View/default/base/context/add.tpl"/>
<block name="common_css">
    <link rel="stylesheet" type="text/css" href="/public/huiadmin/lib/webuploader/0.1.5/webuploader.css"/>
</block>
<block name="body_main">
    <article class="page-container">
        <form class="form form-horizontal" id="form-notice-add">
            <input type="hidden" value="{$land.land_id}" name="land_id"/>
            <input type="hidden" name="note"/>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>酒店名称：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$land.name}" placeholder="" id="" name="name">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>城市：</label>
                <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="city_id" class="select">
                    <option value=""></option>
                    <volist name="citys" id="item">
                        <option value="{$item.type_id}"
                        <php>if($land['city_id'] == $item['type_id']) {echo 'selected';}</php>
                        >{$item.name}</option>
                    </volist>
                </select>
				</span></div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>酒店属性：</label>
                <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="type_id" class="select">
                    <option value=""></option>
                    <volist name="types" id="item">
                        <option value="{$item.type_id}"
                        <php>if($land['type_id'] == $item['type_id']) {echo 'selected';}</php>
                        >{$item.name}</option>
                    </volist>
                </select>
				</span></div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>地址：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$land.address}" placeholder="" id="" name="address">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">电话：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$land.tel}" placeholder="" id="" name="tel">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">邮箱：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$land.email}" placeholder="" id="" name="email">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>酒店简介：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <textarea name="desc" class="textarea" style="height:100px;"
                              placeholder="请输入56个字符以内">{$land.desc}</textarea>
                </div>
            </div>

            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>酒店详述：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <script id="editor" type="text/plain" style="width:100%;height:500px;"></script>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>排序权重：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$land.weight|default=0}" placeholder="" id=""
                           name="weight">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">发布开始日期(默认立即生效)：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" onfocus="WdatePicker()" id="datemin" name="begin_time"
                           value="{$land.begin_time}" class="input-text Wdate">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">发布结束日期：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" onfocus="WdatePicker()" id="datemax" name="end_time"
                           value="<php> echo (isset($land['end_time']) && $land['end_time'] != '0000-00-00')? $land['end_time'] : ''; </php>"
                           class="input-text Wdate">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>状态：</label>
                <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                    <php>$var=$land;</php>
                    <include file="./Application/Admin/View/default/base/context/auditor-add.tpl"/>

                </div>
            </div>
            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                    <php> if(!isset($search)):</php>
                    <button class="btn btn-primary radius" type="submit">保存提交
                    </button>
                    <php> endif;</php>
                    <button onClick="removeIframe();" class="btn btn-default radius" type="button">
                        &nbsp;&nbsp;
                        <php> echo !isset($search)? '取消':'关闭';</php>
                        &nbsp;&nbsp;</button>
                </div>
            </div>
        </form>
    </article>
</block>
<block name="footer_js">
    <script type="text/javascript" src="/public/huiadmin/lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/public/huiadmin/lib/ueditor/1.4.3/ueditor.config.js"></script>
    <script type="text/javascript" src="/public/huiadmin/lib/ueditor/1.4.3/ueditor.all.min.js"></script>
    <script type="text/javascript" src="/public/huiadmin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript" src="/public/huiadmin/lib/webuploader/0.1.5/webuploader.min.js"></script>
    <script type="text/javascript" src="/public/js/lib/uploadImage.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.skin-minimal input').iCheck({
                checkboxClass: 'icheckbox-blue',
                radioClass: 'iradio-blue',
                increaseArea: '20%'
            });

            var ue = UE.getEditor('editor', {
                serverUrl: '/1fd3ab97ee/vendor/ueditor/index',
                /*
                 toolbars: [
                 ['fullscreen', '|', 'undo', 'redo', '|',
                 'bold', //加粗
                 'italic', //斜体
                 'underline', //下划线
                 'strikethrough', //删除线
                 '|',
                 'link', 'unlink', '|', 'simpleupload', //单图上传
                 'map', //Baidu地图
                 'gmap', //Google地图
                 'insertvideo', //视频
                 'background', //背景
                 ],
                 [
                 'source', //源代码
                 'indent', '|',  //首行缩进
                 'inserttable', //插入表格
                 'insertrow', //前插入行
                 'insertcol', //前插入列
                 'mergeright', //右合并单元格
                 'mergedown', //下合并单元格
                 'deleterow', //删除行
                 'deletecol', //删除列
                 'splittorows', //拆分成行
                 'splittocols', //拆分成列
                 'splittocells', //完全拆分单元格
                 'deletecaption', //删除表格标题
                 'inserttitle', //插入标题
                 'mergecells', //合并多个单元格
                 'deletetable', //删除表格
                 '|',
                 'cleardoc', //清空文档
                 ]
                 ]
                 */
            });

            ue.ready(function () {
                var note = '<php> echo $land["note"];</php>';
                ue.setContent(note);  //赋值给UEditor
            });
        });

        $("#form-notice-add").validate({
            rules: {
                name: {
                    required: true,
                    rangelength: [1, 100]
                },
                city_id: {
                    required: true,
                },
                type_id: {
                    required: true,
                },
                address: {
                    required: true,
                    rangelength: [1, 100]
                },
                tel: {
                    required: false,
                    rangelength: [6, 20]
                },
                weight: {
                    required: true,
                    digits: true
                },
                desc: {
                    required: true,
                    rangelength: [1, 56]
                },
                note: {
                    required: true,
                    rangelength: [1, 20000]
                },
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
                if ((UE.getEditor('editor').hasContents())) {
                    $('input[name=note]').val(UE.getEditor('editor').getContent());
                } else {
                    layer.msg('酒店详述不能为空', {icon: 2, time: 1500});
                    return false;
                }

                if ($('input[name=land_id]').val()) {
                    var url = '/1fd3ab97ee/business/hotel/change';
                } else {
                    var url = '/1fd3ab97ee/business/hotel/add';
                }

                K.doAjaxSubmit('#form-notice-add', url, function (response) {
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

                return false;
            }
        });

        function removeIframe() {
            K.removeIframe();
        }

    </script>
</block>