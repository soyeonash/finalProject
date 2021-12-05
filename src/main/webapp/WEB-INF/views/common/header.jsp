<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
<link href="resources/css/headerStyle.css" rel="stylesheet">


</head>
<body>
	<header>
		<div class="wrapper">
			<div class="wrapper left" id="left">
					<!--  <a href="home.do"><img src="resources/img/logoNew.png" alt="logo" id="header-logo"></a> -->&nbsp;&nbsp;
					<a href="home.do"><h3 id="logoText" style="font-weight:bold;">다올대학교 도서관 규장각</h3></a>
			</div>
			<c:if test="${sessionScope.userId eq null }">
				<div class="wrapper right" id="loginbutton" >&nbsp;&nbsp;<a href="loginView.do" >LOGIN</a></div>
			</c:if>
			<c:if test="${sessionScope.userId ne null and userId ne ''}">
				<div class="wrapper right" id="logoutbutton" >
					${sessionScope.userId}님 환영합니다!&nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.do" style="color : gray;">LOGOUT</a>
				</div>
			</c:if>
		</div>
		<div class="nav" id="nav">
			<ul class="menu" id="menu">
				<li><a href="greetingView.do">도서관 소개</a>
					<ul>
						<li><a href="greetingView.do">규장각 인사말</a></li>
						<li><a href="historyView.do">규장각 연혁</a></li>
						<li><a href="ComeView.do">규장각 오시는 길</a></li>
						<li><a href="informationView.do">규장각 시설 이용 안내</a></li>
					</ul>
				</li>
				<li><a href="noticeList.do">도서관이용</a>
					<ul>
						<li><a href="noticeList.do">공지사항</a></li>
						<li><a href="postList.do">자유게시판</a></li>
						<li><a href="readingRoom.do">열람실 예약</a></li>
						<li><a href="studyRoom.do">스터디룸 예약</a></li>
					</ul>
				</li>
				<li><a href="/search.do">자료검색</a>
					<ul>
						<li><a href="/search.do">간략 검색</a></li>
						<li><a href="/sDetail.do">상세 검색</a></li>
						<li><a href="/sSub.do">주제별 검색</a></li>
						<li><a href="/searchNew.do">신착 자료</a></li>
						<li><a href="/bestBook.do">대출 베스트</a></li>
					</ul>				
				</li>
				<li>
					<c:if test="${sessionScope.userType ne '관리자' }">
					<a href="mypageInfo.do?userId=${userId }">마이페이지</a>
					<ul>
						<li><a href="mypageInfo.do?userId=${userId }">회원정보</a></li>
						<li><a href="leaveAccount.do?userId=${userId }">회원탈퇴</a></li>
						<li><a href="lendingStatus.do?userId=${userId }">나의 대출 내역</a></li>
						<li><a href="bookingList.do?userId=${userId }">도서 예약 내역</a></li>
						<li><a href="wishList.do?userId=${userId }">희망 도서 신청</a></li>
						<li><a href="likeList.do?userId=${userId }">관심도서 내역</a></li>
						<li><a href="tasteSurveyView.do?userId=${userId }">취향 분석 설문</a></li>
						<li><a href="readingroomHistory.do?userId=${userId }">시설 이용 내역</a></li>
						<li><a href="qnaList.do?userId=${userId }">문의하기</a></li>
					</ul>
					</c:if>
					<c:if test="${sessionScope.userType eq '관리자' }">
 					<a href="userListView.do">관리자페이지</a>
					<ul>
						<li><a href="userListView.do">회원관리</a></li>
						<li><a href="bookListView.do">도서관리</a></li>
						<li><a href="adQnaList.do?userId=${userId }">문의관리</a></li>
						<li><a href="reportView.do">신고관리</a></li>
						<li><a href="statisticsView.do">대출통계</a></li>
					</ul>
					</c:if>
				</li>
				
			</ul>
		</div>
	</header>
</body>
</html>