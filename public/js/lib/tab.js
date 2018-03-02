$(function () {
    tabClick();
    function tabClick() {
        $(".section2 .item li").click(function () {
            var index = $(this).index();
            $(this).addClass("active").siblings().removeClass("active");
            $(".section2 .content .icon").eq(index).show().siblings(".icon").hide();
            $(".section2 .content .news-box").eq(index).show().siblings(".news-box").hide();
        }) ;
        $(".section1 .content .score a").click(function () {
            var index = $(this).index();
            $(this).addClass("active").siblings().removeClass("active");
            $(".section1 .content .icon").hide();
            $(".section1 .content .icon").eq(index).show();
            $(".section1 .content .form").eq(index).show().siblings(".form").hide();
        }) ;
    }
});

