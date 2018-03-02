<extend name="./Application/Home/View/default/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/news/news-group.css">
</block>
<block name="head_common2">
    <script src="/public/js/lib/jquery.masonry.min.js"></script>
</block>
<block name="title">楼盘速递-雅居乐集团</block>
<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                    href="/business/index?level_id=1000000123">多元业务</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span><a href="/business/estate?level_id=1000000128">地产</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<span>楼盘速递</span>
            <h2>楼盘速递</h2>
            <div id="select" class="select">
                <div class="nav">
                    请选择年份
                </div>
                <ul class="items">
                    <li >全部</li>
                    <volist name="years" id="item">
                        <li>{$item}</li>
                    </volist>
                </ul>
            </div>
            <div >
                <ul id="lists">
                    <li class="pitch-on"><a>全部</a></li>
                    <volist name="months" id="item">
                        <li id="{$key}"><a >{$item}</a></li>
                    </volist>
                    <div class="clear"></div>

                </ul>
            </div>


            <div class="box" style="margin-top: 45px;">
                <div class="waterfull clearfloat" id="waterfull">
                    <ul id="news-lists">
                        <volist name="notices" id="item" offset="0" length="12">
                        <li class="item">
                            <a href="/news/detail?id={$item.notice_id}" class="a-img" target='_blank'>
                                <notempty name="item.image_url1">
                                    <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                         simplified_image="{$item.image_url1}" alt="">
                                </notempty>
                            </a>
                            <!--<if condition=" 1 == $item['stick'] && 0 == $key">
                                <span class="news">头条<br><span style="font-size: 15px;">news</span></span>
                            </if>-->
                            <h4 class="li-title" title=""><a href="/news/detail?id={$item.notice_id}" target='_blank'>{$item.name}</a>
                            </h4>
                            <div class="description">{$item.desc}</div>
                            <div class="more"><a href="/news/detail?id={$item.notice_id}" target='_blank'>了解详情 <span class="icon"></span></a></div>
                        </li>
                        </volist>

                    </ul>
                </div>
            </div>
            <img src="/public/img/home/common/loading.gif" alt="" id="imloading">
        </div>
    </div>
</block>
<block name="footer_js">
    <script  type="text/javascript">
        $(function(){
            $(".header .nav li").eq(2).addClass("active").siblings().removeClass("active");
            $(".listItem li:nth-child(3n-2)").addClass("fir");
            var id="select";
            var year=$('.select .items li');
            select(id);
            var head_text;
            var get_year='{$Think.get.year}';
            year.each(function(i){
                if($(this).html()== get_year)
                {
                    $(this).addClass('active');
                }
            });

            head_text=$("#select .items .active").html();
            if(head_text) $("#select .nav").text(head_text);

            var list=$('#lists  li');
            var get_id='{$Think.get.id}';
            list.each(function(i){
                if($(this).attr("id")== get_id)
                {
                    $(this).addClass('pitch-on').siblings().removeClass("pitch-on");

                }
            });
            var list_val=$('.pitch-on').attr('id');
            var total_pages = -1;
            var data = {
                pg: 3,
                year:head_text,
                id:list_val,
            };

            var isStart = false;
            var isload=false;
            var length;
            var count=0;

            var container = $('.waterfull ul');

            $(window).scroll(function () {
                if (isStart) {
                    return;
                }
                /*
                 if ($(document).scrollTop() > (data.pg - 2) * 1000) {
                 isStart = true;
                 pageAjax();
                 }
                 */

                if(1 < initPages) {

                    var scroll_h = $(document).scrollTop();
                    var lists_h = $('#news-lists').height();

                    /*
                     */
                    if((0 > total_pages || total_pages >= data.pg) && !isStart && 1000 > lists_h-scroll_h &&isload) {
                        isStart = true;
                        pageAjax();
                    }
                }
            });


            function tores() {
                var tmpWid = $(window).width();
                if (tmpWid > 1000) {
                    tmpWid = 1000;
                } else {
                    var column = Math.floor(tmpWid / 320);
                    tmpWid = column * 320;
                }
                $('.waterfull').width(tmpWid);
            }

            //tores();
            $(window).resize(function () {
                //tores();
            });

            container.imagesLoaded(function () {
                container.masonry({
                    columnWidth: 333,
                    itemSelector: '.item',
                    isFitWidth: true,//是否根据浏览器窗口大小自动适应默认false
                    isAnimated: false,//是否采用jquery动画进行重拍版
                    isRTL: false,//设置布局的排列方式，即：定位砖
                    animationOptions: {
                        duration: 800,
                        easing: 'easeInOutBack',//如果你引用了jQeasing这里就可以添加对应的动态动画效果，如果没引用删除这行，默认是匀速变化
                        queue: false//是否队列，从一点填充瀑布流
                    }
                });
            });
            imageLoad();


            function pageAjax() {
                $("#imloading").show();
                K.doAjax(data, window.document.location.href, function (res) {
                    var html = "";
                    dataEnd();
                    total_pages = res.total_pages;
                    initPages=res.total_pages;
//                    if (res.notices.length == 0) {
//                        isStart = false;
//                        return;
//                    }
                    if( null != total_pages ){

                        if(1== data.pg){
                            $('#news-lists').empty();
                            container.masonry('reload');
                            data.pg=2;
                        }

                        for (var i = 0; i < res.notices.length; i++) {
                            html += "<li class='item'>";
                            if (res.notices[i].image_url1) {
                                html += "<a href='/news/detail?id=" + res.notices[i].notice_id + "' class='a-img' target='_blank'>" +
                                        "<img src='" + res.notices[i].image_url1 + "' traditional_image='" + res.notices[i].image_url2 + "' " +
                                        "simplified_image = '" + res.notices[i].image_url1 + "' /></a> ";
                            }

                            html += "<h4 class='li-title'><a target='_blank' href='/news/detail?id=" + res.notices[i].notice_id + "'>" + res.notices[i].name + "</a></h4>";
                            html += "<div class='description'>" + res.notices[i].desc + "</div>";
                            html += '<div class="more"><a href="/news/detail?id='+ res.notices[i].notice_id +'" target="_blank">了解详情 <span class="icon"></span></a></div>';
                        }
//                        }

                        $(html).find('img').each(function (index) {
                            loadImage($(this).attr('src'));
                        });
                        var $newElems = $(html).appendTo(container);
                        $newElems.imagesLoaded(function () {
                            container.masonry('appended', $newElems, true);
                        });
                        data.pg++;
                        isStart = false;
                        gradeChangeNew()
                    }else {
                        $('#news-lists').empty();
                        container.masonry('reload');
                    }

                })
        }

            function loadImage(url) {
                var img = new Image();
                img.src = url;
                if (img.complete) {
                    return img.src;
                }
                img.onload = function () {
                    return img.src;
                };
            };

            function dataEnd() {
                $("#imloading").hide();
            }
            function imageLoad() {
                length=$("#news-lists li").length;
                $("#news-lists li").each(function () {
                    if($(this).find("img").length<1){
                        count++;
                    }
                    $(this).find("img").on("load",function () {
                        count++;
                        if(length==count){
                            isload=true;
                        }
                    })
                    if($(this).find("img").complete){
                        count++;
                        if(length==count){
                            isload=true;
                        }
                    }
                })
            }

            $("#select li").click(function(){
                data.pg = 1;
                data.year=$(this).text();
                if('全部' == data.year) {
                    data.year = '';
                }

                pageAjax();
            });

            $("#lists li ").click(function(){
                data.pg = 1;
                data.id=$(this).attr("id");
                $(this).addClass("pitch-on").siblings().removeClass("pitch-on");

                if('全部' == data.id) {
                    data.id = '';
                }

                pageAjax();
            });
        });


        var initPages = '{$total_pages}';

        //        if(!initPages ){
//            $('#news-lists').empty();
////            container.masonry('reload');
//        }
    </script>
</block>