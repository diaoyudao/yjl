<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/enter/enter-honor.css">
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public/js/lib/page.js"></script>
</block>
<block name="title">荣誉集锦-雅居乐集团</block>

<block name="body_main">
    <div class="section-s section1">
        <div class="content container">
            <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                    href="/enter/index?level_id=1000000123">走进雅居乐</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span>荣誉集锦</span></p>
            <h2>荣誉集锦</h2>

            <div id="select" class="select">
                <div class="nav">请选择年份</div>
                <ul class="items">
                    <li>全部</li>
                    <volist name="lists" id="item">
                        <li>{$item}</li>
                    </volist>

                </ul>
            </div>

        </div>
    </div>
    <div class="sections" id="sections">
        <volist name="notice" id="item">
            <div class="section">
                <div class="content container">
                    <div class="title">
                        <span>{$item[0].tags}</span>
                    </div>
                    <div class="word">
                        <ul>
                            <volist name="item" id="xx">
                                <li>
                                    <span class="icon left"></span>
                                    <span class="text">{$xx.name}</span>
                                    <notempty name="xx.link_url1">
                                <span class="news">
                                    <a href="{$xx['link_url1']}">新闻稿</a>
                                </span>
                                    </notempty>
                                </li>
                            </volist>
                        </ul>
                    </div>
                </div>
            </div>
        </volist>
    </div>



    <div class="pages">
        <div class="box-list">
            <ul>

            </ul>
            <span class="prev"><img src="/public/img/home/common/btn_prev1.png" alt=""></span>
            <span class="next"><img src="/public/img/home/common/btn_next1.png" alt=""></span>
        </div>

    </div>

</block>
<block name="footer_js">
    <script>
        var id = "select";
        select(id);
        $(function () {
            $(".header .nav li").eq(1).addClass("active").siblings().removeClass("active");
//            var notice = JSON.parse('<php>echo json_encode($notice)</php>');
            var total = JSON.parse('<php>echo json_encode($total)</php>');
            var sections = $(".sections");
            var data = {tags: null, pg: 1};
            var isall = true;
            $("#select .items li").click(function () {
                data.pg = 1;
                data.tags = $(this).text();
                isall = false;
                if ("全部" == data.tags) {
                    isall = true;
                    data.tags = "";
                }
                PostAjax();
            });


            $(".pages .next").click(function () {
                if (data.pg >= total) {
                    return
                }
                MyToll.toTop();

                data.pg++;
                PostAjax();
            })

            $(".pages .prev").click(function () {
                if (data.pg <= 1) {
                    return
                }
                MyToll.toTop();
                data.pg--;
                PostAjax();
            })

            clickLi(data.pg, total);
            newClass();


            function clickLi(index, total) {
                $(".pages ul").html(showPages(index, total));

                $(".pages li").click(function () {
                    MyToll.toTop();
                    data.pg = parseInt($(this).text());
                    PostAjax();
                    newClass();
                })
            }

            function newClass() {
                $(".section:nth-child(2n)").addClass("section-d");
                $(".section").find("li:last").addClass("last");
            }


            function PostAjax() {
                $.ajax({
                    url: window.document.location.href,
                    type: "post",
                    data: data,
                    success: function (res) {
                        sections.text("");
//                        $(".pages ul").html("");
//                        console.log(res);
                        total=res.total;
                        $(".pages ul").html(clickLi(data.pg,total));
                        for (var i in res.item) {
                            var section = $("<div class='section'></div>")
                            var content = $("<div></div>").addClass("content container").appendTo(section);
                            var title = $("<div></div>").addClass("title").appendTo(content);
                            var span = $("<span></span>").text(res.item[i][0].tags).appendTo(title);
                            var word = $("<div></div>").addClass("word").appendTo(content);
                            var ul = $("<ul></ul>").appendTo(word);
                            for (var j = 0; j < res.item[i].length; j++) {
                                var li = $("<li></li>").appendTo(ul);
                                var icon = $("<span></span>").addClass("icon left").appendTo(li);
                                var text = $("<span class='text'>" + res.item[i][j].name + "</span>").appendTo(li);
                                if (res.item[i][j].link_url1) {
                                    var news = $("<span></span>").addClass("news").appendTo(li);
                                    var a = $("<a href=" + res.item[i][j].link_url1 + ">新闻稿</a>").appendTo(news)
                                }
                            }
                            section.appendTo(sections);
                            gradeChangeNew();
                        }
                        if (isall) {
                            clickLi(data.pg, total);
                            newClass();
                            return;
                        }
                        newClass();

                    }
                })
            }


        })
    </script>
</block>

