<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
.myButton {
	box-shadow: 0px 10px 14px -7px #276873;
	background:linear-gradient(to bottom, #599bb3 5%, #408c99 100%);
	background-color:#599bb3;
	border-radius:8px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:14px;
	font-weight:bold;
	padding:13px 32px;
	text-decoration:none;
	text-shadow:0px 1px 0px #3d768a;
}
.myButton:hover {
	background:linear-gradient(to bottom, #408c99 5%, #599bb3 100%);
	background-color:#408c99;
}
.myButton:active {
	position:relative;
	top:1px;
}

</style>
</head>
<body>

<jsp:include page="../common/header.jsp"></jsp:include>
	<br>
	<div class="container" style="margin-bottom: 0%; margin-top:10%">
		
    </div>  
<h1 style="text-align: center;margin-bottom: 5%;">규장각 오시는 길</h1>
    <hr>

    <div id="map" style="text-align: center;"> 
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1580.9918298516402!2d126.98849587640085!3d37.57900246379022!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2da3a14f77d%3A0xe21a30684ba2fd29!2z6rec7J6l6rCB!5e0!3m2!1sko!2skr!4v1635686942653!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe> 
    </div>
    <div style="text-align: center;margin-bottom: 4%;">
        <h2><i class="fas fa-arrow-alt-circle-right"></i>규장각 오시는 길 서울특별시 종로구 와룡동 율곡로 99</h2>
    </div>
    <div style="text-align: center;margin-bottom: 6%">
        <h2 style="margin-bottom: 5%;width: 70%;"><i class="far fa-arrow-alt-circle-right"></i> 교통편 안내</h2>

        <div style="width: 70%;    margin-bottom: 1%;">-지하철 정보</div>
       
        <table class="type09" style="text-align: center; margin: auto;margin-bottom: 4%;">
            <thead>
            <tr>
              <th scope="cols">노선</th>
              <th scope="cols">출구</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <th scope="row">2호선</th>
              <td>다올대입구역 5번출구</td>
            </tr>
            <tr>
              <th scope="row">5호선</th>
              <td>규장각역 2번출구</td>
            </tr>
            </tbody>
          </table>
       
          <div style="width: 70%;    margin-bottom: 1%;">-버스 정보</div>

          <table class="type09" style="text-align: center; margin: auto;">
            <thead>
            <tr>
              <th scope="cols">정류장명</th>
              <th scope="cols">버스번호</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <th scope="row">다올대학교</th>
              <td>1002-1</td>
            </tr>
            <tr>
              <th scope="row">다올대입구역</th>
              <td>603번</td>
            </tr>
            </tbody>
          </table>
    </div>
  		<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<style>
     #contact_map { width: 800px; height: 500px; }
      #contact_map iframe { width: 100%; height: 100%; border:0; } 
      table.type09 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;

}
table.type09 thead th {
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #369;
  border-bottom: 3px solid #036;
}
table.type09 tbody th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #f3f6f7;
}
table.type09 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
    </style>
</body>
</html>