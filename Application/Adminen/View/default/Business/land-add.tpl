<extend name="./Application/Adminen/View/default/base/context/add.tpl"/>
<block name="common_css">
    <link rel="stylesheet" type="text/css" href="/public/huiadmin/lib/webuploader/0.1.5/webuploader.css"/>
</block>
<block name="body_main">
    <article class="page-container">
        <form class="form form-horizontal" id="form-notice-add">
            <input type="hidden" value="{$land.land_id}" name="land_id"/>
            <input type="hidden" name="note"/>
            <input type="hidden" name="type"/>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>楼盘名称：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$land.name}" placeholder="" id="" name="name">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>城市：</label>
                <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="city_id" class="select">
                    <option value="" ></option>
                    <volist name="citys" id="item">
                        <option value="{$item.type_id}"
                        <php>if($land['city_id'] == $item['type_id']) {echo 'selected';}</php>
                        >{$item.name}</option>
                    </volist>
                </select>
				</span></div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>业态：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <div class="radio-box">
                    <volist name="types" id="item"> 
                        <input type="checkbox" name="type_name" value="{$item.name}" id="{$item.type_id}" 
                        <php>if(false!==strpos($land['type'],$item['name'])) echo 'checked="checked"';</php>>
                        <label for="{$item.type_id}" class="mr-20">{$item.name}</label>
                    </volist>
                    </div>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>地址：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$land.address}" placeholder="" id="" name="address">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>百度地图坐标：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <label >经度：</label>
                    <input type="text" class="input-text" style="width:150px;" value="{$land.positon_x}" name="positon_x">
                    <label >纬度：</label>
                    <input type="text" class="input-text" style="width:150px;" value="{$land.positon_y}" name="positon_y">
                    <a target="_blank" class="btn btn-primary radius" data-title="添加"   href="http://api.map.baidu.com/lbsapi/getpoint/index.html">
                        从地图获取经纬度
                    </a>

                </div>
            </div>            
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">电话：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$land.tel}" placeholder="" id="" name="tel">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>是否在售：</label>
                <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                    <div class="radio-box">
                        <input name="is_sales" type="radio" value="1" id="sales-1"
                        <php> if(null == $land['is_sales'] || 1 == $land['is_sales'])
                            {echo ' checked ';} </php>
                        >
                        <label for="sales-1">在售</label>
                    </div>
                    <div class="radio-box">
                        <input type="radio" value="0" name="is_sales" id="sales-0"
                        <php> if(('0' === ($land['is_sales']))){echo ' checked ';} </php>
                        >
                        <label for="sales-0">售罊</label>
                    </div>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">是否热卖：</label>
                <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                    <div class="radio-box">
                        <input type="checkbox" name="is_hot" value="1" <if condition="$land.is_hot eq 1">checked="checked"</if>>
                    </div>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>楼盘详述：</label>
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
                    <include file="./Application/Adminen/View/default/base/context/auditor-add.tpl"/>
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
                serverUrl: '/adminenglish/vendor/ueditor/index',
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
                positon_x: {
                    required: true,
                    number: true
                },
                positon_y: {
                    required: false,
                    number: true
                },
                tel: {
                    required: false,
                    rangelength: [1, 20]
                },
                weight: {
                    required: true,
                    digits: true
                },
                note: {
                    required: true,
                    rangelength: [1, 2000]
                },
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
                var temp = '';
                $.each($('input[name=type_name]'), function(i, item){
                    if($(this).is(':checked')) {
                        temp = '' == temp ? $(this).val() : temp + ',' + $(this).val();
                    }                    
                });

                if('' == temp) {
                    layer.msg('楼盘业态不能为空', {icon: 2, time: 1500});
                    return false;
                }
                $('input[name=type]').val(temp);

                if ((UE.getEditor('editor').hasContents())) {
                    $('input[name=note]').val(UE.getEditor('editor').getContent());
                } else {
                    layer.msg('楼盘详述不能为空', {icon: 2, time: 1500});
                    return false;
                }
                
                if ($('input[name=land_id]').val()) {
                    var url = '/adminenglish/business/land/change';
                } else {
                    var url = '/adminenglish/business/land/add';
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

        /*添加*/
        function selectBaiduIp(title, url) {
            var height = $(window).height();
            var width = $(window).width();
            layer_show(title, url,width*0.8,height*0.9 );
        }

    </script>
</block>