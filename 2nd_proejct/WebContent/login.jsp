<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/Css.css">
<link rel="stylesheet" href="css/Login.css">
<head>
<meta charset="UTF-8">
<title>행복하개</title>
<style>
.bottomFixed {
	position: fixed;
	bottom: 0px;
}

#loginFrame {
	margin: auto auto;
	width: 600px;
}

body {
	text-align: center;
}
</style>
</head>
<body>
	<form name="menuBar">
		<div id="menuframe">

			<table id="menu">
				<tr>
					<td class="menubtn" id="btn1" onClick=" location.href='Info.do' ">소개</td>
					<td class="menubtn" id="btn2" onClick=" location.href='Status.do' ">통계현황</td>
					<td class="menubtn" id="btn3" onClick=" location.href='Adopt.do' ">입양공고</td>
					<td class="menubtn" id="btn4" onClick=" location.href='Agency.do' ">연관기관</td>
					<td class="menubtn" id="btn5"
						onClick=" location.href='Developer.do' ">후원</td>
					<td class="menubtn" id="btn6"
						onClick=" location.href='Developer.do' ">개발진</td>
				</tr>
			</table>

		</div>
	</form>

	<div class="mainframe">
		<div id="loginFrame">
			<form action="Login.do" method="post">
				<br><br><br>
				<input type="text" class="signUpInput" name="id"
					placeholder="Type your username" autofocus required> 
				<input
					type="password" class="signUpInput" name="pw" placeholder="Choose a password"
					required> 
				<input type="submit" value="로그인"
					class="signUpButton">
			</form>
			</form>
		</div>
	</div>
	<div id="bottomFrame" class="bottomFixed">Copyright © 2020 별이다섯개.
		All rights reserved.</div>
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