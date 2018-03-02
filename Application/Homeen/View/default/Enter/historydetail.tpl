<extend name="./Application/Homeen/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/enter/enter-history-detail.css">
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public_en/js/lib/page.js"></script>
</block>
<block name="title">Details-Agile Group</block>

<block name="body_main">
    <div class="section-s section1">
        <div class="content container">
            <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                    href="/en/enter/index?level_id=1000000123">A Glance at Agile</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<a href="/en/enter/history?level_id=1000000140">Milestones</a></span>&nbsp;&nbsp; > &nbsp;&nbsp;<span>Details</span></p>
            <h2>Milestones</h2>


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
            <span class="prev"><img src="/public_en/img/home/common/btn_prev1.png" alt=""></span>
            <span class="next"><img src="/public_en/img/home/common/btn_next1.png" alt=""></span>
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

