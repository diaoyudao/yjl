var acImageText = {
    init : function(datas) {
        var $ul, $li, $img;
        var $photo = $("#image-lists").find('.photo').eq(0);
        //1.图片列表加载
        $ul = $("<ul/>").appendTo($(".warp"));
        $.each(datas, function (i, obj) {
            $li = $("<li/>").appendTo($ul);
            $img = $("<img/>").data('notice_id', obj.notice_id).attr("src", obj.thumbnail_url1).appendTo($li);
        });
        $ul.width(datas.length * 174);

        //3.鼠标移动
        //3.1鼠标在图片列表上
        $ul.children().mouseover(function () {
            $(this).addClass("active");
            $(this).siblings().removeClass("active");
            index = $(this).index();

            var $img = $(this).children(":first");
            $photo.css({backgroundImage:"url("+datas[index].image_url1+")",filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+datas[index].image_url1+"', sizingMethod='scale')"});
            $photo.data("src", $img.data("image"));
            $photo.parent().attr('href', '/news/detail?id=' + datas[index].notice_id);

            // 数据
            $('#develop-title').text(datas[index].name);
            $('#develop-title').attr('href', '/news/detail?id=' + datas[index].notice_id);
            //$('#image-context').find('.title').eq(0).text(datas[index].name);
            $('#image-context').find('p').eq(0).text(datas[index].desc);

        });

        //初始显示图片
        $ul.children().first().mouseover();
        $('#develop-title').text(datas[index].name);
        $('#develop-title').attr('href', '/news/detail?id=' + datas[index].notice_id);

        acImageText.navigation(datas);
    },

     navigation : function(datas) {
        var $prev = $(".prev");
        var $next = $(".next");
        var $warp = $(".warp");
        var $ul = $warp.find("ul");
        var ableWidth = $ul.width() - $warp.width();
        var imgWidth;

        function getScrollLeft(dir) {
            imgWidth = imgWidth || $warp.find("img:first").outerWidth();
            if (dir == "left") {
                return $warp.scrollLeft() + imgWidth;
            } else {
                return $warp.scrollLeft() - imgWidth;
            }
        }

        $next.click(function () {
            var $photo = $("#image-lists").find('.photo').eq(0);
            if(index>5){
                return;
            }
            $ul.children("li").removeClass("active");
            $ul.children().eq(++index).addClass("active");
            $photo.css({backgroundImage:"url("+datas[index].image_url1+")",filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+datas[index].image_url1+"', sizingMethod='scale')"});
            $photo.parent().attr('href', '/news/detail?id=' + datas[index].notice_id);
            // 数据
            $('#develop-title').text(datas[index].name);
            $('#develop-title').attr('href', '/news/detail?id=' + datas[index].notice_id);
            // $('#image-context').find('.title').eq(0).text(datas[index].name);
            $('#image-context').find('p').eq(0).text(datas[index].desc);
            var left = getScrollLeft("left");
            if (left <= ableWidth) {
                $warp.scrollLeft(left);
            }

        }).hover(function () {
            if (getScrollLeft("left") <= ableWidth) {
                $(this).addClass("hover");
            }
        }, function () {
            $(this).removeClass("hover");
        });

        $prev.click(function () {
            var $photo = $("#image-lists").find('.photo').eq(0);
            if(index<1){return;}
            $ul.children("li").removeClass("active");
            $ul.children().eq(--index).addClass("active");

            $photo.css({backgroundImage:"url("+datas[index].image_url1+")",filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+datas[index].image_url1+"', sizingMethod='scale')"});
            $photo.parent().attr('href', '/news/detail?id=' + datas[index].notice_id);
            // 数据
            $('#develop-title').text(datas[index].name);
            $('#develop-title').attr('href', '/news/detail?id=' + datas[index].notice_id);
            // $('#image-context').find('.title').eq(0).text(datas[index].name);
            $('#image-context').find('p').eq(0).text(datas[index].desc);
            var left = getScrollLeft();
            if (left >= 0) {
                $warp.scrollLeft(left);

            }
        }).hover(function () {
            if (getScrollLeft() >= 0) {
                $(this).addClass("hover");
            }
        }, function () {
            $(this).removeClass("hover");
        });
    }


};


