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

.myButton11 {
	box-shadow: 0px 0px 0px 2px #cf866c;
	background: linear-gradient(to bottom, #d0451b 5%, #bc3315 100%);
	background-color: #d0451b;
	border-radius: 10px;
	border: 1px solid #942911;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 10px;
	padding: 12px 37px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #854629;
}

.myButton11:hover {
	background: linear-gradient(to bottom, #bc3315 5%, #d0451b 100%);
	background-color: #bc3315;
}

.myButton11:active {
	position: relative;
	top: 1px;
}

.myButton22 {
	box-shadow: 0px 0px 0px 2px #9fb4f2;
	background: linear-gradient(to bottom, #7892c2 5%, #476e9e 100%);
	background-color: #7892c2;
	border-radius: 10px;
	border: 1px solid #4e6096;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 10px;
	padding: 12px 37px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #283966;
}

.myButton22:hover {
	background: linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
	background-color: #476e9e;
}

.myButton22:active {
	position: relative;
	top: 1px;
}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>
	<br>
	<div class="container" style="margin-bottom: 15%; margin-top: 13%;">
		<h1 style="text-align: center; margin-bottom: 8%;">${notice.noticeNo }번
			공지사항</h1>
		<input type="hidden" value="${notice.noticeNo }" id="noticeNo"
			name="noticeNo">

		<c:if test="${userId eq 'daolLibrary' }">
			<div style="text-align: right">
				<c:url var="bUpdate" value="updateView.do">
					<c:param name="noticeNo" value="${notice.noticeNo }"></c:param>
				</c:url>
				<a href="${bUpdate }" class="myButton22">수정</a>

				<c:url var="bDelete" value="noticeDelete.do">
					<c:param name="noticeNo" value="${notice.noticeNo }"></c:param>
				</c:url>
				<a href="${bDelete }" class="myButton11">삭제</a>
			</div>
		</c:if>

		<div class="form-group">
			<label for="exampleInputTitle">제목</label> <input type="text"
				class="form-control" id="exampleInputTitle" name="noticeTitle"
				placeholder="제목" value="${notice.noticeTitle }" readonly>
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
				value="${notice.noticeContents }" readonly>
		</div>

		<div style="text-align: center; margin-top: 8%;">
			<a href="noticeList.do" class="myButton">뒤로가기</a>
		</div>

	</div>
	<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>