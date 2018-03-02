<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/enter/enter-history-detail.css">
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public/js/lib/page.js"></script>
</block>
<block name="title">详情-雅居乐集团</block>

<block name="body_main">
    <div class="section-s section1">
        <div class="content container">
            <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                    href="/enter/index?level_id=1000000123">走进雅居乐</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<a href="/enter/history?level_id=1000000140">发展历程</a></span>&nbsp;&nbsp; > &nbsp;&nbsp;<span>详情</span></p>
            <h2>发展历程</h2>


        </div>
    </div>
    <div class="sections">
        <div class="section">
            <div class="content container" >
                <div class="title"><span>{$notice[0].tags}</span></div>
                <div class="word">
                    <ul>
                        <volist name="notice" id="item">
                            <li>
                                <span class="icon left"></span>
                                <span class="text">{$item.name}</span>
                            </li>
                        </volist>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="pages" style="padding-bottom: 100px;">
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
        $(function () {
            $(".header .nav li").eq(1).addClass("active").siblings().removeClass("active");


            var total = JSON.parse('<php>echo json_encode($total)</php>');
            var sections = $(".sections");
            var data = {pg: 1};

            $(".pages .next").click(function () {
                if (data.pg >= total) {
                    return
                }
                MyToll.toTop();

                data.pg++;
                PostAjax();
            });

            $(".pages .prev").click(function () {
                if (data.pg <= 1) {
                    return
                }
                MyToll.toTop();
                data.pg--;
                PostAjax();
            });

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
            newClass();
            function newClass() {
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

                            var section = $("<div class='section'></div>")
                            var content = $("<div></div>").addClass("content container").appendTo(section);
                            var title = $("<div></div>").addClass("title").appendTo(content);
                            var span = $("<span></span>").text(res.item[0].tags).appendTo(title);
                            var word = $("<div></div>").addClass("word").appendTo(content);
                            var ul = $("<ul></ul>").appendTo(word);
                            for (var j = 0; j < res.item.length; j++) {
                                var li = $("<li></li>").appendTo(ul);
                                var icon = $("<span></span>").addClass("icon left").appendTo(li);
                                var text = $("<span class='text'>" + res.item[j].name + "</span>").appendTo(li);
                            }
                            section.appendTo(sections);


                        newClass();
                    }
                })
            }

        })
    </script>
</block>

