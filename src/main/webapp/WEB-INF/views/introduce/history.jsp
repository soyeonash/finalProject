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
	<div class="container" style="margin-bottom: 4%; margin-top:10%">
		 <div style="text-align: center; margin-bottom: 2%;">
      		<h1 style="margin-bottom: 1%;">규장각 연혁</h1>
     		 <b>다올대학교 규장각 도서관 연혁입니다</b>
    	</div>	
    </div>  
<hr>
    <div id="history">
        <h2>2019 ~ 현재</h2>
        <div class="list_right">
          <span></span>
          <div>
            <ul>
              <li>
                <dl>
                  <dt>2019.02</dt>
                  <dd>다올학술정보관 다올인의 서재 오픈, Learning Commons 설치</dd>
                </dl>
                <dl>
                  <dt>2019.02</dt>
                  <dd>규장각, 의학도서관 통합관리시스템(Solars8)통합</dd>
                </dl>
              </li>
              <li>
                <dl>
                  <dt>2019.01</dt>
                  <dd>다올학술정보관 복라운지 idea Lab 구축</dd>
                </dl>

              </li>
            </ul>
          </div>
        </div><!--list_right-->
        <h2>2009 ~ 2018</h2>
        <div class="list_left">
          <div>
            <ul>
              <li>
                <dl>
                  <dd>다올학술정보관 무인대출반납시스템 구축, 대출반납데스크 철거</dd>
                  <dt>2018.08</dt>
                </dl>
               
              </li>
              <li>
                <dl>
                  <dd>학술정보관 직제개편(인문학술정보팀, 자연학술정보팀)</dd>
                  <dt>2016.01</dt>
                </dl>
               
              </li>
            </ul>
          </div>
          <span></span>
        </div><!--list_right-->
        <div class="list_left">
            <div>
              <ul>
                <li>
                 
                  <dl>
                    <dd>'2013 한국도서관상' 수상</dd>
                    <dt>2013.12</dt>
                  </dl>
                </li>
                <li>
                 
                  <dl>
                    <dd>다올학술정보관 리모델링</dd>
                    <dt>2011.05</dt>
                  </dl>
                </li>
              </ul>
            </div>
            <span></span>
          </div><!--list_right-->
          <h2>2005</h2>
        <div class="list_right">
          <span></span>
          <div>
            <ul>
              <li>
                <dl>
                  <dt>2005.09</dt>
                  <dd>학술정보관 통합 DL 구축</dd>
                </dl>
               
              </li>
              <li>
                <dl>
                  <dt>2005.08</dt>
                  <dd>주제담당사서제도 시행</dd>
                </dl>
               
              </li>
            </ul>
          </div>

        </div><!--list_right-->
        <h2>2004</h2>
        <div class="list_left">
          <div>
            <ul>
              <li>
                <dl>
                  <dd>존경각 신설(동아시아학술원 산하기관)</dd>
                  <dt>2004.08</dt>
                </dl>
               
              </li>
              <li>
                <dl>
                  <dd>법학도서관 개관</dd>
                  <dt>2004.05</dt>
                </dl>
               
              </li>
            </ul>
          </div>
          <span></span>
        </div><!--list_right-->
        <h2>1998</h2>
        <div class="list_right">
          <span></span>
          <div>
            <ul>
              <li>
                <dl>
                  <dt>1998.12</dt>
                  <dd>의학도서관 신설</dd>
                </dl>
               
              </li>
              <li>
                <dl>
                  <dt>1998.08</dt>
                  <dd>100만 장서확보 기념식</dd>
                </dl>
                
              </li>
            </ul>
          </div>
        </div><!--list_right-->
      </div><!--history-->
  		<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }
      
      ul,li {
        list-style: none;
      }
      
      a {
        text-decoration: none
      }
      
      #history {
        width: 1200px;
        margin: 0 auto;
      }
      
      #history h2 {
        text-align: center;
        font-size: 24px;
        color: #444;
        line-height: 1;
        margin-top: 30px;
      }
      
      .list_right {
        display: table;
        width: 100%;
        table-layout: fixed;
      }
      
      .list_right span {
        display: table-cell;
        vertical-align: top;
      }
      
      .list_right div {
        position: relative;
        display: table-cell;
        vertical-align: top;
      }
      
      .list_right div:before {
        content: "";
        position: absolute;
        left: 0;
        width: 1px;
        height: 100%;
        background: #dfdfdf;
      }
      
      .list_right div ul {
        margin-top: 20px;
      }
      
      .list_right div ul li {
        display: table;
        position: relative;
        width: 100%;
        padding-left: 20px;
      }
      
      .list_right div ul li+li {
        margin-top: 20px;
      }
      
      .list_right div ul li:before {
        content: "";
        position: absolute;
        left: -8px;
        top: 7px;
        width: 12px;
        height: 12px;
        border: 3px solid #0a4a9f;
        border-radius: 50%;
      }
      
      .list_right dl {
        text-align: left;
        display: table;
        width: 100%;
      }
      
      .list_right dl dt {
        width: 10%;
        display: table-cell;
        vertical-align: middle;
        font-size: 14px;
        color: #444;
        font-weight: bold;
        text-align: left;
      }
      
      .list_right dl dd {
        width: 90px;
        display: table-cell;
        vertical-align: middle;
        font-size: 13px;
        color: #444;
        text-align: left;
      }
      
      
      .list_left {
        display: table;
        width: 100%;
        table-layout: fixed;
      }
      
      .list_left span {
        display: table-cell;
        vertical-align: top;
      }
      
      .list_left div {
        position: relative;
        display: table-cell;
        vertical-align: top;
      }
      
      .list_left div:before {
        content: "";
        position: absolute;
        right: -1px;
        width: 1px;
        height: 100%;
        background: #dfdfdf;
      }
      
      .list_left div ul {
        margin-top: 20px;
      }
      
      .list_left div ul li {
        display: table;
        position: relative;
        width: 100%;
        padding-left: 20px;
      }
      
      .list_left div ul li+li {
        margin-top: 20px;
      }
      
      .list_left div ul li:before {
        content: "";
        position: absolute;
        right: -10px;
        top: 7px;
        width: 12px;
        height: 12px;
        border: 3px solid #0a4a9f;
        border-radius: 50%;
      }
      
      .list_left dl {
        text-align: right;
        display: table;
        width: 100%;
        padding-right: 20px;
      }
      
      .list_left dl dt {
        width: 10%;
        display: table-cell;
        vertical-align: middle;
        font-size: 14px;
        color: #444;
        font-weight: bold;
        text-align: right;
      }
      
      .list_left dl dd {
        width: 90px;
        display: table-cell;
        vertical-align: middle;
        font-size: 13px;
        color: #444;
        text-align: right;
      }
    </style>
</body>
</html>