<extend name="./Application/Adminen/View/default/base/context/lists.tpl"/>
<block name="menu_name"> > 管理员管理</block>
<block name="page_name"> > 栏目组管理</block>
<block name="body_main">
    <div class="page-container">
        <form class="form form-horizontal" action="" method="get">
            <div class="text-c">
                <span>栏目组名:&nbsp; &nbsp;</span><input type="text" name="name" id="name" placeholder="" value="{$Think.get.name}"
                                                     style="width:100px"
                                                     class="input-text">

                <button name="" id="" class="btn btn-success" onclick="check_2()" type="submit"><i class="Hui-iconfont">
                        &#xe665;</i> 搜索
                </button>
            </div>
        </form>

        <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"> <a href="javascript:;" onclick="datadel()"
                                                              class="btn btn-danger radius">
															  <img style="width:12px;height:12px;margin-top:-2px;" src="/public/img/iconfont/xe6e2-2.png" />
															  批量删除</a> <a class="btn btn-primary radius" href="javascript:;"
                                                 onclick="admin_role_add('添加栏目组','/adminenglish/menu/authority/add','900')">
												 <img style="width:12px;height:12px;margin-top:-2px;" src="/public/img/iconfont/xe600-2.png" />
												 添加栏目组</a> </span> <span class="r">共有数据：<strong>{$counts}</strong> 条</span>
        </div>

        <table class="table table-border table-bordered table-bg">
            <thead>
            <tr>
                <th scope="col" colspan="10">栏目组列表</th>
            </tr>
            <tr class="text-c">
                <th width="25"><input type="checkbox" value="" name=""></th>
                <th width="200">栏目组名</th>
                <th>用户列表</th>
                <th >描述</th>
                <th width="70">操作</th>
            </tr>
            </thead>
            <tbody>
            <volist name="datas" id="item">
                <tr class="text-c">
                    <td><input type="checkbox" value="{$item.menu_authority_id}" name="check"></td>
                    <td>{$item.name}</td>
                    <td>{$item.staff_name}</td>
                    <td>{$item.note}</td>
                    <td class="f-14">
                        <a title="编辑" href="javascript:;"
                           onclick="admin_role_edit('角色编辑','/adminenglish/menu/authority/change?id={$item.menu_authority_id}')"
                           style="text-decoration:none">
						   <img style="width:14px;height:14px;" src="/public/img/iconfont/xe6df.png" />
                        </a>
                        <a
                                title="删除" href="javascript:;" onclick="admin_role_del(this,'{$item.menu_authority_id}')" class="ml-5"
                                style="text-decoration:none">
								<img style="width:14px;height:14px;" src="/public/img/iconfont/xe6e2.png" />
                        </a>
                    </td>
                </tr>
            </volist>
            </tbody>
        </table>
        <div id="pager" style="margin-top:5px; text-align:center;"></div>
    </div>
</block>
<block name="footer_js">
    <script type="text/javascript">
        function check_2() {

            if ($('#name').val() == "姓名") {
                $('#name').val('');
            }

        }

        $(function () {
            var name = "";
            if ($('#name').val() != "姓名") {
                controller = $('#name').val();
            }

        });
        /*  分页 */
        var param ='&name=' + name;
        /*  分页 */
        var page_size = '<php> echo empty($pager -> totalPages) ? 1 : $pager -> totalPages; </php>';
        if (page_size > 1) {
            PAGER.create(page_size);
        }
        /*管理员-角色-添加*/
        function admin_role_add(title, url, w, h) {
            layer_show(title, url, w, h);
        }
        /*管理员-角色-编辑*/
        function admin_role_edit(title, url, id, w, h) {
            layer_show(title, url, w, h);
        }
        /*管理员-角色-删除*/
        function admin_role_del(obj, id) {
            layer.confirm('栏目组删除须谨慎，确认要删除吗？', function (index) {
                //此处请求后台程序，下方是成功后的前台处理……
                var param = {
                    menu_authority_id: id
                };

                K.doAjaxDeleteById(obj, param, '/adminenglish/menu/authority/delete');
            });
        }
        /* 批量删除 */
        function datadel()
        {
            var param = {batch: true};
            param.ids=[];
            $("input[name=check]").each(function(){
                if(this.checked){
                    param.ids.push($(this).val());
                }
            });
            if(param.ids.length <= 0) {
                layer.msg('请选择需要删除的数据!',{icon:2,time:2000});
                return;
            }

            layer.confirm('角色删除须谨慎，确认要删除选中的角色吗？', function (index) {
                //此处请求后台程序，下方是成功后的前台处理……
                K.doAjax(param, '/adminenglish/menu/authority/delete', function(response){
                    if(response.status && response.status == 'ok') {
                        window.location.reload();
                    } else {
                        if(response.message) {
                            layer.msg(response.message, {icon:2,time:1500});
                        } else {
                            layer.msg('后台错误!',{icon:2,time:1500});
                        }
                    }
                });
            });
        }
    </script>
</block>