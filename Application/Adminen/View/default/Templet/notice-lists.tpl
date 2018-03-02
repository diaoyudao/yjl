<extend name="./Application/Adminen/View/default/base/context/lists.tpl"/>

<block name="menu_name"> > 内容管理</block>
<block name="page_name"> > 文章管理</block>
<block name="body_main">
    <div class="page-container">

        <form class="form form-horizontal" action="" method="get">
            <div class="text-c">
                <span>栏目：</span>
                <span class="select-box" style="width:120px;">
                    <select name="level_id" class="select">
                        <option value=""></option>
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

                <span>发布状态：</span>
                <span class="select-box" style="width:80px;">
                    <select name="status" class="select">
                        <option value=""></option>
                        <option value="0"
                        <php>if(I('get.status') == 0 && I('get.status') != null) {echo 'selected';}</php>
                        >待审核</option>
                        <option value="1"
                        <php>if(I('get.status') == 1) {echo 'selected';}</php>
                        >发布</option>

                    </select>
                    </span>

                日期范围：
                <input type="text" onfocus="WdatePicker()" name="begin_time"
                       value="{$Think.get.begin_time}"
                       class="input-text Wdate" style="width:120px;">
                -
                <input type="text" onfocus="WdatePicker()" name="end_time" value="{$Think.get.end_time}"
                       class="input-text Wdate" style="width:120px;">
                <button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">
                        &#xe665;</i> 搜索
                </button>
            </div>
        </form>

        <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="del_more()"
                                                                   class="btn btn-danger radius">
                    <img style="width:12px;height:12px;margin-top:-2px;" src="/public/img/iconfont/xe6e2-2.png"/>
                    批量删除</a>

                   <include file="./Application/Adminen/View/default/base/context/auditor-lists.tpl"/>

               <a class="btn btn-primary radius" data-title="添加"
                  onclick="notice_add('添加', '/adminenglish/templet/notice/add')"
                  href="javascript:;"><img style="width:12px;height:12px;margin-top:-2px;"
                                           src="/public/img/iconfont/xe600-2.png"/>
                   添加
               </a></span> <span class="r">共有数据：<strong>{$counts}</strong> 条</span></div>
        <div class="mt-20">
            <table class="table table-border table-bordered table-bg table-hover table-sort">
                <thead>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="80">栏目</th>
                    <th width="80">显示标记</th>
                    <th>置顶</th>
                    <th>标题</th>
                    <th>简介</th>
                    <th width="60">顺序号</th>
                    <th width="120">生效时间</th>
                    <th width="60">发布状态</th>
                    <th width="120">操作</th>
                </tr>
                </thead>
                <tbody>
                <volist name="notices" id="item">
                    <tr class="text-c">
                        <td><input type="checkbox" value="{$item.notice_id}" name="check"></td>
                        <td>{$item.menu_name}</td>
                        <td>{$item.tags}</td>
                        <td>
                            <span class="label label-success radius"><if condition="$item.web_stick eq 1">头条推送
                                </if></span>
                            <span class="label label-success radius"><if condition="$item.stick eq 1">频道置顶</if></span>
                        </td>
                        <td><a style="cursor:pointer" class="text-primary"
                               onClick="notice_edit(this,'查看','/adminenglish/templet/notice/search?notice_id={$item.notice_id}')"
                               title="查看">{$item.name}</a>
                        </td>
                        <td>{$item.desc}</td>
                        <td>{$item.weight}</td>
                        <td>{$item.begin_time} -
                            <php> echo ($item['end_time'] != '0000-00-00')? $item['end_time'] : '';</php>
                        </td>
                        <td class="td-status"><span class="label label-success radius"><php>if($item['status'] ==
                                    1) {echo '发布';} else {echo '待审核';}</php></span>
                        </td>
                        <td class="f-14 td-manage">
                            <a target="_blank" style="text-decoration:none" class="ml-5"
                               href="/adminenglish/templet/notice/search?notice_id={$item.notice_id}"
                               title="预览"><i class="Hui-iconfont Hui-iconfont-yulan"></i></a>
                            <php>
                                $param="notice_id=".$item['notice_id'];
                            </php>
                            <include file="./Application/Adminen/View/default/base/context/auditorone-lists.tpl"/>

                            <a style="text-decoration:none" class="ml-5"
                               onClick="notice_edit(this,'编辑','/adminenglish/templet/notice/change?notice_id={$item.notice_id}')"
                               href="javascript:;" title="编辑">
                                <img style="width:14px;height:14px;" src="/public/img/iconfont/xe6df.png"/>
                            </a>
                            <a style="text-decoration:none" class="ml-5"
                               onClick="article_del(this,'{$item.notice_id}')"
                               href="javascript:;"
                               title="删除">
                                <img style="width:14px;height:14px;" src="/public/img/iconfont/xe6e2.png"/>
                            </a>
                        </td>
                    </tr>
                </volist>
                </tbody>
            </table>
            <div id="pager" style="margin-top:5px; text-align:center;"></div>
        </div>
    </div>
</block>
<block name="footer_js">
    <script src="/public/js/admin/audit.js"></script>
    <script type="text/javascript">
        var level_lists = JSON.parse('<php>echo json_encode($select_levels)</php>');
        var cotroll = JSON.parse('<php>echo json_encode($release)</php>');
        for (var j = 0; j < level_lists.length; j++) {
            if (null !== level_lists[j].tags_type) {
                var index = j + 1;
                $("select[name=level_id] option").eq(index).attr("disabled", "disabled");
            }
        }
        /*  分页 */
        var level_id = $("select[name=level_id]").val();
        var tags = $("input[name=tags]").val();
        var name = $("input[name=name]").val();
        var status = $("select[name=status]").val();
        var param = '&level_id=' + level_id + '&tags=' + tags + '&name=' + name + '&status=' + status;
        var page_size = '<php> echo empty($pager -> totalPages) ? 1 : $pager -> totalPages; </php>';
        if (page_size > 1) {
            PAGER.create(page_size, param);
        }

        /*添加*/
        function notice_add(title, url) {
            K.showFullSonPage(title, url);
        }

        /*编辑*/
        function notice_edit(obj,title, url, w, h) {
            var text = $(obj).parent().prev().find('span').text().trim();
            if ('发布' == text && 1 == cotroll) {
                layer.msg('您没有权限修改已发布的文章!',{icon:2,time:1500});
                return false;
            }
            var index = layer.open({
                type: 2,
                title: title,
                content: url
            });
            layer.full(index);
        }
        /*删除*/
        function article_del(obj, id) {
            var text = $(obj).parent().prev().find('span').text().trim();
            if ('发布' == text && 1 == cotroll) {
                layer.msg('您没有权限删除已发布的文章!',{icon:2,time:1500});
                return false;
            }
            layer.confirm('确认要删除吗？', function (index) {
                var param = {notice_id: id};

                K.doAjaxDeleteById(obj, param, '/adminenglish/templet/notice/delete');
            });
        }

        function del_more() {
            var param = {
                batch: 1,
                ids: []
            };
            var text=[];
            $("input[name=check]").each(function () {
                if (this.checked) {
                    text.push($(this).parent().siblings().find('span').last().text().trim());
                    param.ids.push($(this).val());
                }
            });
            for(var i=0;i<text.length;i++){
                if ('发布' == text[i] && 1 == cotroll) {
                    layer.msg('您没有权限删除已发布的文章!',{icon:2,time:1500});
                    return false;
                }
            }

            if (param.ids.length <= 0) {
                layer.msg('请选择需要删除的数据!',{icon:2,time:2000});
                return;
            }

            layer.confirm('确认要删除选中的所有吗？', function (index) {
                K.doAjax(param, '/adminenglish/templet/notice/delete', function (response) {
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