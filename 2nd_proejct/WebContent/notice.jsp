<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/Css.css?after">
<link rel="stylesheet" href="css/Board.css?after">
<head>
<meta charset="UTF-8">
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

	<div class="mainframe">
		<div>

			<table class="type09">
				<thead>
					<tr>
						<th scope="cols" align="center">번호</th>
						<th scope="cols">제목</th>
						<th scope="cols" align="center">작성자</th>
						<th scope="cols" align="center">작성일</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="item" items="${noticeList}" begin="0"
						end="${fn:length(noticeList)-1}" step="1" varStatus="status">
						<tr>
							<th scope="row" align="center">${item.num}</th>
							<td class="title"><a href="NoticeBoard.do?num=${item.num}">${item.title}</a></td>
							<td class="written" align="center">${item.written}</td>
							<td class="date" align="center">${item.date}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${not empty sessionScope.id }">
				<div align = "right" style="margin:10px auto 5px auto">
					<button class="clkButton" style="width:150px; height:36px" onClick=" location.href='writenotice.jsp' ">공지작성</button>
				</div>
			</c:if>
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

	
	// https://sjh010.tistory.com/1
    var totalData = ${sessionScope.noticeAllNum};   // 총 데이터 수. 여기 변환법 질문
    //var totalData = 130;    // 총 데이터 수
    var dataPerPage = 10;    // 한 페이지에 나타낼 데이터 수
    var pageCount = 10;        // 한 화면에 나타낼 페이지 수
//    sessionStorage.setItem("currentPage",currentPage);
//    ${sessionScope.currentPage} = currentPage;

//	$.session("currentPage",currentPage);
	
//	console.log("session currentPage : " + ${sessionScope.currentPage});
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
            var temp_url = 'Notice.do?num='+selectedPage;
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