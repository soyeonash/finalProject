<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
header{top:0} 

*{margin:0;padding:0;}
.post{ 
width:1400px; 
height:800px; 
margin:0 auto;
}
.post-title{
	margin-top:200px;
	text-align:center;
}
.post-title span{
	font-size:1.8rem;
}
table{
	text-align:center;
}
table thead tr td{
	font-weight:bold;
	background-color:rgba(90,94,185);
	color:#fff;
}
table tbody td:first-child{
	border-right:1px solid rgba(221,221,221);
}
#title{
	text-align:left;
}
.myButton {
	box-shadow:inset 0px 0px 0px 2px #9fb4f2;
	background:linear-gradient(to bottom, #7892c2 5%, #476e9e 100%);
	background-color:#7892c2;
	border:1px solid #4e6096;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:14px;
	padding:8px 23px;
	text-decoration:none;
	text-shadow:0px 0px 0px #283966;
}
.myButton:hover {
	background:linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
	background-color:#476e9e;
}
.myButton:active {
	position:relative;
	top:1px;
}

</style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="post">
	<div class="post-title">
	<h1>자유게시판</h1>
	<span>규장각 회원들의 자유로운 소통 공간입니다.</span><br><br><br><br><br>
	</div>
	<div class="post-content">
		<table class="table table-hover">
			<thead>
				<tr>
					<td width="50">No.</td>
					<td>제목</td>
					<td width="100">작성자</td>
					<td width="100">작성일</td>
					<td width="100">댓글 수</td>
					<td width="100">조회수</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pList }" var="post">
					<tr>
						<td style="padding:12px;">${post.postNo }</td>
						<c:url var="pDetail" value="postDetail.do">
							<c:param name="postNo" value="${post.postNo }"></c:param>
						</c:url>
						<td id="title" style="padding:12px;"><a href="${pDetail }">${post.postTitle }</a></td>
						<td style="padding:12px;">${post.postWriter }</td>
						<td style="padding:12px;">${post.postDate }</td>
						<td style="padding:12px;">${post.replyCnt }</td>
						<td style="padding:12px;">${post.pViewCount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div align="center">
			<c:url var="before" value="postList.do">
				<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
			</c:url>
			<c:if test="${pi.currentPage <= 1 }">
				[이전]
			</c:if>
			<c:if test="${pi.currentPage > 1 }">
				<a href="${before }">[이전]</a>
			</c:if>
			
			<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
				<c:url var="pagination" value="postList.do">
					<c:param name="page" value="${p }"></c:param>
				</c:url>
				<c:if test="${p eq pi.currentPage }">
					<font color="rgba(90,94,185)" size="4">[${p }]</font>
				</c:if>
				<c:if test="${p ne pi.currentPage }">
					<a href="${pagination }">[${p }]</a>&nbsp;
				</c:if>
			</c:forEach>
			<c:url var="after" value="postList.do">
				<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
			</c:url>
			<c:if test="${pi.currentPage >= pi.maxPage }">
				[다음]
			</c:if>
			<c:if test="${pi.currentPage < pi.maxPage }">
				<a href="${after }">[다음]</a>
			</c:if>
		</div>
		<div align="right">
			<c:if test="${userId ne null }">
				<a href="postWrite.do"><button class="myButton">글쓰기</button></a>
			</c:if>
			<c:if test="${userId eq null }">
				<button id="nLog" class="myButton">글쓰기</button>
			</c:if>
		</div>
	</div>
	<jsp:include page="../common/chat.jsp"></jsp:include>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>

<script>
	$("#nLog").on("click",function(){
		alert("로그인이 필요한 서비스 입니다!");
	});
</script>
</body>
</html>