<extend name="./Application/Adminen/View/default/base/context/lists.tpl"/>

<block name="menu_name"> > 内容管理</block>
<block name="page_name"> > 信用评级</block>
<block name="body_main">
    <div class="page-container">
        <form class="form form-horizontal" action="" method="get">
            <div class="text-c">
                <span> 信用评级机构：</span>
                <input type="text" name="institution" value="{$Think.get.institution}" style="width:104px"
                       class="input-text"/>
                <!--<span>发布状态：</span>
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
                    </span>-->
                <button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">
                        &#xe665;</i> 搜索
                </button>
            </div>
        </form>

        <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="del_more()"
                                                                   class="btn btn-danger radius">
                    <img style="width:12px;height:12px;margin-top:-2px;" src="/public/img/iconfont/xe6e2-2.png"/>
                    批量删除</a>
                <!--<include file="./Application/Adminen/View/default/base/context/auditor-lists.tpl"/>-->

                <a class="btn btn-primary radius" data-title="新增"
                   onclick="advert_add('新增','/adminenglish/invest/credit/add')"
                   href="javascript:;"><img style="width:12px;height:12px;margin-top:-2px;"
                                            src="/public/img/iconfont/xe600-2.png"/>
                    新增</a>
                    <a class="btn btn-primary radius" data-title="导入"
                       onclick="layer_show('导入信用评级','/adminenglish/invest/credit/import',600,300);"
                       href="javascript:;"><i class="Hui-iconfont Hui-iconfont-daoru"></i>导入</a>
                    <a class="btn btn-primary radius" data-title="更新日期"
                       onclick="layer_show('更新日期','/adminenglish/invest/credit/save',600,300);"
                       href="javascript:;"><i class="Hui-iconfont ">&#xe606;</i>更新日期</a>

                    </span>
            <span class="r">共有数据：<strong>{$counts}</strong> 条</span></div>
        <div class="mt-20">
            <table class="table table-border table-bordered table-bg table-hover table-sort">
                <thead>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="100">信用评级机构</th>
                    <th width="100">日期</th>
                    <th>企业家族评级</th>
                    <th>评级展望</th>
                    <th width="60">顺序号</th>
                    <th width="60">发布状态</th>
                    <th width="120">操作</th>
                </tr>
                </thead>
                <tbody>
                <volist name="credits" id="item">
                    <tr class="text-c">
                        <td><input type="checkbox" value="{$item.credit_id}" name="check"></td>
                        <td>{$item.institution}</td>
                        <td>{$item.begin_time}</td>
                        <td>{$item.grade}</td>
                        <td>{$item.forecast}</td>
                        <td>{$item.weight}</td>

                        <td class="td-status"><span class="label label-success radius">
                                <php>if($item['status'] == 1) {echo '发布';} else {echo '待审核';}</php>
                            </span></td>
                        <td class="f-14 td-manage">
                            <!--
                            <php>
                                $param="credit_id=".$item['credit_id'];
                            </php>
                            <include file="./Application/Adminen/View/default/base/context/auditorone-lists.tpl"/>-->
                            <a style="text-decoration:none" class="ml-5"
                               onClick="advert_edit(this,'编辑','/adminenglish/invest/credit/change?credit_id={$item.credit_id}')"
                               href="javascript:;" title="编辑">
                                <img style="width:14px;height:14px;" src="/public/img/iconfont/xe6df.png"/></a>
                            <a
                                    style="text-decoration:none" class="ml-5"
                                    onClick="advert_del(this,'{$item.credit_id}')"
                                    href="javascript:;"
                                    title="删除"><img style="width:14px;height:14px;"
                                                    src="/public/img/iconfont/xe6e2.png"/></a>
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

        /*  分页 */
        var institution = $("input[name=institution]").val();
//        var status = $("select[name=status]").val();
        var param = '&institution=' + institution ;
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
                layer.msg('您没有权限修改已发布的评级!',{icon:2,time:1500});
                return false;
            }
            K.showFullSonPage(title, url);
        }

        /*删除*/
        function advert_del(obj, id) {
            var text = $(obj).parent().prev().find('span').text().trim();

            if ('发布' == text && 1 == cotroll) {
                layer.msg('您没有权限删除已发布的评级!',{icon:2,time:1500});
                return false;
            }
            layer.confirm('确认要删除吗？', function (index) {
                //此处请求后台程序，下方是成功后的前台处理……
                var param = {credit_id: id};

                K.doAjaxDeleteById(obj, param, '/adminenglish/invest/credit/delete');
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
                    layer.msg('您没有权限删除已发布的评级!',{icon:2,time:1500});
                    return false;
                }
            }

            if (param.ids.length <= 0) {
                layer.msg('请选择需要删除的数据!',{icon:2,time:2000});
                return;
            }

            layer.confirm('确认要删除选中的所有记录吗？', function (index) {
                K.doAjax(param, '/adminenglish/invest/credit/delete', function (response) {
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