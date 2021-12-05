<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 정보</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="resources/admin/userDetail.css" rel="stylesheet" />
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
			<div class="mainContents">
				<p class="mainTitle">회원 상세 조회</p>

				<div class="userDetailDiv">
						<div class="profile">
							<img
								src="${pageContext.request.contextPath}/resources/muploadFiles/${member.profilePic }"
								onerror="this.src='/resources/muploadFiles/default_profile.jpg';"
								width="145" height="180"
								style="object-fit: cover;">
						</div>
					<table class="table table-striped">
						<tr>
							<th>이름</th>
							<td>${member.userName }</td>
							<th>아이디</th>
							<td>${member.userId }</td>
						</tr>
						<tr>
							<th>회원 분류</th>
							<td>${member.userType }</td>
							<th>회원 번호</th>
							<td>${member.userNo }</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${member.userPhone }</td>
							<th>이메일</th>
							<td>${member.userEmail }</td>
						</tr>
						<tr>
							<th>가입일</th>
							<td><fmt:formatDate pattern="yyyy년 MM월 dd일"
									value="${member.enrollDate }" /></td>
							<c:if test="${member.userType eq '학생' }">
								<th>전공</th>
								<td>${member.major }</td>
							</c:if>
							<c:if test="${member.userType eq '일반' }">
								<th>연회비</th>
								<c:if test="${member.annualFee ne null}">
									<td>${member.annualFee }(<fmt:formatDate
											pattern="yyyy년 MM월 dd일" value="${member.payDate }" />)
									</td>
								</c:if>
								<c:if test="${member.annualFee eq null}">
									<td>납부 전</td>
								</c:if>
							</c:if>
						</tr>
						<tr>
							<c:if test="${member.userType eq '학생' }">
								<th>학번</th>
								<td>${member.studentId }</td>
							</c:if>
							<c:if test="${member.userType eq '일반' }">
								<th>이용증 발급</th>
								<c:if test="${member.annualFee eq '납부' }">
									<c:if test="${member.passCheck eq 'N' }">
										<td>대기
											<button class="passIssued">발급</button>
										</td>
									</c:if>
									<c:if test="${member.passCheck eq 'Y' }">
										<td>발급 완료</td>
									</c:if>
								</c:if>
								<c:if test="${member.annualFee ne '납부' }">
									<td>납부 전</td>
								</c:if>
							</c:if>
							<th>이용 기간</th>
							<c:if test="${member.userType eq '학생' }">
								<td>재학 기간 동안</td>
							</c:if>
							<c:if test="${member.userType eq '일반' }">
								<c:if test="${member.annualFee eq '납부' }">
									<c:if test="${member.endDate ne null }">
										<td><fmt:formatDate pattern="yyyy년 MM월 dd일"
												value="${member.endDate }" /></td>
									</c:if>
									<c:if test="${member.endDate eq null }">
										<td>대기
											<button class="confirm">승인</button>
										</td>
									</c:if>
								</c:if>
								<c:if test="${member.annualFee ne '납부' }">
									<td>납부 전</td>
								</c:if>
							</c:if>
						</tr>
					</table>
				</div>

				<br>
				<br>
				<p class="mainTitle">대출 이력</p>
				<table class="table table-striped">
					<thead>
						<tr>
							<td>번호</td>
							<td>도서명</td>
							<td>대출일</td>
							<td>반납일</td>
							<td>대출상태</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${lList }" var="lending">
							<tr>
								<td>${lending.lendingNo }</td>
								<td>${lending.book.bookName }</td>
								<td>${lending.lendingDate }</td>
								<td>${lending.returnDate }</td>
								<td><jsp:useBean id="today" class="java.util.Date" /> <fmt:formatDate
										var="now" value="${today}" pattern="yyyyMMdd" /> <fmt:formatDate
										var="bdate" value="${lending.returnDate}" pattern="yyyyMMdd" />

									<c:if test="${lending.returnState eq 'Y'}">	
							반납
					</c:if> <c:if test="${lending.returnState eq 'N'}">
										<c:if test="${bdate- now < 0}">	
							연체
						</c:if>

										<c:if test="${bdate- now >= 0}">
							대출중
						</c:if>
									</c:if></td>
							</tr>
						</c:forEach>
						<c:if test="${empty lList }">
							<tr>
								<td colspan="5" align="center">대출 내역이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<table class="lendingBookListPaging">
					<tr>
						<td><c:url var="before" value="userDetail.do">
								<c:param name="page" value="${pi.currentPage -1 }"></c:param>
								<c:param name="userNo" value="${member.userNo}"></c:param>
							</c:url> <c:if test="${pi.currentPage <= 1 }">
						[이전]
					</c:if> <c:if test="${pi.currentPage > 1 }">
								<a href="${before }">[이전]</a>
							</c:if> <c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
								<c:url var="pagination" value="userDetail.do">
									<c:param name="page" value="${p }"></c:param>
									<c:param name="userNo" value="${member.userNo}"></c:param>
								</c:url>
								<c:if test="${p eq pi.currentPage }">
							[${p }]
						</c:if>
								<c:if test="${p ne pi.currentPage }">
									<a href="${pagination }">${p }</a>&nbsp;
						</c:if>
							</c:forEach> <c:url var="after" value="userDetail.do">
								<c:param name="page" value="${pi.currentPage +1 }"></c:param>
								<c:param name="userNo" value="${member.userNo}"></c:param>
							</c:url> <c:if test="${pi.currentPage >= pi.maxPage }">
						[다음]
					</c:if> <c:if test="${pi.currentPage < pi.maxPage }">
								<a href="${after }">[다음]</a>
							</c:if></td>
					</tr>
				</table>
			</div>
		</main>
	</c:if>
	<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>

<script>
	// 이용증 발급 
	var userId = '${member.userId}';
	$('.passIssued').click(function() {
		// passCheck를 Y로 변경 해야함.
		var passCheck = '${member.passCheck}';
		$.ajax({
			url : 'userPassIssued.do',
			type : 'post',
			data : {
				"userId" : userId,
				"passCheck" : passCheck
			},
			success : function(data) {
				if (data === 'success') {
					alert("이용증 발급이 완료되었습니다.")
					location.reload();
				} else {
					alert('발급실패');
				}
			},
			error : function() {
				alert('AJAX 통신오류.. 관리자에게 문의하세요');
			},
		});
	});

	// 이용 기간 승인
	$('.confirm').click(function() {
		// 오늘 날짜로부터 1년 뒤
		var endDate = '${member.endDate}';
		$.ajax({
			url : 'userEndDateUpdate.do',
			type : 'post',
			data : {
				"userId" : userId
			},
			success : function(data) {
				if (data === 'success') {
					alert("안내 메일이 발송되었습니다.")
					location.reload();
				} else {
					alert('설정실패');
				}
			},
			error : function() {
				alert('AJAX 통신오류.. 관리자에게 문의하세요');
			},
		});
	});
</script>
</html>