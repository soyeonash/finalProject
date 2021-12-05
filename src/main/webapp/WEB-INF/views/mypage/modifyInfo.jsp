<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>

*{
	margin:0;
	padding : 0;
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
	width : 75%;
	display: grid;
	 
}
#mainTitle{
	color : #656379;
	text-align : center;
}
.table{
	margin-left : 5%;
	margin-right : 5%;
	width : 800px;
	min-width: 600px;
	justify-content : center;
}
.table th{
	height : 45px;
	text-align : center;
	vertical-align:middle;
	margin: auto;
}
.table td{
	height : 45px;
	text-align : center;
	vertical-align:middle;
	margin: auto;
}
.btn-area{
	text-align : center;
}

.side{width:200px;position:sticky;left:3%;top:20%;}
.side ul li{line-height:50px;text-align:center; border:1px solid rgb(181,181,181);text-decoration: none;list-style: none;font-size:1.5rem; cursor:pointer;}
.side ul li:first-child{line-height:65px;font-weight:bold; font-size:2rem;background-color:#5a5eb9; color:#fff; cursor:Default;}
.side ul .lo:hover{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}
.sideact{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}
<script>
$(document).ready(function() {
var asideH = $(".mainContent").height();
console.log(asideH);
$(".sideMenu").css("height", asideH);

});
</script>
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<section>
		<!-- 사이드메뉴 -->
		<aside class="sideMenu">
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

		<!-- 내용 -->
		<article class="mainContent">
			<!-- 타이틀 --><br>
			<h2 id="mainTitle">
				<b>회원 정보 수정</b>
			</h2>
			
			<!-- 본문 --><br><br>
			<form action="modifyInfo.do" method="post" id="form" enctype="multipart/form-data">
			<input type="hidden" name="userType" value="${loginUser.userType }">
			<input type="hidden" name="userNo" value="${loginUser.userNo }">
			<input type="hidden" name="enrollDate2" value="<fmt:formatDate pattern = "yyyy-MM-dd" value="${loginUser.enrollDate }"/>">
			<input type="hidden" name="major" value="${loginUser.major }"> 
 			<c:if test="${loginUser.userType eq '학생' }">
				<input type="hidden" name="studentId" value="${loginUser.studentId }">
			</c:if> 
			
				<table class="table table-borderless" align="center">
					<colgroup>
						<col width="120px">
						<col width="300px">
						<col width="220px">
					</colgroup>
					<tr>
						<th style='vertical-align:middle;'>아이디  </th>
						<td  style='vertical-align:middle;'>
							<input class="form-control" type="text" name="userId" value="${loginUser.userId }" readonly>
						</td>
						<td rowspan="4" style='vertical-align:middle;'>
								<c:if test="${loginUser.profilePic ne null}">	
									<img src="${pageContext.request.contextPath}/resources/muploadFiles/${loginUser.profilePic }" width="230" height="180" name="profilePic">
								</c:if>
								<c:if test="${loginUser.profilePic eq null or loginUser.profilePic eq '' }">	
									<p style="text-align : center;">사진 없음</p>
								</c:if> 
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>비밀번호  </th>
						<td  style='vertical-align:middle;'>
							<input class="form-control" type="password" name="userPwd" value="${loginUser.userPwd }" id="userPwd" > <br>
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>비밀번호 확인  </th>
						<td  style='vertical-align:middle;'>
							<input class="form-control"  type="password" name="pwd-check" value="" id="pwdCheck">
							<span class="guide ok"  id="alert-success" style="display: none; color: blue; padding-top : 10px;">비밀번호가 일치합니다.</span>
							<span class="guide error" id="alert-danger" style="display: none; color: #d92742; padding-top : 10px;">비밀번호가 일치하지 않습니다.<br> 다시 입력해주세요</span>
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>이름  </th>
						<td  style='vertical-align:middle;'>
							<input class="form-control"  type="text" name="userName" value="${loginUser.userName }" readonly>
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>이메일  </th>
						<td style='vertical-align:middle;' >
							<input class="form-control" type="text" name="userEmail" value="${loginUser.userEmail }" >
						</td>
						<td> <input type="file" name="reloadFile"></td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>핸드폰번호  </th>
						<td style='vertical-align:middle;' colspan="2">
							<input class="form-control" name="userPhone" value="${loginUser.userPhone }" >
						</td>
					</tr>
				</table>
				
			
				<!-- 버튼 --><br>
				<div class="btn-area">
					<input type="submit" class="btn btn-primary" id="btn" value="완료">
				</div>
			</form>
		</article>
		<br>
		<br>

	</section>
	<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
<script>
	$("#pwdCheck").focusout(function () {
	    var pwd1 = $("#userPwd").val();
	    var pwd2 = $("#pwdCheck").val();
	
	    if ( pwd1 != '' && pwd2 == '' ) {
	        null;
	    } else if (pwd1 != "" || pwd2 != "") {
	        if (pwd1 == pwd2) {
	            $("#alert-success").css('display', 'inline-block');
	            $("#alert-danger").css('display', 'none');
	        } else {
	            alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
	            $("#alert-success").css('display', 'none');
	            $("#alert-danger").css('display', 'inline-block');
	        }
	    }
	});
		
		$("#btn").on("click", function(){
		    var pwd1 = $("#userPwd").val();
		    var pwd2 = $("#pwdCheck").val();
			
			if(pwd1 != null && pwd1 != "" && pwd2 != null && pwd2 != ""){
				if(pwd1 == pwd2){
					$("#form").submit();
				}else{
					alert("비밀번호가 일치하지 않습니다.");
					return false;
				}
			}else{
				alert("비밀번호를 입력해주세요");
				return false;
			}
			
		}); 
		
</script>
</body>
</html>
			
