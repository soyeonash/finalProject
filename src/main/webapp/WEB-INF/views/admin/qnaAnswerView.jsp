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
		<h1 style="text-align:center;margin-bottom: 8%;">문의사항 답변</h1>
		<div class="form-group">
			<label for="exampleInputTitle">제목</label> 
			<input type="text"class="form-control" value="${qna.qnaTitle }" readonly>
		</div>
		<div class="form-group">
			<label for="exampleInputWriter">작성자</label>
			<input type="text"class="form-control" value="${qna.userId }" readonly>
		</div>
		<div class="form-group">
			<label for="exampleInputContents">내용</label> 
			<input style="height: 189px;" type="text"class="form-control" value="${qna.qnaContent }" readonly>
		</div>
		<hr>
		<c:if test="${qna.replyContent eq null }">
			<form action="answer.do" method="post">
			<input type="hidden" name="qnaNo" value="${qna.qnaNo }">
				<div class="form-group">
					<label for="exampleInputContents">답변</label> 
					<input style="height: 189px;" type="text"class="form-control" name="replyContent" placeholder="답변을 입력해 주세요">
					<br>
					<input type="submit" value="등록" style="float:right;">
				</div>
			</form>
		</c:if>
		<c:if test="${qna.replyContent ne null }">
			<form method="post" name="form">
			<input type="hidden" name="qnaNo" value="${qna.qnaNo }">
				<div class="form-group">
					<label for="exampleInputContents">답변</label> 
					<input style="height: 189px;" type="text"class="form-control" name="replyContent" placeholder="답변을 입력해 주세요" value="${qna.replyContent }">
					<br>
					<input type="submit" value="수정" style="float:right;" onclick="javascript: form.action='qnaAnswerModify.do'">
				</div>
			</form>
		</c:if>
		<button id="list" style="float:right; margin-top:-15px;margin-right:10px;">목록으로</button>
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
	$("#list").on("click",function(){
		location.href='adQnaList.do';
	});
	</script>
</body>
</html>