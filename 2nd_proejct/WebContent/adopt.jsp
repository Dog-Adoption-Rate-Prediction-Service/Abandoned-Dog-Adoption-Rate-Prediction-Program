<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/Css.css">
<head>
<meta charset="UTF-8">
<title>행복하개</title>
<style>
.mainframe table {
	
}

.img_dog {
	width: 150px;
	height: 250px;
	border: 2px dashed #ddd;
}

.img_dog>img {
	width: 150px;
	height: auto;
	max-height: 250px;
}

.dog_tmp {
	padding: 10px 10px;
	border: 1px dashed #ddd;
	width: 300px;
}

span.interval {
	display: block;
	height: 5px;
}

.dog_tmp>span>span {
	display: inline-block;
	border: 1px solid #ef6c00;
	padding: 2px 2px;
}

.goButton {
	width: 100%;
	heigth: 54px;
	padding: 0;
	font-size: 16px;
	text-aling: center;
	text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
	background: #ef6c00;
	border: 0;
	cursor: pointer;
	padding: 10px;
	border-bottom: 2px solid #D76B60;
	border-radius: 5px;
	box-shadow: inset 0 -2px #D76B60;
	font-family: 'MapoPeacefull';
	color: white;
}

.clkButton {
	width: 100%;
	heigth: 54px;
	padding: 0;
	font-size: 16px;
	text-aling: center;
	text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
	background: #ffffff;
	border: 1px solid #ef6c00;
	cursor: pointer;
	padding: 10px;
	box-shadow: inset 0 -2px #D76B60;
	font-family: 'MapoPeacefull';
	color: black;
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
			<div align="right">
				<c:choose>
					<c:when test="${sessionScope.pre eq '0'}">
						<button class="clkButton"
							onclick="location.href='AdoptPre.do?num=1&pre=1'"
							style="width: 150px">공고임박</button>
					</c:when>
					<c:otherwise>
						<button class="clkButton"
							onclick="location.href='Adopt.do?num=1&pre=0'"
							style="width: 150px">기본</button>
					</c:otherwise>
				</c:choose>
			</div>
			<div style="height:20px"></div>
			<table>
				<c:forEach var="item" items="${adoptList}" begin="0"
					end="${fn:length(adoptList)-1}" step="2" varStatus="status">
					<tr>
						<td class="img_dog"><img src="${item.img}"></td>
						<td class="dog_tmp"><span><span><strong>공고기간</strong></span>&ensp;${item.limitDate}</span>
							<span class="interval"></span> <span><span><strong>접수일자</strong></span>&ensp;${item.day}</span>
							<span class="interval"></span> <span><span><strong>품종</strong></span>&ensp;${item.kind}</span>
							<span class="interval"></span> <span><span><strong>성별</strong></span>&ensp;${item.sex}</span>
							<span class="interval"></span> <span><span><strong>보호센터</strong></span>&ensp;${item.centerName}</span>
							<span class="interval"></span> <span><span><strong>전화번호</strong></span>&ensp;${item.phone}</span>
							<span class="interval"></span> <span class="interval"></span>
							<button class="goButton" onclick="location.href='${item.link}'">바로가기</button>
						</td>
						<c:choose>
							<c:when test="${not empty adoptList[status.index+1]}">
								<td class="img_dog"><img
									src="${adoptList[status.index+1].img}"></td>
								<td class="dog_tmp"><span><span><strong>공고기간</strong></span>&ensp;${adoptList[status.index+1].limitDate}</span>
									<span class="interval"></span> <span><span><strong>접수일자</strong></span>&ensp;${adoptList[status.index+1].day}</span>
									<span class="interval"></span> <span><span><strong>품종</strong></span>&ensp;${adoptList[status.index+1].kind}</span>
									<span class="interval"></span> <span><span><strong>성별</strong></span>&ensp;${adoptList[status.index+1].sex}</span>
									<span class="interval"></span> <span><span><strong>보호센터</strong></span>&ensp;${adoptList[status.index+1].centerName}</span>
									<span class="interval"></span> <span><span><strong>전화번호</strong></span>&ensp;${adoptList[status.index+1].phone}</span>
									<span class="interval"></span> <span class="interval"></span>
									<button class="goButton"
										onclick="location.href='${adoptList[status.index+1].link}'">바로가기</button>
								</td>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>

			</table>
			<div id="paging" align="center"></div>
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

	    var totalData = ${sessionScope.adoptAllNum};   // 총 데이터 수. 여기 변환법 질문
	    //var totalData = 130;    // 총 데이터 수
	    var dataPerPage = 10;    // 한 페이지에 나타낼 데이터 수
	    var pageCount = 10;        // 한 화면에 나타낼 페이지 수
//	    sessionStorage.setItem("currentPage",currentPage);
//	    ${sessionScope.currentPage} = currentPage;

//		$.session("currentPage",currentPage);
		
//		console.log("session currentPage : " + ${sessionScope.currentPage});
	    function paging(totalData, dataPerPage, pageCount, currentPage){
	        
	        console.log("currentPage : " + currentPage);
	        
	        var totalPage = Math.ceil(totalData/dataPerPage);    // 총 페이지 수
	        var pageGroup = Math.ceil(currentPage/pageCount);    // 페이지 그룹
	        
	        console.log("pageGroup : " + pageGroup);
	        
	        var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
	        if(last > totalPage)
	            last = totalPage;
	        var first = last - (pageCount-1);// 화면에 보여질 첫번째 페이지 번호
	        if(first <= 0){
	        	first = 1;
	        }
	        var next = last+1;
	        var prev = first-1;
	        
	        console.log("last : " + last);
	        console.log("first : " + first);
	        console.log("next : " + next);
	        console.log("prev : " + prev);
	 
	        var $pingingView = $("#paging");
	        
	        var html = "";
	        
	        if(prev > 0)
	            html += "<a href=# id='prev'><</a> ";
	        
	        for(var i=first; i <= last; i++){
	            html += "<a href='#' id=" + i + ">" + i + "</a> ";
	        }
	        
	        if(last < totalPage)
	            html += "<a href=# id='next'>></a>";
	        
	        $("#paging").html(html);    // 페이지 목록 생성
	        $("#paging a").css("color", "black");
	        $("#paging").css("margin-top", "10px");
	        $("#paging a#" + currentPage).css({"text-decoration":"none", 
	                                           "color":"red", 
	                                           "font-weight":"bold"});    // 현재 페이지 표시
	                                           
	        $("#paging a").click(function(){
	            
	            var $item = $(this);
	            var $id = $item.attr("id");
	            var selectedPage = $item.text();
	            
	            if($id == "next")    selectedPage = next;
	            if($id == "prev")    selectedPage = prev;
	           	//session.setAttribute('currentPage',currentPage);
	            //var temp = session.getAttribute('currentPage');
	            //console.log(temp); 
	            var temp_url = 'Adopt.do?num='+selectedPage;
	            location.href=temp_url;
	            //paging(totalData, dataPerPage, pageCount, selectedPage);
	        });
	                                           
	    };
	    
	    $("document").ready(function(){
	    	var address = unescape(location.href); 
	    	var param = ""; 
	    	if(address.indexOf("num", 0) != -1) {
	    		param = address.substring(address.indexOf("num", 0) + 4);
				console.log("param: "+ param);
			} else {
				param = "1";
			}
			//displayTab(param);
			param = Number(param);
	        paging(totalData, dataPerPage, pageCount, param);

	    });
		
	</script>
</body>
</html>