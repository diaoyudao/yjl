<extend name="./Application/Home/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public/css/home/enter/enter-publicity-vediodetail.css">
</block>
<block name="head_common2">
    <script type="text/javascript" src="/public/js/lib/page.js"></script>
</block>
<block name="title">{$media.title}-雅居乐集团</block>

<block name="body_main">
    <div class="section-s section1">
        <div class="content container">
            <p class="nav-p"><span><a href="/index">首页</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;<span><a
                            href="/enter/index?level_id=1000000123">走进雅居乐</a></span>&nbsp;&nbsp;
                > &nbsp;&nbsp;<a href="/enter/publicity?level_id=1000000137">企业宣传</a></span>&nbsp;&nbsp; >
                &nbsp;&nbsp;<a href="/enter/publicityvedio">视频中心</a></span>&nbsp;&nbsp; > &nbsp;&nbsp;<span>视频详情</span>
            </p>


            <EMBED style=" margin: 5px auto; width:963px; height: 438px" ; autostart=true loop=true
                   src="<empty name='media.outside_link'>{$media.url}<else />{$media.outside_link}</empty>"
                   quality="high"
                   wmode="transparent"
                   pluginspage="http://www.macromedia.com/go/getflashplayer"
                   type="application/x-shockwave-flash"> 
<!--
            <object style=" margin: 5px auto; width:963px; height: 438px"
             classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" >
<param name="movie" value="{$media.outside_link}" />
<param name="quality" value="high" />
<param name="wmode" value="transparent" />
<embed src="{$media.outside_link}" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="1000" height="134"></embed>
</object>
 -->
                <div class="title">{$media.title}</div>
                <div class="tips">
                    发布时间：
                    <php> echo date('Y-m-d',strtotime($media['begin_time']))</php>
                    <span class="begin-time">
                    </span>
                    <span class="time">时长：{$media.duration}分钟</span>
                    <img src="/public/img/home/enter/publicity/detail_eye.png" alt=""
                         style="vertical-align: middle;margin-left: 20px">
                    <span style="margin-left: 30px;">播放数：<span
                                style="color: #007069;font-size: 14px">{$media['view_count']}</span></span>
                    <a  style="margin-left: 30px;cursor:pointer;" id="a-two-code2"><img
                                    src="/public/img/home/enter/publicity/detail_icon1.jpg" alt=""></a>
                    <a onclick="shareXLWeiBo()" class="cursor"><span><img src="/public/img/home/enter/publicity/detail_icon2.jpg" alt=""></span></a>
                    <a onclick="shareQqZone()" class="cursor"><span><img src="/public/img/home/enter/publicity/detail_icon3.jpg" alt=""></span></a>
                </div>
                <div style="height:0px;">
                <div style="position:relative;bottom:230px;left:450px;width:130px;height:130px;z-index:20;display:none;" id="two-codes2">
                    <img src="{$two_bar_codes['image_url1']}" style="width:130px;height:130px;"/>
                </div>
                </div>
        </div>
    </div>
    <div class="sections">
        <div class="section">
            <div class="content container">
                <h2 style="margin-top: 75px;margin-bottom: 30px;"><a href="/enter/publicityvedio">相关视频</a></h2>
                <ul class="vedio-list">
                    <volist name="medias" id="item">
                        <li>
                            <a href="/enter/publicityvediodetail?video_id={$item.video_id}">
                                <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                     simplified_image="{$item.image_url1}" alt="" style="width: 320px;height: 275px">

                            </a>
                            <p class="title">
                                <a href="/enter/publicityvediodetail?video_id={$item.video_id}">{$item.title}</a></p>
                            时长: <span>{$item.duration}分钟</span>
                        </li>
                    </volist>

                    <!--<li>-->
                    <!--<a href=""><img src="/public/img/home/enter/publicity/publicity_v4.jpg" alt="" style="width: 320px;height: 275px"></a>-->
                    <!--<p class="title">雅居乐集团宣传视频</p>-->
                    <!--时长: <span>20分钟</span>-->
                    <!--</li>-->
                </ul>
            </div>
        </div>

    </div>
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

