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
.mainframe div {
	position: relative;
	width: 100%;
	max-width: 850px;
	margin: 0 auto;
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
	<br/> <br/>
	<div class="mainframe">
		<div>
			<section class="container">
				<div class="title_1">행복한 동행하개</div>
				<div style="font-size:17px;line-height: 140%;">
					<br> 더 많은 유기동물이 가족을 만날 수 있는 연결다리를 만들기 위한 프로젝트입니다.<br>
					국내에 등록된 반려동물은 100만마리 이상이며, 미등록된 동물들까지 합하면 그 숫자를 훨씬 늘어가고 있습니다.<br>
					그러나 그만큼 버려지는 동물들 또한 증가하는 추세입니다.<br>
					전국 2019년 기준, 전국에는 298곳의 유기동물 보호소가 운영되고 있으며, 10곳 중 1곳은 국가가 운영하고 있습니다.<br>
					국가 운영 보호소의 최대 보호기간은 10일입니다. 그 기간에 최대한 많은 아이들에게 함께해줄 가족을 만나게 하고 싶지만, 그것이
					마냥 쉽지는 않습니다.<br> 행동하개는 사각지대에 놓인 유기견들과 소중한 동행자분들을
					연결해주고,<br> 더 나아가 모든 강아지들이 자신의 터전을 찾아 행복하게 살아가는 것을 목표로 하고있습니다.<br>
					<br> 동물이 일상에 가족으로 스며든 삶, 모든 동물들이 웃을 수 있는 사회가 될 수 있도록 저희 행동하개가
					노력하겠습니다.<br> 모두 관심과 연대로 지지해주세요. <br> <br> <br>
					<br> <br>
				</div>
			</section>
		</div>
	</div>
	<div id="bottomFrame">Copyright © 2020 별이다섯개. All rights
		reserved.</div>
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