<extend name="./Application/Adminen/View/default/base/context/add.tpl"/>
<block name="common_css">
    <link rel="stylesheet" type="text/css" href="/public/huiadmin/lib/webuploader/0.1.5/webuploader.css"/>
</block>
<block name="body_main">
    <article class="page-container">
        <form class="form form-horizontal" id="form-advert-add" enctype="multipart/form-data">
            <input type="hidden" value="<empty name='Think.get.land_id'>{$image.land_id}<else />{$Think.get.land_id}</empty>" name="land_id"/>
            <input type="hidden" value="{$image.land_image_id}" name="land_image_id"/>
            <input type="hidden" value="{$image.thumbnail_url1}" name="thumbnail_url1"/>
            <input type="hidden" value="{$image.image_url1}" name="image_url1"/>
            <input type="hidden" value="{$image.thumbnail_url2}" name="thumbnail_url2"/>
            <input type="hidden" value="{$image.image_url2}" name="image_url2"/>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">分类标记：</label>
                <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
                <select name="tags" class="select">
                    <option value="头部图片">头部图片</option>                    
                </select>
                    </span></div>
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
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>图片上传(最大{$Think.config.UPLOAD_IMAGE_MAX_SIZE}M)：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <!--用来存放文件信息-->
                    <div id="uploader-demo"></div>
                    <div class="btns">
                        <div id="fileList" class="uploader-list"></div>
                        <div id="filePicker">选择图片</div><span class="tags-image-size-span ml-15 c-999">建议尺寸为：200X200，大小不超过20K。</span>
                    </div>
                </div>
            </div>
  <!--          <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">图片点击链接地址：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" name="link_url1" value="{$image.link_url1}" class="input-text">
                </div>
            </div>  -->

 <!--           <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">繁体图片链接地址：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" name="link_url2" value="{$image.link_url2}" class="input-text">
                </div>
            </div> -->
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">图片说明：</label>
                <div class="formControls col-xs-8 col-sm-9">
							<textarea name="desc" class="textarea" placeholder="500个字符以内"
                               style="height:150px;"       dragonfly="true" >{$image.desc}</textarea>
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
            var tags_type = JSON.parse('<php>echo json_encode($lists);</php>');
            $('select[name="tags"]').on('change', function() {
                var me = $(this).val();
                $.each(tags_type, function(i, item) {
                    if(me == item.name) {
                        $('.tags-image-size-span').text(item.size_desc);
                        return false;
                    }
                });
            });

            $('.skin-minimal input').iCheck({
                checkboxClass: 'icheckbox-blue',
                radioClass: 'iradio-blue',
                increaseArea: '20%'
            });

            var addImageToList = function (land_image_id, file_url) {
                var $list = $(land_image_id);
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

            var image = new IMAGE('fileList', '#filePicker', 160, 100, true, function(e, i) {
                $("input[name=thumbnail_url1]").val(i.thumbnail_url);
                $("input[name=image_url1]").val(i.image_url);
                $("#" + e.id + '#fileList').addClass("upload-state-done")
            });
            image.init();

            var image2 = new IMAGE('fileList2', '#filePicker2', 160, 100, true,function(e, i) {
                $("input[name=thumbnail_url2]").val(i.thumbnail_url);
                $("input[name=image_url2]").val(i.image_url);
                $("#" + e.id + '#fileList2').addClass("upload-state-done")
            });
            image2.init();

            addImageToList('#fileList', "{$image.thumbnail_url1}");
            addImageToList('#fileList2', "{$image.thumbnail_url2}");

            $("#form-advert-add").validate({
                rules: {
                    tags: {
                        required: true,
                        rangelength: [1,50]
                    },
                    name: {
                        required: true,
                        rangelength: [1, 100]
                    },
                    weight: {
                        required: true,
                        digits: true
                    },
                    desc: {
                        required: false,
                        rangelength: [1, 500]
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
                    if(!($('input[name=image_url1]').val())) {
                        layer.msg('请添加简体图片', {icon:2,time:1500});
                        return false;
                    }

                    if ($('input[name=land_image_id]').val()) {
                        var url = '/adminenglish/business/mobile/change';
                    } else {
                        var url = '/adminenglish/business/mobile/add';
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

                    return false;
                }
            });
        });

        function removeIframe() {
            K.removeIframe();
        }

    </script>
</block>