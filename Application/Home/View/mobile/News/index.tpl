<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/news/news-index.css">
</block>
<block name="head_common2">
</block>
<block name="title">新闻中心-雅居乐集团</block>

<block name="body_main">

    <div class="container bg-c mb-30">
        <div class="pic-box">
            <img src="{$head_notice.image_url1}" traditional_image="{$head_notice.image_url2}"
                 simplified_image="{$head_notice.image_url1}" class="tags-img" alt="">
            <img class="second " src="/public/img/home/news/new3.png">
        </div>
        <div class="mt-20 pb-10" style="">
            <a href="/news/detail?id={$head_notice.notice_id}"><p class="text1 pb-10">{$head_notice.name}</p></a>
            <span class="text2">{$head_notice.desc}</span>

        </div>       
        <div class="mt-20 pb-30">
            <h2 class="txt-center">媒体报道</h2>
            <div id="" class="mt-20 tab-Bar">
                <ul class="row cl txt-center title-list" >
                    <li class="nav-li  oper ">
                    <div class="row-data active"><img src="/public/img/home/news/icon2.png">
                        地产</div>
                        <span class="row icon"></span>
                    </li>
                    <li class="nav-li oper">
                        <div class="row-data"><img src="/public/img/home/news/icon3.png">
                        雅生活
                        </div>
                         <span class="row icon me-hidden"></span>
                    </li>
                    <li class="nav-li oper">
                    <div class="row-data"><img src="/public/img/home/news/icon4.png">
                        教育</div>
                         <span class="row icon me-hidden"></span>
                    </li>
                    <li class="nav-li  oper ">
                    <div class="row-data"><img src="/public/img/home/news/icon5.png">
                        环保</div>
                        <span class="row icon me-hidden"></span>
                    </li>
                    <li class="nav-li">
                    <div class="row-data"><img src="/public/img/home/news/icon6.png">
                        建设</div>
                        <span class="row icon me-hidden"></span>
                    </li>
                </ul>

                <div class="news-box">
                    <ul id="listContent">
                      <volist name="one_estate_notices" id="item">
                          <li>
                            <div class="pt-10 pb-10">
                              <span class="text"><img class="new-icon" src="/public/img/mobile/enter/point-bg.png"> 
                              <a href="/news/detail?id={$item.notice_id}">{$item.name}</a>
                              </span>
                              <span class="time">发布时间 : <php>echo (new \DateTime($item['begin_time']))->format('Y年m月');</php></span>
                            </div>
                          </li>
                       </volist>     
                       <volist name="estate_notices" id="item">
                          <li>
                            <div class="pt-10 pb-10">
                              <span class="text"><img class="new-icon" src="/public/img/mobile/enter/point-bg.png"> 
                              <a href="/news/detail?id={$item.notice_id}">{$item.name}</a>
                              </span>
                              <span class="time">发布时间 : <php>echo (new \DateTime($item['begin_time']))->format('Y年m月');</php></span>
                            </div>
                          </li>
                       </volist>                       
                    </ul>
                    <a class="fff" href="/news/estate?level_id=1000000164"><div class="row cl mt-20 main-btn">查看更多</div></a>
                </div>
                <div class="news-box me-hidden" >
                    <ul id="listContent">
                    <volist name="one_life_notices" id="item">
                          <li>
                            <div class="pt-10 pb-10">
                              <span class="text"><img class="new-icon" src="/public/img/mobile/enter/point-bg.png"> 
                              <a href="/news/detail?id={$item.notice_id}">{$item.name}</a>
                              </span>
                              <span class="time">发布时间 : <php>echo (new \DateTime($item['begin_time']))->format('Y年m月');</php></span>
                            </div>
                          </li>
                       </volist>
                       <volist name="life_notices" id="item">
                          <li>
                            <div class="pt-10 pb-10">
                              <span class="text"><img class="new-icon" src="/public/img/mobile/enter/point-bg.png"> 
                              <a href="/news/detail?id={$item.notice_id}">{$item.name}</a>
                              </span>
                              <span class="time">发布时间 : <php>echo (new \DateTime($item['begin_time']))->format('Y年m月');</php></span>
                            </div>
                          </li>
                       </volist>
                    </ul>
                    <a class="fff" href="/news/life?level_id=1000000163"><div class="row cl mt-20 main-btn">查看更多</div></a>
                 </div>
                <div class="news-box me-hidden" >
                    <ul id="listContent">
                     <volist name="one_education_notices" id="item">
                          <li>
                            <div class="pt-10 pb-10">
                              <span class="text"><img class="new-icon" src="/public/img/mobile/enter/point-bg.png"> 
                              <a href="/news/detail?id={$item.notice_id}">{$item.name}</a>
                              </span>
                              <span class="time">发布时间 : <php>echo (new \DateTime($item['begin_time']))->format('Y年m月');</php></span>
                            </div>
                          </li>
                       </volist>
                        <volist name="education_notices" id="item">
                          <li>
                            <div class="pt-10 pb-10">
                              <span class="text"><img class="new-icon" src="/public/img/mobile/enter/point-bg.png"> 
                              <a href="/news/detail?id={$item.notice_id}">{$item.name}</a>
                              </span>
                              <span class="time">发布时间 : <php>echo (new \DateTime($item['begin_time']))->format('Y年m月');</php></span>
                            </div>
                          </li>
                       </volist>
                    </ul>
                    <a class="fff" href="/news/education?level_id=1000000162"><div class="row cl mt-20 main-btn">查看更多</div></a>
                </div>
                <div class="news-box me-hidden" >
                    <ul id="listContent">
                     <volist name="one_environment_notices" id="item">
                          <li>
                            <div class="pt-10 pb-10">
                              <span class="text"><img class="new-icon" src="/public/img/mobile/enter/point-bg.png"> 
                              <a href="/news/detail?id={$item.notice_id}">{$item.name}</a>
                              </span>
                              <span class="time">发布时间 : <php>echo (new \DateTime($item['begin_time']))->format('Y年m月');</php></span>
                            </div>
                          </li>
                       </volist>
                       <volist name="environment_notices" id="item">
                          <li>
                            <div class="pt-10 pb-10">
                              <span class="text"><img class="new-icon" src="/public/img/mobile/enter/point-bg.png"> 
                              <a href="/news/detail?id={$item.notice_id}">{$item.name}</a>
                              </span>
                              <span class="time">发布时间 : <php>echo (new \DateTime($item['begin_time']))->format('Y年m月');</php></span>
                            </div>
                          </li>
                       </volist>
                    </ul>
                    <a class="fff" href="/news/environment?level_id=1000000161"><div class="row cl mt-20 main-btn">查看更多</div></a>
                </div>
                <div class="news-box me-hidden" >
                    <ul id="listContent">
                       
                    </ul>
                </div>

            </div>
             

              <div class="mt-40 pb-30">
                   <h2 class="txt-center">集团新闻</h2>
              </div>
                    <ul id="listContent">
                       <volist name="one_group_notices" id="item">
                          <li>
                            <div class="pt-10 pb-10">
                              <span class="text"><img class="new-icon" src="/public/img/mobile/enter/point-bg.png"> 
                              <a href="/news/detail?id={$item.notice_id}">{$item.name}</a>
                              </span>
                              <span class="time">发布时间 : <php>echo (new \DateTime($item['begin_time']))->format('Y年m月');</php></span>
                            </div>
                          </li>
                       </volist>
                        <volist name="group_notices" id="item">
                            <li>
                                <div class="pt-10 pb-10">
                              <span class="text"><img class="new-icon" src="/public/img/mobile/enter/point-bg.png">
                              <a href="/news/detail?id={$item.notice_id}">{$item.name}</a>
                              </span>
                                    <span class="time">发布时间 : <php>echo (new
                                            \DateTime($item['begin_time']))->format('Y年m月');
                                        </php></span>
                                </div>
                            </li>
                        </volist>
                    </ul>
              <a style="color:#fff" class="fff" href="/news/group?level_id=1000000142"><div class="row cl mt-20 main-btn">查看更多</div></a>
        </div>
    </div>


</block>


<block name="footer_js">
    <script>
        $(function () {
            $(".nav-li").click(function () {
                    var index = $(this).index();
                    console.log(index);
                    if(4== index){
                      show_expecting();
                      return;
                    }
                    
                    $(this).siblings().find('.row-data').removeClass("active");
                    $(this).find('.row-data').addClass("active");
                    $(".nav-li .icon").css({ "display": "none" });
                    $(this).find(".icon").css({ "display": "block" });
                    
                    $(".tab-Bar .news-box").eq(index).show().siblings(".news-box").hide();
                }) ;
        })
    </script>
</block>