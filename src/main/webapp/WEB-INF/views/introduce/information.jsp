<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
#introduce1 {
	margin-bottom: 2%;
	font-size: revert;
	text-align:center;
	width: 90%;
}

#introduce {
	margin-bottom: 4%;
	text-align: center;
	background-color: aliceblue;
	margin: left;
	width: 90%;
}

* {
	margin: 0;
	padding: 0;
}

ul {
	list-style: none;
}

.tablink{
	display:block;
	text-decoration: none;
	color:black;
}

.tablink:link { color: black; text-decoration: none;}
.tablink:visited { color: black; text-decoration: none;}
.tablink:hover { color: black; text-decoration: none;}


#wrap {
	width:1000px;
	margin: 0 auto;
}


.navi1 {
	width:300px;
	float:left;
	text-align:center;
	position:sticky;
	top:20%;
}

.navi1 ul li {
	line-height: 50px;
	font-weight: bold;
	font-size: 20px;
	border:1px solid rgb(181,181,181);
	border-left:none;
	border-right:none;
}

.logoli {
	padding: 20px 0;
}


.button{
	cursor:pointer;
	display:block;
	background-color : white;
	border : none;
	color:black;
	font-size:20px;
}
.cont{display:none;margin-left:14%;}
.act{display:block;}
.active{background-color:rgb(155,158,213);}
.active span{color:#fff;}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>
	<br>
	<div class="container" style="margin-bottom: 4%; margin-top: 10%">

	</div>
	<div style="text-align: center; margin-bottom: 2%;">
		
	</div>
	<div style="width:310px;height:80vh;position:absolute;left:2%;">
		<div class="navi1">
			<ul>
				<li class="button"><a href="#time" class="tablink active" id="menuOne"data-tab="tab-1"><span>이용시간</span></a></li>
				<li class="button"><a href="#card" class="tablink"  id="menuTwo" data-tab="tab-2"><span>이용증 발급</span></a></li>
				<li class="button"><a href="#lend" class="tablink" id="menuThree" data-tab="tab-3"><span>대출·반납·연장·예약</span></a></li>
				<li class="button"><a href="#room" class="tablink"  id="menuFour" data-tab="tab-4"><span>열람실·스터디룸 이용</span></a></li>
			</ul>
		</div>
	</div>
	<div id="wrap">
		<div class="content">
			<div class="cont tab-1 act">
				<h2 id="introduce1">학기중 이용시간</h2>
				<table class="table" style="text-align: center;">
					<tr>
						<th style="text-align: center;background-color: aliceblue;">구분</th>
						<th colspan="2" style="text-align: center;background-color: aliceblue;">학기</th>
						<th style="text-align: center;background-color: aliceblue;">시험기간 (시험전주 포함)</th>
					</tr>
					<tr>
						<td rowspan="2" style="line-height: 58px;">대출자료실 미디어실</td>
						<td>평일</td>
						<td>09:00 - 21:00</td>
						<td>09:00 - 21:00</td>
					</tr>
					<tr>
						<td>토요일</td>
						<td>09:00 - 21:00</td>
						<td>09:00 - 17:00</td>
					</tr>
					<tr>
						<td rowspan="2" style="line-height: 58px;">참고자료실</td>
						<td>평일</td>
						<td>09:00 - 21:00</td>
						<td>09:00 - 21:00</td>
					</tr>
					<tr>
						<td>토요일</td>
						<td>휴실</td>
						<td>09:00 - 17:00</td>
					</tr>
				</table>
				
				<h2 id="introduce1" style="margin-top: 8%;">방학중 이용시간</h2>
				<table class="table"
					style="text-align: center;">
					<tr>
						<th rowspan="2" colspan="2" style="text-align: center;background-color: aliceblue;">구분</th>
						<th colspan="2" style="text-align: center;background-color: aliceblue;">하계방학</th>
						<th colspan="2" style="text-align: center;background-color: aliceblue;">동계방학</th>
					</tr>
					<tr>
						<th  style="text-align: center;background-color: aliceblue;">단축운영</th>
						<th  style="text-align: center;background-color: aliceblue;">이 외</th>
						<th  style="text-align: center;background-color: aliceblue;">단축운영</th>
						<th  style="text-align: center;background-color: aliceblue;">이 외</th>
					</tr>
					<tr>
						<td rowspan="2" style="line-height: 58px;">대출자료실 미디어실</td>
						<td>평일</td>
						<td>09:00 - 16:00</td>
						<td>09:00 - 18:00</td>
						<td>09:00 - 16:00</td>
						<td>09:00 - 18:00</td>
					</tr>
					<tr>
						<td>토요일</td>
						<td>09:00 - 15:00</td>
						<td>09:00 - 15:00</td>
						<td>09:00 - 15:00</td>
						<td>09:00 - 15:00</td>
					</tr>
					<tr>
						<td rowspan="2" style="line-height: 58px;">참고자료실</td>
						<td>평일</td>
						<td>09:00 - 16:00</td>
						<td>09:00 - 18:00</td>
						<td>09:00 - 16:00</td>
						<td>09:00 - 18:00</td>
					</tr>
					<tr>
						<td>토요일</td>
						<td colspan="2">휴실</td>
						<td colspan="2">휴실</td>
					</tr>
				</table>
				
				<h2 id="introduce1" style="margin-top: 8%;">열람실 · 스터디룸 개관시간</h2>
				<table class="table" style="text-align: center;">
					<tr>
						<th colspan="2" style="text-align: center;background-color: aliceblue;">구분</th>
						<th style="text-align: center;background-color: aliceblue;">학기</th>
						<th style="text-align: center;background-color: aliceblue;">방학</th>
						<th style="text-align: center;background-color: aliceblue;">비고</th>
					</tr>
					<tr>
						<td>열람실</td>
						<td>1층</td>
						<td colspan="2">09:00-21:00</td>
						<td rowspan="2" style="    line-height: 58px;">연중무휴</td>
					</tr>
					<tr>
						<td>스터디룸</td>
						<td>2층</td>
						<td colspan="2">09:00-21:00</td>
					</tr>
				</table>
			</div>
			<div class="cont tab-2">
				<h2 id="introduce1">대상</h2>
				<div id="introduce">· 다올 대학교 규장각 도서관 이용을 희망하는 자</div>

				<h2 id="introduce1">이용증 발급 절차</h2>
				<div id="introduce">
					1)규장각 도서관 회원가입<br> 2)마이페이지 > 연회비 결제<br> 3)담당자가 결제 확인 후
					이용증 발급<br> 4)이용증 발급 완료 이메일 확인 후 도서관 이용
				</div>

				<h2 id="introduce1">연회비</h2>
				<div id="introduce">
					· 연회비 1년 : 50,000원<br> 연회비는 카드 결제 시스템을 이용하여 납부<br> ※ 이용증 발급
					· 후 연회비 환불조치는 원칙적으로 불가함
				</div>

				<h2 id="introduce1">서비스 이용범위</h2>
				<div id="introduce">
					· 연회비를 납부한 경우 다음과 같은 서비스 이용이 가능함
					<li>시설 이용 : 도서관 출입 및 제반 시설 (열람실,스터디룸 등 이용</li>
					<li>자료 이용 : 도서관 자료 대출 (단행본 연출 5책 14일 : 1회 연장) 및 홈페이지 이용자 서비스
						(도서 예약, 대출 등) 가능</li>
				</div>

				<h2 id="introduce1">안내 및 문의</h2>
				<div id="introduce">규장각 1F 인포메이션 : 02-1234-5678</div>
			</div>
			<div class="cont tab-3" id="tab-3">
				<h2 id="introduce1">도서 대출</h2>
				<div id="introduce">
					· 대출 자격 : 다올 대학교 학생 및 이용증 발급 회원<br> · 대출 권수 및 기간<br>
				</div>
				<table class="table" style="text-align: center;width: 90%;">
					<tr>
						<th  style="text-align: center;">권수</th>
						<th  style="text-align: center;">기간</th>
					</tr>
					<tr>
						<td>5권</td>
						<td>14일</td>
					</tr>
				</table>
				

				<h2 id="introduce1" style="margin-top: 6%;">도서 반납</h2>
				<div id="introduce" >
					반납 장소 : 자료실 대출 반남 데스크 (일반 열람실), 무인반납기<br> · 무인반납기 운영<br>
					- 설치 위치 : 규장각 도서관 후문 옆<br> - 운영 시간 : 도서관 폐관 시간 (※코로나19로 제한적 운영
					중에는 임시 운영 시간 기준으로 무인 반납기 운영)<br> - 주의 사항 : 무인 반납기는 부록을 대출하지 않은
					도서만 반납가능합니다.
				</div>
				

				<h2 id="introduce1" style="margin-top: 6%;}">대출 연장</h2>
				<div id="introduce" >
					도서 대출 기간은 기본 14일(대출일 포함)이나, 예약이 없는 책은 1회(7일)에 한해 연장 신청이 가능<br>
					반납 예정일 7일전부터 연장 신청이 가능하며, 연체도서가 있는 경우 연장 불가
				</div>
				<table class="table" style="text-align: center;width: 90%;">
					<tr>
						<th  style="text-align: center;">STEP 01</th>
						<th  style="text-align: center;">STEP 02</th>
						<th  style="text-align: center;">STEP 03</th>
						<th  style="text-align: center;">STEP 04</th>
					</tr>
					<tr>
						<td>홈페이지 로그인</td>
						<td>마이페이지</td>
						<td>대출현황</td>
						<td>[연장]버튼클릭</td>
					</tr>
				</table>


				<h2 id="introduce1" style="margin-top: 6%;}">도서 예약</h2>
				<div id="introduce">
					대출중인 도서를 예약하면 예약 순서에 따라 도서가 반납되는 즉시 개별 통보(Email)<br> 예약자가 대출가능
					통보를 받은 후 3일 이내에 대출하지 않으면 자동 취소
				</div>
				<table class="table" style="text-align: center;width: 90%;">
					<tr>
						<th  style="text-align: center;">STEP 01</th>
						<th  style="text-align: center;">STEP 02</th>
						<th  style="text-align: center;">STEP 03</th>
						<th  style="text-align: center;">STEP 04</th>
					</tr>
					<tr>
						<td>홈페이지 로그인</td>
						<td>도서 검색</td>
						<td>도서 [상세정보]</td>
						<td>[예약]버튼 클릭</td>
					</tr>
				</table>
			</div>
			<div class="cont tab-4">
				<h2 id="introduce1">좌석 예약</h2>
				<div id="introduce">
					· 규장각 도서관 홈페이지 '열람실·스터디룸 이용'페이지에서 좌석 예약 가능하며, 마이페이지 '열람실·스터디룸 이용내역'에서 취소 가능<br>
					· 1일 1회에 한하여 원하는 좌석을 예약할 수 있으며, 예약은 당일 예약만 가능<br>
				</div>
				<table class="table"
					style="text-align: center; width: 90%;">
					<tr>
						<th style="text-align: center;">STEP 01</th>
						<th style="text-align: center;">STEP 02</th>
						<th style="text-align: center;">STEP 03</th>
					</tr>
					<tr>
						<td>좌석 선택</td>
						<td>이용시간 입력</td>
						<td>좌석 예약 완료</td>
					</tr>
				</table>


				<h2 id="introduce1" style="margin-top: 6%;">스터디룸 예약</h2>
				<div id="introduce">
					· 규장각 도서관 홈페이지 '열람실·스터디룸 이용' 페이지에서 사전 예약 후 이용 <br>
					· 3인 이상(최대 수용인원 8명) 이용시 예약가능하며, 1일 최대 2시간 이용 가능 <br>
					· 예약시 날짜, 이용시간, 사용목적, 사용인원 입력
				</div>


				<h2 id="introduce1" style="margin-top: 6%;">이용시간</h2>
				<table class="table"
					style="text-align: center; width: 90%;">
					<tr>
						<th style="text-align: center;">구분</th>
						<th style="text-align: center;">스터디룸 01</th>
					</tr>
					<tr>
						<td>평일</td>
						<td>09:00-21:00</td>
					</tr>
					<tr>
						<td>토요일</td>
						<td>09:00-21:00</td>
					</tr>
					<tr>
						<td>일요일</td>
						<td>09:00-21:00</td>
					</tr>
				</table>
			</div>
		</div>
</div>
<div style="margin-top:20%"></div>
		<jsp:include page="../common/chat.jsp"></jsp:include>
		<jsp:include page="../common/footer.jsp"></jsp:include>
<script>
	$(".tablink").on("click",function(){
		var tab_id = $(this).attr('data-tab');
		$(".tablink").removeClass("active");
		$(".cont").removeClass("act");
		$(this).addClass("active");
		$("."+tab_id).addClass("act");
	});
	
	if(location.hash === "#lend"){
		$(".tablink").removeClass("active");
		$(".cont").removeClass("act");
		$("#menuThree").addClass("active");
		$(".tab-3").addClass("act");
	};
	if(location.hash === "#room"){
		$(".tablink").removeClass("active");
		$(".cont").removeClass("act");
		$("#menuFour").addClass("active");
		$(".tab-4").addClass("act");
	};
	if(location.hash === "#card"){
		$(".tablink").removeClass("active");
		$(".cont").removeClass("act");
		$("#menuTwo").addClass("active");
		$(".tab-2").addClass("act");
	};
	
</script>
</body>
</html>