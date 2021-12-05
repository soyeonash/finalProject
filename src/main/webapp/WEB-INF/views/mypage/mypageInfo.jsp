<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 포맷태그 식별 태그라이브러리  -->
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
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
	margin-left: 20%;
	margin-right: 10%;
	margint-bottom: 15%;
	vertical-align: middle;
	justify-content: center;
	width : 70%;

}
#mainTitle{
	color : #656379;
	text-align : center;
}
.table{
	margin-left : 5%;
	margin-right : 5%;
	min-width: 900px;
	width : 100%;
}
.table th{
	height : 45px;
	text-align : center;
}
.table td{
	margin: auto;
	vertical-align:middle;
}

#info-table th:nth-chid(0){
	width : 10%;
}
#info-table th:nth-chid(1){
	width : 35%;
}
#info-table td:nth-chid(0){
	width : 10%;
}
#info-table td:nth-chid(1){
	width : 35%;
}
.btn-area{
	text-align : center;
}
#login-btn{
	text-align : center;
}
aside{
min-width : 200px;
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
			<div class="btn-area">
				<br>	
				<a href="loginView.do" ><button type="button" class="btn btn-primary" id="login-btn">로그인 하러 가기</button></a>
			</div>
		</article>
	</section>
	</c:if>
	
	<c:if test="${sessionScope.userId ne null}">
	<section>
		<aside class="sideMenu">
			<!-- 사이드메뉴 -->
			<div class="side">
	            <ul>
	               <li>마이페이지</li>
	               <li class="lo sideact" onclick="location.href='mypageInfo.do?userId=${userId }'" style="background-color:rgb(155,158,213); color:#fff; font-weight:bold;">회원정보</li>
	               <li class="lo" onclick="location.href='leaveAccount.do?userId=${userId }'">회원탈퇴</li>
	               <li class="lo" onclick="location.href='lendingStatus.do?userId=${userId }'">대출내역</li>
	               <li class="lo" onclick="location.href='bookingList.do?userId=${userId }'">예약내역</li>
	               <li class="lo" onclick="location.href='wishList.do?userId=${userId }'">희망도서신청</li>
	               <li class="lo" onclick="location.href='likeList.do?userId=${userId }'">관심도서내역</li>
	               <li class="lo" onclick="location.href='tasteSurveyView.do?userId=${userId }'">취향분석</li>
	               <li class="lo" onclick="location.href='readingroomHistory.do?userId=${userId }'">열람실이용내역</li>
	               <li class="lo" onclick="location.href='studyroomHistory.do?userId=${userId }'">스터디룸이용내역</li>
	               <li class="lo" onclick="location.href='qnaList.do?userId=${userId }'">문의하기</li>
	            </ul>
         	</div>	
		</aside>

		<article class="mainContent">
		<br>
			<h2 id="mainTitle"><b>내 정보 관리</b></h2>
			<br>
			<br>
			<!-- 일반회원 -->
			<c:if test="${loginUser.userType eq '일반' }">
				<table class="table" align="center" id="info-table">
					<tbody>
						<tr>
							<td rowspan="4" width="230" style='vertical-align:middle;'>
								<c:if test="${loginUser.profilePic ne null}">	
									<img src="${pageContext.request.contextPath}/resources/muploadFiles/${loginUser.profilePic }" width="230" height="180">
								</c:if>
								<c:if test="${loginUser.profilePic eq null or loginUser.profilePic eq '' }">	
									<p style="text-align : center;">사진 없음</p>
								</c:if> 
							</td>
							<th class="bg-info" style='vertical-align:middle;'>이름</th>
							<td style='vertical-align:middle;'>${loginUser.userName }</td>
							<th class="bg-info" style='vertical-align:middle;'>아이디</th>
							<td style='vertical-align:middle;'>${loginUser.userId }</td>
						</tr>
						<tr>
							<th class="bg-info" style='vertical-align:middle;'>회원분류</th>
							<td style='vertical-align:middle;'>${loginUser.userType }</td>
							<th class="bg-info" style='vertical-align:middle;'>회원번호</th>
							<td style='vertical-align:middle;'>${loginUser.userNo }</td>
						</tr>
						<tr>
							<th class="bg-info" style='vertical-align:middle;'>가입일</th>
							<td style='vertical-align:middle;'><fmt:formatDate pattern = "yyyy-MM-dd" value="${loginUser.enrollDate }"/></td>
							<th class="bg-info" style='vertical-align:middle;'>연회비</th>
							<td style='vertical-align:middle;'> 
								<c:if test="${loginUser.annualFee eq null }">
									미납 &nbsp;&nbsp; &nbsp; <button type="button" class="btn btn-warning" id="pay-btn">결제</button>
								</c:if>
								<c:if test="${loginUser.annualFee ne null and loginUser.payDate ne null}">
									납부 &nbsp;(<fmt:formatDate pattern = "yyyy-MM-dd" value="${loginUser.payDate }"/>)
								</c:if>
							</td> 
						</tr>
						<tr>
							<th class="bg-info" style='vertical-align:middle;'>이용증</th>
							<td style='vertical-align:middle;'>
								<c:if test="${loginUser.annualFee eq null or loginUser.payDate eq null }">
									미발급
								</c:if>
 								<c:if test="${loginUser.annualFee ne null and loginUser.passCheck eq 'N'}">
									대기
								</c:if>
								<c:if test="${loginUser.passCheck ne 'N' and loginUser.approvalDate ne null}">
									발급
								</c:if> 
							</td>
							<th class="bg-info" style='vertical-align:middle;'>이용기간</th>
							<td style='vertical-align:middle;'>
								<c:if test="${loginUser.annualFee eq null or loginUser.payDate eq null }">
									없음
								</c:if>
								<c:if test="${loginUser.annualFee ne null and loginUser.passCheck eq 'N'}">
									대기
								</c:if>
								<c:if test="${loginUser.passCheck ne 'N' and loginUser.approvalDate ne null}">
									<fmt:formatDate pattern = "yyyy-MM-dd" value="${loginUser.approvalDate }"/>
									 ~ 
									<fmt:formatDate pattern = "yyyy-MM-dd" value="${loginUser.endDate }"/>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
				<br>
				<table class="table">
					<tbody>
						<tr>
							<th class="bg-info" width="20%" style='vertical-align:middle;'>전화번호</th>
							<td width="77%" style='vertical-align:middle;'>${loginUser.userPhone }</td>
						</tr>
						<tr>
							<th class="bg-info" width="20%" style='vertical-align:middle;'>이메일</th>
							<td  width="77%" style='vertical-align:middle;'>${loginUser.userEmail }</td>
						</tr>
					</tbody>
				</table>
			</c:if>	
				
			<!-- 학생회원 -->
		<c:if test="${loginUser.userType eq '학생'}">
			<table class="table" align="center" id="info-table">
					<tbody>
						<tr>
							<td rowspan="4" width="230" style='vertical-align:middle;'>
								<c:if test="${loginUser.profilePic ne null }">	
									<img src="${pageContext.request.contextPath}/resources/muploadFiles/${loginUser.profilePic }" width="230" height="180">
								</c:if>
								<c:if test="${loginUser.profilePic eq null or loginUser.profilePic eq '' }">	
									<p style="text-align : center;">사진 없음</p>
								</c:if> 
							</td>
							<th class="bg-info" style='vertical-align:middle;'>이름</th>
							<td style='vertical-align:middle;'>${loginUser.userName }</td>
							<th class="bg-info" style='vertical-align:middle;'>아이디</th>
							<td style='vertical-align:middle;'>${loginUser.userId }</td>
						</tr>
						<tr>
							<th class="bg-info" style='vertical-align:middle;'>회원분류</th>
							<td style='vertical-align:middle;'>${loginUser.userType }</td>
							<th class="bg-info" style='vertical-align:middle;'>회원번호</th>
							<td style='vertical-align:middle;'>${loginUser.userNo }</td>
						</tr>
						<tr>
							<th class="bg-info" style='vertical-align:middle;'>학번</th>
							<td style='vertical-align:middle;'>${loginUser.studentId }</td>
							<th class="bg-info" style='vertical-align:middle;'>전공</th>
							<td style='vertical-align:middle;'>${loginUser.major }</td> 
						</tr>
						<tr>
							<th class="bg-info" style='vertical-align:middle;'>가입일</th>
							<td style='vertical-align:middle;'><fmt:formatDate pattern = "yyyy-MM-dd" value="${loginUser.enrollDate }"/></td>
							<th class="bg-info" style='vertical-align:middle;'>이용기간</th>
							<td style='vertical-align:middle;'>재학기간동안</td>
						</tr>
					</tbody>
				</table>
				<br>
				<table class="table">
					<tbody>
						<tr>
							<th class="bg-info" width="20%" style='vertical-align:middle;'>전화번호</th>
							<td width="77%" style='vertical-align:middle;'>${loginUser.userPhone }</td>
						</tr>
						<tr>
							<th class="bg-info" width="20%" style='vertical-align:middle;'>이메일</th>
							<td  width="77%" style='vertical-align:middle;'>${loginUser.userEmail }</td>
						</tr>
					</tbody>
				</table>
			</c:if>	
				<br><br>
				<div class="btn-area">
					<button type="button" class="btn btn-primary" id="btn" onclick="location.href='modifyInfoView.do?userId=${loginUser.userId }';">수정하기</button>
				</div>
		</article>
	</section>
	</c:if>
	<br><br><br><br><br>
	<jsp:include page="../common/chat.jsp"></jsp:include>
	<br><br><br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"></jsp:include>



<script>
	var IMP = window.IMP; 
	IMP.init("imp25073131"); 
	
	$("#pay-btn").click(function(e){
		IMP.request_pay({
		    pg : 'inicis', 
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '연회비 결제',
		    amount : 50000, //판매 가격
		    buyer_name : '${loginUser.userId}',
		    buyer_email : '${loginUser.userEmail}',
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        alert(msg);
		        location.href="updatePaymentStatus.do"
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        alert(msg);
		    }
		    
		});
	});
	
</script>

</body>
</html>