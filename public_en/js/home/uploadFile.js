

var FILE_UPLOAD = {
 create: function (image_list_id, filePicker, start_btn, server_url, uploadSuccess) {
    var uploader;
    var image_list_id = image_list_id || "#file-list";
    var filePicker = filePicker || "#file-picker";
    var server_url = server_url || "/upload/honestfile";
    var start_btn = start_btn || "#file-start";
    var $list = $(image_list_id);
    var $btn = $(start_btn);
    var uploadSuccess = uploadSuccess || function (file, response) {
            if (response.status && "ok" == response.status) {
                $("input[name=file_url]").val(response.file_url);
                $("input[name=file_name]").val(response.file_name);
                setProcessStatus(file, "文件已上传完毕！")
            } else {
                $("input[name=file_url]").val("");
                setProcessStatus(file, "上传出错("+response.message+")，请重新选择文件后再次上传！")
            }
            uploader.reset();
        };

    uploader = new WebUploader.Uploader({
            swf: "/public_en/huiadmin/lib/webuploader/0.1.5/Uploader.swf",
            chunked: false,
            server: server_url,
            pick: filePicker,
            resize: false,
            duplicate: false,
    });
        uploader.on("beforeFileQueued", function (file) {
            if(2*1024*1024 <= file.size ) {
                layer.msg('文件不能大于2M！', {icon: 2, time: 2000});
                return false;
            }
            if(0 > ",xls,xlsx,jpg,png,gif,rar,zip,doc,docx".indexOf(file.ext)) {
                layer.msg('只能上传文件类型为xls,xlsx,jpg,png,gif,rar,zip,doc,docx的文件！', {icon: 2, time: 2500});
                return false;
            }
            createQueueFile(file, "等待上传，请点击开始上传...")
        });

        uploader.on("uploadProgress", function (file, percentage) {
            var $li = $("#" + file.id ), $percent = $li.find(".progress .progress-bar");
            if (!$percent.length) {
                $percent = $('<div class="progress progress-striped active">' + '<div class="progress-bar" role="progressbar" style="width: 0%">' + "</div>" + "</div>").appendTo($li).find(".progress-bar")
            }
            $li.find("p.state").text("上传中...");
            $percent.css("width", percentage * 100 + "%")
        });
        uploader.on("uploadSuccess", uploadSuccess);
        uploader.on("uploadError", function (file, reason) {
            $("#" + file.id).find("p.state").text("上传出错("+reason+")，请重新选择文件后再次上传!")
        });
        uploader.on("uploadComplete", function (file) {
            if ($("#" + file.id ).find(".progress")) {
                $("#" + file.id ).find(".progress").fadeOut()
            }
            uploader.reset();
            $btn.text("开始上传");
        });

        $btn.on("click", function () {
            var txt = $btn.text();
            if (txt === "暂停上传") {
                uploader.stop(true);
                $btn.text("开始上传")
            } else {
                $btn.text("暂停上传");
                uploader.upload();
            }
        });

        var createQueueFile = function (file, msg) {
            $list.empty();
            $list.append('<div id="' + file.id + '" class="item">' + '<h4 class="info" style="margin-left:0px;">' + file.name + "</h4>" + '<p class="state">' + msg + "</p>" + "</div>");
            $btn.text("开始上传")
        };
        var setProcessStatus = function (file, msg) {
            $("#" + file.id ).find("p.state").text(msg);
        }        
        return uploader;
        
    },


};
    
