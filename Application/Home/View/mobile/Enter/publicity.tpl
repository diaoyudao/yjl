<extend name="./Application/Home/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/enter/enter-publicity.css">
</block>
<block name="title">企业宣传-雅居乐集团</block>

<block name="head_menu">
    <a class="tip" href="#">企业宣传/</a>
</block>

<block name="body_main">
  <div class="picBox">
      <img src="{$mobile_head_images[0].image_url1}"
           traditional_image="{$mobile_head_images[0].image_url2}"
           simplified_image="{$mobile_head_images[0].image_url1}" alt=""
           class="tags-img">
  </div>
  <p class="video-title">视频中心</p>
    <volist name="media" id="item" offset="0" length="2">
        <a href="/enter/publicityvediodetail?video_id={$item.video_id}">
            <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                 simplified_image="{$item.image_url1}" class="video1">
        </a>
    </volist>

    <div class="container mt-20 mb-20 ">
        <a href="/enter/publicityvedio"><div class="row cl main-btn  " >查看更多</div></a>
    </div>
</block>


<block name="footer_js">
    <!--[if IE]>
    <script src="http://api.html5media.info/1.1.4/html5media.min.js"></script>
    <![endif]-->

    <script>


    </script>
</block>