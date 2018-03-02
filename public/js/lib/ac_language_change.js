/**
 * Created by Administrator on 2016/12/7.
 */

var Cookie_img_new = {
    domain_zh: '',
    domain_en: '',
    cookie_domain : '',
    init: function(domain_zh, domain_en, cookie_domain) {
        this.domain_en = domain_en;
        this.domain_zh = domain_zh;
        this.cookie_domain = cookie_domain;
    },
    cookie: function (lang, day) {
        var me = this;

        $.cookie("lang_select",null);
        $.cookie("lang_select", lang, {
            expires: day,//有效日期
            path: "/",//cookie的路 径
            domain: me.cookie_domain,
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
    },

    changeLanguageHostUrl: function(source_url, to_type) {
        if('zh' == to_type) {
            return source_url.replace(this.domain_en, this.domain_zh);
        } else {
            return 'http://' + this.domain_en + '/en/';
        }
    },
}

var gradeChangeNew = function(index) {
    if ('undefined' == typeof(index)) {
        var lang = $.cookie("lang_select")
        index = lang ? ('s' == lang ? 0 : ('t' == lang) ? 2 : 1) : 0;
    } else if (!index && index != 0) {
        var index = $(".choise select").get(0).selectedIndex;
    }

    switch (index) {
        case 0:
            cantonese.zh_tran('s');
            var lang = "s";
            Cookie_img_new.change("s");
            Cookie_img_new.cookie(lang, 1);            

            break;
        case 1:

            location.href = Cookie_img_new.changeLanguageHostUrl(location.href, 'en');
            // location.href = "http://web.agile.com.cn/agile/web/en/91/";
            break;
        case 2:
            cantonese.zh_tran('t');
            var lang = "t";
            Cookie_img_new.change("t");
            Cookie_img_new.cookie(lang, 1);

            break;
    }
}

var gradeChange = function(index) {
    gradeChangeNew(index)
}