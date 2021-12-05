<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심 도서 내역</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css" />
<link href="resources/css/popupStyle.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
*{
	margin:0;
	padding : 0;
}

#beforeLogin{
	margin-top : 5%;
	margin-bottom : 10%;
}

.sideMenu{
	float: left;
	width: 25%;
	position: absolute;
}
.mainContent {
	margin-left: 15%;
	margin-right: 15%;
	margint-bottom: 15%;
	vertical-align: middle;
	justify-content: center;
	width : 85%;
	display: grid;
	position : relative;
}
#mainTitle{
	color : #656379;
	text-align : center;
}
#book-count{
	border-bottom : 1px solid gray;
	font-size : 1.1em;
}
.card{
	width : 700px;
	height : 250px;
	border-bottom : 1px solid;
}
.checkbox{
	width : 3%;
	float: left;
}
.photo{
	width : 25%;
	float: left;
	border : 0.5px solid;
	margin : 2%;
}
.description{
	width : 60%;
	float: left;
	margin-left : 2%;
	margin-top : 2%;
}
.btn-area{
	text-align : center;
}

.page-area{
	text-align :center;
}
input[type=checkbox] {
transform : scale(1.5);
}

.side{width:200px;position:sticky;left:3%;top:20%;}
.side ul li{line-height:50px;text-align:center; border:1px solid rgb(181,181,181);text-decoration: none;list-style: none;font-size:1.5rem; cursor:pointer;}
.side ul li:first-child{line-height:65px;font-weight:bold; font-size:2rem;background-color:#5a5eb9; color:#fff; cursor:Default;}
.side ul .lo:hover{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}
.sideact{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}
</style>
<script>
$(document).ready(function() {
var asideH = $(".mainContent").height();
console.log(asideH);
$(".sideMenu").css("height", asideH);

});
</script>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
	<c:if test="${sessionScope.userId eq null }">
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
	
	<c:if test="${sessionScope.userId ne null}">
	<section>
		<!-- 사이드메뉴 -->
		<aside class="sideMenu">
			<div class="side">
	            <ul>
	               <li>마이페이지</li>
	               <li class="lo" onclick="location.href='mypageInfo.do?userId=${userId }'">회원정보</li>
	               <li class="lo" onclick="location.href='leaveAccount.do?userId=${userId }'">회원탈퇴</li>
	               <li class="lo" onclick="location.href='lendingStatus.do?userId=${userId }'">대출내역</li>
	               <li class="lo" onclick="location.href='bookingList.do?userId=${userId }'">예약내역</li>
	               <li class="lo" onclick="location.href='wishList.do?userId=${userId }'">희망도서신청</li>
	               <li class="lo sideact" onclick="location.href='likeList.do?userId=${userId }'">관심도서내역</li>
	               <li class="lo" onclick="location.href='tasteSurveyView.do?userId=${userId }'">취향분석</li>
	               <li class="lo" onclick="location.href='readingroomHistory.do?userId=${userId }'">열람실이용내역</li>
	               <li class="lo" onclick="location.href='studyroomHistory.do?userId=${userId }'">스터디룸이용내역</li>
	               <li class="lo" onclick="location.href='qnaList.do?userId=${userId }'">문의하기</li>
	            </ul>
         	</div>	
		</aside>
	
		<!-- 내용 -->
		<article class="mainContent">
			<!-- 타이틀 --><br>
			<h2 id="mainTitle">
				<b>관심 도서 내역</b>
			</h2>
			<br><br><br>
			<c:if test="${empty likeList }">
				<tr>
					<td colspan="6" align="center"> 관심 도서 내역이 없습니다. </td>
				</tr>
			</c:if>		
			<c:if test="${not empty likeList }">	
			<div id="book-count">
				<p><span>${pi.totalCount}</span> 권의 책이 있습니다.</p> 
			</div>
			<br><br>
			<c:forEach items="${likeList }" var="like" varStatus="index">
			<!-- 본문 -->
			<br>
				<div class="card">
					<div class="photo">
						<img src="${pageContext.request.contextPath}/resources/bookcover/${like.bookCover}" width="173.3px" height="220px">
					</div>
					<div class="description">
						<h3><a href="/bookDetail.do?bookNo=${like.bookNo }">${like.bookName}</a></h3><input type="hidden" name="bookNo" value="${like.bookNo }" id="bookNo">
						<p><span>${like.publisher}</span>&nbsp;|&nbsp;<span>${like.bookWriter}</span>&nbsp;|&nbsp;<span>${like.bookYear}</span></p>
						<br><br><br>	
					</div>
				</div>
			</c:forEach>
			<br><br>
				<div class="page-area">
					<c:url var="before" value="likeList.do">
						<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
					</c:url>
					<c:if test="${pi.currentPage <= 1 }">
						[이전]
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<a href="${before }">[이전]</a>
					</c:if>
					<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
						<c:url var="pagination" value="likeList.do">
							<c:param name="page" value="${p }"></c:param>
						</c:url>
						<c:if test="${p eq pi.currentPage }">
						 	<font color = "#408c99" size="4">[${p }]</font>
						</c:if>
						<c:if test="${p ne pi.currentPage }">
						 	<a href="${pagination }">[${p }]</a>&nbsp;
						</c:if>
					</c:forEach>
					<c:url var="after" value="likeList.do">
						<c:param name="page" value="${pi.currentPage + 1 }">></c:param>
					</c:url>
					<c:if test="${pi.currentPage >= pi.maxPage }">
						[다음]
					</c:if>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<a href="${after } ">[다음]</a>
					</c:if>
				</div>	
		</c:if>
		</article>
		<br><br>
	</section>
	</c:if>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<jsp:include page="../common/chat.jsp"></jsp:include>
	<br><br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>