<extend name="./Application/Homeen/View/default/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/home/news/news-detail.css">
</block>

<block name="head_common2">
</block>
<block name='title'>{$news.name}-Agile Group</block>
<block name='head_keywords'>{$news.keyword}</block>
<block name='head_description'>{$news.desc}</block>
<block name="body_main">
    <div class="section1">
        <div class="content container">
            <p><span><a href="/en/index">Home</a></span>&nbsp;&nbsp;&nbsp; > &nbsp;&nbsp;
                <notempty name="four_path"><span><a href="{$four_path.link_url}">{$four_path.name}</a></span>&nbsp;&nbsp;>
                    &nbsp;&nbsp;</notempty>
                <notempty name="three_path"><span><a href="{$three_path.link_url}">{$three_path.name}</a></span>&nbsp;&nbsp;>
                    &nbsp;&nbsp;</notempty>
                <span><a href="{$two_path.link_url}">{$two_path.name}</a></span>&nbsp;&nbsp;> &nbsp;&nbsp;
                <if condition="'楼盘速递' == $two_path['name']"><else /><span><a href='{$one_path.link_url}'>{$one_path.name}</a></span>&nbsp;&nbsp;> &nbsp;&nbsp;</if>
                <span><if condition="'教育' == $two_path['name']">{$news.name}<else />Details</if></span>
            </p>
            <h2>{$news.name}</h2>
            <p class="second">Release Time：<span class="time">{$news.begin_time}</span><notempty name="news.source">&nbsp;&nbsp;&nbsp;&nbsp;Source: <span
                    class="source">{$news.source}</span></notempty>&nbsp;&nbsp;&nbsp;&nbsp;Read: <span>{$news.view_count}</span>&nbsp;&nbsp;&nbsp;&nbsp;Share:
                <a class="cursor" id="a-two-code2"><img src="/public_en/img/home/news/weixin.png"></a>
                <a onclick="shareXLWeiBo()" class="cursor"><img src="/public_en/img/home/news/weibo.png"></a>
                <a onclick="shareQqZone()" class="cursor"><img src="/public_en/img/home/news/qq.png"></a>
            </p>
            <div style="height:0px;">
                <div style="position:relative;bottom:20px;left:600px;width:130px;height:130px;z-index:20;display:none;"
                     id="two-codes2">
                    <img src="{$two_bar_codes['image_url1']}" style="width:130px;height:130px;"/>
                </div>
            </div>
            <div class="box">
                {$news.note}
                <div class="right cursor" style="margin-right: -60px;margin-top: -70px;">
                    <a onclick="history.go(-1);"><img src="/public_en/img/home/business/estate/detail/estate_icon7.png" alt=""></a>
                </div>
                <div class="clear"></div>
            </div>

        </div>
    </div>
</block>
<block name="footer_js"></block>
<block name="footer_js">
    <script type="text/javascript">
        var shareXLWeiBo = function () {
            var _shareUrl = 'http://v.t.sina.com.cn/share/share.php?&appkey=895033136';     //真实的appkey ，必选参数
            _shareUrl += '&url=' + encodeURIComponent(document.location);     //参数url设置分享的内容链接|默认当前页location，可选参数
            _shareUrl += '&title=' + encodeURIComponent('{$news.name}');    //参数title设置分享的标题|默认当前页标题，可选参数
            _shareUrl += '&source=' + encodeURIComponent('雅居乐官网');
            _shareUrl += '&sourceUrl=' + encodeURIComponent('http://www.byyh.cn');
            _shareUrl += '&content=' + 'utf-8';   //参数content设置页面编码gb2312|utf-8，可选参数
            _shareUrl += '&pic=' + encodeURIComponent('');  //参数pic设置图片链接|默认为空，可选参数

            var _width = $(window).width() / 2;
            var _height = $(window).height() / 1.5;

            window.open(_shareUrl, '_blank', 'toolbar=no,menubar=no,scrollbars=no,resizable=1,location=no,status=0,' + 'width=' + _width + ',height=' + _height + ',top=' + (screen.height - _height) / 2 + ',left=' + (screen.width - _width) / 2);
        }
        var shareQqZone = function () {
            var _shareUrl = 'http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?';
            _shareUrl += 'url=' + encodeURIComponent(document.location);   //参数url设置分享的内容链接|默认当前页location
            _shareUrl += '&showcount=' + 1;      //参数showcount是否显示分享总数,显示：'1'，不显示：'0'，默认不显示
            _shareUrl += '&desc=' + encodeURIComponent('{$news.name}');    //参数desc设置分享的描述，可选参数
            _shareUrl += '&summary=' + encodeURIComponent('{$news.desc}');    //参数summary设置分享摘要，可选参数
            _shareUrl += '&title=' + encodeURIComponent(document.title);    //参数title设置分享标题，可选参数
            _shareUrl += '&site=' + encodeURIComponent('雅居乐官网');   //参数site设置分享来源，可选参数
            _shareUrl += '&pics=' + encodeURIComponent('');   //参数pics设置分享图片的路径，多张图片以＂|＂隔开，可选参数

            var _width = $(window).width() / 2;
            var _height = $(window).height() / 1.5;

            window.open(_shareUrl, '_blank', 'width=' + _width + ',height=' + _height + ',top=' + (screen.height - _height) / 2 + ',left=' + (screen.width - _width) / 2 + ',toolbar=no,menubar=no,scrollbars=no,resizable=1,location=no,status=0');
        }

        $(function () {
            $('#two-codes2').hide();
            $('#a-two-code2').on('click', function () {
                if ($("#two-codes2").is(":hidden")) {
                    $('#two-codes2').show();
                } else {
                    $('#two-codes2').hide();
                }
            });

            var path_name = $('.container p').eq(0).find('span a').eq(1).text();
            $.each($(".header .nav li"), function() {
                if(path_name == $(this).text()) {
                    $(this).addClass("active").siblings().removeClass("active");
                    return false;
                }                
            });
        });
    </script>
</block>    