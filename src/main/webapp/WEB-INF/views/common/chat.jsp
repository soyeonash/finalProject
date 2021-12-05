<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 챗봇용 -->
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<!-- 스와이퍼 -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- 메인페이지 챗봇 스크립트 -->
<link rel="stylesheet" href="/resources/mainPage/css/chatbot.css">
<script type="text/javascript" src="/resources/js/chat.js"></script>
<title></title>
</head>
<body>
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
</html>

