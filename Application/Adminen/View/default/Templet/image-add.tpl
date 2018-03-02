<extend name="./Application/Adminen/View/default/base/context/add.tpl"/>
<block name="common_css">
    <link rel="stylesheet" type="text/css" href="/public/huiadmin/lib/webuploader/0.1.5/webuploader.css"/>
</block>
<block name="body_main">
    <article class="page-container">
        <form class="form form-horizontal" id="form-advert-add" enctype="multipart/form-data">
            <input type="hidden" value="{$image.image_id}" name="image_id"/>
            <input type="hidden" value="{$image.thumbnail_url1}" name="thumbnail_url1"/>
            <input type="hidden" value="{$image.image_url1}" name="image_url1"/>
            <input type="hidden" value="{$image.thumbnail_url2}" name="thumbnail_url2"/>
            <input type="hidden" value="{$image.image_url2}" name="image_url2"/>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>栏目名称：</label>
                <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="level_id" class="select">
                    <option value=""></option>
                    <volist name="select_levels" id="item1">
                        <option value="{$item1.level_id}"
                        <php>if($image['level_id'] == $item1['level_id']) {echo 'selected';}</php>
                        >{$item1.name}</option>
                    </volist>
                </select>
				</span></div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>前台显示标记：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <span class="select-box">
                        <select name="tags" class="select">
                            <option value=""></option>
                            <volist name="tags_type" id="item1">
                                <option value="{$item1}"
                                <php>if($image['tags'] == $item1) {echo 'selected';}</php>
                                >{$item1}</option>
                            </volist>
                        </select>
                    </span>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>图片名称：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$image.name}" placeholder="" id="" name="name">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>排序权重：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$image.weight|default='0'}" placeholder="数字，值越大排序越靠前"
                           name="weight">
                </div>
            </div>
            <div id="uploader" class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span
                            class="c-red">*</span>图片上传(最大{$Think.config.UPLOAD_IMAGE_MAX_SIZE}M)：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <!--用来存放文件信息-->
                    <div id="uploader-demo"></div>
                    <div class="btns">
                        <div id="fileList" class="uploader-list"></div>
                        <div id="filePicker">选择图片</div>
                        <span class="tags-image-size-span ml-15 c-999" style="display: none;">建议尺寸：1920*700</span>

                    </div>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">图片点击链接地址：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" name="link_url1" value="{$image.link_url1}" class="input-text">
                </div>
            </div>
            <!--          <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">繁体图片链接地址：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" name="link_url2" value="{$image.link_url2}" class="input-text">
                </div>
            </div> -->
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">描述：</label>
                <div class="formControls col-xs-8 col-sm-9">
							<textarea name="desc" cols="" rows="6" class="textarea" placeholder="500个字符以内"
                                      style="height:150px;" dragonfly="true">{$image.desc}</textarea>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">发布开始日期（默认立即生效）：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" onfocus="WdatePicker()" id="datemin" name="begin_time"
                           value="{$image.begin_time}" class="input-text Wdate">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">发布结束日期：</label>
                <div class="formControls col-xs-8 col-sm-9 ">
                    <input type="text" onfocus="WdatePicker()" id="datemax" name="end_time"
                           value="<php> echo ($image['end_time'] != '0000-00-00')? $image['end_time'] : ''; </php>"
                           class="input-text Wdate">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>状态：</label>
                <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                    <div class="radio-box">
                        <input name="status" type="radio" value="1" id="sex-1" checked="checked">
                        <label for="sex-1">发布</label>
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
    <script type="text/javascript" src="/public/huiadmin/lib/webuploader/0.1.5/webuploader.min.js"></script>
    <script type="text/javascript" src="/public/js/lib/uploadImage.js"></script>
    <script type="text/javascript">
        $(function () {
            var level_lists = JSON.parse('<php>echo json_encode($select_levels)</php>');
            for (var j = 0; j < level_lists.length; j++) {
                if (null == level_lists[j].tags_type) {
                    var index = j + 1;
                    $("select[name=level_id] option").eq(index).attr("disabled", "disabled");
                }
            }
            $('.skin-minimal input').iCheck({
                checkboxClass: 'icheckbox-blue',
                radioClass: 'iradio-blue',
                increaseArea: '20%'
            });

            $("select[name=level_id]").change(function () {
                var res = getTagsSelect();
                var select = $("select[name=tags]");
                select.empty();
                if (res) {
                    var option = $("<option></option>");
                    select.append(option);
                    for (var i = 0; i < res.length; i++) {
                        option = $("<option value='" + res[i] + "' >" + res[i] + "</option>");
                        select.append(option);
                    }
                }

            });
            $("select[name=tags]").change(function () {
                var tags = $("select[name=tags]").val();
                if ("头部图片" == tags) {
                    $(".tags-image-size-span").show();
                }else {
                    $(".tags-image-size-span").hide();
                }
            });
            if("头部图片"==$("select[name=tags]").val()){
                $(".tags-image-size-span").show();
            }
            function getTagsSelect() {
                var level_id = $("select[name=level_id] ").val();
                var res = [];
                for (var k = 0; k < level_lists.length; k++) {
                    if (level_lists[k].level_id == level_id) {
                        res = level_lists[k].tags_type;
                    }
                }

                return res;
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

            addImageToList('#fileList', "{$image.thumbnail_url1}");
            addImageToList('#fileList2', "{$image.thumbnail_url2}");

            $("#form-advert-add").validate({
                rules: {
                    level_id: {
                        required: true,
                    },
                    tags: {
                        required: true,
                        rangelength: [1, 50]
                    },
                    name: {
                        required: true,
                        rangelength: [1, 100]
                    },
                    desc: {
                        required: false,
                        rangelength: [1, 500]
                    },
                    weight: {
                        required: true,
                        digits: true
                    },
                    link_url1: {
                        required: false,
                        url: true
                    },
                    link_url2: {
                        required: false,
                        url: true
                    },
                },
                onkeyup: false,
                focusCleanup: true,
                success: "valid",
                submitHandler: function (form) {
                    if (!($('input[name=image_url1]').val())) {
                        layer.msg('请添加简体图片', {icon:2,time:1500});
                        return false;
                    }

                    if ($('input[name=image_id]').val()) {
                        var url = '/adminenglish/templet/image/change';
                    } else {
                        var url = '/adminenglish/templet/image/add';
                    }
                    K.doAjaxSubmit('#form-advert-add', url, function (response) {
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

        //        function removeIframe() {
        //            K.removeIframe();
        //        }


    </script>
</block>