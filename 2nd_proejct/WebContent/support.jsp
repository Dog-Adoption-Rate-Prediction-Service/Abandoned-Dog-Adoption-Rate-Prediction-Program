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
	margin: 0px 0px;
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

div.pannel {
	position: relative;
	padding: auto auto;
	display: inline-block;
	text-align: center;
}

#mainframe_2 div.interval {
	display: inline-block;
	width: 10px;
}

#mainframe_0 {
	width: 100%;
	position: relative;
	margin: 0px 0px;
	width: 100%;
	padding: 0px 0px;
}

.interval{
	height: 50px;
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
	<div id="mainframe_0">
		<img src="img/support_top.png"
			style="margin: 0px auto; width: 100%; position: relative;">
	</div>
	<div class="mainframe">
		<div>
			<div class="title_1">유기동물 보호소 현장 실태</div>
			<div style="font-size:17px;line-height: 140%;">
				<br>5가구 중 1가구는 반려동물과 함께하고 있습니다. 이미 동물은 가족 구성원의 일부가 된 것이죠. <br><br> 그리고
				그만큼 매년 버려지는 동물 또한 늘어나고 있습니다. <br/>2008년 전국 유기동물 수는 7만 7877마리였지만, 2017년
				10만 2593마리로 급증했습니다. 그러나, 보호소는 점점 더 감소하는 추세입니다. 2019년 동물보호법이 개정되고, 보호기간이
				늘었음에도 5마리 중 1마리는 안락사가 되고 있습니다.<br><br> 국가에서 운영하는 유기동물 보호소 외에도 다양한
				보호소와 센터가 부족하지만, 버려지는 동물의 수에 비하여 지원이 부족한 실정입니다.<br/>이 때문에 좀 더 많은 아이들을
				보호하고, 자리를 찾아주고 싶어도 그러기가 어려운 것이 현실입니다.<br><br> 이를 극복하기 위해, 많은 분들이
				자원봉사와 후원이라는 형태로 아이들을 돕고 있습니다.
			</div>
			<div class="interval"></div>
			<div class="title_1">자원봉사와 후원</div>
			<div style="font-size:17px;line-height: 140%;">
				<br>유기동물에 대한 지원은 크게 두 가지로 나뉩니다. 자원봉사와 후원입니다.<br><br> 자원봉사는, 봉사자가 직접
				보호소에 방문하여 돕는 것입니다. 아이들의 수에 비해 봉사자 수가 열악하여, 보호소 중에는 좋지 않은 환경이 유지되는
				경우가 많습니다. 자원봉사자들은 보호소에 방문하여, 견사를 청소하거나 배식을 하고, 이불을 깔아주는 일을 도맡습니다. 더
				나아가, 아이들과 함께 산책을 할 수도 있죠. 많은 동물들이 있어 하나 하나 애정을 주기 어려운 환경이므로, 봉사자의
				방문은 분명 아이들에게 큰 기쁨이 될 것입니다.<br><br> 후원은, 물질적인 방식으로 아이들을 돕는 것입니다. 사료나
				담요 등을 보호소에 보내는 경우도 있으며, 직접 보호소에 금전적 후원을 하는 경우도 있습니다. 강아지가 분양가기 전에
				지원하는 결연 후원, 혹은 보호소가 아닌 동물단체에게 주기적으로 후원하는 정기 후원 등이 존재합니다.<br> 직접
				동물들에게 도움의 손길을 건네고 싶다면 아래의 페이지에 방문해보세요!
			</div>
		</div>
	</div>
		<div id="mainframe_2">
		<div>
			<div>
				<div class="pannel"
					onClick=" location.href='http://www.zooseyo.or.kr/Yu_board/volunteer_listV.php' ">
					<img src="./img/support_2.png">
				</div>
				<div class="interval"></div>
				<div class="pannel"
					onClick=" location.href='https://www.animals.or.kr/support/intro' ">
					<img src="./img/support_1.png">
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
				} else {
					$('#menuframe').removeClass('jbFixed');
					$('#menu').removeClass('jbMenuFixed');
				}
			});
			$("#mainframe_0").on("click", function(event) {
				// 이동 버튼을 클릭시 pre 태그로 스크롤의 위치가 이동되도록 한다.

				// 1. pre태그의 위치를 가지고 있는 객체를 얻어온다. => offset 객체
				var offset = $("#mainframe_2").offset();
				// offset은 절대 위치를 가져온다. offset.top을 통해 상단의 좌표를 가져온다.
				// position은 부모를 기준으로한 상대위치를 가져온다.
				$("html, body").animate({
					scrollTop : offset.top
				}, 1000);

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

		$(document).ready(function() {
			$("#mainframe_0").on("click", function(event) {
				// 이동 버튼을 클릭시 pre 태그로 스크롤의 위치가 이동되도록 한다.

				// 1. pre태그의 위치를 가지고 있는 객체를 얻어온다. => offset 객체
				var offset = $("#mainframe_2").offset();

				// offset은 절대 위치를 가져온다. offset.top을 통해 상단의 좌표를 가져온다.
				// position은 부모를 기준으로한 상대위치를 가져온다.
				$("html body").animate({
					scrollTop : offset.top
				}, 2000);

			});
		});// end of ready()
	</script>
</body>
</html>