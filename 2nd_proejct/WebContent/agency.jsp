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
.mainframe {
	font-family: 'Nanum Square';
}

.container {
	width: 100%;
	vertical-algin: middle;
	position: relative;
	padding-right: 15px;
	padding-left: 100px;
	margin-right: auto;
	margin-left: auto;
	box-sizing: border-box;
}
.container tr{
	height: 60px;
}

.size_logo{
	width:230px;
	height:45px;
}

.logo_left{
	padding-left:2em;
	font-size:17px;
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
		<div>
			<section class="container">
				<h2 class="title_1">기관소개</h2>

				<div style="font-size:19px;line-height: 140%;">
					학대로부터 고통받은 동물들을 구조 및 돌봄에 최선의 노력을 하고 있는 단체를 소개합니다. <br> 유기동물 발견시
					아래 단체의 도움을 받으세요. <br> <br> <br> 				
				</div>



				<table>
					<tr>
						<td><a href="https://www.animal.go.kr" target="_blank"><img class="size_logo"
								src="./img/agency1.PNG" class="agencyLogo"></a></td>
						<td class = "logo_left"><a href="https://www.animal.go.kr" target="_blank">동물보호관리시스템</a></td>
					</tr>
					<tr>
						<td><a href="http://www.kcanimal.or.kr/" target="_blank"><img class="size_logo"
								src="./img/agency2.png" class="agencyLogo"></a></td>
						<td class = "logo_left"><a href="http://www.kcanimal.or.kr/" target="_blank">광주광역시
								동물보호소</a></td>
					</tr>
					<tr>
						<td><a href="https://zooseyo.or.kr" target="_blank"><img class="size_logo"
								src="./img/agency3.png" class="agencyLogo"></a></td>
						<td class = "logo_left"><a href="https://zooseyo.or.kr" target="_blank">종합유기견보호센터</a></td>
					</tr>
					<tr>
						<td><a href="https://www.animals.or.kr/" target="_blank"><img class="size_logo"
								src="./img/agency4.PNG" class="agencyLogo"></a></td>
						<td class = "logo_left"><a href="https://www.animals.or.kr/" target="_blank">동물자유연대</a></td>
					</tr>
					<tr>
						<td><a href="http://www.animal.or.kr/" target="_blank"><img class="size_logo"
								src="./img/agency5.png" class="agencyLogo"></a></td>
						<td class = "logo_left"><a href="http://www.animal.or.kr/" target="_blank">유기견보호센터</a></td>
					</tr>
				</table>
				<br/> <br/>
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