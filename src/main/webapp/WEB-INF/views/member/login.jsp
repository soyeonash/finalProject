<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>규장각 로그인</title>
<link rel="stylesheet" href="style.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/loginPage/css/login.css" />
</head>

<body>

	<div class="bg-img">
		<div class="content">
			<header>Login</header>
			<form action="login.do" method="post">
				<div class="field">
					<span class="fa fa-user"></span> <input type="text" required
						placeholder="ID" name="user-id" id="user-id">
				</div>
				<div class="field space">
					<span class="fa fa-lock"></span> <input type="password"
						class="pass-key" required placeholder="Password" name="user-pwd"
						id="user-pwd"> <span class="show">SHOW</span>
				</div>
				<div class="pass">
					<a href="searchView.do">Forgot &nbsp;&nbsp;&nbsp;ID / Password?</a>
				</div>
				<div class="field">
					<input type="submit" value="LOGIN">
				</div>
			</form>
			<div class="login">Or login with</div>
			<div class="links">
				<div class="facebook">
					<input type="hidden" name="kakaoemail" id="kakaoemail" /> <input
						type="hidden" name="kakaoname" id="kakaoname" /> <a
						href="javascript:kakaoLogin();" style="color: white;"><i
						class="fas fa-comment"><span>kakao</span></i></a>
				</div>
				<!--           <form name="kakaoForm" id="kakaoForm" method = "post" action="/user/setSnsInfo.do"> -->
				<!-- 			<input type="hidden" name="email" id="kakaoEmail" /> -->
				<!-- 			<input type="hidden" name="id" id="kakaoId" /> -->
				<!-- 			<input type="hidden" name="flag" id="flag" value="kakao" /> -->
				<!-- 		  </form> -->
			</div>
			<div class="signup">
				아직 계정이 없으신가요? <a href="enrollType.do">Signup Now</a>
			</div>
		</div>
	</div>
	<script>
    
   
    
     Kakao.init("c637ca01ecee964368b81b9362e975bd");
     console.log(Kakao.isInitialized());
     function kakaoLogin() {
    		
    	    Kakao.Auth.loginForm({
    	        success: function(response) {
    	            Kakao.API.request({ // 사용자 정보 가져오기 
    	                url: '/v2/user/me',
    	                
    	                success: function(response) {
    	                	var kakaoid = response.id+"K";
    	                	console.log(kakaoid);
    	                    $.ajax({
    	    					type : "post",
    	    					url : '/idDuplicateCheck.do', // ID중복체크를 통해 회원가입 유무를 결정한다.
    	    					data : {"userId":kakaoid},
    	    					success : function(result){   				
    	    						if(result != 0){
    	    							// 존재하는 경우 로그인 처리
    	    							createHiddenLoginForm(kakaoid);
    	    						} else{
    	    							if(confirm('가입되지 않은 회원정보입니다. 회원가입을 진행하시겠습니까?')){
    	    									$.ajax({
    	    										url : "enrollView.do",
    	    										type : "get",
    	    										data : {"userId" : kakaoid},
    	    										success: function(data){
														location.href="kakaoEnrollView.do?userId="+kakaoid;
    	    										},
    	    										error : function(){
    	    											alert('error');
    	    										}
    	    									});
    	    								}else{
    	    									return false;
    	    								};
    	    							};
    	    						}
    	    					}
    	                    )}
    	            })
    	            }}
    	    )}
     
    	    	

    	function createHiddenLoginForm(kakaoId){
    		
    		var frm = document.createElement('form');
    		frm.setAttribute('method', 'post');
    		frm.setAttribute('action', '/kakaoLogin.do');
    		var hiddenInput = document.createElement('input');
    		hiddenInput.setAttribute('type','hidden');
    		hiddenInput.setAttribute('name','userid');
    		hiddenInput.setAttribute('value',kakaoId);
    		frm.appendChild(hiddenInput);
    		document.body.appendChild(frm);
    		frm.submit();
    		
    	}
      
    </script>
</body>
</html>