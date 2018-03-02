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
        });
        if ($(window).scrollTop() > top) {
            $(".side-list").css({top: 250});
        } else {
            $(".side-list").css({top: top + 250});
        }
    },
    tel: function () {
        var width = $(".side-tel .tel-box").width() + 30;
        $(".side-list .side-tel").click(function () {
            $(".side-tel .tel-box").toggle().stop().animate({width: width, left: -width}, 300);
        });

    },
    email: function () {
        var width = $(".side-email .email-box").width() + 30;
        $(".side-list .side-email").click(function () {
            $(".side-email .email-box").toggle().stop().animate({width: width, left: -width}, 300);

        })


    },
    xin: function () {

        $(".side-list .side-xin").click(function () {
                $(".side-xin .xin-box").toggle();

        });
    },
    navTop: function () {
        $(".side-list li:last").click(function () {
            $('html,body').animate({scrollTop: '0px'}, 300);
        });
    }
}