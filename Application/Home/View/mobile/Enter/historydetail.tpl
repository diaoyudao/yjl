<extend name="./Application/Home/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/enter/enter-history-detail.css">
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public/js/lib/page.js"></script>
</block>
<block name="title">详情-雅居乐集团</block>
  <block name="head_menu">
      <a class="tip" href="#">发展历程/</a>
  </block>
<block name="body_main">
 <div class="honor-content container mb-20">
   <h3 class="title">发展历程</h3>
  <div class="sections">
   <ul class="section">
     <li><span class="title txt-center">{$notice[0].tags}</span></li>
     <volist name="notice" id="item">
     <li>
       <img class="icon" src="/public/img/mobile/enter/point-bg.png">
       <span class="honor-text">{$item.name}</span>
     </li>   
     </volist>  
   </ul>

 </div>
 </div>
</block>
<block name="footer_js">
    <script>

    </script>
</block>

