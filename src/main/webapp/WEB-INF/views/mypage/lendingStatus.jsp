<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>λμΆνν©</title>
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
	text-align : right;
}
.page-area{
	text-align :center;
}
.review{
	margin : 1%;
}
#review{
	float : right;;
}
.starRev{
	float : right;
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

.side{width:200px;position:sticky;left:3%;top:20%; bottom : 20%;}
.side ul li{line-height:50px;text-align:center; border:1px solid rgb(181,181,181);text-decoration: none;list-style: none;font-size:1.5rem; cursor:pointer;}
.side ul li:first-child{line-height:65px;font-weight:bold; font-size:2rem;background-color:#5a5eb9; color:#fff; cursor:Default;}
.side ul .lo:hover{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}
.sideact{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}
</style>
<script>
$(document).ready(function() {
var asideH = $(".mainContent").height()/2;
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
			<h3 style='text-align:center;'>λ‘κ·ΈμΈ ν μ΄μ© κ°λ₯ν©λλ€</h3><br>
			<div class="btn-area" style="text-align:center;">
				<br>	
				<a href="loginView.do" ><button style="text-align:center;" type="button" class="btn btn-primary" id="login-btn">λ‘κ·ΈμΈ νλ¬ κ°κΈ°</button></a>
			</div>
		</article>
	</section>
	</c:if>
	
	<c:if test="${sessionScope.userId ne null}">
	<section>
		<!-- μ¬μ΄λλ©λ΄ -->
		<aside class="sideMenu">
			<div class="side">
	            <ul>
	               <li>λ§μ΄νμ΄μ§</li>
	               <li class="lo" onclick="location.href='mypageInfo.do?userId=${userId }'">νμμ λ³΄</li>
	               <li class="lo" onclick="location.href='leaveAccount.do?userId=${userId }'">νμνν΄</li>
	               <li class="lo sideact" onclick="location.href='lendingStatus.do?userId=${userId }'" style="background-color:rgb(155,158,213); color:#fff; font-weight:bold;">λμΆλ΄μ­</li>
	               <li class="lo" onclick="location.href='bookingList.do?userId=${userId }'">μμ½λ΄μ­</li>
	               <li class="lo" onclick="location.href='wishList.do?userId=${userId }'">ν¬λ§λμμ μ²­</li>
	               <li class="lo" onclick="location.href='likeList.do?userId=${userId }'">κ΄μ¬λμλ΄μ­</li>
	               <li class="lo" onclick="location.href='tasteSurveyView.do?userId=${userId }'">μ·¨ν₯λΆμ</li>
	               <li class="lo" onclick="location.href='readingroomHistory.do?userId=${userId }'">μ΄λμ€μ΄μ©λ΄μ­</li>
	               <li class="lo" onclick="location.href='studyroomHistory.do?userId=${userId }'">μ€ν°λλ£Έμ΄μ©λ΄μ­</li>
	               <li class="lo" onclick="location.href='qnaList.do?userId=${userId }'">λ¬ΈμνκΈ°</li>
	            </ul>
         	</div>	
		</aside>

		<!-- λ΄μ© -->
		<article class="mainContent">
			<!-- νμ΄ν --><br>
			<h2 id="mainTitle">
				<b>λμΆ νν©</b>
			</h2>
			<br><br><br>
			<c:if test="${empty lendingList }">
				<tr>
					<td colspan="6" align="center"> λμΆ λ΄μ­μ΄ μμ΅λλ€. </td>
				</tr>
			</c:if>
			
			<c:if test="${not empty lendingList }">
			<div id="book-count">
				<p><span>${pi.totalCount}</span> κΆμ μ±μ΄ μμ΅λλ€.</p> 
			</div>
			<br> <br>
				<c:forEach items="${lendingList }" var="lending" varStatus="status">
				<!-- λ³Έλ¬Έ -->
				<br>
					<div class="card">
						<div class="photo">
							<img src="${pageContext.request.contextPath}/resources/bookcover/${lending.bookCover}" width="173.3px" height="220px">
						</div>
						<div class="description">
							<h3><a href="/bookDetail.do?bookNo=${lending.bookNo }">${lending.bookName}</a></h3><input type="hidden" name="bookNo" value="${lending.bookNo }" id="bookNo">
							<p><span>${lending.publisher}</span>&nbsp;|&nbsp;<span>${lending.bookWriter}</span>&nbsp;|&nbsp;<span>${lending.bookYear}</span></p>
							<br>	
							<p>λμΆμΌ : ${lending.lendingBook.lendingDate }</p>
							<p>
								<c:if test="${lending.lendingBook.returnState eq 'N'}">
									<jsp:useBean id="now" class="java.util.Date" />
									<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="today" />
									<fmt:parseNumber value="${today}" integerOnly="true" var="nowTime" scope="request"/>
									<fmt:formatDate pattern = "yyyyMMdd" value="${lending.lendingBook.returnDate}" var="returnDate"/>
									<fmt:parseNumber value="${returnDate}" integerOnly="true" var="returnDate" scope="page"/> 
									<c:set value="${returnDate - nowTime }" var="dateDiff"/>
									<c:if test="${lending.lendingBook.extendCount eq 0}">λ°λ©μμ μΌ : ${lending.lendingBook.returnDate}<c:if test="${dateDiff < 0}">&nbsp;&nbsp;<p style="color :red;">μ°μ²΄μ€</p></c:if></c:if>
									<c:if test="${lending.lendingBook.extendCount eq 1}">λ°λ©μμ μΌ : ${lending.lendingBook.returnDate} (μ°μ₯ 1ν)<c:if test="${dateDiff < 0}"><p style="color :red;">μ°μ²΄μ€</p></c:if></c:if>
								</c:if>
								<c:if test="${lending.lendingBook.returnState eq 'Y'}">λ°λ©μΌμ : ${lending.lendingBook.returnDate}</c:if>
							</p>
							<br>
								<div class="btn-area">
									<c:if test="${sessionScope.userId eq lending.lendingBook.userId and lending.lendingBook.returnState eq 'N'}">
									<c:if test="${lending.lendingBook.extendCount eq 0}"><c:if test="${dateDiff >= 0}"><button class="btn btn-success" onclick="extendLending(this);">μ°μ₯νκΈ°</button></c:if></c:if>
										<input type="hidden" name="lendingNo" value="${lending.lendingBook.lendingNo }">
									</c:if>
									<c:if test="${lending.lendingBook.returnState ne 'N'}">
										<c:if test="${lending.review.reviewContents ne null and lending.review.reviewContents ne ''}"> 
											<button class="btn btn-info" id="reviewDetail" onclick="reviewDetail(this);">μνλ³΄κΈ°</button>
										</c:if> 
										<c:if test="${lending.review.reviewContents eq null or lending.review.reviewContents eq ''}">
											<button class="btn btn-info" id="writeReview" onclick="writeReview(this);">μνμ°κΈ°</button>
										</c:if>
									</c:if>
								</div>
							<br>
						</div>
						<c:if test="${sessionScope.userId eq lending.lendingBook.userId and lending.lendingBook.returnState eq 'Y'}">
								<div class="review reviewBoxWrite" id="reviewBoxWrite">
									<textarea rows="7" cols="92" placeholder="λ΄μ©μ μλ ₯ν΄μ£ΌμΈμ" name="reviewContents" id="reviewContents"></textarea>
									<div class="starRev">
										<span class="starR1 on" data-value="0.5">λ³1_μΌμͺ½</span> <span class="starR2" data-value="1.0">λ³1_μ€λ₯Έμͺ½</span>
										<span class="starR1" data-value="1.5">λ³2_μΌμͺ½</span> <span class="starR2" data-value="2.0">λ³2_μ€λ₯Έμͺ½</span>
										<span class="starR1" data-value="2.5">λ³3_μΌμͺ½</span> <span class="starR2" data-value="3.0">λ³3_μ€λ₯Έμͺ½</span>
										<span class="starR1" data-value="3.5">λ³4_μΌμͺ½</span> <span class="starR2" data-value="4.0">λ³4_μ€λ₯Έμͺ½</span>
										<span class="starR1" data-value="4.5">λ³5_μΌμͺ½</span> <span class="starR2" data-value="5.0">λ³5_μ€λ₯Έμͺ½</span>
										<input type="hidden" name="reviewStar" id="reviewStar">
										 <br> <br>
										<div class="btn-area">
											<input type="hidden" name="bookNo" class="bookNo" value="${lending.bookNo }">
											<button class="btn btn-info btn-sm" id="registerReview" onclick="registerReview(this);">λ±λ‘</button>
											<button class="btn btn-info btn-sm" id="cancelReview" onclick="cancelReview(this);">μ·¨μ</button>
										</div>	
									</div>
								</div>
								<div class="review reviewBoxView" id="reviewBoxView">
									<textarea rows="7" cols="92" placeholder="λ΄μ©μ μλ ₯ν΄μ£ΌμΈμ" name="reviewContents" id="modifyContents">${lending.review.reviewContents }</textarea>
									<div class="starRev">
										<span class="starR1 on" data-value="0.5">λ³1_μΌμͺ½</span> <span class="starR2" data-value="1.0">λ³1_μ€λ₯Έμͺ½</span>
										<span class="starR1" data-value="1.5">λ³2_μΌμͺ½</span> <span class="starR2" data-value="2.0">λ³2_μ€λ₯Έμͺ½</span>
										<span class="starR1" data-value="2.5">λ³3_μΌμͺ½</span> <span class="starR2" data-value="3.0">λ³3_μ€λ₯Έμͺ½</span>
										<span class="starR1" data-value="3.5">λ³4_μΌμͺ½</span> <span class="starR2" data-value="4.0">λ³4_μ€λ₯Έμͺ½</span>
										<span class="starR1" data-value="4.5">λ³5_μΌμͺ½</span> <span class="starR2" data-value="5.0">λ³5_μ€λ₯Έμͺ½</span>
										<input type="hidden" name="reviewStar" id="reviewdStar" value="${lending.review.reviewStar }">
										 <br><br>
										<div class="btn-area">
											<input type="hidden" name="bookNo" class="bookNo" value="${lending.bookNo }">
											<button class="btn btn-info btn-sm" id="modifyReview" onclick="modifyReview(this);">μμ </button>
											<button class="btn btn-info btn-sm" id="deleteReview" onclick="deleteReview(this)">μ­μ </button>
											<button class="btn btn-info btn-sm" id="closeReview" onclick="closeReview(this);">λ«κΈ°</button>
										</div>	
									</div>
								</div>
						</c:if>
					</div>
			</c:forEach>
				<br><br>
				<div class="page-area">
					<c:url var="before" value="lendingStatus.do">
						<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
					</c:url>
					<c:if test="${pi.currentPage <= 1 }">
						[μ΄μ ]
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<a href="${before }">[μ΄μ ]</a>
					</c:if>
					<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
						<c:url var="pagination" value="lendingStatus.do">
							<c:param name="page" value="${p }"></c:param>
						</c:url>
						<c:if test="${p eq pi.currentPage }">
						 	<font color = "#408c99" size="4">[${p }]</font>
						</c:if>
						<c:if test="${p ne pi.currentPage }">
						 	<a href="${pagination }">[${p }]</a>&nbsp;
						</c:if>
					</c:forEach>
					<c:url var="after" value="lendingStatus.do">
						<c:param name="page" value="${pi.currentPage + 1 }">></c:param>
					</c:url>
					<c:if test="${pi.currentPage >= pi.maxPage }">
						[λ€μ]
					</c:if>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<a href="${after } ">[λ€μ]</a>
					</c:if>
				</div>	
			
			</c:if>
		</article>
		<br>
		<br>
	</section>
	</c:if>
<br><br><br><br><br><br><br><br><br>
<jsp:include page="../common/chat.jsp"></jsp:include>
<br><br><br><br><br><br><br><br><br>
<jsp:include page="../common/footer.jsp"></jsp:include>

<script>
$(document).ready(function(){
	
	$(".reviewBoxView").hide();
	$(".reviewBoxWrite").hide(); //μν λ°μ€ μ¨κΈ°κΈ°

	
	//λ³μ (μ)
	$('.starRev span').click(function(){
		 $(this).parent().children('span').removeClass('on');
		 $(this).addClass('on').prevAll('span').addClass('on');
		 var rating = $(this).data("value");
		 $(this).siblings("input[type=hidden]").val(rating); 
		 console.log(rating);
		 return false;
	});
	
	

});



//μνλ³΄κΈ°
function reviewDetail(obj){
	$(obj).parent().parent().next().next().show();
	$(obj).hide();

 	var rating = $(obj).parent().parent().next().next().children($(".starRev")).children(("input[type=hidden]")).val();

	$(obj).parent().parent().next().next().children($(".starRev")).find("span").each(function(index, item) {
		if($(item).data("value") <= rating) {
			$(item).addClass("on");
		}
	});
	

}
//μνλ³΄κΈ° λ«κΈ°
function closeReview(obj){
	$(obj).parent().parent().parent().hide();
	$(obj).parent().parent().parent().prev().prev().children().children("#reviewDetail").show();
}

	
//μνμ°κΈ°μ°½ μ΄κΈ°
function writeReview(obj){
	$(obj).parent().parent().next().show();
	$(obj).hide();

}
//μνμ°κΈ° λ«κΈ°
function cancelReview(obj){
	$(obj).parent().parent().parent().hide();
	$(obj).parent().parent().parent().prev().children().children().last("#cancelReview").show();
}
	
//λ±λ‘
function registerReview(obj){
 	var bookNo = $(obj).prev().val();
	var reviewContents = $(obj).parent().parent().prev().val();
	var reviewStar = $(obj).parent().siblings("input[type=hidden]").val(); 

	$.ajax({
		url : "registerReview.do", 
		type : "post",
		data : {
			"bookNo" : bookNo,
			"reviewContents" : reviewContents,
			"reviewStar" : reviewStar
		},
		success : function(data){
			if(data == "success"){
				location.href="lendingStatus.do"
			}else{
				alert("λ¦¬λ·° λ±λ‘ μ€ν¨");
			}
		},
		error : function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	})
}	
	
//μμ 
function modifyReview(obj){
	var bookNo = $(obj).prev().val();
	var reviewContents = $(obj).parent().parent().prev().val();
	var reviewStar = $(obj).parent().siblings("input[type=hidden]").val(); 
	$.ajax({
		url : "modifyReview.do", 
		type : "post",
		data : {
			"bookNo" : bookNo,
			"reviewContents" : reviewContents,
			"reviewStar" : reviewStar
		},
		success : function(data){
			if(data == "success"){
				alert("μν μμ μ΄ μλ£λμμ΅λλ€.");
				location.href="lendingStatus.do"
			}else{
				alert("λ¦¬λ·° μμ  μ€ν¨");
			}
		},
		error : function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	})
}

//μ­μ 
function deleteReview(obj){
	var bookNo = $(obj).prev().prev().val();
	$.ajax({
		url : "deleteReview.do", 
		type : "post",
		data : {
			"bookNo" : bookNo,
		},
		success : function(data){
			if(data == "success"){
				alert("μμ±νμ  μνμ΄ μ­μ λμμ΅λλ€.");
				location.href="lendingStatus.do"
			}else{
				alert("λ¦¬λ·° μ­μ  μ€ν¨");
			}
		},
		error : function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	})
}
	
//λμΆμ°μ₯
function extendLending(obj){
	var lendingNo = $(obj).next().val();
	$.ajax({
		url : "extendLending.do", 
		type : "post",
		data : {
			"lendingNo" : lendingNo,
		},
		success : function(data){
			if(data == "success"){
				alert("μ°μ₯ μ μ²­μ΄ μλ£λμμ΅λλ€.");
				location.href="lendingStatus.do"
			}else{
				alert("μ°μ₯ μ μ²­ μ€ν¨");
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