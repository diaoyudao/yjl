<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/invest/invest-performance.css">
</block>
<block name="head_common2">
    <script src="/public_en/js/lib/page.js"></script>
</block>
<block name="title">Presentation Materials-Agile Group</block>

 <block name="head_menu">
     <a class="tip" href="#">Presentation Materials/</a>
 </block>

<block name="body_main">
  <div class=" txt-center container notice-bg  pt-20 pb-30 bg-c">
           <h2 class="txt-center f-20 pt-10 pb-10" style="font-weight:bold;color:#000">Presentation Materials</h2>
           <p class="txt-center  pb-10">Webcast on Analyst Briefing</p>
           <div class="imgBox"><img src="{$mobile_image[0]['image_url1']}" traditional_image="{$mobile_image[0]['image_url2']}"
                     simplified_image="{$mobile_image[0]['image_url1']}" class=""></div>

          <a class="fff" href="{$mobile_image[0]['link_url1']}">
          <div class="row cl mt-20 main-btn " style="width:60%;margin-left:auto;margin-right:auto" >
                   More
           </div>
           </a>

  </div>



</block>
<block name="footer_js">
</block>