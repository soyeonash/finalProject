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
            <li class="lo sideact" onclick="location.href='/search.do'">간략검색</li>
            <li class="lo" onclick="location.href='/sDetail.do'">상세검색</li>
            <li class="lo" onclick="location.href='/sSub.do'">주제별검색</li>
            <li class="lo" onclick="location.href='/searchNew.do'">신착자료</li>
            <li class="lo" onclick="location.href='/bestBook.do'">대출베스트</li>
            </ul>
        </div>	
    </aside>
<!-- Contents -->
    <article style="margin: auto; margin-bottom: 70px; display: grid; vertical-align: middle; justify-content: center; text-align: center">
        <div style="margin-top: 50px;">
            <h1 style="font-weight: bolder;">간략검색</h1>
        </div>
        <div>
            <h5><a href="/home.do">Home</a> > 자료검색 > 간략검색</h5>
        </div>
        <div style="padding-top: 60px; text-align: center; margin: auto;">
            <form action="/searchSimple.do" method="get">
                <select name="searchCondition" id="" class="search__select">
                    <option value="title" <c:if test="${ search.searchCondition eq 'title' }">selected</c:if>>도서명</option>
                    <option value="writer" <c:if test="${ search.searchCondition eq 'writer' }">selected</c:if>>저자</option>
                    <option value="publisher" <c:if test="${ search.searchCondition eq 'publisher' }">selected</c:if>>출판사</option>
                </select>
                <input type="text" name="searchValue" placeholder="검색어 입력" value="${ search.searchValue }" class="search">
                <input type="submit" value="검색" class="s__button" style="border-radius: 3px; font-weight: bolder;">
            </form>
        </div>
        <div>
        	<c:if test="${ empty bList }">
                <div style="margin-bottom: 180px;">
                        <p style="margin-top: 100px;">검색 결과가 없습니다.</p>
                </div>
        	</c:if>
        	<c:if test="${ !empty bList }">
                <div style="margin-bottom: 50px; margin-top: 50px;">
                    <h2>"${ search.searchValue }" 검색 결과입니다.</h2>
                </div>
                <table class="contents__table" style="width: 800px;">
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
                            <c:url var="before" value="/searchSimple.do">
                                <c:param name="page" value="${ pi.currentPage - 1 }"></c:param>
                                <c:param name="searchCondition" value="${ search.searchCondition }"></c:param>
                                <c:param name="searchValue" value="${ search.searchValue }"></c:param>
                            </c:url>
                            <c:if test="${ pi.currentPage <= 1 }">이전</c:if>
                            <c:if test="${ pi.currentPage > 1 }"><a href="${ before }">이전</a></c:if>
                            <c:forEach var="p" begin="${ pi.startNavi }" end="${ pi.endNavi }">
                                <c:url var="pagenation" value="/searchSimple.do">
                                    <c:param name="page" value="${ p }"></c:param>
                                    <c:param name="searchCondition" value="${ search.searchCondition }"></c:param>
                                    <c:param name="searchValue" value="${ search.searchValue }"></c:param>
                                </c:url>
                                <c:if test="${ p eq pi.currentPage }">
                                    <font color="red" size="4">[${ p }]</font>
                                </c:if>
                                <c:if test="${ p ne pi.currentPage }">
                                    <a href="${ pagenation }">${ p }</a>&nbsp;
                                </c:if>
                            </c:forEach>
                            <c:url var="after" value="/searchSimple.do">
                                <c:param name="page" value="${ pi.currentPage + 1 }"></c:param>
                                <c:param name="searchCondition" value="${ search.searchCondition }"></c:param>
                                <c:param name="searchValue" value="${ search.searchValue }"></c:param>
                            </c:url>
                            <c:if test="${ pi.currentPage >= pi.maxPage }">다음</c:if>
                            <c:if test="${ pi.currentPage < pi.maxPage }"><a href="${ after }">다음</a></c:if>
                        </td>
                    </tr>
                </table>
        	</c:if>
        </div>
    </article>
<!-- Footer -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>