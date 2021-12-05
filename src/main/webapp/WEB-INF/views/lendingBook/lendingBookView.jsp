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
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
<script src="../../../resources/js/lendingBook.js"></script>
<style>
    #book-parcel {
        display: none;
    }
    .sideMenu{
        float: left;
        width: 25%;
    }
    .side{width:200px;position:fixed;left:3%;top:18%;}
    .side ul li{line-height:50px;text-align:center; border:1px solid rgb(181,181,181);text-decoration: none;list-style: none;font-size:1.5rem; cursor:pointer;}
    .side ul li:first-child{line-height:65px;font-weight:bold; font-size:2rem;background-color:#5a5eb9; color:#fff; cursor:Default;}
    .side ul .lo:hover{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}
    .sideact{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}
    .sideMenu{
    float: left;
    width: 25%;
    position: absolute;
    }

    .mainContent {
        margin: auto;
        vertical-align: middle;
        justify-content: center;
        width : 75%;
        display: grid;
        position : relative;
        margin-bottom: 70px;
    }

    .table {
        text-align: center;
    }

    .len__btn {
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
    .addr__btn {
        width: 50px;
		height: 30px;
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
    <article class="mainContent">
        <div style="margin-top: 50px; margin-bottom: 20px;">
            <h1 style="color: gray; text-align: center; font-weight: bolder;">대출신청</h1>
        </div>
        <div>
            <div>
                <form id="lending-form" action="/lendingBook.do" method="post">
                    <input type="hidden" name="bookNo" value="${ book.bookNo }">
                    <input type="hidden" name="userId" value="${ sessionScope.userId }">
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
                    <c:if test="${ book.bookState eq '대출가능' && not empty sessionScope.userId }">
                        <table class="table" style="width: 800px; margin-bottom: 50px;">
                            <tr>
                                <td colspan="2"><b>도서 수령 방법</b></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="bookReceive" id="" value="visit" onchange="setDisplay()" checked>방문수령</td>
                                <td><input type="radio" name="bookReceive" id="bookReceive" value="parcel" onchange="setDisplay()">택배수령</td>
                            </tr>
                        </table>
                        <div id="book-inperson" style="text-align: center;">
                            <input type="submit" id="normal-submit" class="len__btn" value="대출신청">
                        </div>
                        <div id="book-parcel">
                            <table class="table" style="width: 800px; margin-bottom: 50px;">
                                <tr>
                                    <td colspan="2"><b>배송지</b></td>
                                </tr>
                                <tr>
                                    <td>* 우편번호</td>
                                    <td>
                                        <input type="text" name="post" class="postcodify_postcode5" size="12">
                                        <button type="button" id="postcodify_search_button" class="addr__btn">검색</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>* 도로명 주소</td>
                                    <td><input type="text" name="address1" class="postcodify_address"></td>
                                </tr>
                                <tr>
                                    <td>* 상세 주소</td>
                                    <td><input type="text" name="address2" class="postcodify_extra_info"></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><b>결제방법</b></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input type="radio" name="payment" id="card" value="card" onchange="payment()" checked>카드결제 
                                    </td>
                                </tr>
                            </table>
                            <div style="text-align: center;">
                                <button type="button" id="pay-btn" class="len__btn">대출신청</button>
                            </div>
                        </div>
                    </c:if>
                </form>
            </div>
        </div>
    </article>
<!-- Footer -->
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
    <jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 아임포트 결제 -->
    <script>
        let IMP = window.IMP;
        IMP.init("imp25073131"); // 가맹점코드
        $("#pay-btn").click(function(e){
            IMP.request_pay({
                pg : 'inicis',
                pay_method : 'card',
                merchant_uid : 'merchant_' + new Date().getTime(),
                name : '다올대학교 도서관 규장각 택배 결제',
                amount : 10, //판매 가격
                buyer_name : '${sessionScope.userId}',
                buyer_email : ''
            }, function(rsp) {
                if ( rsp.success ) {
                    var msg = '결제가 완료되었습니다.\n';
                    msg += '결제 금액 : ' + rsp.paid_amount + '원\n';
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    alert(msg);
                }                        else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                    alert(msg);
                    return false;
                }
                $("#lending-form").submit();
            });
        });
    </script>
</body>
</html>