<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>스터디룸 예약</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="resources/studyRoom/studyRoomMain.css" rel="stylesheet" />

<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" />

<!-- 챗봇용 -->
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- 스와이퍼 -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- 메인페이지 챗봇 스크립트 -->
<link rel="stylesheet" href="/resources/mainPage/css/chatbot.css">
<script type="text/javascript" src="/resources/js/chat.js"></script>

</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<main>
	    <div class="studyRoomTitle">
	        <p class="studyRoomTitleOne">스터디룸</p>
	        <p class="studyRoomTitleTwo">도서관이용>스터디룸</p>
	    </div>
	    <div class="studyRoomDiv">
	        <div class="reservation">
	            <div class="rsv_form">
					<p class="rsv_title">스터디룸 예약</p>
	                <div class="rsv_form_con">
	                    <p>예약일</p>
	                    <c:if test="${userId eq null }">
	                	    <input type="text" onclick="showLoginPage();" placeholder="로그인 후 이용 가능합니다." readonly/>
	                   	</c:if>
	                    <c:if test="${userId ne null }">
	                	    <input type="text" class="dateSelector" id="selectedDate" placeholder="날짜를 선택하세요." readonly />
	                   	</c:if>	                   	
	                    <p>예약시간</p>
		                    <select id="reservationTime">
		                    	<option value="default" disabled selected>시간을 선택해 주세요.</option>
		                        <option value="A">09:00~12:00</option>
		                        <option value="B">12:00~15:00</option>
		                        <option value="C">15:00~18:00</option>
		                        <option value="D">18:00~21:00</option>
		                    </select>
	                    <p>사용 목적</p>
	       	            	<input type="text" id="purpose" placeholder="ex) 토익스터디" />
	                    <p>사용 인원</p>
	                    	<input type="text" id="personnel" placeholder="최소 3인 최대 8인까지 예약 가능합니다." onkeypress="inNumber();" />
	                 </div>
	                 <button class="rsv_btn">예약</button>
	             </div>
	             <div class="alert_div">
	             	<div class="alert_div_con">
						<p>예약이 완료되었습니다.</p>
						<p>예약을 확인하시겠습니까?</p>
	                  <input type="button" onclick="location.href='studyroomHistory.do?userId=${userId }';" value="확인" />
	                  <input type="button" onclick="location.reload();" value="취소" />
	                </div>
	            </div>
	        </div>
	    </div>
	</main>
 		
		<jsp:include page="../common/footer.jsp"></jsp:include>
		
<!-- 챗봇 -->
	<div id="chat-circle" class="btn btn-raised">
    	<div id="chat-overlay"></div>
		    <i class="material-icons">chat</i>
		</div>
		<div class="chat-box">
		    <div class="chat-box-header">
		    	ChatBot
		    	<span class="chat-box-toggle"><i class="material-icons">close</i></span>
		    </div>
		    <div class="chat-box-body">
		    	<div class="chat-box-overlay">   
		    </div>
		    	<div class="chat-logs">
		       	<div class="cm-msg-text">
	            	<span class="main-msg">안녕하세요 규장각 입니다</span><br>
	            	<span class="main-msg">버튼을 클릭 하시거나 키워드를 입력해 주세요!</span><br><br>
	            	<ul>
		                <li class="site">사이트 이용안내</li>
		                <li class="site">대출 * 반납</li>
		                <li class="site">이용시설 안내</li>
		                <li class="site">문의하기</li>
					</ul>
				</div>
				</div><!--chat-log -->
			</div>
		    <div class="chat-input">      
				<form id="send">
			        <input type="text" id="chat-input" placeholder="Send a message..."/>
					<button type="submit" class="chat-submit" id="chat-submit"><i class="material-icons">send</i></button>
				</form>      
			</div>
		</div>

</body>
	
<script>
	var now = new Date();
	var year = now.getFullYear(); // 년도
	var month = now.getMonth()+1; // 월
	var date = now.getDate(); // 날짜
	var dateString = year + '/' + month + '/' + date;
	var hr = now.getHours(); // 현재 시간
	if (hr < 12){
		var time = 'A, 09:00~12:00'
	}else if(hr >= 12 && hr < 15) {
		var time = 'B, 12:00~15:00'
	}else if(hr >= 15 && hr < 18) {
		var time = 'C, 15:00~18:00'
	}else if(hr >= 18 && hr < 21) {
		var time = 'D, 18:00~21:00'
	}else {
		var time = '예약불가'
	}
	console.log("현재시간", time);
	
	// 예약일 달력
	$('.dateSelector').flatpickr({
	    dateFormat: 'Y/m/d',
	    minDate: 'today', // 최소 날짜
	    maxDate: new Date().fp_incr(31),
	    // 31일 이내만 가능
	});
	
	// 날짜 별 시간 조회
		$("#selectedDate").on("change",function(){
			$("#reservationTime option:eq(0)").prop("selected", true);
  			let selectedDate = $("#selectedDate").val();
  			console.log(selectedDate);
			$.ajax({
				url : 'selectTimeStatus.do',
				type : 'post',
				data : {
					sReservationDate : selectedDate
				},
				dataType : 'json',
				success : function(data) {
					if(selectedDate == dateString) { 
						console.log(1231231,hr)
						if(hr < 9) { // 모두 가능 
							$("#reservationTime option[value*='A']").prop('disabled',false);
							$("#reservationTime option[value*='B']").prop('disabled',false);
							$("#reservationTime option[value*='C']").prop('disabled',false);
							$("#reservationTime option[value*='D']").prop('disabled',false);
						} else if (hr >= 9 && hr < 12) { // 9 ~ 11시 이면 B, C, D민 가능
							$("#reservationTime option[value*='A']").prop('disabled',true);
							$("#reservationTime option[value*='B']").prop('disabled',false);
							$("#reservationTime option[value*='C']").prop('disabled',false);
							$("#reservationTime option[value*='D']").prop('disabled',false);
						} else if (hr >= 12 && hr < 15) { // 12 ~ 14시 이면 C, D만 가능
							$("#reservationTime option[value*='A']").prop('disabled',true);
							$("#reservationTime option[value*='B']").prop('disabled',true);
							$("#reservationTime option[value*='C']").prop('disabled',false);
							$("#reservationTime option[value*='D']").prop('disabled',false);
						} else if (hr >= 15 && hr < 18) { // 15 ~ 17시 이면 D만 가능
							$("#reservationTime option[value*='A']").prop('disabled',true);
							$("#reservationTime option[value*='B']").prop('disabled',true);
							$("#reservationTime option[value*='C']").prop('disabled',true);
							$("#reservationTime option[value*='D']").prop('disabled',false);
						} else {
							console.log("all true")
							$("#reservationTime option[value*='A']").prop('disabled',true);
							$("#reservationTime option[value*='B']").prop('disabled',true);
							$("#reservationTime option[value*='C']").prop('disabled',true);
							$("#reservationTime option[value*='D']").prop('disabled',true);
						}
					}else{
						if(data.length > 0){
							$("#reservationTime option[value*='A']").prop('disabled',false);
							$("#reservationTime option[value*='B']").prop('disabled',false);
							$("#reservationTime option[value*='C']").prop('disabled',false);
							$("#reservationTime option[value*='D']").prop('disabled',false);
							for(let i in data){
								console.log(data[i].sReservationTime)
								$("#reservationTime option[value*='"+data[i].sReservationTime+"']").prop('disabled',true);
							}
						}else {
							$("#reservationTime option[value*='A']").prop('disabled',false);
							$("#reservationTime option[value*='B']").prop('disabled',false);
							$("#reservationTime option[value*='C']").prop('disabled',false);
							$("#reservationTime option[value*='D']").prop('disabled',false);
						}
					}
				},
				error : function() {
					alert('AJAX 통신오류.. 관리자에게 문의하세요');
				},
			});
		})
	 
	// 좌석예약
	$('.rsv_btn').click(function () {
	    if ($('.dateSelector').val() == '') {
	        alert('예약일을 선택해주세요.');
	    } else if ($('#purpose').val() == '') {
	        alert('사용 목적을 입력해주세요.');
	    } else if ($('#personnel').val() == '') {
	        alert('사용 인원을 입력해주세요.');
	    } else {
	        $.ajax({
	            url: 'reservationStudyRoom.do',
	            type: 'post',
	            data: {
	                userId: $('#userId').val(),
	                sReservationDate: $('.dateSelector').val(),
	                sReservationTime: $('#reservationTime').val(),
	                purpose: $('#purpose').val(),
	                personnel: $('#personnel').val(),
	            },
	            success: function (data) {
	                if (data === 'success') {
	                    $('.alert_div').css('display', 'block');
	                } else {
	                    alert('예약실패');
	                }
	            },
	            error: function () {
	                alert('AJAX 통신오류.. 관리자에게 문의하세요');
	            },
	        });
	    }
	});
	
	// 인원수 제한 3~8인
	function inNumber() {
	    if ($('#personnel').val().length < 1) {
	        if (event.keyCode < 51 || event.keyCode > 56) {
	            event.returnValue = false;
	        }
	    } else {
	        event.returnValue = false;
	    }
	}
	
	// 로그인 페이지로 이동
	function showLoginPage() {
		alert('로그인페이지로 이동합니다.');
		location.href="loginView.do";
	} 
	
</script>
</html>
