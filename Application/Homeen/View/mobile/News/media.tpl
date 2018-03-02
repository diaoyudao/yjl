<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/news/news-group.css">
</block>
<block name="head_common2">
    <script src="/public_en/js/lib/jquery.masonry.min.js"  type="text/javascript"></script>
</block>
<block name="title">Media Reports-Agile Group</block>

<block name="head_menu">
    <a class="tip" href="#">Media Reports/</a>
</block>

<block name="body_main">
  <div class="content container bg-c">
     <div class="row"><span class="main-title">Media Reports</span></div>
     <div class="option-bg mt-20" style="height: auto;padding-bottom: 0.7rem">
       <ul class="option">
            <li class="current" id="0">All</li>
            <li id="1000000164">Property Development</li>
            <li id="1000000163">A-Living</li>
            <li id="1000000162">Education</li>
            <li id="1000000161">Environmental Protection</li>
            <li id="1000000202">Construction</li>
       </ul>
     </div>
     <include file="./Application/Homeen/View/mobile/base/newslistsmain.tpl" />

  </div>

</block>
<block name="footer_js">
    <include file="./Application/Homeen/View/mobile/base/newslistsjs.tpl" />
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