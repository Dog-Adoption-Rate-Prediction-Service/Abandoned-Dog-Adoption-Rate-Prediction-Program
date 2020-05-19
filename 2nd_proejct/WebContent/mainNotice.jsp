<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/Css.css">
<link rel="stylesheet" href="css/Board.css">
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
table.type09 tbody td.mainNoticeTitle {
	padding-left: 15px;
}
table.type09 tbody td {
    padding: 10px 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
<body>

	<table class="type09" width="100%">
		<tbody>

			<c:forEach var="item" items="${noticeList}" begin="0" end="8"
				step="1" varStatus="status">
				<tr>
					<td width=80% class="mainNoticeTitle"><a
						href="NoticeBoard.do?num=${item.num}" target="_top">${item.title}</a></td>
					<td class="date" align="center" width=20%>${item.date}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</body>
</html>