<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관리</title>
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
	top: 40%;
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
	<div class="container"
		style="margin-bottom: 15%; margin-top: 8%; margin-left: 20%;">
		<h1 style="text-align: center; margin-bottom: 8%;">도서관리</h1>

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
					<th colspan="2">No.</th>
					<th>도서 명</th>
					<th>저자</th>
					<th>출판사</th>
					<th>분류기호</th>
					<th>대출 상태</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty bList }">
					<c:forEach items="${bList }" var="book">
						<tr>
							<td><input type="checkbox" name="bookNo"
								class="list-checkBox" value="${book.bookNo }"></td>
							<td>${book.bookNo }</td>
							<td><a href="bookDetail.do?bookNo=${book.bookNo }">${book.bookName }</a>
							</td>
							<td>${book.bookWriter }</td>
							<td>${book.publisher }</td>
							<td>${book.callNo }</td>
							<td>${book.bookState }</td>
							<td><a href="bookUpdate.do?bookNo=${book.bookNo }">수정</a></td>
						</tr>

					</c:forEach>
				</c:if>
				<div align="left">
					<form action="bookSearch.do" method="get">
						<select name="searchCondition">
							<option value="all"
								<c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
							<option value="name"
								<c:if test="${search.searchCondition == 'name' }">selected</c:if>>도서
								명</option>
							<option value="writer"
								<c:if test="${search.searchCondition == 'writer' }">selected</c:if>>저자</option>
							<option value="publisher"
								<c:if test="${search.searchCondition == 'publisher' }">selected</c:if>>출판사</option>
						</select> <input type="text" name="searchValue"
							value="${search.searchValue }"> <input type="submit"
							value="검색">
					</form>
				</div>
				<tr align="center" height="20">

					<td colspan="8"><c:url var="before" value="bookListView.do">
							<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
						</c:url> <c:if test="${pi.currentPage <= 1}">
					[이전]
				</c:if> <c:if test="${pi.currentPage > 1 }">
							<a href="${before }">[이전]</a>
						</c:if> <c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
							<c:url var="pagination" value="bookListView.do">
								<c:param name="page" value="${p }"></c:param>
							</c:url>
							<c:if test="${p eq pi. currentPage }">
								<font color="#408c99" size="3">[${p }]</font>
							</c:if>
							<c:if test="${p ne pi. currentPage }">
								<a href="${pagination }">${p }</a>&nbsp;
					</c:if>
						</c:forEach> <c:url var="before" value="bookListView.do">
							<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
						</c:url> <c:if test="${pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if> <c:if test="${pi.currentPage < pi.maxPage }">
							<a href="${after }">[다음]</a>
						</c:if></td>
				</tr>
			</tbody>
		</table>

		<div style="text-align: right">
			<a href="bookEnrollView.do" class="myButton">등록</a>
			<button type="button" class="myButton" id="numArray"
				style="border: none;" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
		</div>


	</div>
	<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
		$('#numArray').on('click',function(){
			var checkArr =[];
			$('.list-checkBox:checked').each(function(i){
				checkArr.push($(this).val());
			})
			$.ajax({
				url : 'bookDelete.do',
				type : 'post',
				data : { 
					"bookNo" : checkArr,
				},
				success : function(data){
// 						console.log(data);
					if(data == "success"){
						alert("삭제 되었습니다");
						location.href = "bookListView.do";
					}else{
						alert("삭제 실패");
					}
				}
			});
		});
	</script>
</body>
</html>