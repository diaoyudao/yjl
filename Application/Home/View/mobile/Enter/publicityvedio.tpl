<extend name="./Application/Home/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/enter/publicity-vedio.css">
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public/js/lib/page.js"></script>
</block>
<block name="title">视频中心-雅居乐集团</block>

<block name="body_main">
<style>
.video-list{

}    
.video-list li{
    width:48%;
    height:140px;
    display: block;
    overflow: hidden;
}
.video-list li>.left{
    float:left;
    margin-left:0;
}
.video-list li>.right{
    float:right;
    margin-right:0;
}
.video-list li img{
    width: 100%;height:100%;
    display: block;
}
.video-list li .title{
    position: relative;
    height:30px;
    line-height: 30px;
    top:-30px;
    padding-left: 10px;
    width:100%;
    text-align: left;
    background-color: rgba(0,0,0,0.7);
    color:#fff;
}

</style>
    <div class="container mt-30 mb-30">
        <div class="main-title text-c">视频中心</div>
        <ul class="video-list mt-20 row cl">
            <volist name="media" id="item">
            <a href='/enter/publicityvediodetail?video_id={$item.video_id}'>
            <li class="<if condition='$i % 2 eq 1'>left<else />right</if>">
                    <img src='{$item.image_url1}' alt='' simplified_image='{$item.image_url1}'
                                     traditional_image='{$item.image_url2}'>
                <div class='title'>
                    {$item.title}
                </div>
            </li>
            </a>
            </volist>
        </ul>
        <div class="row main-btn mt-20" id="much">查看更多</div>
    </div>

</block>
<block name="footer_js">
<script type="text/javascript">
    $(function(){        
        total_pages = {$total};

        if(1 == total_pages) {
           $('#much').hide();
        }
    });

    var data = {
        id: '',
        pg: 1,
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

        if (res.media.length == 0) {
            return;
        }

        var ul = $("ul.video-list");

        for (var i = 0; i < res.media.length; i++) {
            var li = $("<li><a href='/enter/publicityvediodetail?video_id=" + res.media[i].video_id + "'><img src='" + res.media[i].image_url1 + "' alt='' simplified_image='" + res.media[i].image_url1 + "'  traditional_image='" + res.media[i].image_url2 + "' style='width:320px;height:275px';></a>" +
                                    "<div class='title'>" + res.media[i].title + "</div></li>")
            li.appendTo(ul);
        }
    };

    var postData = function(){
        K.doAjax(data, window.document.location.href, function (res) {
            total_pages=res.total_pages;
                        
            addList(res);
                        
            if (total_pages == data.pg) {
                $('#much').hide();                            
            }

            loading_hide();            
        },function(err){
            console.log('post error');
            loading_hide();
        });
    }

    </script>
</block>

