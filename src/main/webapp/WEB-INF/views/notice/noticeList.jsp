<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<div class="container" style="margin-bottom: 15%; margin-top: 10%">
		<h1 style="text-align: center; margin-bottom: 8%;">공지사항</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>No.</th>
					<th style="width: 40%; text-align: center;">글 제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty bList }">
					<tr>
						<td colspan="5" align="center">조회된 정보가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty bList }">
					<c:forEach items="${bList }" var="notice">
						<tr>
							<td>${notice.noticeNo }</td>
							<td style="text-align: center"><c:url var="bDetail"
									value="noticeDetail.do">
									<c:param name="noticeNo" value="${notice.noticeNo }"></c:param>
								</c:url> <a href="${bDetail }">${notice.noticeTitle }</a></td>
							<td>${notice.noticeWriter }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${notice.nCreateDate }" /></td>
							<td>${notice.viewCount }</td>
						</tr>
					</c:forEach>
				</c:if>
				<tr align="center" height="20">
					<td colspan="6"><c:url var="before" value="noticeList.do">
							<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
						</c:url> <c:if test="${pi.currentPage <= 1}">
					[이전]
				</c:if> <c:if test="${pi.currentPage > 1 }">
							<a href="${before }">[이전]</a>
						</c:if> <c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
							<c:url var="pagination" value="noticeList.do">
								<c:param name="page" value="${p }"></c:param>
							</c:url>
							<c:if test="${p eq pi. currentPage }">
								<font color="#408c99" size="3">[${p }]</font>
							</c:if>
							<c:if test="${p ne pi. currentPage }">
								<a href="${pagination }">${p }</a>&nbsp;
					</c:if>
						</c:forEach> <c:url var="before" value="noticeList.do">
							<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
						</c:url> <c:if test="${pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if> <c:if test="${pi.currentPage < pi.maxPage }">
							<a href="${after }">[다음]</a>
						</c:if></td>
				</tr>
			</tbody>
		</table>
		<c:if test="${userId eq 'daolLibrary' }">
			<div style="text-align: right">
				<a href="writeView.do" class="myButton">작성</a>
			</div>
		</c:if>
	</div>
	<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>