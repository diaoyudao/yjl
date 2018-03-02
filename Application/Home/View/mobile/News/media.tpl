<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/news/news-group.css">
</block>
<block name="head_common2">
    <script src="/public/js/lib/jquery.masonry.min.js"  type="text/javascript"></script>
</block>
<block name="title">媒体报道-雅居乐集团</block>

<block name="head_menu">
    <a class="tip" href="#">媒体报道/</a>
</block>

<block name="body_main">
  <div class="content container bg-c">
     <div class="row"><span class="main-title">媒体报道</span></div>
     <div class="option-bg mt-20">
       <ul class="option">
            <li class="current" id="0">全部</li>
            <li id="1000000164">房地产</li>
            <li id="1000000163">雅生活</li>
            <li id="1000000162">教育</li>
            <li id="1000000161">环保</li>
            <li id="1000000202">建设</li>
       </ul>
     </div>
     <include file="./Application/Home/View/mobile/base/newslistsmain.tpl" />    

  </div>

</block>
<block name="footer_js">
    <include file="./Application/Home/View/mobile/base/newslistsjs.tpl" />
    <script  type="text/javascript">
        $(function(){
            $('.option-bg ul li').click(function(){
                if(5 == $(this).index()) {
                  show_expecting();
                      return;
                }

                $('.option-content ul').empty();

                $(this).addClass('current').siblings().removeClass('current');
                data.pg = 0;
                data.id = $(this).attr('id');

                $('#much').show();
                show_more();
            });
        });
    </script>
</block>