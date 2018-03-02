<extend name="./Application/Adminen/View/default/base/context/lists.tpl"/>
<block name="menu_name">系统管理</block>
<block name="page_name">后台日志</block>
<block name="body_main">
    <div class="page-container">
        <form class="form form-horizontal" action="" name="searchform" method="get">
            <div class="text-c"> 日期范围：
                <input type="text" onfocus="WdatePicker()" id="begin_date" name="begin_date"
                       value="{$paramter.begin_date}"
                       class="input-text Wdate" style="width:120px;">
                -
                <input type="text" onfocus="WdatePicker()" id="end_date" name="end_date" value="{$paramter.end_date}"
                       class="input-text Wdate" style="width:120px;">
                <input type="text" name="name" id="name" placeholder="姓名" style="width:80px" value="{$paramter.name}"
                       class="input-text">
                <input type="text" name="staff_code" id="staff_code" placeholder="工号" value="{$paramter.staff_code}"
                       style="width:100px"
                       class="input-text">
                <input type="text" name="ip" id="ip" placeholder="IP" value="{$paramter.ip}"
                       style="width:104px"
                       class="input-text">

                <input type="text" name="controller" id="controller" placeholder="控制器" value="{$paramter.controller}"
                       style="width:100px"
                       class="input-text">
                <input type="text" name="action" id="action" placeholder="活动" value="{$paramter.action}"
                       style="width:100px"
                       class="input-text">
                <input type="text" name="event" id="event" placeholder="操作内容" value="{$paramter.event}"
                       style="width:100px"
                       class="input-text">
                <button name="" id="" class="btn btn-success" onclick="check()" type="submit"><i class="Hui-iconfont">
                        &#xe665;</i> 搜索
                </button>
                <button name="" id="" class="btn btn-success" onclick="export_csv()" ><i class="Hui-iconfont">
                        &#xe644;</i> 导出
                </button>
            </div>
        </form>
        <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"></span> <span class="r">共有数据：<strong>{$counts}</strong> 条</span>
        </div>
        <table class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
            <tr class="text-c">
                <th width="40">序号</th>
                <th width="120">姓名</th>
                <th width="120">用户名</th>
                <th width="120">操作时间</th>
                <th width="120">IP地址</th>
                <th width="120">控制器</th>
                <th width="120">活动</th>
                <th>操作内容</th>
            </tr>
            </thead>
            <tbody>
            <volist name="logs" id="item">
                <tr class="text-c">
                    <td>{$i}</td>
                    <td>{$item.name}</td>
                    <td>{$item.staff_code}</td>
                    <td>{$item.create_time}</td>
                    <td>{$item.ip}</td>
                    <td>{$item.controller}</td>
                    <td>{$item.action}</td>
                    <td>{$item.event}</td>
                </tr>
            </volist>
            </tbody>
        </table>
        <div id="pager" style="margin-top:5px; text-align:center;"></div>
    </div>
</block>
<block name="footer_js">
    <script type="text/javascript">
        function check() {
            if ($('#name').val() == "姓名") {
                $('#name').val('');
            }
            if ($('#staff_code').val() == "工号") {
                $('#staff_code').val('');
            }
            if ($('#ip').val() == "IP") {
                $('#ip').val('');
            }

            if ($('#controller').val() == "控制器") {
                $('#controller').val('');
            }
            if ($('#action').val() == "活动") {
                $('#action').val('');
            }
            if ($('#event').val() == "操作内容") {
                $('#event').val('');
            }
        }

        $(function () {
            var name = "";

            if ($('#name').val() != "姓名") {
                name = $('#name').val();
            }
            var staff_code = "";
            if ($('#staff_code').val() != "工号") {
                staff_code = $('#staff_code').val();
            }
            var ip = "";
            if ($('#ip').val() != "IP") {
                ip = $('#ip').val();
            }
            var controller = "";
            if ($('#controller').val() != "控制器") {
                controller = $('#controller').val();
            }
            var action = "";
            if ($('#action').val() != "活动") {
                action = $('#action').val();
            }
            var event = "";
            if ($('#event').val() != "操作内容") {
                event = $('#event').val();
            }

            /*  分页 */

            var param = '&begin_date=' + '{$paramter.begin_date}' + '&end_date=' + '{$paramter.end_date}' +
                    '&name=' + name + '&staff_code=' + staff_code + '&controller=' + '&ip=' + ip +
                    controller + '&action=' + action + '&event=' + event;
            var page_size = '<php> echo empty($pager -> totalPages) ? 1 : $pager -> totalPages; </php>';
            if (page_size > 1) {
                PAGER.create(page_size, param);
            }

        });
        function export_csv() {
            document.searchform.action="/adminenglish/system/log/export";
            searchform.submit();
        }




    </script>
</block>