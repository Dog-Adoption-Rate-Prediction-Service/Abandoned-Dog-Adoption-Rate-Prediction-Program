<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.cluster-marker-50 {
	background-color: #c2185b;
	width: 80px;
	height: 80px;
	border-radius: 45px;
	text-align: center;
	margin: 0 auto;
	font-size: 16px;
	vertical-align: middle;
	line-height: 80px;
	opacity: 0.8;
	border: 5px solid #ffffff;
	font-weight: bold;
}
.cluster-marker-30 {
	background-color: #ef5350;
	width: 70px;
	height: 70px;
	border-radius: 40px;
	text-align: center;
	margin: 0 auto;
	font-size: 16px;
	vertical-align: middle;
	line-height: 70px;
	opacity: 0.8;
	border: 5px solid #ffffff;
	font-weight: bold;
}
.cluster-marker-10 {
	background-color: #ffb74d;
	width: 60px;
	height: 60px;
	border-radius: 33px;
	text-align: center;
	margin: 0 auto;
	font-size: 14px;
	vertical-align: middle;
	line-height: 60px;
	opacity: 0.8;
	border: 3px solid #ffffff;
	font-weight: bold;
}
.cluster-marker {
	background-color: #c0ca33;
	width: 50px;
	height: 50px;
	border-radius: 28px;
	text-align: center;
	margin: 0 auto;
	font-size: 14px;
	vertical-align: middle;
	line-height: 50px;
	opacity: 0.8;
	border: 3px solid #ffffff;
	font-weight: bold;
}
</style>
</head>
<body>
	<div id="map" style="width: 680px; height: 700px; margin:auto auto"></div>
	<script src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a6a35288a1a3e168f5137d757b21489&libraries=clusterer"></script>
	<script>
		var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
			center : new kakao.maps.LatLng(36.0683, 127.6358), // 지도의 중심좌표 
			level : 13
		// 지도의 확대 레벨 
		});

		// 마커 클러스터러를 생성합니다 
		var clusterer = new kakao.maps.MarkerClusterer({
			map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
			averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
			minLevel : 10,
		// 클러스터 할 최소 지도 레벨 
		});

		kakao.maps.event.addListener(clusterer, 'clustered',
				function(clusters) {

					clusters.forEach(function(cluster) {
								var adopt_sum = 0;
								var sum = 0;
								cluster.getMarkers().forEach(function(marker) {
									adopt_sum += (parseInt(marker.getTitle()));
									sum += 1;
									console.log(sum);
									//sum += (parseInt(marker.data.adopt));
									//sum += (parseInt(marker.data.end));
								});
								var result = 0; 
								result = (100-parseInt(((parseInt(adopt_sum) / parseInt(sum)) * 1000))/10);
								if(result>=90){
								cluster.getClusterMarker().setContent(
										'<div class="cluster-marker-50">'
												+ result
												+ "%</div>");
								}
								else if(result>=80){
									cluster.getClusterMarker().setContent(
											'<div class="cluster-marker-30">'
													+ result
													+ "%</div>");	
								}
								else if(result>=60){
									cluster.getClusterMarker().setContent(
											'<div class="cluster-marker-10">'
													+ result
													+ "%</div>");	
								}else{
									cluster.getClusterMarker().setContent(
											'<div class="cluster-marker">'
													+ result
													+ "%</div>");	
								}
								//cluster.getClusterMarker().setContent(
								//		'<div class="cluster-marker">'
								//				+ parseInt(((parseInt(adopt_sum) / parseInt(sum)) * 1000))/10
								//				+ "%</div>");
								//cluster.getClusterMarker().setContent('<div class="cluster-marker">' + sum + "</div>");
							});
				});

		// 데이터를 가져오기 위해 jQuery를 사용합니다
		// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
		$.get("./data/adopt_json.json", function(data) {
			// 데이터에서 좌표 값을 가지고 마커를 표시합니다
			// 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
			var markers = $(data.positions).map(
					function(i, position) {
						var marker = new kakao.maps.Marker({
							title : ("0" + position.adopt),
							position : new kakao.maps.LatLng(position.lat,
									position.lng)
						});
						marker.data = position;
						return marker;
					});

			// 클러스터러에 마커들을 추가합니다
			clusterer.addMarkers(markers);
		});
	</script>
</body>
</html>