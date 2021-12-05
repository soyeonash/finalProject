<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="style.css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/loginPage/css/login.css" />
</head>
<body>
	<div class="bg-img">
		<div class="content">
			<header>아이디 찾기</header>
			<div class="field space" style="height: 175px;">
				<input type="text" class="pass-key" style="text-align: center;"
					required placeholder="회원님의 아이디는  ${mOne.userId } 입니다.">
			</div>
			<div class="field space">
				<a href="loginView.do"
					style="background: #d9ca40; border: #d9ca40; width: 100%; color: white; line-height: 42px; text-decoration: none;">로그인</a>
			</div>

		</div>
	</div>
	<script>
      const pass_field = document.querySelector('.pass-key');
      const showBtn = document.querySelector('.show');
      showBtn.addEventListener('click', function(){
       if(pass_field.type === "password"){
         pass_field.type = "text";
         showBtn.textContent = "HIDE";
         showBtn.style.color = "#3498db";
       }else{
         pass_field.type = "password";
         showBtn.textContent = "SHOW";
         showBtn.style.color = "#222";
       }
      });
    </script>
</body>
</html>