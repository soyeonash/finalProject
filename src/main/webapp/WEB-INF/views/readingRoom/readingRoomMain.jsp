<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>열람실 예약</title>
<link href="resources/readingRoom/readingRoomMain.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
	<main>
		<div class="readingRoomTitle">
			<p class="readingRoomTitleOne">열람실</p>
			<p class="readingRoomTitleTwo">도서관이용>열람실</p>
		</div>
		<div class="readingRoomDiv">
			<p>열람실 예약<p>
			<table class="readingRoomMainTable">
				<tr>
					<td>
						<table class="readingRoomSubTable">
							<tr>
								<td class="seats" id="1">1</td>
								<td class="seats" id="2">2</td>
								<td class="seats" id="3">3</td>
								<td class="seats" id="4">4</td>
							</tr>
							<tr>
								<td class="seats" id="13">13</td>
								<td class="seats" id="14">14</td>
								<td class="seats" id="15">15</td>
								<td class="seats" id="16">16</td>
							</tr>
						</table>
					</td>
					<td>
						<table class="readingRoomSubTable">
							<tr>
								<td class="seats" id="5">5</td>
								<td class="seats" id="6">6</td>
								<td class="seats" id="7">7</td>
								<td class="seats" id="8">8</td>
							</tr>
							<tr>
								<td class="seats" id="17">17</td>
								<td class="seats" id="18">18</td>
								<td class="seats" id="19">19</td>
								<td class="seats" id="20">20</td>
							</tr>
						</table>
					</td>
					<td>
						<table class="readingRoomSubTable">
							<tr>
								<td class="seats" id="9">9</td>
								<td class="seats" id="10">10</td>
								<td class="seats" id="11">11</td>
								<td class="seats" id="12">12</td>
							</tr>
							<tr>
								<td class="seats" id="21">21</td>
								<td class="seats" id="22">22</td>
								<td class="seats" id="23">23</td>
								<td class="seats" id="24">24</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table class="readingRoomSubTable">
							<tr>
								<td class="seats" id="25">25</td>
								<td class="seats" id="26">26</td>
								<td class="seats" id="27">27</td>
								<td class="seats" id="28">28</td>
							</tr>
							<tr>
								<td class="seats" id="37">37</td>
								<td class="seats" id="38">38</td>
								<td class="seats" id="39">39</td>
								<td class="seats" id="40">40</td>
							</tr>
						</table>
					</td>
					<td>
						<table class="readingRoomSubTable">
							<tr>
								<td class="seats" id="29">29</td>
								<td class="seats" id="30">30</td>
								<td class="seats" id="31">31</td>
								<td class="seats" id="32">32</td>
							</tr>
							<tr>
								<td class="seats" id="41">41</td>
								<td class="seats" id="42">42</td>
								<td class="seats" id="43">43</td>
								<td class="seats" id="44">44</td>
							</tr>
						</table>
					</td>
					<td>
						<table class="readingRoomSubTable">
							<tr>
								<td class="seats" id="33">33</td>
								<td class="seats" id="34">34</td>
								<td class="seats" id="35">35</td>
								<td class="seats" id="36">36</td>
							</tr>
							<tr>
								<td class="seats" id="45">45</td>
								<td class="seats" id="46">46</td>
								<td class="seats" id="47">47</td>
								<td class="seats" id="48">48</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<div class="rsvDiv hidden">
			선택된 좌석 <input type="text" id="selectedSeat" readonly /> 
			예약시간 <select id="reservationTime">
				<option value="default" disabled selected>시간을 선택해 주세요.</option>
				<option value="AM">09:00~15:00</option>
				<option value="PM">15:00~21:00</option>
			</select>
		</div>
		<div>
			<c:if test="${userId eq null }">
				<button onclick="showLoginPage();" class="rsv_btn">로그인</button>
			</c:if>
			<c:if test="${userId ne null }">
				<button class="rsv_btn">예약</button>
			</c:if>
		</div>
	</main>
	<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>

<script>
	// 현재 시간(시, 분)
	var now = new Date();
	// 현재 시간만
	var hr = now.getHours();
	console.log("현재시간", hr);
	if (hr < 15){
		var time = 'am'
	}else {
		var time = 'pm'
	}
	if (hr >= 21){
		alert("예약 가능한 시간이 아닙니다.");
		window.history.back();
	}
	
	// 좌석 현황
	$.ajax({
		url : 'printAllReadingRoom.do',
		type : 'post',
		data : {
			"data" : "data"
		},
		dataType : 'json',
		contentType : 'application/json',

		success : function(data) {
			console.log("예약상황",data)
			data.find(function(ele) {
				if(ele.count == 2){
				    $('#' + ele.seatNo + '').addClass('seatRed');
				}else if(ele.count == 1){
				    $('#' + ele.seatNo + '').addClass("seatOrange");
				}
			});

			$('.seats').not('.seatRed').addClass('seatGreen');

			$('.seatGreen').click(function() {
				$(this).css('background-color', '#e0e0e0');
				$(this).addClass('select');

				$('.seatGreen').not($(this)).css('background-color', '#FFF');
				$('.seatGreen').not($(this)).removeClass('select');
				$('#selectedSeat').val($('.select').text());
				
				// 좌석  별 예약 상태
				$.ajax({
					url : 'selectSeatStatus.do',
					type : 'post',
					data : {
						seatNo : $('#selectedSeat').val()
					},
					success : function(data) {
						$("#reservationTime option[value*='AM']").prop('disabled',false);
						$("#reservationTime option[value*='PM']").prop('disabled',false);
						console.log(1231232,hr)
						if(hr>=21){ // 현재 시간이 21시 보다 크거나 같으면 am,pm 둘다 예약 불가능
							$("#reservationTime option[value*='AM']").prop('disabled',true);
							$("#reservationTime option[value*='PM']").prop('disabled',true);
						}else if(hr>=15) { // 현재 시간이 15시 이후라면 am 예약 불가능
							$("#reservationTime option[value*='AM']").prop('disabled',true);
						}else if(hr<15) { // 현재 시간이 15시 이전이라면 am, pm 둘다 예약 가능
							$("#reservationTime option[value*='AM']").prop('disabled',false);
							$("#reservationTime option[value*='PM']").prop('disabled',false);
						} 
						
						data = JSON.parse(data);
 						if(data.length > 0){ //데이터가 1개 이상일때  reservationTime value 값이 AM이면  AM을 disabled PM이면 PM을 disabled
							for(let i in data){
								console.log(data[i].rReservationTime)
								$("#reservationTime option[value*='"+data[i].rReservationTime+"']").prop('disabled',true);
							} 
						}
						$("#reservationTime option[value*='default']").prop('selected',true);

						var rsvComplete = $('#reservationTime option:disabled').length;
						console.log(rsvComplete);
					},
					error : function() {
						alert('AJAX 통신오류.. 관리자에게 문의하세요');
					},
				});
				
			});
		},
		error : function() {
			alert('AJAX 통신오류.. 관리자에게 문의하세요');
		},
	});

	// 좌석 예약
	$('.rsv_btn').click(function() {
		if ($('.hidden').length > 0) {
			$('.hidden').removeClass('hidden')
		} else {
			if ($('#selectedSeat').val() !== '' && $('#reservationTime').val() !== null) {
				$.ajax({
					url : 'reservationReadingRoom.do',
					type : 'post',
					data : {
						seatNo : $('#selectedSeat').val(),
						rReservationTime : $('#reservationTime').val(),
						userId : $('#userId').val(),
					},
					success : function(data) {
						if (data === 'success') {
							alert("예약이 완료되었습니다.")
							location.reload();
						} else {
							alert('예약실패');
						}
					},
					error : function() {
						alert('AJAX 통신오류.. 관리자에게 문의하세요');
					},
				});
			} else if($('#selectedSeat').val() == '') {
				alert('좌석을 선택해주세요.');
			} else if($('#reservationTime').val() == null) {
				alert('예약시간을 선택해주세요.');
			} else {
				alert('좌석과 예약시간을 선택해주세요.');
			}
		}
	});
	
	function showLoginPage() {
		alert('로그인페이지로 이동합니다.');
		location.href="loginView.do";
	} 
	
</script>
</html>
