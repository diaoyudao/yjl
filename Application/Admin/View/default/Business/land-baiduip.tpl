<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
	<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=eSQsLuFoxGfRvRw4oNy98nX0kQfKo02w&s=1"></script>
		<title>鼠标滚轮缩放地图</title>
</head>
<body>
    <div style="margin: 10px 10px;">
		<label>按地址查询坐标：</label><input type="text" name="address"/>
		<button onclick="searchIp();" type="button">搜索</button>
	</div>
	<div style="margin:0 10px 10px;">
		<label>x坐标（经度）：</label><input type="text" name="x-post"/>
		<label>y坐标（纬度）：</label><input type="text" name="y-post"/>
		<button onclick="confirmIp();">确定</button>
	</div>
	<div id="allmap"></div>
</body>
</html>
<script type="text/javascript" src="/public/huiadmin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/public/js/lib/common-1.js"></script>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");            
              
	map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
	map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用

	// 百度地图API功能
         
	map.centerAndZoom("广州",12);  
	map.setDefaultCursor("url('bird.cur')");         
	//单击获取点击的经纬度
	map.addEventListener("click",function(e){
		$('input[name=x-post]').val(e.point.lng);
		$('input[name=y-post]').val(e.point.lat);
	});

	var confirmIp = function() {
		window.parent.$('input[name=positon_x]').val($('input[name=x-post]').val());
		window.parent.$('input[name=positon_y]').val($('input[name=y-post]').val());

		K.removeIframe();
	}

	var searchIp = function() {
		var address = $('input[name=address]').val();

		if("" == address) {
			return false;
		}

		// 创建地址解析器实例
	var myGeo = new BMap.Geocoder();
	// 将地址解析结果显示在地图上,并调整地图视野
	myGeo.getPoint(address, function(point){
		if (point) {
			map.centerAndZoom(point, 16);
			map.addOverlay(new BMap.Marker(point));

			console.log(point);

			$('input[name=x-post]').val(point.lng);
			$('input[name=y-post]').val(point.lat);
		}else{
			alert("您选择地址没有解析到结果!");
		}
	}, "中国");

	}
</script>