<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/enter/enter-honor.css">
</block>
<block name="head_common2">
  <script type="text/javascript" src="/public_en/js/lib/page.js"></script>
</block>
<block name="title">Awards & Recognitions-Agile Group</block>
<block name="head_menu">
 <a class="tip" href="#">Awards & Recognitions/</a>
</block>
<block name="body_main">
 <div class="honor-content container mt-10 mb-20">
   <h3 class="title">Awards & Recognitions</h3>
   <div class="option mt-20">
     <div id="date">
       <span class="text">Select Years</span>
       <select id="year-select">
         <option >All</option>
         <volist name="lists" id="item">
          <option >{$item}</option>
        </volist>
      </select>
    </div>
  </div>

  <div class="sections">
  <volist name="notice" id="item">
   <ul class="section">
     <li><span class="title">{$item[0].tags}</span></li>
     <volist name="item" id="xx">
     <li>
       <img class="icon" src="/public_en/img/mobile/enter/point-bg.png" style="position: absolute;top:2.8rem">
       <span class="honor-text" style="padding-top: 1.3rem">{$xx.name}</span>
     </li>
     </volist>     
   </ul>
    </volist>
   
 </div>
  <div class="row main-btn mt-20 mb-20 " id="much" >More</div>
</div>


</block>
<block name="footer_js">
  <script type="text/javascript">
    $(function(){
         $(".option").click(function(){
          $(".honor-content .option .items").show();
        })

         $(".sections").click(function(){
           $(".honor-content .option .items").hide();
         })

         $("#items li").click(function(){
          var Index=$(this).index();
          $(this).addClass("extra").siblings("li").removeClass("extra");
        })

   })
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
            if(news_t == 'All') {
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
          $('.sections').html('');
        }

        var last_title = $('.sections .title:last').text();

        $.each(ret_data, function(i, item){
            // 获取最后一个title
            var temp_str = '';
            $.each(item, function(i, item2){
                temp_str += '<li><img class="icon" src="/public_en/img/mobile/enter/point-bg.png"><span class="honor-text">' + item2.name + '</span></li>';
            });            

            if(last_title != item[0].tags){
                var t_str = '<ul class="section"><li><span class="title">' + item[0].tags + '</span></li>';
                temp_str = t_str + temp_str + '</ul>';

                $('.sections').append($(temp_str));
            } else {
                $('.sections .section:last').append($(temp_str));
            }
            
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


  </script>
</block>

