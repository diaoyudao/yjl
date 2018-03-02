var K = function () {
    var e = function (e, n, t) {
        var a = $('<div class="bubble"><p>' + e + "</a></div>");
        t = t || 1e3;
        a.appendTo($("body")).hide().fadeIn();
        setTimeout(function () {
            a.fadeOut("normal", function () {
                if (typeof n == "function") {
                    n()
                }
            })
        }, t)
    };
    var n = function (e, n, t, a, o) {
        o = o || function (e) {
                layer.msg(e, {icon: 2, time: 1500});
                return
            };
        a = a || function (e) {
                e = $.parseJSON(e);
                if (e.status && e.status == "ok") {
                    window.location.replace(window.location.href)
                } else {
                    if (e.message) {
                        layer.msg(e.message, {icon: 2, time: 1500})
                    } else {
                        layer.msg("后台错误!", {icon: 2, time: 1500})
                    }
                }
            };
        var i = new XMLHttpRequest;
        i.open("POST", e, t);
        i.onreadystatechange = function (e) {
            if (i.readyState == 4 && i.status == 200) {
                a(i.response)
            } else {
                var n = "调用后台失败" + i.responseText;
                o(n)
            }
        };
        i.send(n)
    };
    var t = function (e, n, t, a) {
        n = n || $(e).attr("action");
        n = n || window.location.href;
        t = t || function (e) {
                if (e.status && e.status == "ok") {
                    window.location.replace(window.location.href)
                } else {
                    if (e.message) {
                        layer.msg(e.message, {icon: 2, time: 1500})
                    } else {
                        layer.msg("后台错误!", {icon: 2, time: 1500})
                    }
                }
            };
        a = a || function (e) {
                layer.msg("调用错误，请检查!", {icon: 2, time: 1500})
            };
        $.post(n, $(e).serialize(), function (e) {
            if (t) {
                try {
                    if (typeof e == "string") {
                        e = JSON.parse(e)
                    }
                } catch (e) {
                    a();
                    return false
                }
                t(e)
            }
        }).error(function (e) {
            if (a) {
                a(e)
            }
        });
        return false
    };
    var a = function (e, n, t, a) {
        n = n || window.location.href;
        t = t || function (e) {
                if (e.status && e.status == "ok") {
                    var n = parent.layer.getFrameIndex(window.name);
                    parent.window.location.replace(parent.window.location.href);
                    parent.layer.close(n)
                } else {
                    if (e.message) {
                        layer.msg(e.message, {icon: 2, time: 1500})
                    } else {
                        layer.msg("后台错误!", {icon: 2, time: 1500})
                    }
                }
            };
        origin_success_func = function (e) {
            try {
                if (typeof e == "string") {
                    e = JSON.parse(e)
                }
            } catch (e) {
                a();
                return false
            }
            t(e)
        };
        a = a || function (e) {
                layer.msg("调用错误，请检查!", {icon: 2, time: 1500})
            };
        $.ajax({url: n, type: "post", data: e, success: origin_success_func, error: a});
        return false
    };
    var o = function (e, n, t, a, o) {
        t = t || window.location.href;
        a = a || function (n) {
                if (n.status && n.status == "ok") {
                    $(e).parents("tr").remove();
                    window.location.reload()
                } else {
                    if (n.message) {
                        layer.msg(n.message, {icon: 2, time: 1e3})
                    } else {
                        layer.msg("后台错误!", {icon: 2, time: 1e3})
                    }
                }
            };
        o = o || function (e) {
                layer.msg("调用错误，请检查!", {icon: 2, time: 1e3})
            };
        origin_success_func = function (e) {
            try {
                if (typeof e == "string") {
                    e = JSON.parse(e)
                }
            } catch (e) {
                o();
                return false
            }
            a(e)
        };
        $.ajax({url: t, type: "post", data: n, success: origin_success_func, error: o});
        return false
    };
    var i = function () {
        var e = parent.layer.getFrameIndex(window.name);
        parent.layer.close(e)
    };
    var r = function (e, n, t, a) {
        layer_show(e, n, t, a)
    };
    var s = function (e, n) {
        var t = layer.open({type: 2, title: e, content: n});
        layer.full(t)
    };

    var getDateEnglishFormat = function(date) {
        date = new Date(date);
        var dd = date.getDate();
        dd = (dd >= 10)? dd : ('0' + dd);
        var mm = date.getMonth() + 1;
        mm = (mm >= 10)? mm : ('0' + mm);
        return mm + '/' + dd + '/' + date.getFullYear();
    };
    return {
        notify: e,
        sendForm: n,
        doAjaxSubmit: t,
        doAjax: a,
        doAjaxDeleteById: o,
        removeIframe: i,
        showFullSonPage: s,
        getDateEnglishFormat: getDateEnglishFormat,
    }
}();