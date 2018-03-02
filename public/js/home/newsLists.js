$(function () {

    var total_pages = -1;
    var data = {
        pg: 3,
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

            if (res.notices.length == 0) {
                isStart = false;
                return;
            }
            for (var i = 0; i < res.notices.length; i++) {
                html += "<li class='item'>";
                if (res.notices[i].image_url1) {
                    html += "<a href='/news/detail?id=" + res.notices[i].notice_id + "' class='a-img' target='_blank'>" +
                        "<img src='" + res.notices[i].image_url1 + "' traditional_image='" + res.notices[i].image_url2 + "' " +
                        "simplified_image = '" + res.notices[i].image_url1 + "' /></a> ";                        }
                html += "<h4 class='li-title'><a target='_blank' href='/news/detail?id=" + res.notices[i].notice_id + "'>" + res.notices[i].name + "</a></h4>";
                html += "<div class='description'>" + res.notices[i].desc + "</div>";
                html += '<div class="more"><a href="/news/detail?id='+ res.notices[i].notice_id +'" target="_blank">了解详情 <span class="icon"></span></a></div>';
            }
            $(html).find('img').each(function (index) {
                loadImage($(this).attr('src'));
            })
            var $newElems = $(html).appendTo(container);
            $newElems.imagesLoaded(function () {
                container.masonry('appended', $newElems, true);
            });
            data.pg++;
            isStart = false;
            gradeChangeNew()
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
});