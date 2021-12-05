<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다올대학교 도서관 ｜ 규장각</title>
<link rel="stylesheet" href="../../../resources/css/searchingBook.css">
<style>
    .sideMenu{
        float: left;
        width: 25%;
        position: static;
    }
    .side{width:200px;position:fixed;left:3%;top:18%;}
    .side ul li{line-height:50px;text-align:center; border:1px solid rgb(181,181,181);text-decoration: none;list-style: none;font-size:1.5rem; cursor:pointer;}
    .side ul li:first-child{line-height:65px;font-weight:bold; font-size:2rem;background-color:#5a5eb9; color:#fff; cursor:Default;}
    .side ul .lo:hover{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}
    .sideact{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}
    .contents__table tr{
        height: 10px;
        text-align: left;
    }
    table button {
        width: 80px;
		height: 50px;
        font-size: 15px;
        font-weight: bolder;
        margin: 10px;
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
            <li class="lo sideact" onclick="location.href='/sSub.do'">주제별검색</li>
            <li class="lo" onclick="location.href='/searchNew.do'">신착자료</li>
            <li class="lo" onclick="location.href='/bestBook.do'">대출베스트</li>
            </ul>
        </div>	
    </aside>
<!-- Contents -->
    <article style="margin: auto; display: grid; vertical-align: middle; justify-content: center; text-align: center">
        <div style="margin-top: 50px;">
            <h1 style="font-weight: bolder;">주제별검색</h1>
        </div>
        <div>
            <h5><a href="/home.do">Home</a> > 자료검색 > 주제별검색</h5>
        </div>
        <div style="padding-top: 30px; text-align: center; margin: auto;">
            <form action="/searchSubject.do" method="get">
                <table>
                    <tr>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="총류">총류</button></td>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="철학">철학</button></td>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="종교">종교</button></td>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="언어">언어</button></td>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="문학">문학</button></td>
                    </tr>
                    <tr>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="예술">예술</button></td>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="사회과학">사회과학</button></td>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="자연과학">자연과학</button></td>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="기술과학">기술과학</button></td>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="역사">역사</button></td>
                    </tr>
                </table>
            </form>
        </div>
        <c:if test="${ empty bList }">
            <div style="margin-top: 50px; margin-bottom: 230px;">
                <p>주제를 선택해 주세요.</p>
            </div>
        </c:if>
        <c:if test="${ !empty bList }">
            <div style="margin-bottom: 50px; margin-top: 50px;">
                <h2>"${ search.searchValue }" 검색 결과입니다.</h2>
            </div>
            <table class="contents__table" style="width: 800px; margin-bottom: 50px; ">
                <c:forEach items="${ bList }" var="book">
                    <tr>
                        <td rowspan="5" style="padding: 40px;">
                            <c:url var="bDetail" value="/bookDetail.do">
                                <c:param name="bookNo" value="${ book.bookNo }"></c:param>
                            </c:url>
                                <a href="${ bDetail }">
                                    <img src="${pageContext.request.contextPath}/resources/bookcover/${book.bookCover}" alt="" class="book__cover">
                                </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="${ bDetail }">
                                <h4>${ book.bookName }</h4>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            저자 : ${ book.bookWriter } ｜ 발행처 : ${ book.publisher } ｜ 발행연도 : ${ book.bookYear }
                        </td>
                    </tr>
                    <tr>
                        <td>
                            자료상태 : ${ book.bookState }
                        </td>
                    </tr>
                    <tr><td></td></tr>
                    <tr><td></td></tr>
                </c:forEach>
<!-- 페이징 처리 -->
                <tr>
                    <td colspan="2" style="text-align: center; height: 80px;">
                        <c:url var="before" value="/searchSubject.do">
                            <c:param name="page" value="${ pi.currentPage - 1 }"></c:param>
                            <c:param name="searchValue" value="${ search.searchValue }"></c:param>
                        </c:url>
                        <c:if test="${ pi.currentPage <= 1 }">이전</c:if>
                        <c:if test="${ pi.currentPage > 1 }"><a href="${ before }">이전</a></c:if>
                        <c:forEach var="p" begin="${ pi.startNavi }" end="${ pi.endNavi }">
                            <c:url var="pagenation" value="/searchSubject.do">
                                <c:param name="page" value="${ p }"></c:param>
                                <c:param name="searchValue" value="${ search.searchValue }"></c:param>
                            </c:url>
                            <c:if test="${ p eq pi.currentPage }">
                                <font color="red" size="4">[${ p }]</font>
                            </c:if>
                            <c:if test="${ p ne pi.currentPage }">
                                <a href="${ pagenation }">${ p }</a>&nbsp;
                            </c:if>
                        </c:forEach>
                        <c:url var="after" value="/searchSubject.do">
                            <c:param name="page" value="${ pi.currentPage + 1 }"></c:param>
                            <c:param name="searchValue" value="${ search.searchValue }"></c:param>
                        </c:url>
                        <c:if test="${ pi.currentPage >= pi.maxPage }">다음</c:if>
                        <c:if test="${ pi.currentPage < pi.maxPage }"><a href="${ after }">다음</a></c:if>
                    </td>
                </tr>   
            </table>
        </c:if>
    </article>
<!-- Footer -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>