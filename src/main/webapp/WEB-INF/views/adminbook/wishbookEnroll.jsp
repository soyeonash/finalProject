<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
.myButton {
	box-shadow: 0px 10px 14px -7px #276873;
	background: linear-gradient(to bottom, #599bb3 5%, #408c99 100%);
	background-color: #599bb3;
	border-radius: 8px;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 14px;
	font-weight: bold;
	padding: 13px 32px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #3d768a;
}

.myButton:hover {
	background: linear-gradient(to bottom, #408c99 5%, #599bb3 100%);
	background-color: #408c99;
}

.myButton:active {
	position: relative;
	top: 1px;
}

.bEnroll {
	width: 100%
}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>
	<br>
	<hr style="margin-top: 13%">
	<div class="container" style="margin-bottom: 15%;">
		<h1 style="text-align: center; margin-bottom: 8%;">도서관리</h1>

		<button class="btn btn-default"
			onclick="location.href='bookListView.do'">장서 목록</button>
		<button class="btn btn-default"
			onclick="location.href='statusList.do'">대출 현황</button>
		<button class="btn btn-default"
			onclick="location.href='wishbookList.do'">희망 도서 접수 목록</button>
		<button class="btn btn-default"
			onclick="location.href='bookParcelList.do'">대출도서 택배 신청 목록</button>

		<hr>
		<form action="wishbookEnr.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" value="${applyNo }" name="applyNum">
			<input type="hidden" value="${userId }" name="userId">
			<table class="table table-striped"
				style="width: 50%; position: relative; left: 61px; margin-top: 10%">
				<thead>
					<tr>
						<th>도서 명</th>
						<c:if test="${not empty bookName }">
							<td><input class="bEnroll" type="text" name="bookName"
								value="${bookName }"></td>
						</c:if>
					</tr>
					<tr>
						<th>저자</th>
						<td><input class="bEnroll" type="text" name="bookWriter"
							value="${bookWriter }"></td>
					</tr>
					<tr>
						<th>출판사</th>
						<td><input class="bEnroll" type="text" name="publisher"
							value="${publisher }"></td>
					</tr>
					<tr>
						<th>발행연도</th>
						<td><input class="bEnroll" type="text" name="bookYear"></td>
					</tr>
					<tr>
						<th>표준부호 (ISBN)</th>
						<td><input class="bEnroll" type="text" name="isbn"></td>
					</tr>
					<tr>
						<th>청구기호</th>
						<td><input class="bEnroll" type="text" name="callNo"></td>
					</tr>
					<tr>
						<th>주제</th>
						<td><select name="bookSubject">
								<option value="총류">총류</option>
								<option value="철학">철학</option>
								<option value="종교">종교</option>
								<option value="언어">언어</option>
								<option value="사회과학">사회과학</option>
								<option value="자연과학">자연과학</option>
								<option value="기술과학">기술과학</option>
								<option value="역사">역사</option>
								<option value="문학">문학</option>
								<option value="예술">예술</option>
						</select></td>
					</tr>
					<tr>
						<th>테마</th>
						<td><select name="theme">
								<option value="기술">기술</option>
								<option value="힐링">힐링</option>
								<option value="인사이트">인사이트</option>
								<option value="여행">여행</option>
								<option value="자기계발">자기계발</option>
								<option value="감성">감성</option>
								<option value="관계">관계</option>
								<option value="습관">습관</option>
								<option value="건강">건강</option>
						</select></td>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div class="image-container"
				style="width: 40%; float: right; position: relative; bottom: 358px;">
				<img style="width: 52%;" id="preview-image"
					src="https://media.istockphoto.com/vectors/photo-album-icon-vector-id1023892724?k=20&m=1023892724&s=170667a&w=0&h=zXZB3iWNnwhrDA055eJgxh4Sq814_ZNRSVAJT7lBgLY=">
				<input style="display: block; left: 54%; bottom: 46%;" type="file"
					id="input-image" name="bookCoverFile">
			</div>

			<div
				style="text-align: center; margin-top: 9%; position: relative; left: 23%;">
				<input type="submit" value="등록" class="myButton"
					style="border: none" onclick="return confirm('등록하시겠습니까?');">
				<a href="bookListView.do" class="myButton">취소</a>
			</div>
		</form>

	</div>
	<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
        function readImage(input) {
            // 인풋 태그에 파일이 있는 경우
            if(input.files && input.files[0]) {
                // 이미지 파일인지 검사 (생략)
                // FileReader 인스턴스 생성
                const reader = new FileReader()
                // 이미지가 로드가 된 경우
                reader.onload = e => {
                    const previewImage = document.getElementById("preview-image");
                    previewImage.src = e.target.result;
                }
                // reader가 이미지 읽도록 하기
                reader.readAsDataURL(input.files[0])
            }
        }
        // input file에 change 이벤트 부여
        const inputImage = document.getElementById("input-image")
        inputImage.addEventListener("change", e => {
            readImage(e.target)
        });
        
        
        
        
        
        
        
            
            </script>
</body>
</html>