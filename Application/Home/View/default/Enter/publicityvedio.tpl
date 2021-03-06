<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/enter/enter-publicity-vedio.css">
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public/js/lib/page.js"></script>
</block>
<block name="title">视频中心-雅居乐集团</block>

<block name="body_main">
    <div class="section-s section1">
        <div class="content container">
            <p class="nav-p"><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                    href="/enter/index?level_id=1000000123">走进雅居乐</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<a href="/enter/publicity?level_id=1000000137">企业宣传</a></span>&nbsp;&nbsp; >
                &nbsp;&nbsp;<span>视频中心</span></p>
            <h2>视频中心</h2>


        </div>
    </div>
    <div class="sections" style="position: relative;padding-bottom: 165px;">
        <div class="section">
            <div class="content container">
                <ul class="vedio-list">
                    <volist name="media" id="item">
                        <li>
                            <a href='/enter/publicityvediodetail?video_id={$item.video_id}'>
                                <img src='{$item.image_url1}' alt='' simplified_image='{$item.image_url1}'
                                     traditional_image='{$item.image_url2}' style='width:320px;height:275px' ;>
                            </a>
                            <p class='title'>
                                <a href='/enter/publicityvediodetail?video_id={$item.video_id}'>{$item.title}</a>
                            </p>时长: <span>{$item.duration}分钟</span>
                        </li>
                    </volist>
                </ul>
            </div>
            <div class="btn-list">
                <div class="box">
                    <ul></ul>
                    <span class="prev"><img src="/public/img/home/common/btn_prev1.png" alt=""></span>
                    <span class="next"><img src="/public/img/home/common/btn_next1.png" alt=""></span>
                </div>
            </div>
        </div>
    </div>
    </div>

</block>
<block name="footer_js">
    <script>
        $(function () {
            $(".header .nav li").eq(1).addClass("active").siblings().removeClass("active");
            $(".sections .vedio-list li:nth-child(3n-2)").addClass("fir");
            var notice = JSON.parse('<php>echo json_encode($media)</php>');
            var total = JSON.parse('<php>echo json_encode($total)</php>');
            var data = {
                pg: 1,
            }
            var ul = $(".sections .vedio-list");
            //11

            clickLi(data.pg, total);

            function ajaxPage() {

                K.doAjax(data, window.document.location.href, function (res) {
                    if (res.status && res.status == 'ok') {
                        total = res.total_pages;
                        ul.text("");
                        if (res.media == null) {
                            $(".btn-list ul").html("");
                            return;
                        }
                        for (var i = 0; i < res.media.length; i++) {
                            var li = $("<li><a href='/enter/publicityvediodetail?video_id=" + res.media[i].video_id + "'><img src='" + res.media[i].image_url1 + "' alt='' simplified_image='" + res.media[i].image_url1 + "'  traditional_image='" + res.media[i].image_url2 + "' style='width:320px;height:275px';></a>" +
                                    "<p class='title'><a href='/enter/publicityvediodetail?video_id=" + res.media[i].video_id + "'>" + res.media[i].title + "</a></p>时长: <span>" + res.media[i].duration + "分钟</span></li>")
                            li.appendTo(ul);
                        }
                        clickLi(data.pg, total);
                        $(".sections .vedio-list li:nth-child(3n-2)").addClass("fir");
                    } else {
                    }
                });
            }


            function clickLi(index, total) {
                $(".btn-list ul").html(showPages(index, total));
                $(".btn-list li").click(function () {
                    data.pg = parseInt($(this).text());

                    ajaxPage();
                })
            }

            $(".btn-list .next").click(function () {
                if (data.pg >= total) {
                    return
                }
                data.pg++;
                ajaxPage()
            })

            $(".btn-list .prev").click(function () {
                if (data.pg <= 1) {
                    return
                }
                data.pg--;
                ajaxPage()
            })

        })
    </script>
</block>

