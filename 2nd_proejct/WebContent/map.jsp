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
		var map = new kakao.maps.Map(document.getElementById('map'), { // ������ ǥ���� div
			center : new kakao.maps.LatLng(36.0683, 127.6358), // ������ �߽���ǥ 
			level : 13
		// ������ Ȯ�� ���� 
		});

		// ��Ŀ Ŭ�����ͷ��� �����մϴ� 
		var clusterer = new kakao.maps.MarkerClusterer({
			map : map, // ��Ŀ���� Ŭ�����ͷ� �����ϰ� ǥ���� ���� ��ü 
			averageCenter : true, // Ŭ�����Ϳ� ���Ե� ��Ŀ���� ��� ��ġ�� Ŭ������ ��Ŀ ��ġ�� ���� 
			minLevel : 10,
		// Ŭ������ �� �ּ� ���� ���� 
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

		// �����͸� �������� ���� jQuery�� ����մϴ�
		// �����͸� ������ ��Ŀ�� �����ϰ� Ŭ�����ͷ� ��ü�� �Ѱ��ݴϴ�
		$.get("./data/adopt_json.json", function(data) {
			// �����Ϳ��� ��ǥ ���� ������ ��Ŀ�� ǥ���մϴ�
			// ��Ŀ Ŭ�����ͷ��� ������ ��Ŀ ��ü�� ������ �� ���� ��ü�� �������� �ʽ��ϴ�
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

			// Ŭ�����ͷ��� ��Ŀ���� �߰��մϴ�
			clusterer.addMarkers(markers);
		});
	</script>
</body>
</html>