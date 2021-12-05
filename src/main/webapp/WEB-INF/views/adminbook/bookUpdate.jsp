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
		<form action="booksEnroll.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" value="${book.bookNo }" name="bookNo">
			<table class="table table-striped"
				style="width: 50%; position: relative; left: 61px; margin-top: 10%">
				<thead>
					<tr>
						<th>도서 명</th>
						<td><input class="bEnroll" type="text" name="bookName"
							value="${book.bookName }"></td>
					</tr>
					<tr>
						<th>저자</th>
						<td><input class="bEnroll" type="text" name="bookWriter"
							value="${book.bookWriter }"></td>
					</tr>
					<tr>
						<th>출판사</th>
						<td><input class="bEnroll" type="text" name="publisher"
							value="${book.publisher }"></td>
					</tr>
					<tr>
						<th>발행연도</th>
						<td><input class="bEnroll" type="text" name="bookYear"
							value="${book.bookYear}"></td>
					</tr>
					<tr>
						<th>표준부호 (ISBN)</th>
						<td><input class="bEnroll" type="text" name="isbn"
							value="${book.isbn }"></td>
					</tr>
					<tr>
						<th>청구기호</th>
						<td><input class="bEnroll" type="text" name="callNo"
							value="${book.callNo }"></td>
					</tr>
					<tr>
						<th>주제</th>
						<td><c:if test="${book.bookSubject ne null}">
								<select name="bookSubject">
									<option value="${book.bookSubject }" selected>${book.bookSubject }</option>
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
								</select>
							</c:if></td>
					</tr>
					<tr>
						<th>테마</th>
						<td><c:if test="${book.theme ne null }">
								<select name="theme">
									<option value="${book.theme }" selected>${book.theme }</option>
									<option value="기술">기술</option>
									<option value="힐링">힐링</option>
									<option value="인사이트">인사이트</option>
									<option value="여행">여행</option>
									<option value="자기계발">자기계발</option>
									<option value="감성">감성</option>
									<option value="관계">관계</option>
									<option value="습관">습관</option>
									<option value="건강">건강</option>
								</select>
							</c:if></td>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div class="image-container"
				style="width: 40%; float: right; position: relative; bottom: 358px;">
				<img style="width: 52%;" id="preview-image"
					src="https://us.123rf.com/450wm/alekseyvanin/alekseyvanin1908/alekseyvanin190800297/128284615-%EC%B1%85-%ED%8E%98%EC%9D%B4%EC%A7%80-%EB%9D%BC%EC%9D%B8-%EC%95%84%EC%9D%B4%EC%BD%98%EC%9E%85%EB%8B%88%EB%8B%A4-%EB%AA%A8%EB%B0%94%EC%9D%BC-%EA%B0%9C%EB%85%90-%EB%B0%8F-%EC%9B%B9-%EB%94%94%EC%9E%90%EC%9D%B8%EC%9D%84-%EC%9C%84%ED%95%9C-%EC%84%A0%ED%98%95-%EC%8A%A4%ED%83%80%EC%9D%BC-%EA%B8%B0%ED%98%B8%EC%9E%85%EB%8B%88%EB%8B%A4-%ED%8E%BC%EC%B9%9C-%EC%B1%85-%EA%B0%9C%EC%9A%94-%EB%B2%A1%ED%84%B0-%EC%95%84%EC%9D%B4%EC%BD%98.jpg?ver=6">
				<input style="display: block; left: 54%; bottom: 46%;" type="file"
					id="input-image" name="bookCoverFile">
			</div>

			<div
				style="text-align: center; margin-top: 9%; position: relative; left: 23%;">
				<input type="submit" value="등록" class="myButton"
					style="border: none" onclick="return confirm('수정하시겠습니까?');">
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