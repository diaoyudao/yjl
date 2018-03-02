<extend name="./Application/Adminen/View/default/base/context/lists.tpl"/>
<block name="menu_name">公告管理</block>
<block name="page_name">公告列表</block>
<block name="body_main">
    <div class="page-container">

        <form class="form form-horizontal" action="" method="get">
            <div class="text-c">
                <span>显示标记：</span>
                <span class="select-box" style="width: 200px">
                    <select name="show_flag" class="select" >
                        <option value=""></option>
                        <volist name="show_flag" id="item">
                            <option value="{$item}"
                            <php>if($paramter['show_flag'] == $item) {echo 'selected';}</php>
                            >{$item}</option>
                        </volist>
                    </select>
                </span>

                <button name="" id="" class="btn btn-success"  type="submit"><i class="Hui-iconfont">
                        &#xe665;</i> 搜索
                </button>
            </div>
        </form>

        <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="del_more()"
                                                             class="btn btn-danger radius"><img style="width:12px;height:12px;margin-top:-2px;" src="/public/img/iconfont/xe6e2-2.png" /> 批量删除</a> <a class="btn btn-primary radius" data-title="添加公告"
                                                 onclick="notice_add('添加公告', '/adminenglish/notice/manage/add')"
                                                 href="javascript:;"><img style="width:12px;height:12px;margin-top:-2px;" src="/public/img/iconfont/xe600-2.png" />
                    添加公告</a></span> <span class="r">共有数据：<strong>{$counts}</strong> 条</span></div>
        <div class="mt-20">
            <table class="table table-border table-bordered table-bg table-hover table-sort">
                <thead>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="80">显示标记</th>
                    <th>公告标题</th>
                    <th width="60">排序权重</th>
                    <th width="120">生效时间</th>
                    <th width="60">发布状态</th>
                    <th width="60">操作</th>
                </tr>
                </thead>
                <tbody>
                <volist name="notices" id="item">
                    <tr class="text-c">
                        <td><input type="checkbox" value="{$item.notice_id}" name="check"></td>
                        <td>{$item.show_flag}</td>
                        <td class="text-l"><a style="cursor:pointer" class="text-primary"
                                              onClick="notice_edit('公告查看','/adminenglish/notice/manage/search?notice_id={$item.notice_id}')"
                                              title="查看">{$item.name}</a>
                        </td>
                        <td>{$item.weight}</td>
                        <td>{$item.begin_time} -
                            <php> echo ($item['end_time'] != '0000-00-00')? $item['end_time'] : '';</php>
                        </td>
                        <td class="td-status"><span class="label label-success radius"><php>if($item['status'] ==
                                    1) {echo '已启用';} else {echo '未启用';}</php></span></td>
                        <td class="f-14 td-manage"><a style="text-decoration:none" class="ml-5"
                                                      onClick="notice_edit('公告编辑','/adminenglish/notice/manage/change?notice_id={$item.notice_id}')"
                                                      href="javascript:;" title="编辑"><img style="width:14px;height:14px;" src="/public/img/iconfont/xe6df.png" /></a> <a style="text-decoration:none" class="ml-5"
                                                        onClick="article_del(this,'{$item.notice_id}')"
                                                        href="javascript:;"
                                                        title="删除"><img style="width:14px;height:14px;" src="/public/img/iconfont/xe6e2.png" /></a></td>
                    </tr>
                </volist>
                </tbody>
            </table>
            <div id="pager" style="margin-top:5px; text-align:center;"></div>
        </div>
    </div>
</block>
<block name="footer_js">
    <script type="text/javascript">
        var show_flag=$(".select").val();

        /*  分页 */
        var param = '&show_flag=' + show_flag;
        var page_size = '<php> echo empty($pager -> totalPages) ? 1 : $pager -> totalPages; </php>';
        if (page_size > 1) {
            PAGER.create(page_size,param);
        }

        /*添加*/
        function notice_add(title, url) {
            K.showFullSonPage(title, url);
        }
        /*编辑*/
        function notice_edit(title, url, w, h) {
            var index = layer.open({
                type: 2,
                title: title,
                content: url
            });
            layer.full(index);
        }
        /*删除*/
        function article_del(obj, id) {
            layer.confirm('确认要删除吗？', function (index) {
                var param = {notice_id: id};

                K.doAjaxDeleteById(obj, param, '/adminenglish/notice/manage/delete');
            });
        }

        function del_more() {
            var param = {
                batch: 1,
                ids: []
            };
            $("input[name=check]").each(function () {
                if (this.checked) {
                    param.ids.push($(this).val());
                }
            });
            if (param.ids.length <= 0) {
                layer.msg('请选择需要删除的数据!',{icon:2,time:2000});
                return;
            }

            layer.confirm('确认要删除选中的所有公告吗？', function (index) {
                K.doAjax(param, '/adminenglish/notice/manage/delete', function (response) {
                    if (response.status && response.status == 'ok') {
                        window.location.replace(window.location.href);
                    } else {
                        if (response.message) {
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