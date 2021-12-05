<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취향분석설문</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css" />
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
	height : auto;
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
	/*height : 250px;*/
	border-bottom : 1px solid;
}
.photo{
	width : 25%;
	float: left;
	border : 0.5px solid;
	margin : 2%;
}
.description{
	width : 65%;
	float: left;
	margin-left : 2%;
	margin-top : 2%;
}
.btn-area{
	text-align : center;
}


.starRev{
	float : left;
	margin : 1%;
}
.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}

.side{width:200px;position:sticky;left:3%;top:20%;}
.side ul li{line-height:50px;text-align:center; border:1px solid rgb(181,181,181);text-decoration: none;list-style: none;font-size:1.5rem; cursor:pointer;}
.side ul li:first-child{line-height:65px;font-weight:bold; font-size:2rem;background-color:#5a5eb9; color:#fff; cursor:Default;}
.side ul .lo:hover{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}
.sideact{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}

</style>
<script>
$(document).ready(function(){
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
	               <li class="lo" onclick="leaveAccount.do?userId=${userId }'">회원탈퇴</li>
	               <li class="lo" onclick="location.href='lendingStatus.do?userId=${userId }'">대출내역</li>
	               <li class="lo" onclick="location.href='bookingList.do?userId=${userId }'">예약내역</li>
	               <li class="lo" onclick="location.href='wishList.do?userId=${userId }'">희망도서신청</li>
	               <li class="lo" onclick="location.href='likeList.do?userId=${userId }'">관심도서내역</li>
	               <li class="lo sideact" onclick="location.href='tasteSurveyView.do?userId=${userId }'">취향분석</li>
	               <li class="lo" onclick="location.href='readingroomHistory.do?userId=${userId }'">열람실이용내역</li>
	               <li class="lo" onclick="location.href='studyroomHistory.do?userId=${userId }'">스터디룸이용내역</li>
	               <li class="lo" onclick="location.href='qnaList.do?userId=${userId }'">문의하기</li>
	            </ul>
         	</div>				
		</aside>
		<c:if test="${sessionScope.surveyCheck eq 'Y' }">
			<article class="mainContent" id="beforeLogin">
			<h3 style='text-align:center;'>이미 설문에 참여하셨습니다. </h3><br>
			<div class="btn-area" style="text-align:center;">
				<br>	
				<a href="home.do" ><button style="text-align:center;" type="button" class="btn btn-primary" id="login-btn">추천 도서 보러가기</button></a>
			</div>
			</article>
		</c:if>
	
		<!-- 내용 -->
		<c:if test="${sessionScope.surveyCheck eq 'N' }">
			<article class="mainContent">
				<!-- 타이틀 --><br>	
				<h2 id="mainTitle">
					<b>${sessionScope.userId}님의 취향분석</b>
				</h2>
				<br><br><br>
	
			
				<div id="book-count">
					<p style='color : #5a5eb9;'>과거에 본 도서를 찾아 평가해보세요!</p>
				</div>
				
				<!-- 본문 -->
				<br><br><p style='color : red;'>평가한 도서 각각 확인 버튼을 눌러주세요. 더 많은 도서를 평가할 수록 추천의 정확도가 높아집니다!</p>
				<c:forEach items="${surveyList }" var = "survey" varStatus="status">
					<div class="card">
						<div class="photo">
							<img src="${pageContext.request.contextPath}/resources/bookcover/${survey.bookCover}" width="173.3px" height="220px">
						</div>
						<div class="description">
							<h3>${survey.bookName }</h3>
							<p><span>${survey.publisher }</span>&nbsp;|&nbsp;<span>${survey.bookWriter }</span>&nbsp;|&nbsp;<span>${survey.bookYear }</span></p>
							
							<br>
							<div class="starRev">
								<span class="starR1 on" data-value="0.5">별1_왼쪽</span> <span class="starR2" data-value="1.0">별1_오른쪽</span>
								<span class="starR1" data-value="1.5">별2_왼쪽</span> <span class="starR2" data-value="2.0">별2_오른쪽</span>
								<span class="starR1" data-value="2.5">별3_왼쪽</span> <span class="starR2" data-value="3.0">별3_오른쪽</span>
								<span class="starR1" data-value="3.5">별4_왼쪽</span> <span class="starR2" data-value="4.0">별4_오른쪽</span>
								<span class="starR1" data-value="4.5">별5_왼쪽</span> <span class="starR2" data-value="5.0">별5_오른쪽</span>
								<input type="hidden" name="bookRating" id="bookRating${status.index }">
							</div>
							<br><br>
							<div class="btn-area" style="text-align : right;">
								<input type="hidden" name="bookNo" id="bookNo${status.index }" value="${survey.bookNo }">
								<input type="hidden"  name="bookName" id="bookName${status.index }" value="${survey.bookName }">
								<input type="hidden" name="bookSubject" id="bookSubject${status.index }" value="${survey.bookSubject }">
								<input type="hidden" name="theme" id="theme${status.index }" value="${survey.theme }">
								<button class="btn btn-info" id="writeReview" onclick="checkRating(this);">확인</button>
							</div>
							
					</div>
					</div>
				</c:forEach>
				<br><br>
				<div class="btn-area">
						<button class="btn btn-success" onclick="location.href='submitSurvey.do';">설문 완료</button>&nbsp;&nbsp;
						<button class="btn btn-danger" onclick="location.href='cancelSurvey.do';">초기화</button>
				</div>	
			
			</article>
		</c:if>
		<br>
		<br>

	</section>
	</c:if>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<jsp:include page="../common/chat.jsp"></jsp:include>
	<br><br><br><br><br>
<jsp:include page="../common/footer.jsp"></jsp:include>

<script>
$(document).ready(function(){

	//별점(색)
	$('.starRev span').click(function(){
		 $(this).parent().children('span').removeClass('on');
		 $(this).addClass('on').prevAll('span').addClass('on');
		 var rating = $(this).data("value");
		 $(this).siblings("input[type=hidden]").val(rating); 
		 return false;
	});
});

function checkRating(obj){
	var bookNo = $(obj).prev().prev().prev().prev().val();
	var bookName = $(obj).prev().prev().prev().val();
	var bookRating = $(obj).parent().siblings(".starRev").children().last().val();
	var bookSubject = $(obj).prev().prev().val();
	var theme = $(obj).prev().val();
	
	$.ajax({
		url : "insertRating.do",
		type : "get",
		data : {
			"bookNo" : bookNo,
			"bookName" : bookName,
			"bookRating" : bookRating,
			"bookSubject" : bookSubject,
			"theme" : theme
		},
		success : function(data){
			if(data == "success"){
				$(obj).removeClass('btn-info').addClass('btn-warning');
				$(obj).attr('disabled', true);
				$(obj).html('완료');
			}else{
				alert("전송 실패")	
			}
		},
		error : function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	})
	
}


</script>
</body>
</html>