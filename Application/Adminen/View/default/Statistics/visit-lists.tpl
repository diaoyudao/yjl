<extend name="./Application/Adminen/View/default/base/context/lists.tpl"/>
<block name="menu_name"> > 数据统计</block>
<block name="page_name"> > 访问统计</block>
<block name="body_main">
    <div class="page-container">
        <form class="form form-horizontal" action="" method="get">
            <div class="text-c"> 日期范围：
                <input type="text" onfocus="WdatePicker()" name="begin_date"
                       value="{$paramter.begin_date}"
                       class="input-text Wdate" style="width:120px;">
                -
                <input type="text" onfocus="WdatePicker()" name="end_date" value="{$paramter.end_date}"
                       class="input-text Wdate" style="width:120px;">

                <input type="text" name="ip" id="ip" placeholder="IP" value="{$paramter.ip}"
                       style="width:104px"
                       class="input-text">
                <input type="text" name="controller" id="controller" placeholder="控制器" value="{$paramter.controller}"
                       style="width:100px"
                       class="input-text">
                <input type="text" name="action" id="action" placeholder="活动" value="{$paramter.action}"
                       style="width:100px"
                       class="input-text">
                <input type="text" name="event" id="event" placeholder="事件内容" value="{$paramter.event}"
                       style="width:100px"
                       class="input-text">
                <button name="" id="" class="btn btn-success" onclick="check_2()" type="submit"><i class="Hui-iconfont">
                        &#xe665;</i> 搜索
                </button>
            </div>
        </form>
        <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"></span> <span class="r">共有数据：<strong>{$counts}</strong> 条</span>
        </div>
        <table class="table table-border table-bordered table-bg">
            <thead>
            <tr>
                <th scope="col" colspan="10">统计列表</th>
            </tr>
            <tr class="text-c">
                <th width="50">序号</th>
                <th width="100">菜单</th>
                <th width="100">IP</th>
                <th width="100">开始时间</th>
                <th width="100">停留时间</th>
                <th width="100">登陆时间</th>
                <th width="100">客户端类型</th>
                <th width="100">控制器</th>
                <th width="100">活动</th>
                <th >事件内容</th>
            </tr>
            </thead>
            <tbody>
            <volist name="statistics" id="item">
                <tr class="text-c">
                    <td>{$i}</td>
                    <td>{$item.menu_name}</td>
                    <td>{$item.ip}</td>
                    <td>{$item.create_time}</td>
                    <td>{$item.duration} 分钟</td>
                    <td>{$item.login_time}</td>
                    <td>{$item.client_type}</td>
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
        function check_2() {

            if ($('#ip').val() == "IP") {
                $('#ip').val('');
            }
            if ($('#controller').val() == "控制器") {
                $('#controller').val('');
            }
            if ($('#action').val() == "活动") {
                $('#action').val('');
            }
            if ($('#event').val() == "事件内容") {
                $('#event').val('');
            }
        }

        $(function () {

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
            if ($('#event').val() != "事件内容") {
                event = $('#event').val();
            }
            /*  分页 */
            var param = '&begin_date=' + '{$paramter.begin_date}' + '&end_date=' + '{$paramter.end_date}' +
                    '&ip=' + ip + '&controller=' + controller
                    + '&action=' + action + '&event=' + event;
            var page_size = '<php> echo empty($pager -> totalPages) ? 1 : $pager -> totalPages; </php>';
            if (page_size > 1) {
                PAGER.create(page_size, param);
            }
        });



    </script>

</block>