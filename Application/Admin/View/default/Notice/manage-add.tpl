<extend name="./Application/Admin/View/default/base/context/add.tpl"/>
<block name="body_main">
    <article class="page-container">
        <form class="form form-horizontal" id="form-notice-add">
            <input type="hidden" value="{$notice.notice_id}" name="notice_id"/>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>前台显示22标记：</label>
                <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="show_flag" class="select">
                    <option value=""></option>
                    <volist name="show_flag" id="item">
                        <option value="{$item}"
                        <php>if($notice['show_flag'] == $item) {echo 'selected';}</php>
                        >{$item}</option>
                    </volist>
                </select>
				</span></div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>公告标题：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$notice.name}" placeholder="" id="" name="name">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>排序权重：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$notice.weight|default=0}" placeholder="" id=""
                           name="weight">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>发布人：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" disable="disable"
                           value="<php>echo empty($notice['author']) ? session('staff_name'):$notice['author']; </php>"
                           placeholder="" id="" name="author">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">发布开始日期：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" onfocus="WdatePicker()" id="datemin" name="begin_time"
                           value="{$notice.begin_time}" class="input-text Wdate">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">发布结束日期：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" onfocus="WdatePicker()" id="datemax" name="end_time"
                           value="<php> echo (isset($notice['end_time']) && $notice['end_time'] != '0000-00-00')? $notice['end_time'] : ''; </php>"
                           class="input-text Wdate">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>公告内容：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <script id="editor" type="text/plain" style="width:100%;height:400px;"></script>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>状态：</label>
                <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                    <div class="radio-box">
                        <input name="status" type="radio" value="1" id="sex-1"
                        <php> if(empty($notice) || ((!empty($notice)) && $notice['status'] == 1) )
                            {echo ' checked ';} </php>
                        >
                        <label for="sex-1">启用</label>
                    </div>
                    <div class="radio-box">
                        <input type="radio" value="0" name="status" id="sex-2"
                        <php> if((!empty($notice)) && $notice['status'] == 0){echo ' checked ';} </php>
                        >
                        <label for="sex-2">禁用</label>
                    </div>
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
    <script type="text/javascript">
        $(function () {
            $('.skin-minimal input').iCheck({
                checkboxClass: 'icheckbox-blue',
                radioClass: 'iradio-blue',
                increaseArea: '20%'
            });

            var ue = UE.getEditor('editor', {
                serverUrl: '/1fd3ab97ee/vendor/ueditor/index',
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
            });

            ue.ready(function () {
                var note = '<php> echo $notice["note"];</php>';
                ue.setContent(note);  //赋值给UEditor
            });
        });

        $("#form-notice-add").validate({
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
                author: {
                    required: true,
                    rangelength: [2, 20]
                },
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
                if (!(UE.getEditor('editor').hasContents())) {
                    layer.msg('请输入公告内容', {icon:2,time:1500});
                    return false;
                }

                var parameter = {};
                if ($('input[name=notice_id]').val()) {
                    var url = '/1fd3ab97ee/notice/manage/change';
                    parameter.notice_id = $('input[name=notice_id]').val();
                } else {
                    var url = '/1fd3ab97ee/notice/manage/add';
                }
                parameter.show_flag = $('select[name=show_flag]').val();
                parameter.name = $('input[name=name]').val();
                parameter.weight = $('input[name=weight]').val();
                parameter.author = $('input[name=author]').val();
                parameter.begin_time = $('input[name=begin_time]').val();
                parameter.end_time = $('input[name=end_time]').val();
                parameter.status = $('input[name=status]:checked').val();
                parameter.note = UE.getEditor('editor').getContent();

                K.doAjax(parameter, url);
            }
        });

        function removeIframe() {
            K.removeIframe();
        }

    </script>
</block>