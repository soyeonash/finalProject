<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다올대학교 도서관 ｜ 규장각</title>
<link rel="stylesheet" href="../../../resources/css/searchingBook.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    .sideMenu{
        float: left;
        width: 25%;
    }
    .side{width:200px;position:fixed;left:3%;top:18%;}
    .side ul li{line-height:50px;text-align:center; border:1px solid rgb(181,181,181);text-decoration: none;list-style: none;font-size:1.5rem; cursor:pointer;}
    .side ul li:first-child{line-height:65px;font-weight:bold; font-size:2rem;background-color:#5a5eb9; color:#fff; cursor:Default;}
    .side ul .lo:hover{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}
    .sideact{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}

    .len__btn, .rsv__btn, .back__btn {
        width: 70px;
		height: 40px;
		background-color: #2e4f85;
		color: whitesmoke;
		border-radius: 5px;
		outline: none;
		box-shadow: none;
        border: none;
        outline: none;
    }
    .int__btn {
        width: 100px;
		height: 40px;
		background-color: #2e4f85;
		color: whitesmoke;
		border-radius: 5px;
		outline: none;
		box-shadow: none;
        border: none;
        outline: none;
    }
</style>
</head>
<body>
<!-- Header -->
    <jsp:include page="../common/header.jsp"></jsp:include>
    <jsp:include page="../common/chat.jsp"></jsp:include>
    <div>
        <span style="font-size: 8rem;">&nbsp;</span>
    </div>
<!-- Aside -->
    <aside class="sideMenu">
        <div class="side">
            <ul>
            <li>자료검색</li>
            <li class="lo" onclick="location.href='/search.do'">간략검색</li>
            <li class="lo" onclick="location.href='/sDetail.do'">상세검색</li>
            <li class="lo" onclick="location.href='/sSub.do'">주제별검색</li>
            <li class="lo" onclick="location.href='/searchNew.do'">신착자료</li>
            <li class="lo" onclick="location.href='/bestBook.do'">대출베스트</li>
            </ul>
        </div>	
    </aside>
<!-- Contents -->
    <input type="hidden" name="bookNo" value="${ book.bookNo }">
    <input type="hidden" name="userId" value="${ sessionScope.userId }">
    <article style="margin: auto; margin-bottom: 70px; display: grid; vertical-align: middle; justify-content: center; text-align: center;">
        <div style="margin-top: 50px; margin-bottom: 20px;">
            <h1 style="color: gray; font-weight: bolder;">도서정보</h1>
        </div>
        <div>
            <table class="table" style="width: 800px;">
                <tr style="font-size: 1.2em;">
                    <td colspan="3"><b>${ book.bookName }</b></td>
                </tr>
                <tr>
                    <td rowspan="4"><img src="${pageContext.request.contextPath}/resources/bookcover/${book.bookCover}" alt="" class="book__cover"></td>
                    <td><b>저자</b></td>
                    <td>${ book.bookWriter }</td>
                </tr>
                <tr>
                    <td><b>발행처</b></td>
                    <td>${ book.publisher }</td>
                </tr>
                <tr>
                    <td><b>발행연도</b></td>
                    <td>${ book.bookYear }</td>
                </tr>
                <tr>
                    <td><b>ISBN</b></td>
                    <td>${ book.isbn }</td>
                </tr>
            </table>
        </div>
        <div>
            <table class="table">
                <tr>
                    <td><b>청구기호</b></td>
                    <td><b>도서상태</b></td>
                    <td><b>반납예정일</b></td>
                    <td><b>예약신청</b></td>
                </tr>
                <tr>
                    <td>${ book.callNo }</td>
                    <td>${ book.bookState }</td>
                    <td>
                        <c:if test="${ book.bookState eq '대출불가' }">
                            ${ lendingBook.returnDate }
                        </c:if>
                    </td>
                    <td>${ rsvCount }명</td>
                </tr>
            </table>
        </div>
        <div style="margin-bottom: 30px;">
            <c:url var="lendingB" value="/lendingBookView.do">
                <c:param name="bookNo" value="${ book.bookNo }"></c:param>
            </c:url>
            <c:url var="intB" value="/interestingBook.do">
                <c:param name="bookNo" value="${ book.bookNo }"></c:param>
                <c:param name="userId" value="${ sessionScope.userId }"></c:param>
            </c:url>
            <c:url var="rsvB" value="/reservationBook.do">
                <c:param name="bookNo" value="${ book.bookNo }"></c:param>
                <c:param name="userId" value="${ sessionScope.userId }"></c:param>
            </c:url>
            <c:if test="${ book.bookState eq '대출가능' && not empty sessionScope.userId }">
                <button type="button" onclick="location.href='${ lendingB }';" class="len__btn" id="lending-btn">대출신청</button>
            </c:if>
            <c:if test="${ book.bookState eq '대출불가' && not empty sessionScope.userId }">
                <button type="button" onclick="location.href='${ rsvB }';" class="rsv__btn" id="reservation-btn">도서예약</button>
            </c:if>
            <c:if test="${ not empty sessionScope.userId }">
                <button type="button" onclick="location.href='${ intB }';" class="int__btn" id="interesting-btn">관심도서담기</button>
            </c:if>
            <button type="button" class="back__btn" onclick="javascript:history.back();">뒤로가기</button>
        </div>
        <div>
            <table class="table">
                <tr>
                    <td colspan="4"><b>회원 서평</b></td>
                </tr>
                <c:if test="${ empty rList }">
                    <tr>
                        <td colspan="4">등록된 서평이 없습니다.</td>
                    </tr>
                </c:if>
                <c:if test="${ not empty rList }">
                    <tr>
                        <td><b>별점</b></td>
                        <td><b>서평</b></td>
                        <td><b>아이디</b></td>
                        <td><b>작성일</b></td>
                    </tr>
                    <c:forEach items="${ rList }" var="review">
                        <tr>
                            <td>★ ${ review.reviewStar }</td>
                            <td>${ review.reviewContents }</td>
                            <td>${ review.userId }</td>
                            <td>${ review.reviewDate }</td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
        </div>
    </article>
<!-- Footer -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>