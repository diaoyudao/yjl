/**
 * Created by Administrator on 2016/12/7.
 */

var Cookie_img = {
    cookie: function (lang, day) {
        $.cookie("lang_select",null);
        $.cookie("lang_select", lang, {
            expires: day,//有效日期
            path: "/",//cookie的路 径
            domain:"dev.yjl.com"
        })
    },
    change: function (lang) {
        $("img").each(function () {
            var cookie = $.cookie("lang_select");
            if (!$(this).attr("traditional_image")) {
                return;
            }

            if ("t" == lang) {
                var src = $(this).attr("traditional_image");
                $(this).attr({src: src});
            } else if ("s" == lang) {
                var src = $(this).attr("simplified_image");
                $(this).attr({src: src});
            }
        })
    }

}
