<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/news/news-detail.css">
</block>
<block name="head_common2">
</block>

<block name="title">{$news.name}</block>
<block name="head_menu">
    <a class="tip" href="#">details /</a>
</block>
<block name="body_main">
   <div class="container detail-content mb-30">
        <span class="detail-title">{$news.name}</span>
        <span class="date">{$news.begin_time}</span>

     <div class="content mt-20">
         {$news.note}
     </div>

   </div>
</block>


<block name="footer_js">
    <script>
        $(function () {

        })
    </script>
</block>