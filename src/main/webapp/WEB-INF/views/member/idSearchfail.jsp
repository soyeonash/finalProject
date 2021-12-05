<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<meta http-equiv="refresh" content="1 url=/idView.do">
<title>아이디 찾기 실패</title>
<link rel="stylesheet" href="style.css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/loginPage/css/login.css" />
</head>
<body>
	<div class="bg-img">
		<div class="content">
			<header style="color: burlywood;">
				아이디 찾기 실패<br>
				<br> <b style="font-size: 19px; color: cornsilk;">정보를 다시
					입력해주세요.</b>
			</header>

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