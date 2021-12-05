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


			<form action="idSearch.do" method="post">
				<div class="field space">
					<input type="text" class="pass-key" required placeholder="NAME"
						name="userName">
				</div>
				<div class="field space">
					<input type="text" class="pass-key" required placeholder="EMAIL"
						name="userEmail">
				</div>
				<div class="field space">
					<input type="text" class="pass-key" required
						placeholder="PHONE(-제거)" name="userPhone">
				</div>
				<div class="field space">
					<input type="submit" value="아이디찾기"
						style="background: #d9ca40; border: #d9ca40;">
				</div>
			</form>


			<div></div>

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