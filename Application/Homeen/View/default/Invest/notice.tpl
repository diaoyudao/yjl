<extend name="./Application/Homeen/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/invest/invest-notice.css">
</block>
<block name="head_common2">
    <script src="/public_en/js/lib/page.js"></script>
</block>
<block name="title">Announcement-Agile Group</block>

<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                    href="/en/invest/index?level_id=1000000136"> Investor Relations</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span>Announcements</span></p>
            <h2>Announcement</h2>
            <div class="select" id="select">
                <div class="nav">Select Years</div>
                <ul class="items">
                    <li>All</li>
                    <volist name="lists" id="item">
                        <li>{$item}</li>
                    </volist>
                </ul>
            </div>
        </div>
    </div>
    <div style="padding-bottom: 150px;position: relative;">
        <div class="sections">
            <volist name="notice" id="item">
                <div class="section">
                    <div class="content container">
                        <div class="title">
                            <span>{$item[0].tags}</span>
                        </div>
                        <div class="word">
                            <ul >
                                <volist name="item" id="xx">
                                    <li >
                                        <span class="icon"></span>
                                        <span class="l-title" title="{$xx['title']}">
                                            {$xx['title']}

                                        </span>
                                        <notempty name="xx.url">
                                <a class="news" onclick="down_file('{$xx.url}')">
                                    Download
                                </a>
                                        </notempty>
                                        <span class="time"><php>echo date('m/d/Y',strtotime($xx['begin_time']))</php></span>
                                    </li>
                                </volist>
                            </ul>
                        </div>
                    </div>
                </div>
            </volist>
        </div>
        <div class="btn-list">
            <div class="box">
                <ul></ul>
                <span class="prev"><img src="/public_en/img/home/common/btn_prev1.png" alt=""></span>
                <span class="next"><img src="/public_en/img/home/common/btn_next1.png" alt=""></span>
            </div>
        </div>
    </div>

    <!--<div class="pages">-->
    <!--<div class="box-list">-->
    <!--<ul>-->

    <!--</ul>-->
    <!--<span class="prev"><img src="/public_en/img/home/invest/prev.png" alt=""></span>-->
    <!--<span class="next"><img src="/public_en/img/home/invest/next.png" alt=""></span>-->
    <!--</div>-->

    <!--</div>-->

</block>
<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(3).addClass("active").siblings().removeClass("active");
            var id = "select";
            select(id);
//            var notice = JSON.parse('<php>echo json_encode($notice)</php>');
            var total = JSON.parse('<php>echo json_encode($total)</php>');
            var sections = $(".sections");
            var data = {tags: null, pg: 1};

            $("#select .items li").click(function () {
                data.pg = 1;
                data.tags = $(this).text();
                if ("All" == data.tags) {
                    data.tags = "";
                }
                PostAjax();
            });
                function PostAjax() {
                    $.ajax({
                        url: window.document.location.href,
                        type: "post",
                        data: data,
                        success: function (res) {
//                            if (!data.tags) {
//                                sections.text("");
////                            $(".btn-list").html("");
//                                notice = res.item;
//                                page = 1;
//                                total = res.total;
//                                showNews(page);
//                                var content = $("<div class='box'><ul></ul><span class='prev'><img src='/public_en/img/home/common/btn_prev1.png' alt=''></span><span class='next'><img src='/public_en/img/home/common/btn_next1.png' alt=''></span></div>")
//                                $(".btn-list").append(content);
////                            clickLi(page, total);
//                                $(".btn-list").html(clickLi(data.pg, total));
//                                newClass();
//                                return;
//                            }
                            sections.text("");
//                            $(".btn-list").html("");
                            total = res.total;
                            $(".btn-list").html(clickLi(data.pg, total));
                            for (var i in res.item) {
                                var section = $("<div class='section'></div>")
                                var content = $("<div></div>").addClass("content container").appendTo(section);
                                var title = $("<div></div>").addClass("title").appendTo(content);
                                var span = $("<span ></span>").text(res.item[i][0].tags).appendTo(title);
                                var word = $("<div></div>").addClass("word").appendTo(content);
                                var ul = $("<ul></ul>").appendTo(word);
                                for (var j = 0; j < res.item[i].length; j++) {
                                    var li = $("<li></li>").appendTo(ul);
                                    var icon = $("<span></span>").addClass("icon").appendTo(li);
//                                    var a = $("<span  title='"+res.item[i][j].title+"'></span>").text(res.item[i][j].title.substring(0,40)).appendTo(li);
                                    var a = $("<span class='l-title' title='"+res.item[i][j].title+"'></span>").text(res.item[i][j].title).appendTo(li);
                                    var news = $("<a class='news' onclick='down_file(\"" + res.item[i][j].url + "\")' ></a>").text("Download").addClass("news").appendTo(li);
                                    var time = $("<span class='time'></span>").text( K.getDateEnglishFormat(res.item[i][j].begin_time)).appendTo(li);
                                }
                                section.appendTo(sections);
                            }
                            newClass()

                            gradeChange()

                        }
                    })
                }

            clickLi(data.pg, total);
            newClass();
            $(".btn-list .prev").click(function () {
                if (data.pg <= 1) {
                    return;
                }
                data.pg--;
                PostAjax();
                newClass();
            });
            $(".btn-list .next").click(function () {
                if (data.pg >= total) {
                    return;
                }
                data.pg++;
                PostAjax();
                newClass();
            });


            function clickLi(index, total) {
                $(".btn-list ul").html(showPages(index, total));
                $(".btn-list li").click(function () {
                    data.pg = parseInt($(this).text());
                    PostAjax();
                    newClass();
                });
            }

            function newClass() {
                $(".section:nth-child(2n)").addClass("section2");
                $(".section").find("li:last").addClass("last");
            }
        });

function down_file(file) {
            var $file = encodeURI(file);
            //alert($file);

            window.open($file);

            return;
        }

    </script>
</block>