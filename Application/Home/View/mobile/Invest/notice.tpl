<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/invest/invest-notice.css">
</block>
<block name="head_common2">
    <script src="/public/js/lib/page.js"></script>
</block>
<block name="title">公告-雅居乐集团</block>

<block name="head_menu">
    <a class="tip" href="#">公告/</a>
</block>

<block name="body_main">
<style>
.bottom-bd{border-bottom:1px solid #cfcfcf}  
.bgc-ff{background: #fff;}
</style>
    <div class=" txt-center container notice-bg  pt-20 pb-30 bg-c">
           <h2 class="txt-center f-20 pt-10 pb-10">公告</h2>
               <div class="option">
                      <div id="date">
                      <span class="text">请选择年份</span>
                        <select id="year-select">
                              <option>全部</option>
                              <volist name="lists" id="item">
          <option >{$item}</option>
        </volist>
                        </select>
                      </div>
               </div>

    </div>

    <div class="container notice-bg  pt-20 pb-30 bg-c" id="context-list">
         <volist name="notice" id="item">
            <div class="mt-10 txt-center bottom-bd" ><span class="dateText">{$item[0].tags}</span></div>
                <volist name="item" id="xx">
               <div class="mt-10 bottom-bd bgc-ff" >
                   <div class="container pt-10 pb-10 pd ">
                       <div class=" pr-5 left pt-5" style="display: inline; "><img
                                   src="/public/img/mobile/invest/index/dot.png" class="xs-img"></div>
                       <div class="pl-5 left word">
                           <span>
                               {$xx['title']}
                           </span>
                           <p>发布时间：{$xx.begin_time}
                           </p>
                       </div>
                       <div class="right">
                           <a href="#"  onclick="down_file('{$xx.url}')">
                               <img src="/public/img/mobile/invest/index/xz-img.png" class="md-img ">
                           </a>
                       </div>
                       <div class="clear"></div>
                   </div>
               </div>
               </volist> 
         </volist>      
               
           
       </div>
       <div class="row container mb-20"><div class="main-btn" id="much">查看更多</div></div>

</block>
<block name="footer_js">
    <script>
         $(function(){
        $('#much').click(function(){
            loading_show();            
            data.pg ++ ;
            setTimeout("PostAjax()", 1000);   // 暂停两秒再执行，显示效果更人性化。         

        });

        if(1 == total) {
           $('#much').hide();
        }

        $('#year-select').change(function(){
            var news_t = $(this).find('option:selected').text();
            if(news_t == '全部') {
                data.tags = null;
            } else {
                data.tags = news_t;
            }

            $("#date .text").text(news_t);

            data.pg = 1;
            $('#much').show();
            loading_show();            
            setTimeout("PostAjax()", 1000);
        });
    })

    var total = JSON.parse('<php>echo json_encode($total)</php>');
    var data = {tags: null, pg: 1};

    var addList = function(ret_data){
        if(1 == data.pg) {
          $('#context-list').html('');
        }
        // 获取最后一个title
        var last_title = $('#context-list .dateText:last').text();

        $.each(ret_data, function(i, item){
            
            var temp_str = '';
            $.each(item, function(i, item2){
                temp_str += '<div class="mt-10 bottom-bd bgc-ff" ><div class="container pt-10 pb-10 pd "><div class=" pr-5 left pt-5" style="display: inline; ">'
                temp_str += '<img src="/public/img/mobile/invest/index/dot.png" class="xs-img"></div><div class="pl-5 left word"><span>' + item2.title + '</span><p>发布时间：';
                temp_str += item2.begin_time + '</p></div><div class="right"><a href="#"  onclick="down_file(\'' + item2.url + '\')">';
                temp_str += '<img src="/public/img/mobile/invest/index/xz-img.png" class="md-img "></a></div><div class="clear"></div></div></div>';
            });            

            if(last_title != item[0].tags){
                var t_str = '<div class="mt-10 txt-center bottom-bd" ><span class="dateText">' + item[0].tags + '</span></div>';
                temp_str = t_str + temp_str;                
            } 

            $('#context-list').append($(temp_str));
            
        });
        
    }

    function PostAjax() {
                $.ajax({
                    url: window.document.location.href,
                    type: "post",
                    data: data,
                    success: function (res) {
                        total=res.total;
                        
                        addList(res.item);
                        
                        if (total == data.pg) {
                            $('#much').hide();                            
                        }

                        gradeChange()

                        loading_hide();
                    },
                    error: function(){
                      console.log('post error');
                      loading_hide();
                    }
                })
            }

        var down_file = function (file) {
            var $file = encodeURI(file);
            window.open($file);

            return;
        };



    </script>
</block>