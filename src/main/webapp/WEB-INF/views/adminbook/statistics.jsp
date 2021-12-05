<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출 통계</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>



<style>
.myButton {
	box-shadow: 0px 10px 14px -7px #276873;
	background: linear-gradient(to bottom, #599bb3 5%, #408c99 100%);
	background-color: #599bb3;
	border-radius: 8px;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 14px;
	font-weight: bold;
	padding: 13px 32px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #3d768a;
}

.myButton:hover {
	background: linear-gradient(to bottom, #408c99 5%, #599bb3 100%);
	background-color: #408c99;
}

.myButton:active {
	position: relative;
	top: 1px;
}

.side {
	width: 200px;
	position: absolute;
	left: 3%;
	top: 25%;
}

.side ul li {
	line-height: 50px;
	text-align: center;
	border: 1px solid rgb(181, 181, 181);
	text-decoration: none;
	list-style: none;
	font-size: 1.5rem;
	cursor: pointer;
}

.side ul li:first-child {
	line-height: 80px;
	font-weight: bold;
	font-size: 2rem;
	background-color: #5a5eb9;
	color: #fff;
	cursor: Default;
}

.side ul .lo:hover {
	background-color: rgb(155, 158, 213);
	color: #fff;
	font-weight: bold;
}

.sideact {
	background-color: rgb(155, 158, 213);
	color: #fff;
	font-weight: bold;
}
</style>

</head>
<body>


	<jsp:include page="../common/header.jsp"></jsp:include>
	<br>

	<div class="side">
		<ul>
			<li>관 리 자</li>
			<li class="lo" onclick="location.href='userListView.do'">회원관리</li>
			<li class="lo" onclick="location.href='bookListView.do'">도서관리</li>
			<li class="lo" onclick="location.href='adQnaList.do'">문의관리</li>
			<li class="lo" onclick="location.href='reportView.do'">신고관리</li>
			<li class="lo sideact" onclick="location.href='statisticsView.do'">대출통계</li>
		</ul>
	</div>
	<div class="container"
		style="margin-bottom: 15%; margin-top: 8%; margin-right: 10%; margin-left: 20%;">
		<h1 style="text-align: center; margin-bottom: 8%;">대출통계</h1>



		<c:if test="${not empty sList}">
			<c:forEach items="${sList }" var="statis">
				<input type="hidden" id="subject" value="${statis.bookSubject }">
				<input type="hidden" class="lending-count11"
					value="${statis.lendingCount }">
			</c:forEach>
		</c:if>
		<div class="chart-div" align="center">
			<canvas id="myChart" width="400" height="200"></canvas>
		</div>





	</div>


	<script src="script.js"></script>




	<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
		// 	function setDisplay(){
		// 	    if($('input:radio[id=weekly-check]').is(':checked')){
		// 	        $('.month-box').hide();
		// 	    }else{

		// 	    }
		// 	};

		var checkArr = [];
		$('.lending-count11').each(function(i) {
			checkArr.push($(this).val());
		});
		var arrSlice1 = Number(checkArr.slice(0, 1));
		var arrSlice2 = Number(checkArr.slice(1, 2));
		var arrSlice3 = Number(checkArr.slice(2, 3));
		var arrSlice4 = Number(checkArr.slice(3, 4));
		var arrSlice5 = Number(checkArr.slice(4, 5));
		var arrSlice6 = Number(checkArr.slice(5, 6));
		var arrSlice7 = Number(checkArr.slice(6, 7));
		var arrSlice8 = Number(checkArr.slice(7, 8));
		var arrSlice9 = Number(checkArr.slice(8, 9));
		var arrSlice10 = Number(checkArr.slice(9, 10));

		var data1 = Math
				.ceil(arrSlice1
						/ (arrSlice1 + arrSlice2 + arrSlice3 + arrSlice4
								+ arrSlice5 + arrSlice6 + arrSlice7 + arrSlice8
								+ arrSlice9 + arrSlice10) * 100);
		var data2 = Math
				.ceil(arrSlice2
						/ (arrSlice1 + arrSlice2 + arrSlice3 + arrSlice4
								+ arrSlice5 + arrSlice6 + arrSlice7 + arrSlice8
								+ arrSlice9 + arrSlice10) * 100);
		var data3 = Math
				.ceil(arrSlice3
						/ (arrSlice1 + arrSlice2 + arrSlice3 + arrSlice4
								+ arrSlice5 + arrSlice6 + arrSlice7 + arrSlice8
								+ arrSlice9 + arrSlice10) * 100);
		var data4 = Math
				.ceil(arrSlice4
						/ (arrSlice1 + arrSlice2 + arrSlice3 + arrSlice4
								+ arrSlice5 + arrSlice6 + arrSlice7 + arrSlice8
								+ arrSlice9 + arrSlice10) * 100);
		var data5 = Math
				.ceil(arrSlice5
						/ (arrSlice1 + arrSlice2 + arrSlice3 + arrSlice4
								+ arrSlice5 + arrSlice6 + arrSlice7 + arrSlice8
								+ arrSlice9 + arrSlice10) * 100);
		var data6 = Math
				.ceil(arrSlice6
						/ (arrSlice1 + arrSlice2 + arrSlice3 + arrSlice4
								+ arrSlice5 + arrSlice6 + arrSlice7 + arrSlice8
								+ arrSlice9 + arrSlice10) * 100);
		var data7 = Math
				.ceil(arrSlice7
						/ (arrSlice1 + arrSlice2 + arrSlice3 + arrSlice4
								+ arrSlice5 + arrSlice6 + arrSlice7 + arrSlice8
								+ arrSlice9 + arrSlice10) * 100);
		var data8 = Math
				.ceil(arrSlice8
						/ (arrSlice1 + arrSlice2 + arrSlice3 + arrSlice4
								+ arrSlice5 + arrSlice6 + arrSlice7 + arrSlice8
								+ arrSlice9 + arrSlice10) * 100);
		var data9 = Math
				.ceil(arrSlice9
						/ (arrSlice1 + arrSlice2 + arrSlice3 + arrSlice4
								+ arrSlice5 + arrSlice6 + arrSlice7 + arrSlice8
								+ arrSlice9 + arrSlice10) * 100);
		var data10 = Math
				.ceil(arrSlice10
						/ (arrSlice1 + arrSlice2 + arrSlice3 + arrSlice4
								+ arrSlice5 + arrSlice6 + arrSlice7 + arrSlice8
								+ arrSlice9 + arrSlice10) * 100);


		var ctx = document.getElementById("myChart");
		var myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ "총류", "철학", "종교", "사회과학", "자연과학", "기술과학", "예술",
						"언어", "문학", "역사" ],
				datasets : [ {
					label : 'Percentage',
					data : [ data10, data9, data8, data3, data7, data1, data6,
							data4, data2, data5 ],
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)',
							'rgba(205, 109, 48, 0.2)',
							'rgba(185, 149, 106, 0.2)',
							'rgba(155, 129, 92, 0.2)',
							'rgba(1005, 89, 54, 0.2)' ],
					borderColor : [ 'rgba(255,99,132,1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)', 'rgba(205, 109, 48, 1)',
							'rgba(185, 149, 106, 1)', 'rgba(155, 129, 92, 1)',
							'rgba(1005, 89, 54, 1)' ],
					borderWidth : 1
				} ]
			},
			options : {
				scales : {

					yAxes : [ {
						ticks : {

							min : 0,
							max : 100,
							callback : function(value) {
								return value + "%"
							}
						},
						scaleLabel : {
							display : true,
							labelString : "Percentage"
						}
					} ]
				}
			}
		});
	</script>
</body>
</html>