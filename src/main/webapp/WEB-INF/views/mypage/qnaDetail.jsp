<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
<style>

</style>
</head>
<body>

<jsp:include page="../common/header.jsp"></jsp:include>
	<br><hr style="margin-top:13%">
	<div class="container" style="margin-bottom: 15%;">
		<h1 style="text-align:center;margin-bottom: 8%;">문의사항</h1>
		<form method="get" name="form">
			<div class="form-group">
				<label for="exampleInputTitle">제목</label> 
				<input type="text"class="form-control" name="qnaTitle" value="${qna.qnaTitle }" readonly>
			</div>
			<div class="form-group">
				<label for="exampleInputWriter">작성자</label>
				<input type="text"class="form-control" name="userId" value="${qna.userId }" readonly>
			</div>
			<div class="form-group">
				<label for="exampleInputContents">내용</label> 
				<input style="height: 189px;" type="text"class="form-control" value="${qna.qnaContent }"  name="qnaContent" readonly>
			</div>
			<c:if test="${qna.replyState eq 'N' }">
				<div style="text-align: center;margin-top: 8%;">
					<input type="hidden" value="${qna.qnaNo }" name="qnaNo">
					<input type="submit" value="수정" onclick="javascript: form.action='qnaModifyView.do'">
					<input type="submit" id="del" value="삭제" onclick="javascript: form.action='qnaRemove.do'">
				</div>
			</c:if>
			<c:if test="${qna.replyState eq 'Y' }">
				<div class="form-group">
					<hr>
					<label for="exampleInputTitle">답변 등록일</label> 
					<input type="text"class="form-control" value="${qna.replyWriteDate }" readonly>
				</div>
					<div class="form-group">
					<label for="exampleInputContents">답변 내용</label> 
					<input style="height: 189px;" type="text"class="form-control" value="${qna.replyContent }" readonly>
				</div>
			</c:if>
		</form>
	</div>
  		<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
	$("#del").on("click",function(){
		if(confirm('정말 문의를 삭제 하시겟습니까?')){
			alert("삭제되엇습니다");
			return true;
		}else{
			return false;
		}
	});
	</script>
</body>
</html>