<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성</title>
<style>
	*{margin:0;padding:0}
	header{top:0}
	#wrap{width:1400px;height:800px;margin:0 auto;margin-top:200px}
	input{outline:none;border:none;border-bottom:1px solid rgb(220,220,220); padding:10px; width:100%}
	textarea{outline:none;resize:none;width:100%;height:100%; padding:10px; border:none;}
	table{margin:0 auto;width:100%;}
	table td:first-child{border-right:1px solid rgb(220,220,220); border-bottom:1px solid rgb(220,220,220);}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id="wrap">
	<h1>글 등록</h1><br><br>
	<form action="postRegister.do" method="post">
		<table>
			<tr>
				<td width='80'>제목</td>
				<td><input type="text" size="50" name="postTitle" id="title"placeholder="제목을 입력해 주세요."></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" size="50" name="postWriter" value="${userId }" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows='17' name="postContents" id="cont" placeholder="내용을 입력해 주세요."></textarea></td>
			</tr>
		</table>
		<div>
			<input type="submit" id="sb" value="등록">&nbsp;<input type="reset" value="취소">
		</div>
	</form>
	</div>
	<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
		var str = document.getElementById('title');
		var str2 = document.getElementById('cont');
		var blank = /^\s+|\s+$/g;
		$("#sb").on("click",function(){
			if(str.value.replace(blank, '')==""){
				alert("제목을 입력해주세요");
				return false;
			}else if(str2.value.replace(blank, '')==""){
				alert("내용을 입력해 주세요");
				return false;
			}else{
				return true;
			}
		});
	</script>
</body>
</html>