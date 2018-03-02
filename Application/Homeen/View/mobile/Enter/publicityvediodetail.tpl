<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/enter/enter-videodetail.css">
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public_en/js/lib/page.js"></script>
</block>
<block name="title">{$media.title}-Agile Group</block>

 <block name="head_menu">
     <a class="tip" href="#">Details/</a>
 </block>

<block name="body_main">
  <div class="videoDetail container">
    <span class="min-title title-color">{$media.title}</span>
    <p class="mt-10" style="color:#818181">Updated on：<php> echo date('Y-m-d',strtotime($media['begin_time']))</php>  Length：{$media.duration}minutes  Read:{$media['view_count']}
    <video  autoplay="autoplay" width="100%" height="240" class="mt-10" controls preload="auto" src="{$media.url}">
        
        Your browser does not support the video tag.
    </video>
  </div>
     <div class=" row cl container pt-20 mb-30 bg-c">
        <h2 class="txt-center">Videos</h2>
            <volist name="medias" id="item" offset="0" length="2">
              <a href="/en/enter/publicityvediodetail?video_id={$medias[0].video_id}">
              <div class="video-img-other left">
                 <img class=" mt-20" src="{$medias[0].image_url1}" traditional_image="{$medias[0].image_url2}"
                                     simplified_image="{$medias[0].image_url1}">
                <div class="txt">{$medias[0].title}</div>
            </div>
              </a>      
              <a href="/en/enter/publicityvediodetail?video_id={$medias[1].video_id}">
                 <div class="video-img-other right"><img class="mt-20" src="{$medias[1].image_url1}" traditional_image="{$medias[1].image_url2}"
                                     simplified_image="{$medias[1].image_url1}">
                 <div class="txt">{$medias[1].title}</div>
                 </div>
              </a>         
     </div>

</block>
<block name="footer_js">
    <script  type="text/javascript">
        $(function () {
            $('#two-codes2').hide();
            $('#a-two-code2').on('click', function() {
                if($("#two-codes2").is(":hidden")) {
                    $('#two-codes2').show();
                } else {
                    $('#two-codes2').hide();
                }
            });

            $(".header .nav li").eq(1).addClass("active").siblings().removeClass("active");
            $(".sections .vedio-list li:nth-child(3n-2)").addClass("fir");
//            var total = JSON.parse('<php>echo json_encode($total)</php>');
            newClass();

//            function showNews(page) {
//                sections.text("");
//                for (var i = (page - 1) * 3; i < (page - 1) * 3 + 3; i++) {
//                    if(!notice[i]){continue;}
//                    var section = $("<div></div>").attr({class: "section"});
//                    var content = $("<div></div>").attr({class: "content container"}).appendTo(section);
//                    var title = $("<div></div>").attr({class: "title"}).appendTo(content);
//                    var span = $("<span></span>").text(notice[i][0].tags).appendTo(title);
//                    var word = $("<div></div>").attr({class: "word"}).appendTo(content);
//                    var ul = $("<ul></ul>").appendTo(word);
//                    for (var j = 0; j < notice[i].length; j++) {
//                        var li = $("<li></li>").appendTo(ul);
//                        var icon = $("<span></span>").attr({class: "icon"}).appendTo(li);
//                        var a = $("<a></a>").text(notice[i][j].name).attr({href: "a"}).appendTo(li);
//                        var news = $("<span></span>").text("新闻稿").attr({class: "news"}).appendTo(li);
//                    }
//                    section.appendTo(sections);
//                }
//            }

            function newClass() {
            }

            $(".btn-list ul").html(showPages(2, 5));

        })

        var shareXLWeiBo = function() {
            var _shareUrl = 'http://v.t.sina.com.cn/share/share.php?&appkey=895033136';     //真实的appkey ，必选参数
            _shareUrl += '&url='+ encodeURIComponent(document.location);     //参数url设置分享的内容链接|默认当前页location，可选参数
            _shareUrl += '&title=' + encodeURIComponent('{$media.title}');    //参数title设置分享的标题|默认当前页标题，可选参数
            _shareUrl += '&source=' + encodeURIComponent('雅居乐官网');
            _shareUrl += '&sourceUrl=' + encodeURIComponent('http://www.byyh.cn');
            _shareUrl += '&content=' + 'utf-8';   //参数content设置页面编码gb2312|utf-8，可选参数
            _shareUrl += '&pic=' + encodeURIComponent('');  //参数pic设置图片链接|默认为空，可选参数

            var _width = $(window).width()/2;
            var _height = $(window).height()/1.5;

            window.open(_shareUrl,'_blank','toolbar=no,menubar=no,scrollbars=no,resizable=1,location=no,status=0,' + 'width=' + _width + ',height=' + _height + ',top=' + (screen.height-_height)/2 + ',left=' + (screen.width-_width)/2);
        }
        var shareQqZone= function() {
            var _shareUrl = 'http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?';
            _shareUrl += 'url=' + encodeURIComponent(document.location);   //参数url设置分享的内容链接|默认当前页location
            _shareUrl += '&showcount=' + 1;      //参数showcount是否显示分享总数,显示：'1'，不显示：'0'，默认不显示
            _shareUrl += '&desc=' + encodeURIComponent('{$media.title}');    //参数desc设置分享的描述，可选参数
            _shareUrl += '&summary=' + encodeURIComponent('{$media.desc}');    //参数summary设置分享摘要，可选参数
            _shareUrl += '&title=' + encodeURIComponent(document.title);    //参数title设置分享标题，可选参数
            _shareUrl += '&site=' + encodeURIComponent('雅居乐官网');   //参数site设置分享来源，可选参数
            _shareUrl += '&pics=' + encodeURIComponent('');   //参数pics设置分享图片的路径，多张图片以＂|＂隔开，可选参数

            var _width = $(window).width()/2;
            var _height = $(window).height()/1.5;

            window.open(_shareUrl,'_blank','width='+_width+',height='+_height+',top='+(screen.height-_height)/2+',left='+(screen.width-_width)/2+',toolbar=no,menubar=no,scrollbars=no,resizable=1,location=no,status=0');
        }
    </script>
</block>

