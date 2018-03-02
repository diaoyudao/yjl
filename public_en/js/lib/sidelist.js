/**
 * Created by Administrator on 2016/12/20.
 */
var SideXinT,SideXinTE;
var SideList = {
    top: function (top, bottom) {
        $(window).scroll(function () {
            if ($(window).scrollTop() > top) {
                return;
            } else {
                $(".side-list").css({top: top - $(window).scrollTop() + 250});
            }
        })
        if ($(window).scrollTop() > top) {
            $(".side-list").css({top: 250});
        } else {
            $(".side-list").css({top: top + 250});
        }
    },
    tel: function () {
        var width = $(".side-tel .tel-box").width() + 30;
        $(".side-tel .tel-box").css({width: 0, left: 0, display: "none"});
        $(".side-list .side-tel").hover(function () {
            $(".side-tel .tel-box").show().stop().animate({width: width, left: -width}, 300);
        },function () {
            $(".side-tel .tel-box").stop().animate({width: 0, left: 0}, 300, function () {
                $(this).hide();
            })
        })
        // $(".side-list .side-tel").mouseover(function () {
        // });
        // $(".side-list .side-tel").mouseout(function () {
        //
        // })
    },
    email: function () {
        var width = $(".side-email .email-box").width() + 30;
        $(".side-email .email-box").css({width: 0, left: 0, display: "none"});
        $(".side-list .side-email").mouseover(function () {
            $(".side-email .email-box").show().stop().animate({width: width, left: -width}, 300);
        })
        $(".side-list .side-email").mouseout(function () {
            $(".side-email .email-box").stop().animate({width: 0, left: 0}, 300, function () {
                $(this).hide();
            })
        })
    },
    xin: function () {

        $(".side-list .side-xin").hover(function () {
                $(".side-xin .xin-box").show();
                // $(".side-xin .xin-box .box-head").stop().animate({width: 130, right: 0}, 300, function () {
                //     $(".side-list .xin-box img").stop().animate({height: 130}, 300);
                // });
        },function(){
                // $(".side-list .xin-box img").stop().animate({height: 0}, 300, function () {
                //     $(".side-xin .xin-box .box-head").stop().animate({width: 0, right: -130}, 300,function () {
                //         $(".side-list .xin-box").hide();
                //     });
                // });
            $(".side-list .xin-box").hide();
        })
    },
    navTop: function () {
        $(".side-list li:last").click(function () {
            $('html,body').animate({scrollTop: '0px'}, 300);
        })
    }
}