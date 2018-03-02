<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/enter/enter-history.css">
</block>
<block name="title">发展历程-雅居乐集团</block>

<block name="body_main">
    <div class="section1">
        <div class="pic-box">
            <img src="{$head_images[0]['image_url1']}" traditional_image="{$head_images[0]['image_url2']}"
                 simplified_image="{$head_images[0]['image_url1']}" alt="" class="pic">
        </div>
    </div>
    <div class="content container">
        <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                href="/enter/index?level_id=1000000123">走进雅居乐</a></span>&nbsp;&nbsp;
            > &nbsp;&nbsp;<span>发展历程</span></p>
        <h2>发展历程</h2>
        <div>
            <span class="title">集团发展历程</span>
        </div>


        <div class="box">

            <ul>
                <volist name="notice" id="item">
                    <li class="r">
                        <span class="tags">{$item[0].tags}</span>
                        <volist name="item" id="ite">
                            <p title="{$ite.name}"> {$ite.name}</p>
                        </volist>
                            <span class="circle">
                             <img src="/public/img/home/enter/history/history_circle.jpg" alt="">
                             <img src="/public/img/home/enter/history/history_circle1.jpg" alt="" style="display: none">
                        </span>
                    </li>
                </volist>
                <div class="clear"></div>

            </ul>
            <div style="clear: both;height: 0"></div>
            <a onclick="addTags()" class="pull" style="cursor: pointer"><img
                    src="/public/img/home/enter/history/history_pull.png"
                    alt=""></a>
        </div>
    </div>
</block>

<block name="footer_js">
    <script>
        var data = {
            pg: 2,
        }
        var ul;
        var clear=$(".content .box ul .clear");

        $(function () {
            $(".header .nav li").eq(1).addClass("active").siblings().removeClass("active");

            $(".content .box li:nth-child(2n)").addClass("l").removeClass("r");

            $('.content .box li').mouseover(function () {
                $(this).find("span img").eq(1).show().siblings().hide();
                $(this).find("span").addClass("active").parents("li").siblings("li").find("span").removeClass("active");
            })

            $('.content .box li').mouseout(function () {
                $(this).find("span img").eq(1).hide().siblings().show();
                $(this).find("span").removeClass("active");
            })

            $(".content .box li:last").addClass("last");

            listClick();

        });


        function addTags() {

            K.doAjax(data, window.document.location.href, function (res) {
                ul = $(".content .box ul");
                for (var i = 0; i < res.notice.length; i++) {
                    var li = $("<li class='r'></li>");
                    var span = $("<span class='tags'>" + res.notice[i][0].tags + "</span>");
                    li.append(span);
                    var circle = $('<span class="circle"><img src="/public/img/home/enter/history/history_circle.jpg" alt=""><img src="/public/img/home/enter/history/history_circle1.jpg" alt="" style="display: none"></span>');

                    li.append(circle);

                    for (var j = 0; j <res.notice[i].length; j++) {
                    var p = $("<p>" + res.notice[i][j].name + "</p>");
                        li.append(p);
                    }

                    gradeChangeNew();
                    clear.before(li);
                }
                listClick();
                $(".content .box li").removeClass("last");
                $(".content .box li:last").addClass("last");
                $(".content .box li:nth-child(2n)").addClass("l").removeClass("r");
//                绑定事件
                $('.content .box li').mouseover(function () {
                    $(this).find("span img").eq(1).show().siblings().hide();
                    $(this).find("span").addClass("active").parents("li").siblings("li").find("span").removeClass("active");
                });
                $('.content .box li').mouseout(function () {
                    $(this).find("span img").eq(1).hide().siblings().show();
                    $(this).find("span").removeClass("active");
                })

                if(res.total_pages==data.pg){
                    $(".content .box .pull").hide();
                    $(".content .box li:last").addClass("end");
                    return;
                }
                data.pg++;
            })
        }

        function listClick(){
            $(".content .box li").click(function () {
                var data = {
                    year: $(this).find(".tags").text()
                }
                location.href = "/enter/historydetail?year=" + data.year;
            })
        }
    </script>
</block>