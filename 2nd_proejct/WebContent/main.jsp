<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/Css.css?after">
<head>
<meta charset="UTF-8">
<style>
.mainframe table {
	width: 100%;
}

.mainframe table th {
	text-align: left;
	border-bottom: 3px solid #ef6c00;
}

.img_slide {
	cursor: pointer;
}

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
}

#mainframe_2 table td {
	width: 50%;
	border: 3px solid #ef6c00;
	max-width: 300px;
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

#mainframe_2 div.pannel {
	display: inline-block;
	width: 490px;
	height: 300px;
	max-width: 490px;
	cursor: pointer;
}
div.pannel{
	position: relative;
	padding: auto auto;
	display: inline-block;
	text-align: center;
}


#mainframe_2 div.interval {
	display: inline-block;
	width: 10px;
}
</style>
<title>행복하개</title>
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

	<div class="img_slide">
		<div>
			<img src="img/img1.png" id="imageslide">
		</div>
	</div>
	<div class="mainframe">
		<div>
			<table>
				<tr>
					<th class="title_1"><span onClick=" location.href='Adopt.do?num=1' " style="cursor:pointer">입양공고</span></th>
					<th class="title_1"><span onClick=" location.href='Notice.do?num=1' " style="cursor:pointer">공지사항</span></th>
				</tr>
				<tr>
					<td width=60% height="620px"><iframe src="MainAdopt.do"
							style="height: 100%; width: 100%" frameborder=0></iframe></td>
					<td width=40% height="620px"><iframe src="MainNotice.do?num=1"
							style="height: 410px; width: 100%" frameborder=0></iframe>
						<div class="pannel"
							style="height: 210px; width: 100%; background-color: #ffffcc; cursor: pointer"
							onClick=" location.href='Developer.do' ">
							<img src="./img/main_develop.png">
						</div></td>
				</tr>
			</table>
		</div>
	</div>
	<div id="mainframe_2">
		<div>
			<div>
				<div style="background-color: #ffdc93" class="pannel"
					onClick=" location.href='Status.do' ">
					<img src="./img/main_pannel_1.png">
				</div>
				<div class="interval"></div>
				<div style="background-color: #05bbff" class="pannel"
					onClick=" location.href='Support.do' ">
					<img src="./img/main_pannel_2.png">
				</div>
			</div>
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
		const imgNum = 2;
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
			url = './img/img' + num + '.png';
			$('#imageslide').attr("src", url);
			if (num === 1) {
				$('.img_slide')
						.attr(
								"onclick",
								"location.href = 'Info.do'");
			}
			if (num === 2) {
				$('.img_slide')
						.attr(
								"onclick",
								"location.href = 'https://www.qia.go.kr/animal/protect/ani_prot_ani_law_cont.jsp'");
			}
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

		$(function() {
			$("iframe.myFrame")
					.load(
							function() { //iframe 컨텐츠가 로드 된 후에 호출됩니다.
								var frame = $(this).get(0);
								var doc = (frame.contentDocument) ? frame.contentDocument
										: frame.contentWindow.document;
								$(this).height(doc.body.scrollHeight);
								$(this).width(doc.body.scrollWidth);
							});
		});
	</script>
</body>
</html>