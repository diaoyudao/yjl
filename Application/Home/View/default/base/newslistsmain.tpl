
        <div class="box">
            <div class="waterfull clearfloat" id="waterfull">
                <ul id="news-lists">
                    <volist name="notices" id="item">
                        <li class="item">
                            <a href="/news/detail?id={$item.notice_id}" class="a-img" target='_blank'>
                                <notempty name="item.image_url1">
                                    <img src="{$item.image_url1}" traditional_image="{$item.image_url2}"
                                         simplified_image="{$item.image_url1}" alt="">
                                </notempty>
                            </a>
                            <if condition="$item['web_stick'] && 1 == $item['web_stick']">
                                <span class="news">头条<br><span style="font-size: 15px;">news</span></span>
                            </if>
                            <h4 class="li-title" title="">
                                <a href="/news/detail?id={$item.notice_id}" target='_blank'>{$item.name}</a></h4>
                            <div class="description">{$item.desc}</div>
                            <div class="more"><a href="/news/detail?id={$item.notice_id}" target='_blank'>
                                    了解详情 <span class="icon"></span>
                                </a></div>
                        </li>
                    </volist>
                </ul>
            </div>
        </div>
        <img src="/public/img/home/common/loading.gif" alt="" id="imloading">
