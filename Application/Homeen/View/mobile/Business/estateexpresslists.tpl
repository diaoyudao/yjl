<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/business/business-estateexpresslists.css">
    <link rel="stylesheet" href="/public_en/css/mobile/news/news-group.css">
</block>
<block name="head_common2">
    <script src="/public_en/js/lib/jquery.masonry.min.js"></script>
</block>
<block name="title">Projects Updates-Agile Group</block>
<block name="head_menu">
    <a class="tip" href="#">Projects Updates/</a>
</block>

<block name="body_main">
      <div class=" txt-center content container notice-bg  pt-20 pb-30 bg-c">
          <h2 class="txt-center f-20 pt-10 pb-10">Projects Updates</h2>
          <div class="option">
              <div id="date">
                  <span class="text">Select Years</span>
                  <select id='year-select'>
                      <option value="全部">All</option>
                       <volist name="years" id="item">
                        <option value="{$item}">{$item}</option>
                      </volist>
                  </select>
              </div>
          </div>
          <ul id="lists" class="mt-20">
              <li class="" ><a>All</a></li>
              <volist name="months" id="item">
                  <li id="{$key}"><a >{$item}</a></li>
              </volist>
              <div class="clear"></div>
          </ul>
          <div class="option-content active">
              <ul>
                  <volist name="notices" id="item" offset="0" length="12">
                      <!--<a href="/en/news/detail?id={$item.notice_id}">-->
                      <a onclick='show_expecting()'>
                          <li>
                              <div class="box pt-20 pb-20">
                                  <if condition=" 1 == $item['web_stick']"><img class="icon" src="/public_en/img/home/news/news-icon_03.png"></if>
                                  <notempty name="item.image_url1"><img class="content-img" src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                                                        simplified_image="{$item.image_url1}" alt=""></notempty>
                                  <span class="new-title">{$item.name}</span>
                   <span class="new-content">
                        <php>
                            $leng=mb_strlen($item['desc'],'utf-8');
                            echo ($leng>23)?mb_substr($item['desc'], 0, 23,'utf-8').'...':$item['desc'];
                        </php>
                   </span>
                              </div>
                          </li>
                      </a>
                  </volist>
              </ul>
          </div>

          <a class="fff" id="much" onclick="show_more()"><div class="row cl mt-20 main-btn">More</div></a>

      </div>

</block>
<block name="footer_js">
    <script  type="text/javascript">
        $(function(){
            $('#year-select').change(function(){
                $('.option-content ul').empty();

                var news_t = $(this).find('option:selected').text();
                if(news_t == 'All') {
                    data.year = null;
                } else {
                    data.year = news_t;
                }

                $('#date .text').text(news_t);

                data.pg = 0;

                $('#much').show();
                show_more();
            });

            $('#lists li').click(function(){
                $('.option-content ul').empty();

                $(this).addClass('active-year').siblings().removeClass('active-year');
                data.pg = 0;

                data.id = $(this).attr('id');

                $('#much').show();
                show_more();
            });

        });
        var total_pages = 1;
        var data = {
            id: '',
            pg: 2,
        };
        var show_more = function(){
            loading_show();
            data.pg ++ ;
            setTimeout("postData()", 1000);
        };

        var addList = function(res){
            var initFun = initFun || function(){};  // 如果需要初始请在外围自定义
            initFun();

            if (res.notices.length == 0) {
                return;
            }

            for (var i = 0; i < res.notices.length; i++) {
//                var temp_str = '<a href="/en/news/detail?id='+ res.notices[i].notice_id +'">';
                var temp_str = '<a onclick="show_expecting()">';
                temp_str += '<li><div class="box pt-20 pb-20">';
                if(1 == res.notices[i].web_stick) {
                    temp_str += '<img class="icon" src="/public_en/img/home/news/news-icon_03.png">';
                }
                if("" != res.notices[i].image_url1) {
                    temp_str += '<img class="content-img" src="' + res.notices[i].image_url1 + '" traditional_image="'+ res.notices[i].image_url2 +'" simplified_image="'+ res.notices[i].image_url1 +'">';
                }
                temp_str += ' <span class="new-title">'+ res.notices[i].name +'</span>';

                var temp_desc = res.notices[i].desc;
                if(23 < res.notices[i].desc.length) {
                    temp_desc = res.notices[i].desc.substring(0,23) + "...";
                }

                temp_str += '<span class="new-content">' + temp_desc + '</span>';
                temp_str += '</div></li></a>';

                $('.option-content ul').append($(temp_str));
            }
        };

        var postData = function(){
            K.doAjax(data, window.document.location.href, function (res) {
                total_pages=res.total_pages;

                addList(res);

                if(1 == data.pg){
                    data.pg =2;
                }

                if (total_pages <= data.pg) {
                    $('#much').hide();
                }

                gradeChangeNew()

                loading_hide();
            },function(err){
                console.log('post error');
                loading_hide();
            });
        }
    </script>
</block>