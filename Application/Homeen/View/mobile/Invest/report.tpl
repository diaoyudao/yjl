<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/invest/invest-report.css">
</block>
<block name="head_common2">
</block>
<block name="title">Financial Reports / ESG Reports-Agile Group</block>

<block name="head_menu">
    <a class="tip" href="#" style="font-size: 12px">Financial Reports / ESG Reports/</a>
</block>

<block name="body_main">
    <div class=" txt-center container notice-bg  pt-20 pb-30 bg-c">
        <h2 class="txt-center f-16 pt-10 pb-10">Annual Reports / Interim Reports</h2>
        <div class="option">
            <div id="date">
                <span class="text">Select Years</span>
                <select>

                    <option>All</option>
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
                            Download
                        </a>
                    </div>
                </li>
            </volist>
        </ul>
        <div class="clear"></div>
        <div id="next" class=" mt-20 main-btn">
               More
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
                if('All' == data.year) {
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
                            var a=$("<a style='color:#fff;' onclick='down_file(\"" + res.datas[i].url + "\")' >Download</a>").appendTo(div);
                            li.appendTo(ul);
                        }
                        $("<div class='clear'></div>").appendTo(ul);


                        total_count = res.total_page;

                        gradeChangeNew()

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