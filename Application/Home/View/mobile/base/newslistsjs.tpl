<script  type="text/javascript">
    $(function(){        
        total_pages = {$total_pages};

        if(2 >= total_pages) {
           $('#much').hide();
        }
    });

    var data = {
        id: '',
        pg: 2,
    };

    var total_pages = 1;

    var show_more = function(){
        loading_show();
        data.pg ++ ;
        setTimeout("postData()", 1000);
    };

    var addList = function(res){
        var initFun = initFun || function(){};  // 如果需要初始请在外围自定义
        initFun();

        if (res.notices.length == 0) {
            return;
        }

        for (var i = 0; i < res.notices.length; i++) {
            var temp_str = '<a href="/news/detail?id='+ res.notices[i].notice_id +'">';
            temp_str += '<li><div class="box pt-20 pb-20">';
            if(1 == res.notices[i].web_stick) {
                temp_str += '<img class="icon" src="/public/img/home/news/news-icon_03.png">';
            }
            if("" != res.notices[i].image_url1) {
                temp_str += '<img class="content-img" src="' + res.notices[i].image_url1 + '" traditional_image="'+ res.notices[i].image_url2 +'" simplified_image="'+ res.notices[i].image_url1 +'">';
            }
            temp_str += ' <span class="new-title">'+ res.notices[i].name +'</span>';

            var temp_desc = res.notices[i].desc;
            if(23 < res.notices[i].desc.length) {
                temp_desc = res.notices[i].desc.substring(0,23) + "...";
            } 

            temp_str += '<span class="new-content">' + temp_desc + '</span>';
            temp_str += '</div></li></a>';

            $('.option-content ul').append($(temp_str));
        }
    };

    var postData = function(){
        K.doAjax(data, window.document.location.href, function (res) {
            total_pages=res.total_pages;
                        
            addList(res);

            if(1 == data.pg){
                data.pg =2;
            }
                        
            if (total_pages <= data.pg) {
                $('#much').hide();                            
            }

            gradeChangeNew()

            loading_hide();            
        },function(err){
            console.log('post error');
            loading_hide();
        });
    }


    </script>
