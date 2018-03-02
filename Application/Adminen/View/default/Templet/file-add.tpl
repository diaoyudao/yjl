<extend name="./Application/Adminen/View/default/base/context/add.tpl"/>
<block name="common_css">
    <link rel="stylesheet" type="text/css" href="/public/huiadmin/lib/webuploader/0.1.5/webuploader.css"/>
</block>
<block name="body_main">
    <article class="page-container">
        <form action="" method="post" class="form form-horizontal" id="form-add"
              enctype="multipart/form-data">
            <input type="hidden" value="{$firmware.file_id}" name="file_id"/>
            <input type="hidden" value="{$firmware.url}" name="url"/>
            <input type="hidden" value="{$firmware.size}" name="size"/>
            <input type="hidden" value="{$firmware.name}" name="name"/>
            <input type="hidden" value="{$firmware.thumbnail_url1}" name="thumbnail_url1"/>
            <input type="hidden" value="{$firmware.image_url1}" name="image_url1"/>
            <input type="hidden" value="{$firmware.thumbnail_url2}" name="thumbnail_url2"/>
            <input type="hidden" value="{$firmware.image_url2}" name="image_url2"/>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>栏目名称：</label>
                <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="level_id" class="select">
                    <option value=""></option>
                    <volist name="select_levels" id="item">
                        <option value="{$item.level_id}"
                        <php>if($firmware['level_id'] == $item['level_id']) {echo 'selected';}</php>
                        >{$item.name}</option>
                    </volist>
                </select>
				</span></div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">前台显示标记：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$firmware.tags}" placeholder="" id="" name="tags">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文件标题：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$firmware.title}" placeholder="" id="" name="title">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>上传文件(文件名最长100个字符)：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <div id="uploader" class="wu-example">
                        <!--用来存放文件信息-->
                        <div id="big-file-list" class="uploader-list"></div>
                        <div class="btns">
                            <div id="big-file-picker">选择文件</div>
                            <button id="big-file-start" class="btn btn-default">开始上传</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row cl" style="display:none;">
                <label class="form-label col-xs-4 col-sm-2">上传手册：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <div id="uploader" class="wu-example">
                        <!--用来存放文件信息-->
                        <div id="file-list" class="uploader-list"></div>
                        <div class="btns">
                            <div id="file-picker">选择文件</div>
                            <button id="file-start" class="btn btn-default">开始上传</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>排序权重：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$firmware.weight|default='0'}"
                           placeholder="数字，值越大排序越靠前"
                           name="weight">
                </div>
            </div>
            <div id="uploader" class="row cl">
                <label class="form-label col-xs-4 col-sm-2">图片上传(最大{$Think.config.UPLOAD_IMAGE_MAX_SIZE}M)：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <!--用来存放文件信息-->
                    <div id="uploader-demo"></div>
                    <div class="btns">
                        <div id="fileList" class="uploader-list"></div>
                        <div id="filePicker">选择图片</div>
                    </div>
                </div>
            </div>


            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">文件描述：</label>
                <div class="formControls col-xs-8 col-sm-9">
							<textarea name="desc" cols="" rows="6" class="textarea" placeholder="500个字符以内"
                                      style="height:200px;" dragonfly="true">{$firmware.desc}</textarea>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">发布开始日期（默认立即生效）：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" onfocus="WdatePicker()" id="datemin" name="begin_time"
                           value="{$firmware.begin_time}" class="input-text Wdate">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">发布结束日期：</label>
                <div class="formControls col-xs-8 col-sm-9 ">
                    <input type="text" onfocus="WdatePicker()" id="datemax" name="end_time"
                           value="<php> echo ($firmware['end_time'] != '0000-00-00')? $firmware['end_time'] : ''; </php>"
                           class="input-text Wdate">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>状态：</label>
                <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                    <div class="radio-box">
                        <input name="status" type="radio" value="1" id="status-1" checked="checked">
                        <label for="status-1">发布</label>
                    </div>
                </div>
            </div>
            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                    <button onclick="firmware_save1()" class="btn btn-success radius" id="admin-save"
                            name="admin-role-save"><i class="icon-ok"></i> 提交
                    </button>
                    <button onClick="K.removeIframe();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>

                    <notempty name="firmware">
                        <button onclick="firmware_save()" class="btn btn-success radius" id="admin-save"
                                name="admin-role-save"><i class="icon-ok"></i> 提交并更新排序
                        </button>
                            <span>
                            (排序规则：权重>发布日期，若发布日期相同，则按照更新排序时间来排序。)
                         </span>
                    </notempty>


                </div>
            </div>
        </form>
    </article>
</block>
<block name="footer_js">
    <script type="text/javascript" src="/public/huiadmin/lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/public/huiadmin/lib/webuploader/0.1.5/webuploader.js"></script>
    <script src="/public/js/lib/md5.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="/public_en/js/lib/uploadLargeFile.js"></script>
    <script type="text/javascript" src="/public_en/js/lib/uploadImage.js"></script>
    <script type="text/javascript">
        var big_file_uplad = upload_large_file.create();

        var file_upload = upload_large_file.create('#file-list', '#file-picker', '#file-start', function (data) {
            $('input[name=handbook_url]').val(data.url);
        }, function (data) {
            $('input[name=handbook_url]').val('');
        });

        var initListFile = function (list_id, id, name, msg) {
            var $list = $('#' + list_id);
            $list.empty();
            $list.append('<div id="' + id + '" class="item">' +
                    '<h4 class="info">' + name + '</h4>' +
                    '<p class="state">' + msg + '</p>' +
                    '</div>');
        }

        $(function () {
            $('.skin-minimal input').iCheck({
                checkboxClass: 'icheckbox-blue',
                radioClass: 'iradio-blue',
                increaseArea: '20%'
            });

            var dt = new Date();
            y = dt.getFullYear();  //获取年(四位)
            var tags = $('input[name=tags]').val();
            if ('' == tags) {
                $('input[name=tags]').attr('value', y);
            }

            var addImageToList = function (image_id, file_url) {
                var $list = $(image_id);
                if (!file_url) {
                    $list.empty();
                    return;
                }
                var $li = $(
                        '<div id="' + file_url + '" class="file-item thumbnail">' +
                        '<img src="' + file_url + '">' +
                        '<div class="info">' + '</div>' +
                        '</div>'
                );
                $list.empty();
                $list.append($li);
            };

            var image = new IMAGE('fileList', '#filePicker', 160, 100, true, function (e, i) {
                $("input[name=thumbnail_url1]").val(i.thumbnail_url);
                $("input[name=image_url1]").val(i.image_url);
                $("#" + e.id + '#fileList').addClass("upload-state-done")
            });
            image.init();

            var image2 = new IMAGE('fileList2', '#filePicker2', 160, 100, true, function (e, i) {
                $("input[name=thumbnail_url2]").val(i.thumbnail_url);
                $("input[name=image_url2]").val(i.image_url);
                $("#" + e.id + '#fileList2').addClass("upload-state-done")
            });
            image2.init();

            addImageToList('#fileList', "{$firmware.thumbnail_url1}");
            addImageToList('#fileList2', "{$firmware.thumbnail_url2}");

            var name = "{$firmware.name}";
            if (name) {
                initListFile('big-file-list', name, name, '文件已经上传');
            }

            var url = "{$firmware.handbook_url}";
            if (url) {
                var temp = url.split('/');
                var name = temp.pop();
                initListFile('file-list', name, name, '文件已经上传');
            }

            $("#form-add").validate({
                debug: true,
                rules: {
                    level_id: {
                        required: true,
                    },
                    tags: {
                        required: false,
                        rangelength: [1, 50]
                    },
                    title: {
                        required: true,
                        rangelength: [1, 1000]
                    },
                    desc: {
                        required: false,
                        rangelength: [1, 500]
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

        function firmware_save1() {
            if (!($('input[name=url]').val())) {
                layer.msg('请上传文件', {icon:2,time:2000});
                return false;
            }

            if ($('input[name=file_id]').val()) {
                var url = '/adminenglish/templet/file/changeone';
            } else {
                var url = '/adminenglish/templet/file/add';
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

        function firmware_save() {
            if (!($('input[name=url]').val())) {
                layer.msg('请上传文件', {icon:2,time:2000});
                return false;
            }

            if ($('input[name=file_id]').val()) {
                var url = '/adminenglish/templet/file/change';
            } else {
                var url = '/adminenglish/templet/file/add';
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