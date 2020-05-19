<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/Css.css?after">
<link rel="stylesheet" href="css/Board.css">
<head>
<meta charset="UTF-8">
<title>행복하개</title>
<style>
#board_title {
	width: 70%;
	font-size: 24px;
	vertical-align: bottom;
}

#written {
	width: 10%;
	vertical-align: bottom;
}

#date {
	width: 20%;
	text-align: right;
	vertical-align: bottom;
}

#content {
	padding: 20px 20px;
	width: 100%;
}

table tr td{
	padding: 20px 20px;
}

.type09 {
	width: 80%;
	margin: auto auto;
}

.type09 tbody tr {
	border-bottom: 1px solid #777777;
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
				onClick=" location.href='Notice.do' ">공지사항</span>
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
						onClick=" location.href='Developer.do' ">후원</td>
					<td class="menubtn" id="btn6"
						onClick=" location.href='Developer.do' ">개발진</td>
				</tr>
			</table>

		</div>
	</form>

	<div class="mainframe">
		<div>
			<table class="type09">
				<thead>
					<tr>
						<th scope="cols" id="board_title"><Strong>${noticeBoard.title}</Strong></th>
						<th scope="cols" id="written">${noticeBoard.written}</th>
						<th scope="cols" id="date">${noticeBoard.date}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan=3 id="content">${noticeBoard.content}</td>
					</tr>
				</tbody>
				<tr>
					<td colspan=3 align="right">
					<c:if
							test="${not empty sessionScope.id }">
							<button onClick=" location.href='writenotice.jsp' ">공지작성</button>
						</c:if>
						<button onClick=" location.href='notice.jsp' ">목록</button>
					</td>
				</tr>
			</table>
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