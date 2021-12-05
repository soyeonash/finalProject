<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출현황</title>
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

.side {
	width: 200px;
	position: absolute;
	left: 3%;
	top: 25%;
}

.side ul li {
	line-height: 50px;
	text-align: center;
	border: 1px solid rgb(181, 181, 181);
	text-decoration: none;
	list-style: none;
	font-size: 1.5rem;
	cursor: pointer;
}

.side ul li:first-child {
	line-height: 80px;
	font-weight: bold;
	font-size: 2rem;
	background-color: #5a5eb9;
	color: #fff;
	cursor: Default;
}

.side ul .lo:hover {
	background-color: rgb(155, 158, 213);
	color: #fff;
	font-weight: bold;
}

.sideact {
	background-color: rgb(155, 158, 213);
	color: #fff;
	font-weight: bold;
}
</style>

</head>
<body>


	<jsp:include page="../common/header.jsp"></jsp:include>
	<br>
	<div class="container"
		style="margin-bottom: 15%; margin-top: 8%; margin-right: 10%;">
		<h1 style="text-align: center; margin-bottom: 8%;">도서관리</h1>
		<div class="side">
			<ul>
				<li>관 리 자</li>
				<li class="lo" onclick="location.href='userListView.do'">회원관리</li>
				<li class="lo sideact" onclick="location.href='bookListView.do'">도서관리</li>
				<li class="lo" onclick="location.href='adQnaList.do'">문의관리</li>
				<li class="lo" onclick="location.href='reportView.do'">신고관리</li>
				<li class="lo" onclick="location.href='statisticsView.do'">대출통계</li>
			</ul>
		</div>
		<button class="btn btn-default"
			onclick="location.href='bookListView.do'">장서 목록</button>
		<button class="btn btn-default"
			onclick="location.href='statusList.do'">대출 현황</button>
		<button class="btn btn-default"
			onclick="location.href='wishbookList.do'">희망 도서 접수 목록</button>
		<button class="btn btn-default"
			onclick="location.href='bookParcelList.do'">대출도서 택배 신청 목록</button>

		<hr>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>No.</th>
					<th>도서 명</th>
					<th>저자</th>
					<th>회원번호</th>
					<th>대출일</th>
					<th>반납예정일</th>
					<th>대출연장</th>
					<th>처리</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty bList }">
					<c:forEach items="${bList }" var="book" varStatus="status">
						<input type="hidden" id="bookNo" value="${book.bookNo}">
						<input type="hidden" id="userId" value="${book.userId}">
						<tr>
							<td>${status.count }</td>
							<td style="width: 36%;"><a
								href="bookDetail.do?bookNo=${book.bookNo }">${book.bookName }</a>
							</td>
							<td>${book.bookWriter }</td>
							<td><a href="mypageInfo.do?userId=${book.userId }">${book.userNo }</a>
							</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${book.lendingDate }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${book.returnDate }" /></td>
							<td><c:if test="${book.extendCount eq 0 }">
                    Y
                    </c:if> <c:if test="${book.extendCount eq 1 }">
                    N
                    </c:if></td>
							<td><a
								href="bookReturn.do?userId=${book.userId}&bookNo=${book.bookNo}&lendingNo=${book.lendingNo}"
								onclick="return confirm('반납 처리하시겠습니까?');">반납</a></td>
						</tr>
					</c:forEach>
				</c:if>

				<tr align="center" height="20">

					<td colspan="8"><c:url var="before" value="statusList.do">
							<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
						</c:url> <c:if test="${pi.currentPage <= 1}">
					[이전]
				</c:if> <c:if test="${pi.currentPage > 1 }">
							<a href="${before }">[이전]</a>
						</c:if> <c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
							<c:url var="pagination" value="statusList.do">
								<c:param name="page" value="${p }"></c:param>
							</c:url>
							<c:if test="${p eq pi. currentPage }">
								<font color="#408c99" size="3">[${p }]</font>
							</c:if>
							<c:if test="${p ne pi. currentPage }">
								<a href="${pagination }">${p }</a>&nbsp;
					</c:if>
						</c:forEach> <c:url var="before" value="statusList.do">
							<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
						</c:url> <c:if test="${pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if> <c:if test="${pi.currentPage < pi.maxPage }">
							<a href="${after }">[다음]</a>
						</c:if></td>
				</tr>
			</tbody>
		</table>



	</div>
	<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>