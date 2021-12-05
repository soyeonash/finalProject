<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의</title>

<style>
*{
	margin:0;
	padding : 0;
}
header{top:0}
#beforeLogin{
	margin-top : 5%;
	margin-bottom : 10%;
}
.mainContent {
	margin-left: 15%;
	margin-right: 15%;
	margint-bottom: 15%;
	vertical-align: middle;
	justify-content: center;
	display: grid;
}
#mainTitle{
	color : #656379;
	text-align : center;
}
#book-count{margin-left:150px;}
.qna-con{
	width:1000px;
	height:600px;
	margin-left:150px;
}
table thead tr td{
	font-weight:bold;
	background-color:rgba(90,94,185);
	color:#fff;
	padding:10px;
}
.table thead tr td:first-child{width:15%; text-align:center;}
.table thead tr td:nth-child(2){text-align:center;}
.table thead tr td:last-child{width:15%; text-align:center;}
.table tbody tr td:first-child{width:15%; text-align:center;}
.table tbody tr td:last-child{width:15%; text-align:center;}
.side{background-color:white; width:200px;position:sticky;top:18%;}
.side ul li{line-height:50px;text-align:center; border:1px solid rgb(181,181,181);text-decoration: none;list-style: none;font-size:1.5rem; cursor:pointer;}
.side ul li:first-child{line-height:65px;font-weight:bold; font-size:2rem;background-color:#5a5eb9; color:#fff; cursor:Default;}
.side ul .lo:hover{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}
.sideact{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
	<c:if test="${userId eq null }">
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
	
	<c:if test="${userId ne null}">
	<section>
		<!-- 사이드메뉴 -->
		<aside class="sideMenu" style="position:absolute; height:800px; left:2%">
			<div class="side">
	            <ul>
	               <li>마이페이지</li>
	               <li class="lo" onclick="location.href='mypageInfo.do?userId=${userId }'" >회원정보</li>
	               <li class="lo" onclick="location.href='leaveAccount.do?userId=${userId }'">회원탈퇴</li>
	               <li class="lo" onclick="location.href='lendingStatus.do?userId=${userId }'">대출내역</li>
	               <li class="lo" onclick="location.href='bookingList.do?userId=${userId }'">예약내역</li>
	               <li class="lo" onclick="location.href='wishList.do?userId=${userId }'">희망도서신청</li>
	               <li class="lo" onclick="location.href='likeList.do?userId=${userId }'">관심도서내역</li>
	               <li class="lo" onclick="location.href='tasteSurveyView.do?userId=${userId }'">취향분석</li>
	               <li class="lo" onclick="location.href='readingroomHistory.do?userId=${userId }'">열람실이용내역</li>
	               <li class="lo" onclick="location.href='studyroomHistory.do?userId=${userId }'">스터디룸이용내역</li>
	               <li class="lo" onclick="location.href='qnaList.do?userId=${userId }'" style="background-color:rgb(155,158,213); color:#fff; font-weight:bold;">문의하기</li>
	            </ul>
         	</div>			
		</aside>
		<!-- 내용 -->
		<article class="mainContent">
			<!-- 타이틀 --><br>
			<h2 id="mainTitle">
				<b>문의내역</b>
			</h2>
			<br><br>
			<div id="book-count">
				<p>*답변 대기 상태일때만 수정, 삭제 가능</p>
			</div>
			<div class="qna-con">
				<table class="table">
					<thead>
						<tr>
							<td>문의번호</td>
							<td>제목</td>
							<td>답변상태</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${qList }" var="qList">
							<tr>
								<td>${qList.qnaNo }</td>
								<td><a href="qnaDetail.do?qnaNo=${qList.qnaNo }">${qList.qnaTitle }</a></td>
								<td>${qList.replyState }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button onclick="location.href='registQnaView.do?userId=${userId}'">문의 등록</button>
			</div>
		</article>
		</section>
	</c:if>

<jsp:include page="../common/chat.jsp"></jsp:include>

<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>