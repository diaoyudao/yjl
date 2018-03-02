<extend name="./Application/Adminen/View/default/base/context/lists.tpl"/>

<block name="menu_name"> > 多元业务</block>
<block name="page_name"> > 酒店业务</block>
<block name="body_main">
    <div class="page-container">

        <form class="form form-horizontal" action="" method="get">
            <div class="text-c">
                <span>城市：</span>
                <span class="select-box" style="width:120px;">
				<select name="city_id" class="select">
                    <option value=""></option>
                    <volist name="citys" id="item">
                        <option value="{$item.type_id}"
                        <php>if(I('get.city_id') == $item['type_id']) {echo 'selected';}</php>
                        >{$item.name}</option>
                    </volist>
                </select>
				</span>
                <span>酒店属性：</span>
                <span class="select-box" style="width:120px;">
				<select name="type_id" class="select">
                    <option value=""></option>
                    <volist name="types" id="item">
                        <option value="{$item.type_id}"
                        <php>if(I('get.type_id') == $item['type_id']) {echo 'selected';}</php>
                        >{$item.name}</option>
                    </volist>
                </select>
				</span>
                <span>酒店名称：</span>
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
                   onclick="notice_add('添加', '/adminenglish/business/hotel/add')"
                   href="javascript:;"><img style="width:12px;height:12px;margin-top:-2px;"
                                            src="/public/img/iconfont/xe600-2.png"/>
                    添加
                </a></span> <span class="r">共有数据：<strong>{$counts}</strong> 条</span></div>
        <div class="mt-20">
            <table class="table table-border table-bordered table-bg table-hover table-sort">
                <thead>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="80">酒店名称</th>
                    <th width="60">酒店属性</th>
                    <th width="80">城市</th>
                    <th width="88">电话</th>
                    <th>地址</th>

                    <th>邮箱</th>
                    <th width="60">顺序号</th>
                    <th width="80">有效时间</th>
                    <th width="60">发布状态</th>
                    <th width="160">操作</th>
                </tr>
                </thead>
                <tbody>
                <volist name="hotels" id="item">
                    <tr class="text-c">
                        <td><input type="checkbox" value="{$item.land_id}" name="check"></td>
                        <td>{$item.name}</td>
                        <td>{$item.type_name}</td>
                        <td>{$item.city_name}</td>
                        <td>{$item.tel}</td>
                        <td>{$item.address}</td>
                        <td>{$item.email}</td>

                        <td>{$item.weight}</td>
                        <td>{$item.begin_time} -
                            <php> echo ($item['end_time'] != '0000-00-00')? $item['end_time'] : '';</php>
                        </td>
                        <td class="td-status"><span class="label label-success radius"><php>if($item['status'] ==
                                    1) {echo '发布';} else {echo '待审核';}</php></span></td>
                        <td class="f-14 td-manage">
                            <a target="_blank" style="text-decoration:none" class="ml-5"
                               href="/adminenglish/business/hotel/search?land_id={$item.land_id}"
                               title="预览"><i class="Hui-iconfont Hui-iconfont-yulan"></i></a>
                            <php>
                                $param="land_id=".$item['land_id'];
                            </php>
                            <include file="./Application/Adminen/View/default/base/context/auditorone-lists.tpl"/>
                            <a style="text-decoration:none" class="ml-5"
                               onclick="manage_image(this,'{$item.name}-图片管理', '/adminenglish/business/image/lists?land_id={$item.land_id}&type=hotel');"
                               title="图片管理"><i class="Hui-iconfont">
                                    &#xe646;</i></a>
                            <a style="text-decoration:none" class="ml-5"
                               onclick="manage_image(this,'{$item.name}-mobile图片管理', '/adminenglish/business/mobile/lists?land_id={$item.land_id}&type=hotel');"
                               title="mobile图片管理"><i class="Hui-iconfont">
                                    &#xe696;</i></a>

                            <a style="text-decoration:none" class="ml-5"
                               onClick="notice_edit(this,'编辑','/adminenglish/business/hotel/change?land_id={$item.land_id}')"
                               href="javascript:;" title="编辑"><img
                                        style="width:14px;height:14px;" src="/public/img/iconfont/xe6df.png"/>
                            </a> <a style="text-decoration:none" class="ml-5"
                                    onClick="article_del(this,'{$item.land_id}')"
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
        var city_id = $("select[name=city_id]").val();
        var type_id = $("select[name=type_id]").val();
        var name = $("input[name=name]").val();
        var status = $("select[name=status]").val();
        var param = '&city_id=' + city_id + '&type_id=' + type_id + '&name=' + name + '&status=' + status;
        var page_size = '<php> echo empty($pager -> totalPages) ? 1 : $pager -> totalPages; </php>';
        if (page_size > 1) {
            PAGER.create(page_size, param);
        }
        var cotroll = JSON.parse('<php>echo json_encode($release)</php>');

        /*添加*/
        function manage_image(obj, title, url) {
            var text = $(obj).parent().prev().find('span').text().trim();
            if ('发布' == text && 1 == cotroll) {
                layer.msg('您没有权限修改已发布的酒店!',{icon:2,time:1500});
                return false;
            }
            var height = $(window).height();
            var width = $(window).width();
            layer_show(title, url, width * 0.9, height);
            //K.showFullSonPage(title, url);
        }

        /*添加*/
        function notice_add(title, url) {
            K.showFullSonPage(title, url);
        }
        /*编辑*/
        function notice_edit(obj, title, url, w, h) {
            var text = $(obj).parent().prev().find('span').text().trim();
            if ('发布' == text && 1 == cotroll) {
                layer.msg('您没有权限修改已发布的酒店!',{icon:2,time:1500});
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
                layer.msg('您没有权限删除已发布的酒店!',{icon:2,time:1500});
                return false;
            }
            layer.confirm('确认要删除吗？', function (index) {
                var param = {land_id: id};

                K.doAjaxDeleteById(obj, param, '/adminenglish/business/hotel/delete');
            });
        }

        function del_more() {
            var param = {
                batch: 1,
                ids: []
            };
            var text = [];
            $("input[name=check]").each(function () {
                if (this.checked) {
                    text.push($(this).parent().siblings().find('span').last().text().trim());
                    param.ids.push($(this).val());
                }
            });
            for (var i = 0; i < text.length; i++) {
                if ('发布' == text[i] && 1 == cotroll) {
                    layer.msg('您没有权限删除已发布的酒店!',{icon:2,time:1500});
                    return false;
                }
            }
            if (param.ids.length <= 0) {
                layer.msg('请选择需要删除的数据!',{icon:2,time:2000});
                return;
            }

            layer.confirm('确认要删除选中的所有吗？', function (index) {
                K.doAjax(param, '/adminenglish/business/hotel/delete', function (response) {
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