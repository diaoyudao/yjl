<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/invest/invest-performance.css">
</block>
<block name="head_common2">
    <script src="/public/js/lib/page.js"></script>
</block>
<block name="title">业绩发布材料-雅居乐集团</block>

 <block name="head_menu">
     <a class="tip" href="#">业绩发布材料/</a>
 </block>

<block name="body_main">
  <div class=" txt-center container notice-bg  pt-20 pb-30 bg-c">
           <h2 class="txt-center f-20 pt-10 pb-10" style="font-weight:bold;color:#000">业绩发布材料</h2>
           <p class="txt-center  pb-10">投资者推荐会网上广播</p>
           <div class="imgBox"><img src="{$mobile_image[0]['image_url1']}" traditional_image="{$mobile_image[0]['image_url2']}"
                     simplified_image="{$mobile_image[0]['image_url1']}" class=""></div>

          <a class="fff" href="{$mobile_image[0]['link_url1']}">
          <div class="row cl mt-20 main-btn " style="width:60%;margin-left:auto;margin-right:auto" >
                   立即查看
           </div>
           </a>

  </div>



</block>
<block name="footer_js">
</block>