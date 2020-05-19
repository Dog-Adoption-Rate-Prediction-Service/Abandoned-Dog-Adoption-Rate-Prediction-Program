<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/Css.css?after">
<head>
<meta charset="UTF-8">
<title>행복하개</title>
<style>
#menuframe {
	width: 100%;
	height: 60px;
	algin: center;
	background-color: white;
	opacity: 0.9;
	vertical-align: middle;
	z-index: 10;
	border-bottom: 2px solid #ef6c00;
}
.mainframe{
	z-index: 1;
}
</style>
</head>
<body>
		<div id="topbar">
		<div>

			<c:choose>
				<c:when test="${empty sessionScope.id }">
					<span class="topbtn" onClick=" location.href='login.jsp' ">로그인</span>
				</c:when>
				<c:otherwise>
					<span class="topbtn" onClick="location.href='Logout.do'">로그아웃</span>
				</c:otherwise>
			</c:choose>
			<span> | </span><span class="topbtn"
				onClick=" location.href='Notice.do?num=1' ">공지사항</span>
		</div>
	</div>
	<table id=title>
		<tr>
			<td><a href="main.jsp"><img src="img/title_logo.png"></a></td>
		</tr>
	</table>
	<form name="menuBar">
		<div id="menuframe">

			<table id="menu">
				<tr>
					<td class="menubtn" id="btn1" onClick=" location.href='Info.do' ">소개</td>
					<td class="menubtn" id="btn2" onClick=" location.href='Status.do' ">통계현황</td>
					<td class="menubtn" id="btn3" onClick=" location.href='Adopt.do' ">입양공고</td>
					<td class="menubtn" id="btn4" onClick=" location.href='Agency.do' ">연관기관</td>
					<td class="menubtn" id="btn5"
						onClick=" location.href='Support.do' ">후원</td>
					<td class="menubtn" id="btn6"
						onClick=" location.href='Developer.do' ">개발진</td>
				</tr>
			</table>

		</div>
	</form>

	<div class="mainframe">
				<div style="clear:left"></div>
		<div style="margin:50px auto">
		<div class="title_mapo" style="float:clear">전국 비입양률 분포</div>
		<hr size="1" style="width:100%; max-width: 800px">
			<div style="padding: auto auto">
		<div style="margin: auto auto;display=inline-block;width:800px;height:740px">
			<iframe src="map.jsp"
							style="height: 100%; width: 100%" frameborder=0></iframe>
					
				</div></div>
		</div>
		<div style="clear:left"></div>
	</div>
	<div id="bottomFrame">Copyright © 2020 별이다섯개. All rights
		reserved.</div>



	<script src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a6a35288a1a3e168f5137d757b21489&libraries=clusterer"></script>
	<script>
		$(document).ready(function() {
			var jbOffset = $('#menuframe').offset();
			$(window).scroll(function() {
				if ($(document).scrollTop() > jbOffset.top) {
					$('#menuframe').addClass('jbFixed');
					$('#menu').addClass('jbMenuFixed');
					console.log("고정")
				} else {
					$('#menuframe').removeClass('jbFixed');
					$('#menu').removeClass('jbMenuFixed');
				}
			});
		});

		var dogmap = new kakao.maps.Map(document.getElementById('dogmap'), { // 지도를 표시할 div
			center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
			level : 13
		// 지도의 확대 레벨 
		});

		// 마커 클러스터러를 생성합니다 
		var clusterer = new kakao.maps.MarkerClusterer({
			map : dogmap, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
			averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
			minLevel : 10
		// 클러스터 할 최소 지도 레벨 
		});

		// 데이터를 가져오기 위해 jQuery를 사용합니다
		// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
		$.get("./data/loc_json.json", function(data) {
			// 데이터에서 좌표 값을 가지고 마커를 표시합니다
			// 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
			var dogmarkers = $(data.positions).map(
					function(i, position) {
						return new kakao.maps.Marker({
							position : new kakao.maps.LatLng(position.lat,
									position.lng)
						});
					});

			// 클러스터러에 마커들을 추가합니다
			dogclusterer.addMarkers(dogmarkers);
		});
		
		
		
		var shelterMap = new kakao.maps.Map(document.getElementById('shelterMap'), { // 지도를 표시할 div
			center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
			level : 13
		// 지도의 확대 레벨 
		});

		// 마커 클러스터러를 생성합니다 
		var shelterClusterer = new kakao.maps.MarkerClusterer({
			map : shelterMap, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
			averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
			minLevel : 10
		// 클러스터 할 최소 지도 레벨 
		});

		// 데이터를 가져오기 위해 jQuery를 사용합니다
		// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
		$.get("./data/shelter_json.json", function(data) {
			// 데이터에서 좌표 값을 가지고 마커를 표시합니다
			// 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
			var shelterMarkers = $(data.positions).map(
					function(i, position) {
						return new kakao.maps.Marker({
							position : new kakao.maps.LatLng(position.lat,
									position.lng)
						});
					});

			// 클러스터러에 마커들을 추가합니다
			shelterClusterer.addMarkers(shelterMarkers);
		});
		
		var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
			center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
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