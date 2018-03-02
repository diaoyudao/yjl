<extend name="./Application/Home/View/mobile/base/common.tpl"/>
<block name="head_common1">
    <link rel="stylesheet" href="/public/css/mobile/business/landmapsearch.css">
</block>
<block name="head_common2">
</block>
<block name="title">地产-雅居乐集团</block>
<block name="head_menu">
    <a class="tip">楼盘地图周边/</a>
</block>

<block name="body_main">

    <div class="" id="estate_map">
        <div class="main">
            <div id="map">
                <!--<img src="/public/img/home/business/estate/detail/estate_map.jpg" alt="">-->
            </div>
            <div class="container">
                <div class="mt-20">
                    <ul>
                        <li class="active">交通</li>
                        <li>教育</li>
                        <li>医疗</li>
                        <li>商业</li>
                    </ul>
                </div>
                <div id="results" class="mt-20 mb-20"></div>
            </div>
        </div>
    </div>

</block>

<block name="footer_js">
    <script src="http://api.map.baidu.com/api?v=2.0&ak=2PnDtDDG2ISO2qtFw4GLT4CMdZajY5hM"
            type="text/javascript"></script>
    <script>
        $(function () {
            var map = new BMap.Map("map");
            var point_x = '{$Think.get.x}';
            var point_y = '{$Think.get.y}';
            map.centerAndZoom(new BMap.Point(point_x, point_y), 15);
            var point = new BMap.Point(point_x, point_y);


            var myIcon = new BMap.Icon("/public/img/home/business/estate/detail/index_z_2327d6a.png", new BMap.Size(23, 33), {
                imageOffset: new BMap.Size(0, 0 - 11 * 25) // 设置图片偏移
            });
            var title = '{$Think.get.name}';
            var w = title.length / 2 * 10 - 4;
            var label = new BMap.Label(title,{offset:new BMap.Size(-w,-20)});
            var marker2 = new BMap.Marker(point,{icon:myIcon,offset: new BMap.Size(0, -14)});  // 创建标注
            map.addOverlay(marker2);
            marker2.setLabel(label);
            var local = new BMap.LocalSearch(map,
                    {renderOptions: {map: map, panel: "results", autoViewport: false}});
            local.disableFirstResultSelection();
            var arr = ['公交', '学校', '医疗', '商场'];
            local.searchInBounds(arr[0], map.getBounds());
            searchTab();


            //        map.addControl(new BMap.NavigationControl());
            //                map.addControl(new BMap.CopyrightControl(''));
            //                map.addControl(new BMap.OverviewMapControl());
            //        map.addControl(new BMap.MapTypeControl());
            //        map.setCurrentCity("北京");
            function searchTab() {
                $(".container ul li").click(function () {
                    var index = $(this).index();

                    local.searchInBounds(arr[index], map.getBounds());
                    $(this).addClass("active").siblings("li").removeClass("active");
                })
            }
        });
    </script>
</block>