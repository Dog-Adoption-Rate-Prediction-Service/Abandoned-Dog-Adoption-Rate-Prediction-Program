<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/Css.css">
<head>
<meta charset="UTF-8">
<title>행복하개</title>
<style>
#mainframe_2 {
	algin: center;
	background-color: #e6e6e6;
	padding: 30px;
	width: 100%;
	font-family: 'Nanum Square';
	box-sizing: border-box;
}

#mainframe_2 table {
	position: relative;
	width: 100%;
	max-width: 1000px;
	margin: 0 auto;
	border:none;
}

#mainframe_2 table td {
	width: 20%;
	max-width: 200px;
}

#mainframe_2 div {
	
}

#mainframe_2>div {
	position: relative;
	width: 100%;
	max-width: 1000px;
	margin: 0 auto;
	padding: auto auto;
	text-align: center;
}

.point{
	background-color: orange;
	color:white;
	font-weight: 200;
}

.point_word {
	font-family: 'Cafe24Dangdanghae';
	font-size: 24px;
	color: #ef6c00;
	padding-bottom: 10px;
}

.bg_gray{
	background-color: #e6e6e6;
}

.content_left{
	margin-left: 3em;
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
	<div id="mainframe_2">
		<div>
			<table style="width:100%; align:center">
				<tr>
					<td><img src="./img/dev_1.png" style="width:100%"></td>
					<td><img src="./img/dev_2.png" style="width:100%"></td>
					<td><img src="./img/dev_3.png" style="width:100%"></td>
					<td><img src="./img/dev_4.png" style="width:100%"></td>
					<td><img src="./img/dev_5.png" style="width:100%"></td>
				</tr>
				<tr style="font-size:22px;font-weight:bold;height:36px;">
					<td>윤별(팀장)</td>
					<td>김은주(부팀장)</td>
					<td>김지현</td>
					<td>문하영</td>
					<td>이설의</td>
				</tr>
				<tr style="vertical-align:text-top">
					<td>프로젝트총괄<br>데이터수집<br>텍스트마이닝<br>데이터 모델링</td>
					<td>데이터수집<br>데이터 전처리<br>데이터 모델링<br>발표</td>
					<td>데이터수집<br>텍스트마이닝<br>웹페이지 디자인</td>
					<td>데이터수집<br>데이터 전처리<br>데이터 모델링<br>ppt제작</td>
					<td>데이터수집<br>DB 설계 및 구축<br>웹페이지 구현</td>
				</tr>
			</table>
		</div>
	</div>
	<br>
	<div class="mainframe content_left">
		<div>
			<div class="title_1">개발배경</div><br>
			<div style="font-size:18px;line-height: 140%;">		
				유기된 동물을 보호하기 위해 공공기관을 비롯한 여러 단체들이 수고를 하고 있습니다.<br>
				하지만 매년 유기동물들의 수가 증가하고 있으며, 그에 비해 <span class="point">입양률</span>은 <span class="point">30%</span>도 미치지 못하는 상황입니다.<br/>         
	            유기동물의 입양이 원활히 이루어지게 위해 홈페이지에 일정기간을 두고 공고에 올립니다. <br>
	            그러나 시간이 지나면 먼저 공고되어 있던 유기동물이 최근에 오는 유기동물에게 밀려나서 <br>
	            유기동물 입양에 관심있는 사람에게 더 눈에 띄기 힘들어지고, 입양될 확률이 더 떨어지게 됩니다.<br>
	            그동안 질병이 깊어져 자연사가 이뤄지기도 하고, 끝내 입양되지 않은 동물은 <span class="point">안락사</span>에 처하게 됩니다.<br>
				<br>
	            한편으로 강아지공장에서 나온 강아지들이 펫샵에서 많이 입양되
	            고 있습니다. <br>
	            펫샵 수요가 있을수록 강아지 공장은 줄어들지 않고 오히려 증가시키는 원인이 된다고 생각하였습니다. <br>
	            펫샵에서 입양하는 것보다 유기동물의 <span class="point">입양률</span>을 <span class="point">증가</span>시키고, <br>
	            <span class="point">안락사</span> 비율을 <span class="point">감소</span>할 수 있을 만한 서비스를 제공하는 것이 좋을 것이라 판단하였습니다.<br/>	            
	            <br>
	            그래서 저희 <span class="point_word">행동하개</span>는 <br>
	            임시보호자 또는 봉사자, 동물을 아끼는 사람들을 타겟층으로 웹페이지 개발하는 것에 목적을 두었고,<br>
	            공고기간이 임박하여 안락사 위험에 처한 동물을 다시 한 번 눈여겨 볼 수 있도록 하였습니다.
	            <br> <br> <br> <br>
			</div>
		</div>
	</div>
	<div id="bottomFrame">Copyright © 2020 별이다섯개. All rights reserved.</div>
	<script src="js/jquery-3.4.1.min.js"></script>
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

		//이미지 슬라이드
		let num = 1;
		const imgNum = 3;
		const img = document.querySelector('#imageslide');

		//일정 시간이 지날 떄 마다 실행하는 함수
		//interval: 밀리초 단위(1000 = 1초)
		setInterval(function() {
			nextImg();
		}, 4000)

		function nextImg() {
			num++;
			if (num === imgNum + 1) {
				num = 1
			}
			url = 'img/img' + num + '.png';
			$('#imageslide').attr("src", url);
		}

		const btn = document.querySelectorAll('.menubtn');

		for (let i = 0; i < btn.length; i++) {
			btn[i].addEventListener('click', moveLink);
		}

		function moveLink() {
			const thisBtn = this.getAttribute('id');
			/* session.setAttribute('btn',thisBtn); */
			sessionStorage.setItem('btn', thisBtn);
			console.log(thisBtn)
			/* var f = document.menuBar;

			// input태그의 값들을 전송하는 주소
			f.action = "AccessLinkService"

			// 전송 방식 : post
			f.method = "post"
			f.submit(); */
		}
	</script>
</body>
</html>