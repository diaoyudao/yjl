<extend name="./Application/Adminen/View/default/base/context/add.tpl"/>
<block name="common_css">
</block>
<block name="body_main">
    <article class="page-container">
        <form action="" method="post" class="form form-horizontal" id="form-add"
              enctype="multipart/form-data">
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2">导入csv格式的文件（最大2M）：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input name="up_file" type="file" id='up_file' style="height:35px;width:95%;border:1px solid #ccc"/>
                </div>
            </div>
            <div class="row cl ">
                <div class="col-xs-9 col-sm-10 col-xs-offset-3 col-sm-offset-2">
                    <button onclick="upFileClick()" class="btn btn-success radius" id="admin-save" type="button"
                            name="admin-role-save"><i class="icon-ok"></i>开始导入
                    </button>
                    <button onClick="K.removeIframe();" class="btn btn-default radius" id="close-btn" type="button">
                        &nbsp;&nbsp;关闭&nbsp;&nbsp;</button>

                    <a target="_blank" style="text-decoration:none;display: none;" class="btn btn-primary radius hide"
                       id="search"
                       type="button"
                       href="/adminenglish/invest/credit/search"
                       title="预览">预览</a>&nbsp;&nbsp;


                    <button onclick="changeStatus()" class="btn btn-success radius " id="status-save" type="button"
                            name="admin-status-save" style="display: none"><i class="icon-ok"></i>确认发布
                    </button>
                </div>
            </div>
        </form>
        <!-- /.modal -->
        <div id="modal-demo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-body">
                    <div class="row">
                        <img src="/public/huiadmin/static/h-ui/images/loading-b.gif"/>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
    </article>

</block>
<block name="footer_js">
    <script type="text/javascript">
        function upFileClick() {
            //var file_name = $('#up_file')[0].files[0].name;
            if (0 >= $('#up_file')[0].files.length) {
                layer.msg('请选择需要导入的文件!', {icon: 2, time: 2000});
                return false;
            }

            formData = new FormData();
            formData.append('up_file', $('#up_file')[0].files[0]);
            K.sendForm('/adminenglish/invest/credit/import', formData, false, success, function (responseTxt) {
                //loadModel.hideModal();
                if (response.message) {
                    layer.msg('调用后台失败:' + responseTxt, {icon: 2, time: 2000});
                } else {
                    layer.msg('后台错误!', {icon: 2, time: 2000});
                }
            });

        }

        function success(ret) {
            // loadModel.hideModal();
            response = $.parseJSON(ret);
            if (response.status && response.status == "ok") {
//                    parent.window.location.reload(parent.window.location.href);
                $(' #admin-save').text('重新导入');
                $(' #close-btn').hide();
                $(' #search').show();
                $(' #status-save').show();
            } else {
                if (response.message) {
                    layer.msg(response.message, {icon: 2, time: 1500})
                } else {
                    layer.msg("后台错误!", {icon: 2, time: 1500})
                }
            }
        }
        function changeStatus() {
            var url = '/adminenglish/invest/credit/changestatus';
            var data = {};
            layer.confirm('请确认内容是否正确，提交后将会替换原有内容？', function (index) {
                K.doAjax(data, url, function (response) {
                    if (response.status && response.status == 'ok') {
                        parent.window.location.reload(parent.window.location.href);
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

        function showModal() {
            $("#modal-demo").modal("show");
        }

        var loadModel = {
            showModal: function () {
                $("#modal-demo").modal("show");
                $('#modal-demo').modal('show');
            },
            hideModal: function () {
                $('#modal-demo').modal('hide');
            },
        };

    </script>
</block>