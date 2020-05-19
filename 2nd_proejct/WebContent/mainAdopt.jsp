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
table {
	margin: auto auto;
}

.img_dog {
	width: 150px;
	height: 300px;
	border: 2px dashed #ddd;
	text-align: center;
}

.img_dog>img {
	width: auto;
	height: 200px;
	max-width: 180px;
	cursor: pointer;
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
</style>
</head>
<body>
	<table>
		<c:forEach var="item" items="${adoptList}" begin="0" end="5" step="3"
			varStatus="status">
			<tr>
				<td class="img_dog"><img src="${item.img}"
					onclick="location.href='${item.link}'"></td>

				<td class="img_dog"><img src="${adoptList[status.index+1].img}"
					onclick="location.href='${adoptList[status.index+1].link}'"></td>

				<td class="img_dog"><img src="${adoptList[status.index+2].img}"
					onclick="location.href='${adoptList[status.index+2].link}'"></td>

			</tr>
		</c:forEach>

	</table>
</body>
</html>