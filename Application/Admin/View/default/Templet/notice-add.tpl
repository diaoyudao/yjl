<extend name="./Application/Admin/View/default/base/context/add.tpl"/>
<block name="common_css">
    <link rel="stylesheet" type="text/css" href="/public/huiadmin/lib/webuploader/0.1.5/webuploader.css"/>
</block>
<block name="body_main">
    <article class="page-container">
        <form class="form form-horizontal" id="form-notice-add">
            <input type="hidden" value="{$notice.notice_id}" name="notice_id"/>
            <input type="hidden" value="{$notice.thumbnail_url1}" name="thumbnail_url1"/>
            <input type="hidden" value="{$notice.image_url1}" name="image_url1"/>
            <input type="hidden" value="{$notice.thumbnail_url2}" name="thumbnail_url2"/>
            <input type="hidden" value="{$notice.image_url2}" name="image_url2"/>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>栏目名称：</label>
                <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="level_id" class="select">
                    <option value=""></option>
                    <volist name="select_levels" id="item1">
                        <option value="{$item1.level_id}"
                        <php>if($notice['level_id'] == $item1['level_id']) {echo 'selected';}</php>
                        >{$item1.name}</option>
                    </volist>
                </select>
				</span></div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">显示标记：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$notice.tags}" placeholder="" id="" name="tags">
                </div>
            </div>
            <div class="row cl" id="web-sitck">
                <label class="form-label col-xs-4 col-sm-2">头条推送：</label>
                <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                    <div class="radio-box">
                        <input type="checkbox" name="web_stick" value="1"
                        <if condition="$notice.web_stick eq 1">checked="checked"</if>
                        />
                    </div>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">频道置顶：</label>
                <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                    <div class="radio-box">
                        <input type="checkbox" name="stick" value="1"
                        <if condition="$notice.stick eq 1">checked="checked"</if>
                        />
                    </div>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标题：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$notice.name}" placeholder="" id="" name="name">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">简称：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$notice.short_name}" placeholder="" id=""
                           name="short_name">
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
                <label class="form-label col-xs-4 col-sm-2">关键词：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$notice.keyword}" placeholder="" id="" name="keyword">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span id="red" class="c-red" style="display: none;">*</span>来源：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$notice.source}" placeholder="" id="" name="source">
                </div>
            </div>

            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">发布开始日期(默认立即生效)：</label>
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
                <label class="form-label col-xs-4 col-sm-2">内容描述：</label>
                <div class="formControls col-xs-8 col-sm-9">
							<textarea name="desc" class="textarea" placeholder="255个字符以内"
                                      style="height:120px;" dragonfly="true">{$notice.desc}</textarea>
                </div>
            </div>
            <div id="uploader" class="row cl">
                <label class="form-label col-xs-4 col-sm-2">简体图片(最大{$Think.config.UPLOAD_IMAGE_MAX_SIZE}M)：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <!--用来存放文件信息-->
                    <div id="uploader-demo"></div>
                    <div class="btns">
                        <div id="fileList" class="uploader-list"></div>
                        <div id="filePicker">选择图片</div>
                        <button class="btn btn-default radius ml-5" onclick="deleteImage1()" type="button">删除</button>
                        <span class=" col-5 ">封面最佳比例为4:3，建议尺寸800X600px，大小200K以内。</span>
                    </div>
                </div>
            </div>
            <div id="uploader" class="row cl">
                <label class="form-label col-xs-4 col-sm-2">繁体图片(最大{$Think.config.UPLOAD_IMAGE_MAX_SIZE}M)：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <!--用来存放文件信息-->
                    <div id="uploader-demo"></div>
                    <div class="btns">
                        <div id="fileList2" class="uploader-list"></div>
                        <div id="filePicker2">选择图片</div>
                        <button class="btn btn-default radius " onclick="deleteImage2()" type="button">删除</button>
                        <span class=" col-5 ">封面最佳比例为4:3，建议尺寸800X600px，大小200K以内。</span>
                    </div>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">详细内容：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <script id="editor" type="text/plain" style="width:100%;height:500px;"></script>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>状态：</label>
                <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                    <php>$var=$notice;</php>
                    <include file="./Application/Admin/View/default/base/context/auditor-add.tpl"/>

                </div>
            </div>
            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                    <php> if(!isset($search)):</php>
                    <button onclick="firmware_save1();" class=" btn btn-primary radius" type="button">保存提交
                    </button>
                    <php> endif;</php>
                    <button onClick="removeIframe();" class="btn btn-default radius" type="button">
                        &nbsp;&nbsp;
                        <php> echo !isset($search)? '取消':'关闭';</php>
                        &nbsp;&nbsp;</button>
                    <notempty name="notice">
                        <button onclick="firmware_save()" class="btn btn-success radius" id="admin-save"
                                name="admin-role-save" type="button"><i class="icon-ok"></i> 提交并更新排序
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
    <script type="text/javascript" src="/public/huiadmin/lib/ueditor/1.4.3/ueditor.config.js"></script>
    <script type="text/javascript" src="/public/huiadmin/lib/ueditor/1.4.3/ueditor.all.min.js"></script>
    <script type="text/javascript" src="/public/huiadmin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript" src="/public/huiadmin/lib/webuploader/0.1.5/webuploader.min.js"></script>
    <script type="text/javascript" src="/public/js/lib/uploadImage.js"></script>
    <script type="text/javascript" src="/public/js/admin/deleteImage.js"></script>
    <script type="text/javascript">

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
            var level_lists = JSON.parse('<php>echo json_encode($select_levels)</php>');
            for (var j = 0; j < level_lists.length; j++) {
                if (null !== level_lists[j].tags_type) {
                    var index = j + 1;
                    $("select[name=level_id] option").eq(index).attr("disabled", "disabled");
                }
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

            var image = new IMAGE('fileList', '#filePicker', 200, 100, true, function (e, i) {
                $("input[name=thumbnail_url1]").val(i.thumbnail_url);
                $("input[name=image_url1]").val(i.image_url);
                $("#" + e.id + '#fileList').addClass("upload-state-done")
            });
            image.init();

            var image2 = new IMAGE('fileList2', '#filePicker2', 200, 100, true, function (e, i) {
                $("input[name=thumbnail_url2]").val(i.thumbnail_url);
                $("input[name=image_url2]").val(i.image_url);
                $("#" + e.id + '#fileList2').addClass("upload-state-done")
            });
            image2.init();

            addImageToList('#fileList', "{$notice.thumbnail_url1}");
            addImageToList('#fileList2', "{$notice.thumbnail_url2}");

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
                var note = '<php> echo $notice["note"];</php>';
                ue.setContent(note);  //赋值给UEditor
            });

            $('select[name=level_id]').change(function () {
                var level_id = $("select[name=level_id]").val();
                if ('1000000164' == level_id || '1000000163' == level_id || '1000000162' == level_id || '1000000161' == level_id || '1000000202' == level_id) {
                    $('#red').show();
                } else {
                    $('#red').hide();
                }
                if ('1000000129' == level_id || '1000000141' == level_id || '1000000142' == level_id || '1000000161' == level_id
                        || '1000000162' == level_id || '1000000163' == level_id || '1000000164' == level_id || '1000000202' == level_id) {
                    $('#web-sitck').show();
                } else {
                    $('#web-sitck').hide();
                }
            });

            var level_id = $("select[name=level_id]").val();
            if ('1000000129' == level_id || '1000000141' == level_id || '1000000142' == level_id || '1000000161' == level_id
                    || '1000000162' == level_id || '1000000163' == level_id || '1000000164' == level_id || '1000000202' == level_id) {
                $('#web-sitck').show();
            } else {
                $('#web-sitck').hide();
            }
            if ('1000000164' == level_id || '1000000163' == level_id || '1000000162' == level_id || '1000000161' == level_id || '1000000202' == level_id) {
                $('#red').show();
            } else {
                $('#red').hide();
            }
        });
        var level_id = $("select[name=level_id]").val();

        $("#form-notice-add").validate({
            rules: {
                level_id: {
                    required: true,
                },
                tags: {
                    required: false,
                    rangelength: [1, 50]
                },
                name: {
                    required: true,
//                    rangelength: [1, 100]
                },
                short_name: {
                    required: false,
                    rangelength: [1, 20]
                },
                author: {
                    required: false,
                    rangelength: [1, 30]
                },
                keyword: {
                    required: false,
                    rangelength: [1, 30]
                },
                desc: {
                    required: false,
                    rangelength: [1, 255]
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
        function firmware_save1() {

            if ('1000000164' == level_id || '1000000163' == level_id || '1000000162' == level_id || '1000000161' == level_id || '1000000202' == level_id) {
                if ('' == $('input[name=source]').val()) {
                    layer.msg('来源不能为空!',{icon:2,time:1500});
                    return false;
                }
            }
            var parameter = condition();
            // 判断是否需要有头条
            if (!$('#web-sitck').is(":hidden") && 1 == parameter.web_stick) {
                var id = '{$notice.notice_id}';
                var param = {notice_id: id};
                K.doAjax(param, "/1fd3ab97ee/templet/notice/webstick", function (req) {
                    if (0 < req.number) {
                        layer.confirm('头条位置已被其他文章占用，是否更新为此篇文章？', {
                            btn: ['确认', '取消'] //按钮
                        }, function () {
                            saveNotice1(parameter);
                        }, function () {
                            return;
                        });
                    } else {
                        saveNotice1(parameter);
                    }
                });
            } else {
                saveNotice1(parameter);
            }
        }
        function firmware_save() {
            if ('1000000164' == level_id || '1000000163' == level_id || '1000000162' == level_id || '1000000161' == level_id || '1000000202' == level_id) {
                if ('' == $('input[name=source]').val()) {
                    layer.msg('来源不能为空!',{icon:2,time:1500});
                    return false;
                }
            }
            var parameter = condition();
            // 判断是否需要有头条
            if (!$('#web-sitck').is(":hidden") && 1 == parameter.web_stick) {
                var id = '{$notice.notice_id}';
                var param = {notice_id: id};
                K.doAjax(param, "/1fd3ab97ee/templet/notice/webstick", function (req) {
                    if (0 < req.number) {
                        layer.confirm('头条位置已被其他文章占用，是否更新为此篇文章？', {
                            btn: ['确认', '取消'] //按钮
                        }, function () {
                            saveNotice(parameter);
                        }, function () {
                            return;
                        });
                    } else {
                        saveNotice(parameter);
                    }
                });
            } else {
                saveNotice(parameter);
            }
        }

        function condition() {
            var parameter = {};

            if ($('input[name=stick]:checkbox').is(':checked')) {
                parameter.stick = 1;
            } else {
                parameter.stick = 0;
            }
            if ($('input[name=web_stick]:checkbox').is(':checked')) {
                parameter.web_stick = 1;
            } else {
                parameter.web_stick = 0;
            }

            if (1 == parameter.stick || 1 == parameter.web_stick) {
                if ('' == $('input[name=image_url1]').val()) {
                    layer.msg('置顶的文章至少要上传一张简体图片', {icon: 2, time: 2000})
                    return false;
                }
            }

            return parameter;
        }
        function saveNotice1(parameter) {
            if ($('input[name=notice_id]').val()) {
                var url = '/1fd3ab97ee/templet/notice/changeone';
                parameter.notice_id = $('input[name=notice_id]').val();
            } else {
                var url = '/1fd3ab97ee/templet/notice/add';
            }
            parameter.level_id = $('select[name=level_id]').val();
            parameter.tags = $('input[name=tags]').val();
            parameter.short_name = $('input[name=short_name]').val();
            parameter.desc = $('textarea[name=desc]').val();
            parameter.name = $('input[name=name]').val();
            parameter.weight = $('input[name=weight]').val();
            parameter.author = $('input[name=author]').val();
            parameter.source = $('input[name=source]').val();
            parameter.begin_time = $('input[name=begin_time]').val();
            parameter.end_time = $('input[name=end_time]').val();
            parameter.status = $('input[name=status]:checked').val();
            parameter.thumbnail_url1 = $('input[name=thumbnail_url1]').val();
            parameter.image_url1 = $('input[name=image_url1]').val();
            parameter.image_url2 = $('input[name=image_url2]').val();
            parameter.thumbnail_url2 = $('input[name=thumbnail_url2]').val();
            if ((UE.getEditor('editor').hasContents())) {
                parameter.note = UE.getEditor('editor').getContent();
            }

            // $('input[name=is_hot]').iCheck('check');

            K.doAjax(parameter, url);
        }
        function saveNotice(parameter) {
            if ($('input[name=notice_id]').val()) {
                var url = '/1fd3ab97ee/templet/notice/change';
                parameter.notice_id = $('input[name=notice_id]').val();
            } else {
                var url = '/1fd3ab97ee/templet/notice/add';
            }
            parameter.level_id = $('select[name=level_id]').val();
            parameter.tags = $('input[name=tags]').val();
            parameter.short_name = $('input[name=short_name]').val();
            parameter.desc = $('textarea[name=desc]').val();
            parameter.name = $('input[name=name]').val();
            parameter.weight = $('input[name=weight]').val();
            parameter.author = $('input[name=author]').val();
            parameter.source = $('input[name=source]').val();
            parameter.begin_time = $('input[name=begin_time]').val();
            parameter.end_time = $('input[name=end_time]').val();
            parameter.status = $('input[name=status]:checked').val();
            parameter.thumbnail_url1 = $('input[name=thumbnail_url1]').val();
            parameter.image_url1 = $('input[name=image_url1]').val();
            parameter.image_url2 = $('input[name=image_url2]').val();
            parameter.thumbnail_url2 = $('input[name=thumbnail_url2]').val();
            if ((UE.getEditor('editor').hasContents())) {
                parameter.note = UE.getEditor('editor').getContent();
            }

            // $('input[name=is_hot]').iCheck('check');

            K.doAjax(parameter, url);
        }

        function removeIframe() {
            K.removeIframe();
        }

    </script>
</block>