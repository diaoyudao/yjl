<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/business/business-estateexpresslists.css">
    <link rel="stylesheet" href="/public/css/mobile/news/news-group.css">
</block>
<block name="head_common2">
    <script src="/public/js/lib/jquery.masonry.min.js"></script>
</block>
<block name="title">楼盘速递-雅居乐集团</block>
<block name="head_menu">
    <a class="tip" href="#">楼盘速递/</a>
</block>

<block name="body_main">
      <div class=" txt-center content container notice-bg  pt-20 pb-30 bg-c">
          <h2 class="txt-center f-20 pt-10 pb-10">楼盘速递</h2>
          <div class="option">
              <div id="date">
                  <span class="text">请选择年份</span>
                  <select id='year-select'>
                      <option value="全部">全部</option>
                       <volist name="years" id="item">
                        <option value="{$item}">{$item}</option>
                      </volist>
                  </select>
              </div>
          </div>
          <ul id="lists" class="mt-20">
              <li class="" id='0'><a>全部</a></li>
              <li id="1000000183"><a>1月</a></li>
              <li id="1000000182"><a>2月</a></li>
              <li id="1000000181"><a>3月</a></li>
              <li id="1000000180"><a>4月</a></li>
              <li id="1000000179"><a>5月</a></li>
              <li id="1000000178"><a>6月</a></li>
              <li id="1000000177"><a>7月</a></li>
              <li id="1000000176"><a>8月</a></li>
              <li id="1000000175"><a>9月</a></li>
              <li id="1000000174"><a>10月</a></li>
              <li id="1000000173"><a>11月</a></li>
              <li id="1000000172"><a>12月</a></li>
              <div class="clear"></div>
          </ul>
     
     <include file="./Application/Home/View/mobile/base/newslistsmain.tpl" /> 

      </div>

</block>
<block name="footer_js">
    <include file="./Application/Home/View/mobile/base/newslistsjs.tpl" />
    <script  type="text/javascript">
        $(function(){
            $('#year-select').change(function(){
                $('.option-content ul').empty();

                var news_t = $(this).find('option:selected').text();
                if(news_t == '全部') {
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
    </script>
</block>