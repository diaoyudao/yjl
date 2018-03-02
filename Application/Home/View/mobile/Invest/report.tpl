<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/invest/invest-report.css">
</block>
<block name="head_common2">
</block>
<block name="title">财务报表 / 环境、社会及管治报告列表-雅居乐集团</block>

<block name="head_menu">
    <a class="tip" href="#" style="font-size: 9px;">财务报表 / 环境、社会及管治报告列表/</a>
</block>

<block name="body_main">
    <div class=" txt-center container notice-bg  pt-20 pb-30 bg-c">
        <h2 class="txt-center f-20 pt-10 pb-10">财务报表 / 环境、社会及管治报告列表</h2>
        <div class="option">
            <div id="date">
                <span class="text">请选择年份</span>
                <select>

                    <option>全部</option>
                    <volist name="years" id="item">
                        <option>{$item.tags}</option>
                    </volist>
                </select>
            </div>
        </div>

    </div>
    <div class=" txt-center container notice-bg  pt-20 pb-30 bg-c">
        <ul class="list">
            <volist name="datas" id="item">
                <li>
                    <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                         simplified_image="{$item.image_url1}" class="img">
                    <p class="reportTip">{$item.title}</p>
                    <div class="row cl  reportBtn">
                        <a onclick="down_file('{$item.url}')" style="color:#fff;">
                            下载
                        </a>
                    </div>
                </li>
            </volist>
        </ul>
        <div class="clear"></div>
        <div id="next" class=" mt-20 main-btn">
                查看更多

        </div>

    </div>
</block>

<block name="footer_js">
    <script>
        $(document).ready(function () {

            var ul=$(".list");
            var page=1;
            var total_count = {$total_page};
            var data={
                level_id: {$Think.get.level_id},
                pg : page,
                year :"",
            };

            if(1 == total_count) {
                $("#next").hide();
            }

            $("#date select").change(function () {
                data.pg = 1;
                var value = $("#date option:selected").text();
                $("#date .text").text(value);
                data.year=$("#date .text").text();
                if('全部' == data.year) {
                    data.year = '';
                }

                ul.empty();
                $("#next").show();

                ajaxPage();

            });


            function ajaxPage() {
                K.doAjax(data, window.document.location.href, function (res) {
                    if (res.status && res.status == 'ok') {
                        for (var i = 0; i < res.datas.length; i++) {
                            var li = $("<li></li>");
                            var img = $("<img src='"+res.datas[i].image_url1+"' traditional_image='" + res.datas[i].image_url2 + "'" +
                                    " simplified_image = '" + res.datas[i].image_url1 + "' class='img'/>").appendTo(li);
                            var p = $("<p class='reportTip'></p>").text(res.datas[i].title).appendTo(li);
                            var div=$('<div class="row cl  reportBtn"></div>').appendTo(li);
                            var a=$("<a style='color:#fff;' onclick='down_file(\"" + res.datas[i].url + "\")' >下载</a>").appendTo(div);
                            li.appendTo(ul);
                        }
                        $("<div class='clear'></div>").appendTo(ul);


                        total_count = res.total_page;

                        gradeChangeNew();

                        if (data.pg >= total_count) {
                             $("#next").hide();
                        }

                    }
                });
            }
            $("#next").click(function () {
                
                data.pg++;
                ajaxPage();
            });


        });
        function down_file(file) {
            var $file = encodeURI(file);
            //alert($file);

            window.open($file);

            return;
        }


    </script>
</block>