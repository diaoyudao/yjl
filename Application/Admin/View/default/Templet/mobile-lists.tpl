<extend name="./Application/Admin/View/default/base/context/lists.tpl"/>

<block name="menu_name"> > 数据管理</block>
<block name="page_name"> > mobile图片管理</block>
<block name="body_main">
    <div class="page-container">
        <form class="form form-horizontal" action="" method="get">
            <div class="text-c">
                <span>栏目：</span>
                <span class="select-box" style="width:120px;">
				<select name="level_id" class="select">
                    <option value="" ></option>
                    <volist name="select_levels" id="item1">
                        <option value="{$item1.level_id}"
                        <php>if(I('get.level_id') == $item1['level_id']) {echo 'selected';}</php>
                        >{$item1.name}</option>                        
                    </volist>
                </select>
				</span>
                <span>标记：</span>
                <input type="text" name="tags" value="{$Think.get.tags}" style="width:104px" class="input-text"/>
                <span>名称：</span>
                <input type="text" name="name" value="{$Think.get.name}" style="width:104px" class="input-text"/>
                <button name="" id="" class="btn btn-success"  type="submit"><i class="Hui-iconfont">
                        &#xe665;</i> 搜索
                </button>
            </div>
        </form>

        <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="del_more()"
                                                                   class="btn btn-danger radius">
                    <img style="width:12px;height:12px;margin-top:-2px;" src="/public/img/iconfont/xe6e2-2.png"/>
                    批量删除</a> <a class="btn btn-primary radius" data-title="新增"
                                onclick="advert_add('新增','/1fd3ab97ee/templet/mobile/add')"
                                href="javascript:;"><img style="width:12px;height:12px;margin-top:-2px;"
                                                         src="/public/img/iconfont/xe600-2.png"/>
                    新增</a></span> <span class="r">共有数据：<strong>{$counts}</strong> 条</span></div>
        <div class="mt-20">
            <table class="table table-border table-bordered table-bg table-hover table-sort">
                <thead>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="80">栏目</th>
                    <th width="80">显示标记</th>
                    <th width="100">图片名称</th>
                    <th >图片介绍</th>
                    <th>简体图片</th>
                    <th>简体图片链接</th>
                    <th>繁体图片</th>
                    <th>繁体图片链接</th>
                    <th width="100">生效时间</th>
                    <th width="60">顺序号</th>
                    <th width="60">发布状态</th>
                    <th width="60">操作</th>
                </tr>
                </thead>
                <tbody>
                <volist name="images" id="item">
                    <tr class="text-c">
                        <td><input type="checkbox" value="{$item.image_id}" name="check"></td>
                        <td>{$item.menu_name}</td>
                        <td>{$item.tags}</td>
                        <td>{$item.name}</td>
                        <td>{$item.desc}</td>
                        <td>
                            <notempty name="item.thumbnail_url1"><img src="{$item['thumbnail_url1']}" width="128" height="80"></notempty>
                        </td>
                        <td>{$item.link_url1}</td>
                        <td>
                            <notempty name="item.thumbnail_url2"><img src="{$item['thumbnail_url2']}" width="128" height="80"></notempty>
                        </td>
                        <td>{$item.link_url2}</td>
                        <td>{$item.begin_time} ~
                            <php> echo ($item['end_time'] != '0000-00-00')? $item['end_time'] : '';</php>
                        </td>
                        <td>{$item.weight}</td>
                        <td class="td-status"><span class="label label-success radius">
                                <php>if($item['status'] == 1) {echo '发布';} else {echo '待审核';}</php>
                            </span></td>
                        <td class="f-14 td-manage"><a style="text-decoration:none" class="ml-5"
                                                      onClick="advert_edit('编辑','/1fd3ab97ee/templet/mobile/change?image_id={$item.image_id}')"
                                                      href="javascript:;" title="编辑">
                                <img style="width:14px;height:14px;" src="/public/img/iconfont/xe6df.png"/></a> <a
                                    style="text-decoration:none" class="ml-5"
                                    onClick="advert_del(this,'{$item.image_id}')"
                                    href="javascript:;"
                                    title="删除"><img style="width:14px;height:14px;"
                                                    src="/public/img/iconfont/xe6e2.png"/></a></td>
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
        var level_lists = JSON.parse('<php>echo json_encode($select_levels)</php>');
        for (var j = 0; j < level_lists.length; j++) {
            if (null == level_lists[j].tags_type) {
                var index = j + 1;
                $("select[name=level_id] option").eq(index).attr("disabled", "disabled");
            }
        }
        /*  分页 */
        var level_id=$("select[name=level_id]").val();
        var tags=$("input[name=tags]").val();
        var name=$("input[name=name]").val();
        var param = '&level_id=' + level_id + '&tags=' + tags + '&name=' + name;
        var page_size = '<php> echo empty($pager -> totalPages) ? 1 : $pager -> totalPages; </php>';
        if (page_size > 1) {
            PAGER.create(page_size, param);
        }

        /*添加*/
        function advert_add(title, url) {
            K.showFullSonPage(title, url);
        }

        /*编辑*/
        function advert_edit(title, url, w, h) {
            K.showFullSonPage(title, url);
        }

        /*删除*/
        function advert_del(obj, id) {
            layer.confirm('确认要删除吗？', function (index) {
                //此处请求后台程序，下方是成功后的前台处理……
                var param = {image_id: id};

                K.doAjaxDeleteById(obj, param, '/1fd3ab97ee/templet/mobile/delete');
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

            layer.confirm('确认要删除选中的所有记录吗？', function (index) {
                K.doAjax(param, '/1fd3ab97ee/templet/mobile/delete', function (response) {
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