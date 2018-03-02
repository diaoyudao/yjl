<extend name="./Application/Admin/View/default/base/context/add.tpl"/>
<block name="common_css">
    <link rel="stylesheet" href="/public/huiadmin/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="/public/huiadmin/lib/webuploader/0.1.5/webuploader.css"/>
</block>
<block name="body_main">
    <article class="page-container">
        <form action="123" method="post" class="form form-horizontal" id="form-admin-role-add">
            <input type="hidden" name="menu_authority_id" value="{$Think.get.id}">
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>栏目组名称：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="{$menu_authority['name']}" placeholder="" id="name" name="name"
                           datatype="*4-16"
                           nullmsg="用户账户不能为空">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>选择栏目权限：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <ul id="treeDemo" class="ztree"></ul>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">备注：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <textarea id="note" name="note" cols="" rows="" class="textarea" placeholder="100个字符以内"
                              dragonfly="true" onKeyUp="textarealength(this,100)">{$menu_authority['note']}</textarea>
                    <p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
                </div>
            </div>
            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                    <button type="submit" class="btn btn-success radius" id="admin-role-save" name="admin-role-save"><i
                                class="icon-ok"></i> 确定
                    </button>
                    <button onClick="K.removeIframe();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
                </div>
            </div>
        </form>
    </article>

</block>

<block name="footer_js">
<script type="text/javascript" src="/public/huiadmin/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
    <script type="text/javascript">
        var setting = {
            view: {
                dblClickExpand: false,
                showLine: true,    //是否显示节点间的连线
                selectedMulti: true,
                txtSelectedEnable: false,
            },
            data: {
                simpleData: {
                    enable: true,
                    idKey: "level_id",
                    pIdKey: "pid",
                    rootPId: "null"
                },

            },
            check: {
                enable: true,
                chkStyle: "checkbox",
                nocheckInherit: true,
                chkDisabledInherit: true,
            },
            callback: {                
            }
        };

        var zNodes = $.parseJSON('<php> echo json_encode((new \Admin\Common\Menu())->getMenuLevel());</php>');
        var code;

        
        var t = $("#treeDemo");
        var zTree = $.fn.zTree.init(t, setting, zNodes);
        zTree.expandAll(true);

        $(function () {  
            var temp_men_levels = "{$menu_authority.menus}";
            if(temp_men_levels) {
                var temp_arr = temp_men_levels.split(",");
                $.each(temp_arr, function(i, item) {
                    var temp_node = zTree.getNodeByParam('level_id', item);
                    zTree.checkNode(temp_node, true, false);
                });
            }
            

            $("#form-admin-role-add").validate({
                rules: {
                    name: {
                        required: true,
                        minlength: 2,
                        maxlength: 49,
                    },
                },
                onkeyup: false,
                focusCleanup: true,
                success: "valid",
                submitHandler: function (form) {
                    var param ={};
                    var arr = [];

                    var nodes = zTree.getCheckedNodes(true);
                    $.each(nodes, function(i, item) {
                        arr.push(item.level_id);
                      //  console.log(item.level_id + item.name);
                    })

                    if(0 >= arr.length) {
                        layer.msg('请至少要选择一个栏目！', {icon:2,time:2000});
                        return false;
                    }

                    param.privileges = arr;
                    param['name'] = $('#name').val();
                    param['note'] = $('#note').val();


                    var menu_authority_id = $('input[name=menu_authority_id]').val();
                    if (menu_authority_id) {
                        param['menu_authority_id'] = menu_authority_id;
                        K.doAjax(param, '/1fd3ab97ee/menu/authority/change');
                    } else {
                        K.doAjax(param, '/1fd3ab97ee/menu/authority/add');
                    }

                    return false;
                }
            });
        });
    </script>
</block>