<extend name="./Application/Admin/View/default/base/context/lists.tpl"/>
<block name="menu_name"> > 数据统计</block>
<block name="page_name"> > 投资者访问</block>
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

                <input type="text" name="organize" id="organize" placeholder="来访机构" value="{$Think.get.organize}"
                       style="width:104px"
                       class="input-text">
                <input type="text" name="name" id="name" placeholder="来访者姓名" value="{$Think.get.name}"
                       style="width:100px"
                       class="input-text">
                <input type="text" name="tel" id="tel" placeholder="联系电话" value="{$Think.get.tel}"
                       style="width:100px"
                       class="input-text">
                <button name="" id="" class="btn btn-success"  type="submit"><i class="Hui-iconfont">
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
                <th scope="col" colspan="10">统计列表</th>
            </tr>
            <tr class="text-c">
                <th width="50">序号</th>
                <th width="120">来访机构</th>
                <th width="80">来访者姓名</th>
                <th width="100">联系电话</th>
                <th  >联系邮箱</th>
                <th  >拟参观项目名称</th>
                <th >项目所在城市</th>
                <th  >拟参观时间</th>
            </tr>
            </thead>
            <tbody>
            <volist name="datas" id="item">
                <tr class="text-c">
                    <td>{$i}</td>
                    <td>{$item.organize}</td>
                    <td>{$item.name}</td>
                    <td>{$item.tel}</td>
                    <td>{$item.mail}</td>
                    <td>{$item.project}</td>
                    <td>{$item.city}</td>
                    <td>{$item.times}</td>
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
//            if ($('#organize').val() == "来访机构") {
//                $('#organize').val('');
//            }
//            if ($('#name').val() == "来访者姓名") {
//                $('#name').val('');
//            }
//            if ($('#tel').val() == "联系电话") {
//                $('#tel').val('');
//            }
//        }
        function export_csv() {

            document.searchform.action="/1fd3ab97ee/statistics/investvisit/export";
            searchform.submit();

        }
        $(function () {

            if ($('#organize').val() == "来访机构") {
                $('#organize').val('');
            }
            if ($('#name').val() == "来访者姓名") {
                $('#name').val('');
            }
            if ($('#tel').val() == "联系电话") {
                $('#tel').val('');
            }

            var organize = "";
            var name = "";
            var tel = "";

            if ($('#organize').val() != "来访机构") {
                organize = $('#organize').val();
            }
            if ($('#name').val() != "来访者姓名") {
                name = $('#name').val();
            }
            if ($('#tel').val() != "联系电话") {
                tel = $('#tel').val();
            }

            /*  分页 */
            var param = '&begin_date=' + '{$Think.get.begin_date}' + '&end_date=' + '{$Think.get.end_date}'
                    + '&organize=' + organize + '&name=' + name + '&tel=' + tel;
            var page_size = '<php> echo empty($pager -> totalPages) ? 1 : $pager -> totalPages; </php>';
            if (page_size > 1) {
                PAGER.create(page_size, param);
            }
        });
    </script>
</block>