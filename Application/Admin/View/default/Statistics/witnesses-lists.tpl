<extend name="./Application/Admin/View/default/base/context/lists.tpl"/>
<block name="menu_name"> > 数据统计</block>
<block name="page_name"> > 举报统计</block>
<block name="body_main">
    <div class="page-container">
        <form class="form form-horizontal" action="" name="searchform" method="get">
            <div class="text-c"> 日期范围：
                <input type="text" onfocus="WdatePicker()" name="begin_date"
                       value="{$Think.get.begin_date}"
                       class="input-text Wdate" style="width:120px;">
                -
                <input type="text" onfocus="WdatePicker()" name="end_date" value="{$Think.get.end_date}"
                       class="input-text Wdate" style="width:120px;">

                <input type="text" name="defendant" id="defendant" placeholder="被举报人" value="{$Think.get.defendant}"
                       style="width:104px"
                       class="input-text">
                <input type="text" name="plaintiff" id="plaintiff" placeholder="举报人" value="{$Think.get.plaintiff}"
                       style="width:100px"
                       class="input-text">
                <input type="text" name="tel" id="tel" placeholder="电话" value="{$Think.get.tel}"
                       style="width:100px"
                       class="input-text">
                <input type="text" name="desc" id="desc" placeholder="举报事项" value="{$Think.get.desc}"
                       style="width:100px"
                       class="input-text">
                <button name="" id="" class="btn btn-success" onclick="check_2()" type="submit"><i class="Hui-iconfont">
                        &#xe665;</i> 搜索
                </button>
                <button class="btn btn-success"  onclick="export_csv()" ><i class="Hui-iconfont">
                        &#xe644;</i> 导出
                </button>
            </div>
        </form>
        <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"></span> <span class="r">共有数据：<strong>{$counts}</strong> 条</span>
        </div>
        <table class="table table-border table-bordered table-bg">
            <thead>
            <tr>
                <th scope="col" colspan="17">举报列表</th>
            </tr>
            <tr class="text-c">
                <th width="30">序号</th>
                <th >被举报人</th>
                <th >城市</th>
                <th >公司类型</th>
                <th >部门</th>
                <th >举报事项</th>
                <th >举报人</th>
                <th >举报人邮箱</th>
                <th >举报人电话</th>
                <th >举报人qq</th>
                <th width="70px">举报时间</th>
                <th >举报IP</th>
                <th >事项</th>
                <th >时间地点</th>
                <th >过程</th>
                <th >证据</th>
                <th >附件</th>
            </tr>
            </thead>
            <tbody>
            <volist name="statistics" id="item">
                <tr class="text-c">
                    <td>{$i}</td>
                    <td>{$item.defendant}</td>
                    <td>{$item.city}</td>
                    <td>{$item.company_type}</td>
                    <td>{$item.partiton}</td>
                    <td>{$item.desc}</td>
                    <td>{$item.plaintiff}</td>
                    <td>{$item.mail}</td>
                    <td>{$item.tel}</td>
                    <td>{$item.qq}</td>
                    <td>{$item.create_time}</td>
                    <td>{$item.ip}</td>
                    <td>{$item.note}</td>
                    <td>{$item.address}</td>
                    <td>{$item.process}</td>
                    <td>{$item.evidence}</td>
                    <td><notempty name="item['attachment']"><a href="{$item.attachment}">下载</a></notempty></td>
                </tr>
            </volist>
            </tbody>
        </table>
        <div id="pager" style="margin-top:5px; text-align:center;"></div>
    </div>
</block>
<block name="footer_js">
    <script type="text/javascript">
//        function check_2() {
//
//            if ($('#defendant').val() == "被举报人") {
//                $('#defendant').val('');
//            }
//            if ($('#plaintiff').val() == "举报人") {
//                $('#plaintiff').val('');
//            }
//            if ($('#tel').val() == "联系电话") {
//                $('#tel').val('');
//            }
//            if ($('#desc').val() == "举报事项") {
//                $('#desc').val('');
//            }
////        }
        function export_csv() {

            document.searchform.action="/1fd3ab97ee/statistics/witnesses/export";
            searchform.submit();

        }
        $(function () {
            if ($('#defendant').val() == "被举报人") {
                $('#defendant').val('');
            }
            if ($('#plaintiff').val() == "举报人") {
                $('#plaintiff').val('');
            }
            if ($('#tel').val() == "联系电话") {
                $('#tel').val('');
            }
            if ($('#desc').val() == "举报事项") {
                $('#desc').val('');
            }

            var defendant = "";
            if ($('#defendant').val() != "被举报人") {
                defendant = $('#defendant').val();
            }
            var plaintiff = "";
            if ($('#plaintiff').val() != "举报人") {
                plaintiff = $('#plaintiff').val();
            }
            var tel = "";
            if ($('#tel').val() != "联系电话") {
                action = $('#tel').val();
            }
            var desc = "";
            if ($('#desc').val() != "举报事项") {
                event = $('#desc').val();
            }
            /*  分页 */
            var param = '&begin_date=' + '{$Think.get.begin_date}' + '&end_date=' + '{$Think.get.end_date}' +
                    '&defendant=' + defendant + '&plaintiff=' + plaintiff
                    + '&tel=' + tel + '&desc=' + desc;
            var page_size = '<php> echo empty($pager -> totalPages) ? 1 : $pager -> totalPages; </php>';
            if (page_size > 1) {
                PAGER.create(page_size, param);
            }
        });



    </script>

</block>