<extend name="./Application/Admin/View/default/base/context/common.tpl"/>
<block name="common_css">
    <link rel="stylesheet" href="/public/huiadmin/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="/public/huiadmin/lib/webuploader/0.1.5/webuploader.css"/>
</block>
<block name="body_main">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>栏目管理 <span
                class="c-gray en">&gt;</span> 层级管理 <a class="btn btn-success radius r"
                                                      style="line-height:1.6em;margin-top:3px"
                                                      href="javascript:location.replace(location.href);" title="刷新"><i
                    class="Hui-iconfont">&#xe68f;</i></a></nav>

    <table class="table">
        <tr>
            <td width="200" class="va-t" style="background-color:#f8f8f8;">
                <ul id="treeDemo" class="ztree"></ul>
            </td>
            <td class="va-t">
                <form action="" method="post" class="form form-horizontal" id="form-change"
                      enctype="mutipart/form-data">
                    <input type="hidden" value="" name="level_id"/>
                    <input type="hidden" value="" name="thumbnail_url"/>
                    <input type="hidden" value="" name="image_url"/>
                    <!--
                    <div class="row cl">
                        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                                 <button onClick="add_children_node('添加层级','/1fd3ab97ee/menu/level/add','700','700');"
                                       class="btn btn-primary radius" type="button"> 添加子节点
                               </button>
                               <button onClick="del_node();" class="btn btn-secondary radius" type="button"> 删除本节点</button>  
                        </div>
                    </div>  -->
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>父节点：</label>
                        <div class="formControls col-xs-8 col-sm-9 ">
                            <span class="select-box">
				                <select name="pid" class="select">
                                    <option value=""></option>
                                    <volist name="select_levels" id="item">
                                        <option value="{$item.value}">
                                            {$item['name']}
                                        </option>
                                    </volist>
                                </select>
				            </span>
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>节点名称：</label>
                        <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                            <input type="text" class="input-text" value="" placeholder="" id="" name="name">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>权重：</label>
                        <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                            <input type="text" class="input-text" value="" placeholder="" name="weight"
                            >
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">链接地址：</label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <input type="text" class="input-text" value="#" placeholder="" name="link_url"   />
                        </div>
                    </div>
                    <!--
                    <div id="uploader" class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">图片：</label>
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
                        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>状态：</label>
                        <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                            <div class="radio-box">
                                <input name="status" type="radio" id="status-1" value="1" required >
                                <label for="status-1">启用</label>
                            </div>
                            <div class="radio-box">
                                <input type="radio" id="status-2" name="status"  value="0">
                                <label for="status-2">禁用</label>
                            </div>
                        </div>
                    </div>
         <!--           <div class="row cl">
                        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;修改提交&nbsp;&nbsp;">
                        </div>
                    </div> -->
                </form>
            </td>
        </tr>
    </table>
</block>
<block name="footer_js">
    <script type="text/javascript" src="/public/huiadmin/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
    <script type="text/javascript" src="/public/huiadmin/lib/webuploader/0.1.5/webuploader.min.js"></script>
    <script type="text/javascript" src="/public/js/lib/uploadImage.js"></script>
    <script type="text/javascript">

        var setting = {
            view: {
                dblClickExpand: false,
                showLine: true,    //是否显示节点间的连线
                selectedMulti: false,
            },
            data: {
                simpleData: {
                    enable: true,
                    idKey: "level_id",
                    pIdKey: "pid",
                    rootPId: "0"
                }
            }
            ,
            callback: {
                onClick: function (event, treeId, treeNode) {
                    select_node(treeNode);
                    return false;
                },
            }
        };

        var zNodes = $.parseJSON('<php> echo json_encode($levels);</php>');
        var code;

        function select_node(treeNode) {
            $('input[name=level_id]').val(treeNode.level_id);
            $('input[name=name]').val(treeNode.name);
            if (treeNode.level_id == 0) {
                $('#status-1').iCheck('check');
                $('#status-2').removeAttr("checked");
                $('#status-1').attr("checked", "checked");
//                addImageToList();
                $('input[name=weight]').val('');
                $('input[name=link_url]').val('#');
                $('select[name=pid]').val('');

                return false;
            }
            $('select[name=pid]').val(treeNode.getParentNode().level_id);
            $('input[name=name]').val(treeNode.name);
            $('input[name=weight]').val(treeNode.weight);
            $('input[name=link_url]').val(treeNode.link_url);
            try {
                if (treeNode.status == 1) {
                    $('#status-1').iCheck('check');
                } else {
                    $('#status-2').iCheck('check');
                }
            } catch (e) {

            }
            if (treeNode.thumbnail_url) {
                $('input[name=image_url]').val(treeNode.image_url);
                $('input[name=thumbnail_url]').val(treeNode.thumbnail_url);
//                addImageToList(treeNode.thumbnail_url);
            } else {
//                addImageToList();
            }
        }

        function showCode(str) {
            if (!code) code = $("#code");
            code.empty();
            code.append("<li>" + str + "</li>");
        }

        function addImageToList(file_url) {
            var $list = $('#fileList');
            if (!file_url) {
                $list.empty();
                return;
            }
            var $li = $(
                            '<div id="' + file_url + '" class="file-item thumbnail">' +
                            '<img src="' + file_url + '">' +
                            '<div class="info">' + '</div>' +
                            '</div>'
                    ),
                    $img = $li.find('img');
            // $list 为容器jQuery实例
            $list.empty();
            $list.append($li);
        }

        $(function () {
            var t = $("#treeDemo");
            t = $.fn.zTree.init(t, setting, zNodes);
            var zTree = $.fn.zTree.getZTreeObj("tree");

//            var image = new IMAGE('#fileList', '#filePicker', 100, 100, true);
//            image.init();

            $('.skin-minimal input').iCheck({
                checkboxClass: 'icheckbox-blue',
                radioClass: 'iradio-blue',
                increaseArea: '20%'
            });


            $("#form-change").validate({
                rules: {
                    pid: {
                        required: true,
                    },
                    name: {
                        required: true,
                        rangelength:[1,15],
                    },
                    weight: {
                        required: true,
                        digits:true
                    },
                },
                onkeyup: false,
                focusCleanup: true,
                success: "valid",
                submitHandler: function (form) {
                    if ($('input[name=level_id]').val() == 0) {
                        layer.msg('根节点不能被修改或删除', {icon:2,time:1000});
                        return false;
                    }
                    try {
                        K.doAjaxSubmit('#form-change', '/1fd3ab97ee/menu/level/change');
                    } catch (e) {
                    }
                    return false; // 避免重复提交
                }
            });
        });

        /*新增节点*/
        function add_children_node(title, url, w, h) {
            if (!($('input[name=level_id]').val())) {
                layer.msg('请选择父节点', {icon:2,time:1000});
                return false;
            }
            layer_show(title, url, w, h);
        }

        /*节点-删除*/
        function del_node() {
            if ($('input[name=level_id]').val() == 0) {
                layer.msg('根节点不能被修改或删除', {icon:2,time:1000});
                return false;
            }
            layer.confirm('节点删除包含下属的所有节点，请谨慎，确认要删除吗？', function (index) {
                //此处请求后台程序，下方是成功后的前台处理……
                var param = {
                    level_id: $('input[name=level_id]').val()
                };

                K.doAjax(param, '/1fd3ab97ee/menu/level/delete', function (response) {
                    if (response.status && response.status == 'ok') {
                        window.location.reload(window.location.href);
                    } else {
                        if (response.message) {
                            layer.msg(response.message, {icon:2,time:1000});
                        } else {
                            layer.msg('后台错误!',{icon:2,time:1000});
                        }
                    }
                });
            })
        }


    </script>
</block>