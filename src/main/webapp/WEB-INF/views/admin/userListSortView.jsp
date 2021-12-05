<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승인 대기 회원 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="resources/admin/userList.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<c:if test="${userType ne '관리자' }">
		<section>
			<article class="mainContent" id="beforeLogin">
				<h3 style='text-align: center;'>로그인 후 이용 가능합니다</h3>
				<br>
				<div class="btn-area" style="text-align: center;">
					<br> <a href="loginView.do"><button
							style="text-align: center;" type="button" class="btn btn-primary"
							id="login-btn">로그인 하러 가기</button></a>
				</div>
			</article>
		</section>
	</c:if>
	<c:if test="${userType eq '관리자'}">
		<main>
			<div class="side">
				<ul>
					<li>관 리 자</li>
					<li class="lo sideact" onclick="location.href='userListView.do'">회원관리</li>
					<li class="lo" onclick="location.href='bookListView.do'">도서관리</li>
					<li class="lo" onclick="location.href='adQnaList.do'">문의관리</li>
					<li class="lo" onclick="location.href='reportView.do'">신고관리</li>
					<li class="lo" onclick="location.href='statisticsView.do'">대출통계</li>
				</ul>
			</div>
			<div class="Membership_MainContent">
				<p class="mainTitle">승인 대기 회원</p>
				<span class="waitingSort"> <i class="fas fa-sort-alpha-down"></i>
				</span>
				<table class="table table-striped" style="margin-top: 75px;">
					<thead>
						<tr>
							<td></td>
							<td class="userNoTitle">회원 번호</td>
							<td>아이디</td>
							<td>이름</td>
							<td>회원 분류</td>
							<td>가입일</td>
							<td>이용 승인</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${uList }" var="member">
							<tr>
								<td><input type="checkbox" name="userNo"
									class="list-checkBox" value="${member.userNo }"></td>
								<td>${member.userNo }</td>
								<td><a href="userDetail.do?userNo=${member.userNo }">${member.userId }</a>
								</td>
								<td>${member.userName }</td>
								<td>${member.userType }</td>
								<td><fmt:formatDate pattern="yyyy년 MM월 dd일"
										value="${member.enrollDate }" /></td>
								<td><c:if test="${member.userType eq '일반' }">
										<c:if test="${member.payDate eq null}">	
		  							없음
		  						</c:if>
										<c:if test="${member.payDate ne null}">
											<c:if test="${member.passCheck eq 'N'}">
		  								대기
		  							</c:if>
											<c:if test="${member.passCheck eq 'Y'}">
		  								승인완료
		  							</c:if>
										</c:if>
									</c:if> <c:if test="${member.userType eq '학생' }">
	  							승인완료
	  						</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="userListPaging">
					<tr>
						<td><c:url var="before" value="waitingSort.do">
								<c:param name="page" value="${pi.currentPage -1 }"></c:param>
							</c:url> <c:if test="${pi.currentPage <= 1 }">
						[이전]
					</c:if> <c:if test="${pi.currentPage > 1 }">
								<a href="${before }">[이전]</a>
							</c:if> <c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
								<c:url var="pagination" value="waitingSort.do">
									<c:param name="page" value="${p }"></c:param>
								</c:url>
								<c:if test="${p eq pi.currentPage }">
							[${p }]
						</c:if>
								<c:if test="${p ne pi.currentPage }">
									<a href="${pagination }">${p }</a>&nbsp;
						</c:if>
							</c:forEach> <c:url var="after" value="waitingSort.do">
								<c:param name="page" value="${pi.currentPage +1 }"></c:param>
							</c:url> <c:if test="${pi.currentPage >= pi.maxPage }">
						[다음]
					</c:if> <c:if test="${pi.currentPage < pi.maxPage }">
								<a href="${after }">[다음]</a>
							</c:if></td>
					</tr>
				</table>
				<button type="button" class="deleteCheck">회원삭제</button>
				<div class="alert_div">
					<div class="alert_div_con">
						<p>이 회원을 정말 삭제하시겠습니까?</p>
						<h4>탈퇴 된 회원은 복구 및 복원이 되지 않습니다.</h4>
						<div class="alertBtn">
							<input type="button" class="deleteBtn" value="확인" /> <input
								type="button" class="cancleBtn" value="취소" />
						</div>
					</div>
				</div>
			</div>
		</main>
	</c:if>
	<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script>
	$('.deleteCheck').on('click', function() {
		$('.alert_div').css('display', 'block');
	});

	$('.cancleBtn').on('click', function() {
		$('.alert_div').css('display', 'none');
	});

	$('.deleteBtn').on('click', function() {
		var checkArr = [];
		$('.list-checkBox:checked').each(function(i) {
			checkArr.push($(this).val());
		})
		$.ajax({
			url : 'userDelete.do',
			type : 'post',
			data : {
				"userNo" : checkArr,
			},
			success : function(data) {
				if (data == "success") {
					location.href = "userListView.do";
				} else {
					alert("삭제 실패");
				}
			}
		});
	});
	$('.waitingSort').on('click', function() {
		location.href = "userListView.do";
	});
</script>
</html>