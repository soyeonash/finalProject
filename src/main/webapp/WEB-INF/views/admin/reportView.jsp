<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고목록</title>
<style>
*{
	margin:0;
	padding : 0;
}
section{height:1000px;}
header{top:0}

#beforeLogin{
	margin-top : 5%;
	margin-bottom : 10%;
}
.sideMenu{
	float: left;
	width: 25%;
}
.mainContent {
	margin-left: 20%;
	margin-right: 15%;
	margint-bottom: 15%;
	vertical-align: middle;
	justify-content: center;
	width : 85%;
	display: grid;
}
#mainTitle{
	color : #656379;
	text-align : center;
}
.qna-con{
	width:1000px;
}
.table{text-align:center;width:100%;table-layout:fixed;}
.table thead tr td{font-weight:bold; background-color:rgb(90,94,185); color:#fff;}
.table thead tr td:first-child{width:10%;}
.table thead tr td:nth-child(3){width:10%;}
.table thead tr td:nth-child(4){width:10%;}
.table thead tr td:nth-child(5){width:10%;}
.table thead tr td:last-child{width:10%;}
.table tbody tr td:nth-child(2){text-overflow:ellipsis; overflow:hidden;white-space:nowrap;}
.del{padding:5px; border:none;}

.side{width:200px;position:absolute;left:3%;top:25%;}
.side ul li{line-height:50px;text-align:center; border:1px solid rgb(181,181,181);text-decoration: none;list-style: none;font-size:1.5rem; cursor:pointer;}
.side ul li:first-child{line-height:80px;font-weight:bold; font-size:2rem;background-color:#5a5eb9; color:#fff; cursor:Default;}
.side ul .lo:hover{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}
.sideact{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
	<c:if test="${userType ne '관리자' }">
	<section>
		<article class="mainContent" id="beforeLogin">
			<h3 style='text-align:center;'>로그인 후 이용 가능합니다</h3><br>
			<div class="btn-area" style="text-align:center;">
				<br>	
				<a href="loginView.do" ><button style="text-align:center;" type="button" class="btn btn-primary" id="login-btn">로그인 하러 가기</button></a>
			</div>
		</article>
	</section>
	</c:if>
	<c:if test="${userType eq '관리자'}">
		<aside class="sideMenu">
			<div class="side">
				<ul>
					<li>관 리 자</li>
					<li class="lo" onclick="location.href='userListView.do'">회원관리</li>
					<li class="lo" onclick="location.href='bookListView.do'">도서관리</li>
					<li class="lo" onclick="location.href='adQnaList.do'">문의관리</li>
					<li class="lo sideact" onclick="location.href='reportView.do'">신고관리</li>
					<li class="lo" onclick="location.href='statisticsView.do'">대출통계</li>
				</ul>
			</div>
		</aside>
	<section>

		<!-- 내용 -->
			<article class="mainContent">
				<!-- 타이틀 --><br>
				<h2 id="mainTitle"><b>게시글 신고 내역</b></h2>
				<br><br>
				<div class="qna-con">
					<table class="table">
						<thead>
							<tr>
								<td>신고번호</td>
								<td>제목</td>
								<td>작성자</td>
								<td>작성일</td>
								<td>처리상태</td>
								<td>삭제</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${rpList }" var="rpList">
								<tr>
									<td>${rpList.postReport.reportNo }</td>
									<td><a href="postDetail.do?postNo=${rpList.postNo }">${rpList.postTitle }</a></td>
									<td>${rpList.postWriter }</td>
									<td>${rpList.postDate }</td>
									<td>${rpList.postReport.postState }</td>
									<td><a href="delPost.do?postNo=${rpList.postNo }"><button class="del">삭제하기</button></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div align="center">
					<c:url var="before" value="reportView.do">
						<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
					</c:url>
					<c:if test="${pi.currentPage <= 1 }">
						[이전]
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<a href="${before }">[이전]</a>
					</c:if>
					
					<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
						<c:url var="pagination" value="reportView.do">
							<c:param name="page" value="${p }"></c:param>
						</c:url>
						<c:if test="${p eq pi.currentPage }">
							<font color="rgba(90,94,185)" size="4">[${p }]</font>
						</c:if>
						<c:if test="${p ne pi.currentPage }">
							<a href="${pagination }">[${p }]</a>&nbsp;
						</c:if>
					</c:forEach>
					<c:url var="after" value="reportView.do">
						<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
					</c:url>
					<c:if test="${pi.currentPage >= pi.maxPage }">
						[다음]
					</c:if>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<a href="${after }">[다음]</a>
					</c:if>
				</div>
				<hr>
				<h2 id="mainTitle"><b>댓글 신고 내역</b></h2>
				<br><br>
				<div class="qna-con">
					<table class="table">
						<thead>
							<tr>
								<td>신고번호</td>
								<td>댓글 내용</td>
								<td>작성자</td>
								<td>작성일</td>
								<td>처리상태</td>
								<td>삭제</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${rrList }" var="rr">
								<tr>
									<td>${rr.replyReport.reportNo }</td>
									<td><a href="postDetail.do?postNo=${rr.postNo }">${rr.replyContents }</a></td>
									<td>${rr.replyWriter }</td>
									<td>${rr.replyDate }</td>
									<td>${rr.replyReport.rStatus }</td>
									<td><a href="delReply.do?replyNo=${rr.replyNo }"><button class="del">삭제하기</button></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div align="center">
						<c:url var="before" value="reportView.do">
							<c:param name="page" value="${rpi.currentPage - 1 }"></c:param>
						</c:url>
						<c:if test="${rpi.currentPage <= 1 }">
							[이전]
						</c:if>
						<c:if test="${rpi.currentPage > 1 }">
							<a href="${before }">[이전]</a>
						</c:if>
						
						<c:forEach var="p" begin="${rpi.startNavi }" end="${rpi.endNavi }">
							<c:url var="pagination" value="reportView.do">
								<c:param name="page" value="${p }"></c:param>
							</c:url>
							<c:if test="${p eq rpi.currentPage }">
								<font color="rgba(90,94,185)" size="4">[${p }]</font>
							</c:if>
							<c:if test="${p ne rpi.currentPage }">
								<a href="${pagination }">[${p }]</a>&nbsp;
							</c:if>
						</c:forEach>
						<c:url var="after" value="reportView.do">
							<c:param name="page" value="${rpi.currentPage + 1 }"></c:param>
						</c:url>
						<c:if test="${rpi.currentPage >= rpi.maxPage }">
							[다음]
						</c:if>
						<c:if test="${rpi.currentPage < rpi.maxPage }">
							<a href="${after }">[다음]</a>
						</c:if>
					</div>
				</div>
			</article>
		</section>
	</c:if>
<jsp:include page="../common/chat.jsp"></jsp:include>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>