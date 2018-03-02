<extend name="./Application/Homeen/View/mobile/base/common.tpl"/>

<block name="head_common1">
    <link rel="stylesheet" href="/public_en/css/mobile/enter/history.css">
</block>
<block name="title">Milestones-Agile Group</block>

<block name="head_menu">
    <a class="tip" href="#">Milestones /</a>
</block>

<block name="body_main">
    <style>
        .body-main-bg{background-color: #efefef;color:#666;}

    </style>
    <div class="row cl body-main-bg pt-20 pb-20">
        <div class="container ">
            <div class="row cl txt-center mt-10"><span class="f-20 c-333 "><strong>Milestones </strong></span></div>
            <div class="row cl mt-20" id="list-history">
                <volist name="notice" id="item" offset="0" length='10'>
                    <if condition='$i != 1'>
                    <div class="news-list-oper">
                        <div class="bd"></div>
                    </div>
                    </if>
                    <div class="row cl news-list"><a href="/en/enter/historydetail?year={$item[0].tags}">
                        <div class="year <if condition='$i == 1'>begin</if><if condition='$i == 10'>end</if>">{$item[0].tags}</div>
                        <div class="tags"></div>
                         
                         <div class="right-txt">
                            <div class="row cl">
                                <div class="news-txt "><php>
                            $leng=mb_strlen($item[0]['name'],'utf-8');
                            echo ($leng>23)?mb_substr($item[0]['name'], 0, 23,
                            'utf-8').'...':$item[0]['name'];
                        </php></div>
                               <div class="news-more"></div>
                            </div>
                        </div>       
                        </a>         
                    </div>
                    
                </volist>            

                
            </div>    
            <div class="row cl main-btn mt-20" id="show_more">More</div>
        </div>
    </div>

</block>

    <block name="footer_js">
        <script>
        var data = {pg: 2, };

            $(function () {
                $('#show_more').click(function(){
                    
                    K.doAjax(data, window.document.location.href, function (res) {
                        if(!res.notice.length || 0 >= res.notice.length) {
                            return;
                        }

                        var lists = $('#list-history');
                        lists.find('.end').removeClass('end');

                        for (var i = 0; i < res.notice.length; i++) {

                            var temp1 = $('<div class="news-list-oper"><div class="bd"></div></div>');

                            var temp2 = '';
                            if(i >= (res.notice.length - 1)) {
                                temp2 = '<div class="row cl news-list"> <div class="year end">';
                            } else {
                                temp2 = '<div class="row cl news-list"> <div class="year">';
                            }

                            var temp3 = temp2 
                            + res.notice[i][0].tags + '</div><div class="tags"></div><div class="right-txt"><div class="row cl"><div class="news-txt ">'
                            + res.notice[i][0].name + '</div><a href="/en/enter/historydetail?year='+ res.notice[i][0].tags +'"><div class="news-more"></div></a></div></div></div> ';
                    
                            lists.append($(temp1));
                            lists.append($(temp3));
                        }

                        callLangChange();

                        if(res.total_pages <= data.pg) {
                             $('#show_more').hide();
                             return;
                        }

                        data.pg++;
                    });


                });
            });
            
        </script>
    </block>