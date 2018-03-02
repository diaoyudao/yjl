<extend name="./Application/Homeen/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/invest/invest-report.css">
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public_en/js/lib/page.js"></script>
</block>
<block name="title">Financial Reports / ESG Reports-Agile Group</block>

<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a href="/en/invest/index?level_id=1000000136">Investor Relations</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span>Financial Reports / ESG Reports</span></p>
            <h2>Financial Reports / ESG Reports</h2>

            <div id="select" class="select">
                <div class="nav">Select Years</div>
                <ul class="items">
                    <li >All</li>
                    <foreach name="years" item="item">
                    <li >{$item.tags}</li>
                    </foreach>
                </ul>
            </div>
            <div class="listItem">
                <ul class="items">
                    <volist name="datas" id="item">
                    <li>
                        <img src="{$item.image_url1}" alt="">
                        <div class="box">
                            <p>{$item.title}</p>
                            <a class="btn-more" onclick="down_file('{$item.url}')" >Download</a>
                        </div>
                    </li>
                    </volist>
                    <div class="clear"></div>
                </ul>
            </div>
            <div class="btn-list">
                <div class="box">
                    <ul></ul>
                    <span class="prev"><img src="/public_en/img/home/common/btn_prev1.png" alt=""></span>
                    <span class="next"><img src="/public_en/img/home/common/btn_next1.png" alt=""></span>
                </div>
            </div>


        </div>
    </div>
</block>

<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(3).addClass("active").siblings().removeClass("active");
            $(".listItem li:nth-child(3n-2)").addClass("fir");
            var id="select";
            select(id);

            var ul=$(".section1 .listItem ul");
            var page=1;
            var total_count = {$total_page};
            var data={
                level_id: {$Think.get.level_id},
                pg : "",
                year :"",
            };

            data.pg=1;
            clickLi(data.pg, total_count);

            function ajaxPage() {
                K.doAjax(data, window.document.location.href, function (res) {
                    if (res.status && res.status == 'ok') {
                        ul.text("");
                        for (var i = 0; i < res.datas.length; i++) {
                            var li = $("<li></li>");
                            var img = $("<img/>").attr({src: res.datas[i].image_url1}).appendTo(li);
                            var box = $("<div class='box'></div>").appendTo(li);
                            var p = $("<p></p>").text(res.datas[i].title).appendTo(box);
                            var lins_str = "onclick='down_file(\'" + res.datas[i].url + "')" ;
                            var a=$("<a class='btn-more' onclick='down_file(\"" + res.datas[i].url + "\")' >Download</a>").appendTo(box);
                            li.appendTo(ul);
                        }
                        $("<div class='clear'></div>").appendTo(ul);


                        total_count = res.total_page;

                        clickLi(data.pg, total_count);

                        $(".listItem li:nth-child(3n-2)").addClass("fir");
                    }
                });
            }

            function clickLi(index, total) {
                $(".btn-list ul").html(showPages(index, total));
                $(".btn-list li").click(function () {
                    page = data.pg = parseInt($(this).text());

                    ajaxPage();
                })
            }

            $(".btn-list .next").click(function () {
                if (page >= total_count) {
                    return
                }
                page = data.pg = page + 1;
                ajaxPage()
            })

            $(".btn-list .prev").click(function () {
                if (page <= 1) {
                    return;
                }
                page = data.pg = page - 1;

                ajaxPage();
            })

            $("#select li").click(function(){
                data.pg = 1;
                data.year=$(this).text();
                if('All' == data.year) {
                    data.year = '';
                }

                ajaxPage();
            })
        });


        function down_file(file) {
            var $file = encodeURI(file);
            //alert($file);

            window.open($file);

            return;
        }


    </script>
</block>