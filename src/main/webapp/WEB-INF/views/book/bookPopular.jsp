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
            <li class="lo" onclick="location.href='/search.do'">간략검색</li>
            <li class="lo" onclick="location.href='/sDetail.do'">상세검색</li>
            <li class="lo" onclick="location.href='/sSub.do'">주제별검색</li>
            <li class="lo" onclick="location.href='/searchNew.do'">신착자료</li>
            <li class="lo sideact" onclick="location.href='/bestBook.do'">대출베스트</li>
            </ul>
        </div>	
    </aside>
<!-- Contents -->
    <div style="margin: auto; margin-bottom: 70px; display: grid; vertical-align: middle; justify-content: center; text-align: center">
        <div style="margin-top: 50px;">
            <h1 style="font-weight: bolder;">대출베스트</h1>
        </div>
        <div>
            <h5><a href="/home.do">Home</a> > 자료검색 > 대출베스트</h5>
        </div>
        <section style="padding-top: 60px;">
            <c:if test="${ empty bList }">
                <tr>
                    <td>
                        <p>검색 결과가 없습니다.</p>
                    </td>
                </tr>
            </c:if>
            <c:if test="${ !empty bList }">
                <h3 style="color: gray;">규장각 인기 대출 도서</h3>
                <table class="contents__table" style="width: 800px;">
                    <c:forEach items="${ bList }" var="book" varStatus="status">
                        <tr><td rowspan="5">${ status.count }</td></tr>
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
                                자료상태 : ${ book.bookState } ｜ 대출 횟수 : ${ book.lendingCount }
                            </td>
                        </tr>
                        <tr><td></td></tr>
                        <tr><td></td></tr>
                    </c:forEach>
                </table>
            </c:if>
        </section>
    </div>
<!-- Footer -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>