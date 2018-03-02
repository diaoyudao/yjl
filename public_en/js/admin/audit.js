/*待审核*/
function article_audit(obj, param, url) {
    K.doAjax(param, url, function (response) {
        if (response.status && response.status == 'ok') {
            var status_obj = $(obj).parent().prev().find('span');
            status_obj.text('待审核')


        } else {
            if (response.message) {
                layer.msg(response.message, {icon: 2, time: 1500});
            } else {
                layer.msg('后台错误!', {icon: 2, time: 1500});
            }
        }
    });
}
/*发布*/
function article_release(obj, param, url) {

    K.doAjax(param, url, function (response) {
        if (response.status && response.status == 'ok') {
            var status_obj = $(obj).parent().prev().find('span');

            status_obj.text('发布')

        } else {
            if (response.message) {
                layer.msg(response.message, {icon: 2, time: 1500});
            } else {
                layer.msg('后台错误!', {icon: 2, time: 1500});
            }
        }
    });
}

function audit_more(url) {
    var param = {
        batch: 1,
        ids: []
    };
    $("input[name=check]").each(function () {
        if (this.checked) {
            param.ids.push($(this).val());
        }
    });
    if (param.ids.length <= 0) {
        layer.msg('请选择需要待审核的数据!', {icon: 2, time: 2000});
        return;
    }

    layer.confirm('确认要待审核选中的所有吗？', function (index) {
        K.doAjax(param, url, function (response) {
            if (response.status && response.status == 'ok') {
                window.location.replace(window.location.href);
            } else {
                if (response.message) {
                    layer.msg(response.message, {icon: 2, time: 1500});
                } else {
                    layer.msg('后台错误!', {icon: 2, time: 1500});
                }
            }
        });
    });
}
function release_more(url) {
    var param = {
        batch: 1,
        ids: []
    };
    $("input[name=check]").each(function () {
        if (this.checked) {
            param.ids.push($(this).val());
        }
    });
    if (param.ids.length <= 0) {
        layer.msg('请选择需要发布的数据!', {icon: 2, time: 2000});
        return;
    }

    layer.confirm('确认要发布选中的所有吗？', function (index) {
        K.doAjax(param, url, function (response) {
            if (response.status && response.status == 'ok') {
                window.location.replace(window.location.href);
            } else {
                if (response.message) {
                    layer.msg(response.message, {icon: 2, time: 1500});
                } else {
                    layer.msg('后台错误!', {icon: 2, time: 1500});
                }
            }
        });
    });
}