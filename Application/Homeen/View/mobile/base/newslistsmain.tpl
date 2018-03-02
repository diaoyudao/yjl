<div class="option-content active">
        <ul>
          <volist name="notices" id="item" offset="0" length="12">
          <a href="/en/news/detail?id={$item.notice_id}">
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
