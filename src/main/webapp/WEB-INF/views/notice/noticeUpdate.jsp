<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
.myButton {
	box-shadow: 0px 10px 14px -7px #276873;
	background: linear-gradient(to bottom, #599bb3 5%, #408c99 100%);
	background-color: #599bb3;
	border-radius: 8px;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 14px;
	font-weight: bold;
	padding: 13px 32px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #3d768a;
}

.myButton:hover {
	background: linear-gradient(to bottom, #408c99 5%, #599bb3 100%);
	background-color: #408c99;
}

.myButton:active {
	position: relative;
	top: 1px;
}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>
	<br>
	<div class="container" style="margin-bottom: 15%; margin-top: 13%;">
		<h1 style="text-align: center; margin-bottom: 8%;">공지사항</h1>
		<form action="noticeUpdate.do" method="post">
			<div class="form-group">
				<label for="exampleInputTitle">제목</label> <input type="text"
					class="form-control" id="exampleInputTitle" name="noticeTitle"
					placeholder="제목" value="${notice.noticeTitle }">
			</div>
			<div class="form-group">
				<label for="exampleInputWriter">작성자</label> <input type="text"
					class="form-control" id="exampleInputWriter" name="noticeWriter"
					placeholder="작성자" value="${notice.noticeWriter }" readonly>
			</div>
			<div class="form-group">
				<label for="exampleInputContents">내용</label> <input
					style="height: 189px;" type="text" class="form-control"
					id="exampleInputContents" name="noticeContents" placeholder="내용"
					value="${notice.noticeContents }">
			</div>

			<div style="text-align: right">
				<input type="submit" value="수정" class="myButton"
					style="border: none">
			</div>
		</form>

	</div>
	<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>