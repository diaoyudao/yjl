<extend name="./Application/Adminen/View/default/base/context/lists.tpl"/>

<block name="menu_name"> > 数据管理</block>
<block name="page_name"> > 视频管理</block>
<block name="body_main">
    <div class="page-container">
        <form class="form form-horizontal" action="" method="get">
            <div class="text-c">
                <span>栏目：</span>
                <span class="select-box" style="width:120px;">
				<select name="level_id" class="select">
                    <option value=""></option>
                    <volist name="select_levels" id="item">
                        <option value="{$item.level_id}"
                        <php>if(I('get.level_id') == $item['level_id']) {echo 'selected';}</php>
                        >{$item.name}</option>
                    </volist>
                </select>
				</span>
                <span> 标记：</span>
                <input type="text" name="tags" value="{$Think.get.tags}" style="width:104px" class="input-text"/>
                <span> 文件标题：</span>
                <input type="text" name="title" value="{$Think.get.title}" style="width:104px" class="input-text"/>
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
                <button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">
                        &#xe665;</i> 搜索
                </button>
            </div>
        </form>

        <div class="cl pd-5 bg-1 bk-gray mt-20">
            <span class="l">
                <a href="javascript:;" onclick="del_more()"
                   class="btn btn-danger radius">
                    <img style="width:12px;height:12px;margin-top:-2px;" src="/public/img/iconfont/xe6e2-2.png"/>
                    批量删除</a>
                <include file="./Application/Adminen/View/default/base/context/auditor-lists.tpl"/>
                <a class="btn btn-primary radius" data-title="新增"
                   onclick="advert_add('新增','/adminenglish/templet/video/add')"
                   href="javascript:;"><img style="width:12px;height:12px;margin-top:-2px;"
                                            src="/public/img/iconfont/xe600-2.png"/>
                    新增</a>
            </span>
            <span class="r">共有数据：<strong>{$counts}</strong> 条</span></div>
        <div class="mt-20">
            <table class="table table-border table-bordered table-bg table-hover table-sort">
                <thead>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="80">栏目</th>
                    <th>显示标记</th>
                    <th width="50">置顶</th>
                    <th width="100">视频标题</th>
                    <th>视频描述</th>
                    <th>时长（分钟）</th>
                    <th>图片预览</th>
                    <th width="60">顺序号</th>
                    <th width="60">发布状态</th>
                    <th width="120">操作</th>
                </tr>
                </thead>
                <tbody>
                <volist name="videos" id="item">
                    <tr class="text-c">
                        <td><input type="checkbox" value="{$item.video_id}" name="check"></td>
                        <td>{$item.menu_name}</td>
                        <td>{$item.tags}</td>
                        <td><span class="label label-success radius"><if condition="$item.stick eq 1">置顶</if></span>
                        </td>
                        <td>{$item.title}</td>
                        <td>{$item.desc}</td>
                        <td>{$item.duration}</td>
                        <td>
                            <notempty name="item.thumbnail_url1"><img src="{$item['thumbnail_url1']}" width="128"
                                                                      height="80"></notempty>
                        </td>
                        <td>{$item.weight}</td>
                        <td class="td-status"><span class="label label-success radius">
                                <php>if($item['status'] == 1) {echo '发布';} else {echo '待审核';}</php>
                            </span></td>
                        <td class="f-14 td-manage">
                            <a target="_blank" style="text-decoration:none" class="ml-5"
                               href="/adminenglish/templet/video/search?video_id={$item.video_id}"
                               title="预览"><i class="Hui-iconfont Hui-iconfont-yulan"></i></a>
                            <php>
                                $param="video_id=".$item['video_id'];
                            </php>
                            <include file="./Application/Adminen/View/default/base/context/auditorone-lists.tpl"/>
                            <a style="text-decoration:none" class="ml-5"
                               onClick="advert_edit(this,'编辑','/adminenglish/templet/video/change?video_id={$item.video_id}')"
                               href="javascript:;" title="编辑">
                                <img style="width:14px;height:14px;" src="/public/img/iconfont/xe6df.png"/></a>
                            <a
                                    style="text-decoration:none" class="ml-5"
                                    onClick="advert_del(this,'{$item.video_id}')"
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
    <script src="/public/js/admin/audit.js"></script>
    <script type="text/javascript">

        /*  分页 */
        var level_id = $("select[name=level_id]").val();
        var status = $("select[name=status]").val();
        var tags = $("input[name=tags]").val();
        var title = $("input[name=title]").val();
        var param = '&level_id=' + level_id + '&tags=' + tags + '&title=' + title + '&status=' + status;
        var page_size = '<php> echo empty($pager -> totalPages) ? 1 : $pager -> totalPages; </php>';
        if (page_size > 1) {
            PAGER.create(page_size, param);
        }

        var cotroll = JSON.parse('<php>echo json_encode($release)</php>');

        /*添加*/
        function advert_add(title, url) {
            K.showFullSonPage(title, url);
        }

        /*编辑*/
        function advert_edit(obj, title, url, w, h) {
            var text = $(obj).parent().prev().find('span').text().trim();

            if ('发布' == text && 1 == cotroll) {
                layer.msg('您没有权限修改已发布的视频!',{icon:2,time:1500});
                return false;
            }
            K.showFullSonPage(title, url);
        }

        /*删除*/
        function advert_del(obj, id) {
            var text = $(obj).parent().prev().find('span').text().trim();

            if ('发布' == text && 1 == cotroll) {
                layer.msg('您没有权限删除已发布的视频!',{icon:2,time:1500});
                return false;
            }
            layer.confirm('确认要删除吗？', function (index) {
                //此处请求后台程序，下方是成功后的前台处理……
                var param = {video_id: id};

                K.doAjaxDeleteById(obj, param, '/adminenglish/templet/video/delete');
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
                    param.ids.push($(this).val());
                    text.push($(this).parent().siblings().find('span').last().text().trim());
                }
            });
            for(var i=0;i<text.length;i++){
                if ('发布' == text[i] && 1 == cotroll) {
                    layer.msg('您没有权限删除已发布的视频!',{icon:2,time:1500});
                    return false;
                }
            }

            if (param.ids.length <= 0) {
                layer.msg('请选择需要删除的数据!',{icon:2,time:2000});
                return;
            }

            layer.confirm('确认要删除选中的所有记录吗？', function (index) {
                K.doAjax(param, '/adminenglish/templet/video/delete', function (response) {
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