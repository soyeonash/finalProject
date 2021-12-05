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
<h1 style="text-align:center; margin-bottom: 4%;" >인사말</h1>
    <hr>
    <div style="width: 50%;text-align: center;margin: auto;height: 340px; background-image: url('/resources/img/greetings.png');background-repeat: no-repeat; background-size: 100% 100%;margin-top: 6%;"></div>

    <div style="width: 25%;float: left;text-align: right;margin-left: 19%;margin-top: 3%;">
        <b style="font-size: 12px;font-weight: 500;line-height: 1.2em;letter-spacing: 5px;">
        DAOL LIBRARY
        </b>
        
        <h1 style="color: #4c4c4e; font-size: 59px;font-weight: 600;">Greeting</h1>
        <em>책을 통해,</em>
        <em>만나는</em>
        <em>새로운 세상</em>
    </div>

    <div style="    width: 23%;position: right;float: right; margin-right: 25%; margin-top: 3%; margin-bottom: 10%;">
        <span style="color: #3e3e3f;font-size: 22px;font-weight: 600;font-family: 'nsr';">
        	다올대학교 도서관 규장각 홈페이지 방문을 진심으로 환영합니다 !
        </span><br><br>
        <b style="    font-weight: 500; color: #757577; letter-spacing: -0.9px;">
       		 언제나 도서관을 이용하시는 분들의 편의를 최우선으로 생각하며,
      		  사람이 책을 만들고, 책이 사람을 만든다는 말처럼
      		  사람과 책의 소중한 만남이 있는 아름다운 도서관으로 거듭날 수 있도록 최선을 다하겠습니다.<br><br>

        	규장각 도서관은 이용자의 입장에서 먼저 생각하고 이용자의 의견을 적극 수용하는 열린 서비스를 펼치도록 하겠습니다.
        <br><br>홈페이지를 많이 이용해 주시고, 이용자 여러분의 많은 관심과 성원을 부탁드립니다.

      		  감사합니다.
        </b>
    </div>
  		<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
</body>
</html>