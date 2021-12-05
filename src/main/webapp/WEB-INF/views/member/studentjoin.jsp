<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 회원가입</title>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/loginPage/css/login.css" />
<style>
.field {
	position: relative;
	height: 45px;
	width: 61%;
	display: flex;
	background: rgba(255, 255, 255, 0.94);
	border: double;
	border-color: darkgoldenrod;
}

.field span {
	color: #222;
	width: 140px;
	line-height: 45px;
	border: double;
	border-color: darkgoldenrod;
}

label {
	color: rgb(0, 0, 0);
}

input[type="radio"]:checked+label {
	color: darkgoldenrod;
}

span.guide {
	display: none;
	font-size: 12px;
	top: 12px;
	right: 10px;
	font-weight: border;
	text-align: right;
}

span.ok {
	color: green;
	border: none;
	width: 110%
}

span.error {
	color: red;
	border: none;
	width: 110%
}
</style>
</head>
<body>
	<div class="bg-img">
		<div class="content" style="width: 40%; height: 83%;">
			<header>회원가입</header>
			<form action="enrollStudent.do" method="post" enctype="multipart/form-data">

				<div class="field">
					<input type="text" required placeholder="아이디" name="userId"
						id="userId"> <span class="guide ok">이 아이디는 사용
						가능합니다.</span> <span class="guide error">이 아이디는 사용할 수 없습니다.</span>
				</div>

				<div class="image-container">
					<input type='file' id="imgInput"
						style="position: absolute; bottom: 46%; right: -2%;"
						name="uploadFile" /> <img id="image_section"
						src="data:image/png;base64,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"
						alt="your image"
						style="position: absolute; width: 28%; top: 19%; height: 30%; right: 6%;"/>
				</div>

				<div class="field space">
					<input type="password" class="pass-key" required placeholder="비밀번호"
						name="userPwd" id="userPwd"><span id="out"
						style="border: none"></span>
				</div>

				<div class="field space">
					<input type="password" class="pass-key" required
						placeholder="비밀번호 확인" name="pwd-check" id="pwd-check">
				</div>

				<input type="hidden" name="userType" value="학생">

				<div class="field space">
					<input type="text" class="pass-key" required placeholder="이름"
						name="userName" id="userName">
				</div>

				<div class="field space">
					<input type="text" class="pass-key" required
						placeholder="핸드폰 번호(-제거)" name="userPhone" id="userPhone">
				</div>


				<div class="field space" style="width: 80%;">
					<input type="text" class="pass-key" required
						placeholder="이메일 (학교이메일을 입력해주세요)" name="userEmail" id="userEmail"><span
						id="out2" style="border: none"></span>
				</div>
				<button
					style="position: absolute; width: 15%; right: 6%; height: 6%; top: 61%;"
					id="e-email">이메일 인증</button>

				<div class="field space" style="width: 59%;">
					<input type="text" class="pass-key" required
						placeholder="학번 (다올대학교 학생만 입력해 주세요.)" name="studentId"
						id="studentId">
				</div>

				<div class="field space"
					style="width: 40%; float: right; bottom:; position: relative; bottom: 61px;">
					<span style="border: none;">전공 : </span> <select name="major">
						<option value="인문사회">인문사회</option>
						<option value="자연과학">자연과학</option>
						<option value="공학">공학</option>
						<option value="예체능">예체능</option>
						<option value="의학">의학</option>
					</select>
				</div>

				<div class="login" id="chK10" style="margin-left: 29%;">※ 인증 후
					가입 가능합니다.</div>

				<div class="field space"
					style="margin-left: 19%; margin-top: 4%; height: 65px;">
					<input type="submit" value="가입하기" id="chkNo1"
						style="background-color: darkgoldenrod; border: none;" disabled>
				</div>

			</form>
		</div>
	</div>
	<script>
	$("#userId").on("blur", function(){
		var userId = $("#userId").val();
		$.ajax({
			url : "checkDupId.do",
			data : {"userId" : userId},
			success : function(result){
				/* console.log(result); */
				if(result != 0){
					$(".guide.ok").hide();
					$(".guide.error").show();
				}else{
					$(".guide.ok").show();
					$(".guide.error").hide();
				}
			},
			error : function(){
				alert("ajax 전송 실패! 관리자에게 문의하세요~");
			},
			/* complete : function(){
				
			} */
		});
	})
	
	$('#pwd-check').keyup(function(){

var pw1=$('#userPwd').val().trim();

if(pw1==""){

alert("패스워드를 입력하세요");

$('#pwd-check').val('');

$('#userPwd').focus();

}

var pw2=$('#pwd-check').val().trim();

if(pw1.length!=0 && pw2.length!=0){

if(pw1==pw2)

{

$('#out').html("패스워드가 일치합니다.");

$('#out').css({'color':'green','width':'110%','font-size':'12px','border':'none','text-align':'right'});

}

else{

$('#out').html("패스워드가 일치하지 않습니다.");

$('#out').css({'color':'red','width':'110%','font-size':'12px','border':'none','text-align':'right'});

}

}

});
	
	function readURL(input) {
		 if (input.files && input.files[0]) {
		  var reader = new FileReader();
		  
		  reader.onload = function (e) {
		   $('#image_section').attr('src', e.target.result);  
		  }
		  
		  reader.readAsDataURL(input.files[0]);
		  }
		}
		 
		// 이벤트를 바인딩해서 input에 파일이 올라올때 위의 함수를 this context로 실행합니다.
		$("#imgInput").change(function(){
		   readURL(this);
		});
		
		$('#e-email').click(function(){
			var reg=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[d,D]{1}[a,A]{1}[o,O]{1}[l,L]{1}.[a,A]{1}[r,R]{1}.[k,K]{1}[r,R]{1}$/;
			var email =$('#userEmail').val().trim();
			
			if(!reg.test(email)){
				alert('인증에 실패하였습니다.');
				$('#userEmail').val('');
				$('#userEmail').focus();
			}else{
				alert('인증이 완료되었습니다.');
				$('#e-email').css({'display':'none'});
				$('#studentId').focus();
				$("#userEmail").attr("readonly",true);
				$('#out2').html("인증 완료");
				$('#out2').css({'color':'green','width':'110%','font-size':'12px','border':'none','text-align':'right'});
				$('#chkNo1').removeAttr("disabled")
				$("#chK10").hide();
			}
		})
	





    
    </script>
</body>
</html>