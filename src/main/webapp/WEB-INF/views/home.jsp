<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>다올대학교 도서관 ｜ 규장각</title>
<link rel="stylesheet" href="/resources/mainPage/css/mainPage.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

</head>
<body>
	<jsp:include page="common/header.jsp"></jsp:include>
	<div>
		<span style="font-size:8rem;">&nbsp;</span>
	</div>
	<div class="search-area">
		<div id="slider">
			<div class="slider_item showing">
				<img src="/resources/mainPage/img/main_img1.jpg" alt="">
			</div>
			<div class="slider_item">
				<img src="/resources/mainPage/img/main_img2.jpg" alt="">
			</div>
			<div class="slider_item">
				<img src="/resources/mainPage/img/main_img3.jpg" alt="">
			</div>
			<div class="slider_item">
				<img src="/resources/mainPage/img/main_img4.jpg" alt="">
			</div>
			<div class="slider_item">
				<img src="/resources/mainPage/img/main_img5.jpg" alt="">
			</div>
			<div class="slider_item">
				<img src="/resources/mainPage/img/main_img6.jpg" alt="">
			</div>
		</div>
		<form action="/searchSimple.do">
			<div class="search-wrap">
				<select name="searchCondition" id="selectbox" class="search__select" style ="width:20%;height:100%;">
					<option value="title">도서명</option>
	                <option value="writer">저자</option>
	                <option value="publisher">출판사</option>
				</select> <input type="text" name="searchValue" id="input-box" class="search" style="width:79%;height:100%;" placeholder="검색어 입력">
				<i class="material-icons zxc" style="position:absolute; z-index:199; margin-left:-30px; margin-top:13px; cursor:pointer;">search</i>
				<input type="submit" value="검색" id="sbt" style="display:none;">
			</div>
		</form>
	</div>
	<div class="main-wrapper">
		<div class="nav-area">
			<ul>
				<li>
					<div class="nav-logo">
						<a href="/search.do"><img src="/resources/mainPage/img/logo1.png" alt=""> <span>도서검색</span></a>
					</div>
				</li>
				<li>
					<div class="nav-logo">
						<a href="informationView.do#room"><img src="/resources/mainPage/img/logo2.png" alt=""> <span>시설이용</span></a>
					</div>
				</li>
				<li>
					<div class="nav-logo">
						<a href="noticeList.do"><img src="/resources/mainPage/img/logo3.png" alt=""> <span>공지사항</span></a>
					</div>
				</li>
				<li>
					<div class="nav-logo">
						<a href="mypageInfo.do?userId=${userId }"><img src="/resources/mainPage/img/logo4.png" alt=""> <span>이용증 신청</span></a>
					</div>
				</li>
				<li>
					<div class="nav-logo">
						<a href="informationView.do#time"><img src="/resources/mainPage/img/logo5.png" alt=""> <span>이용시간</span></a>
					</div>
				</li>
			</ul>
		</div>
		<div class="taste-area">
			<div class="taste-kate">
				<ul>
					<li class="kate active" data-tab="tab-0">인기 도서</li>
					<li class="kate" data-tab="tab-1">신간 도서</li>
				</ul>
			</div>
			<div class="swiper mySwiper tab-0 act">
				<div class="swiper-wrapper">
					<c:forEach items="${pList }" var="pList">
						<div class="swiper-slide">
							<div class="cont">
								<c:url var="bDetail" value="/bookDetail.do">
	                    			<c:param name="bookNo" value="${pList.bookNo }"></c:param>
	                    		</c:url>
								<a href="${bDetail }" style="text-decoration: none;">
									<img class="" src="/resources/bookcover/${pList.bookCover }" alt="" style="width:200px;">
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="swiper-pagination"></div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</div>
			<div class="swiper mySwiper tab-1">
				<div class="swiper-wrapper">
					<c:forEach items="${bList }" var="bList">
						<div class="swiper-slide">
							<div class="cont">
								<c:url var="bDetail" value="/bookDetail.do">
	                    			<c:param name="bookNo" value="${bList.bookNo }"></c:param>
	                    		</c:url>
								<a href="${bDetail }" style="text-decoration: none;">
									<img class="" src="/resources/bookcover/${bList.bookCover }" alt="" style="width:200px;">
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="swiper-pagination"></div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</div>
			<c:if test="${userId ne null && sessionScope.surveyCheck eq 'Y' }">
				<h2>${taste.taste1} 추천 도서</h2><br>
				<div class="swiper mySwiper" style="display:block;">
					<div class="swiper-wrapper">
						<c:forEach items="${taste1List }" var="bList">
							<div class="swiper-slide">
								<div class="cont">
									<c:url var="bDetail" value="/bookDetail.do">
		                    			<c:param name="bookNo" value="${bList.bookNo }"></c:param>
		                    		</c:url>
									<a href="${bDetail }" style="text-decoration: none;">
										<img class="" src="/resources/bookcover/${bList.bookCover }" alt="" style="width:200px;">
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="swiper-pagination"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
				<h2>${taste.taste2} 추천 도서</h2><br>
				<div class="swiper mySwiper" style="display:block;">
					<div class="swiper-wrapper">
						<c:forEach items="${taste2List }" var="bList">
							<div class="swiper-slide">
								<div class="cont">
									<c:url var="bDetail" value="/bookDetail.do">
		                    			<c:param name="bookNo" value="${bList.bookNo }"></c:param>
		                    		</c:url>
									<a href="${bDetail }" style="text-decoration: none;">
										<img class="" src="/resources/bookcover/${bList.bookCover }" alt="" style="width:200px;">
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="swiper-pagination"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
				<h2>${taste.taste3} 추천 도서</h2><br>
				<div class="swiper mySwiper" style="display:block;">
					<div class="swiper-wrapper">
						<c:forEach items="${taste3List }" var="bList">
							<div class="swiper-slide">
								<div class="cont">
									<c:url var="bDetail" value="/bookDetail.do">
		                    			<c:param name="bookNo" value="${bList.bookNo }"></c:param>
		                    		</c:url>
									<a href="${bDetail }" style="text-decoration: none;">
										<img class="" src="/resources/bookcover/${bList.bookCover }" alt="" style="width:200px;">
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="swiper-pagination"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
			</c:if>
			<c:if test="${userId ne null && member.userType eq '학생' }">
				<h2>${member.major} 전공 추천 도서</h2><br>
				<div class="swiper mySwiper" style="display:block;">
					<div class="swiper-wrapper">
						<c:forEach items="${mList }" var="mList">
							<div class="swiper-slide">
								<div class="cont">
									<c:url var="bDetail" value="/bookDetail.do">
		                    			<c:param name="bookNo" value="${mList.bookNo }"></c:param>
		                    		</c:url>
									<a href="${bDetail }" style="text-decoration: none;">
										<img class="" src="/resources/bookcover/${mList.bookCover }" alt="" style="width:200px;">
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="swiper-pagination"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
			
			
			</c:if>
		</div>
		<div class="keyword-area">
			<div class="keyword">
				<ul id="kate">
					<li class="gori sel" data-tab="tab-3" id="popKeykate">인기 검색어</li>
					<li class="gori" data-tab="tab-4" id="manyPeople">다독자</li>
				</ul>
			</div>
			<div class="pop tab-3 sh">
				<ol id="pop-K">
					
				</ol>
			</div>
			<div class="pop tab-4">
				<ol id="many">
				
				</ol>
			</div>
		</div>
  		<jsp:include page="./common/chat.jsp"></jsp:include>
	</div>
 	 <jsp:include page="common/footer.jsp"></jsp:include>
 	 <script>
 	const showing_class = "showing";
	const firstslide = document.querySelector(".slider_item:first-child");

	function slide() {
		const currentSlide = document.querySelector(".showing");
	    if(currentSlide){
	        currentSlide.classList.remove(showing_class);
	        const nextSlide = currentSlide.nextElementSibling;
	        if(nextSlide){
	            nextSlide.classList.add(showing_class);
	        } else {
	            firstslide.classList.add(showing_class);
	        }
	        
	    } else {
	        firstslide.classList.add(showing_class);
	    }
	}
	slide();
	setInterval(slide, 4000)

	var swiper = new Swiper(".mySwiper", {
		slidesPerView : 3,
		spaceBetween : 30,
		loop : true,
		autoplay : {
			delay : 3000,
			disableOnInteraction : false,
		},
		pagination : {
			el : ".swiper-pagination",
			clickable : true,
		},
		navigation : {
			nextEl : '.swiper-button-next',
			prevEl : '.swiper-button-prev',
		},
		scrollbar : {
			el : '.swiper-scrollbar',
		}
	});
	$(".zxc").on("click",function(){
		$("#sbt").click();
	});
	
	$(".kate").on("click",function(){
		var tab_id = $(this).attr('data-tab');
		$(".kate").removeClass("active");
		$(".swiper").removeClass("act")
		$(this).addClass("active");
		$("."+tab_id).addClass("act");
	})
	$(".gori").on("click",function(){
		var pop_id = $(this).attr('data-tab');
		$(".sel").removeClass("sel");
		$(".pop").removeClass("sh");
		$(this).addClass("sel");
		$("."+pop_id).addClass("sh");
	})
	
	getPopKeyword();
	setInterval("getPopKeyword()",3000);
	$("#popKeykate").on("click",function(){
		getPopKeyword();
	});
	function getPopKeyword(){
		$.ajax({
			type:'GET',
			url:'popKeyword.do',
			dataType:"json",
			success : function(data){
				$("#pop-K li").remove();
				if(data.length < 10){
					for(var i in data){
						$("#pop-K").append("<li><a href='/searchSimple.do?searchCondition=title&searchValue="+data[i].keyword+"'>"+data[i].keyword+"</a></li>");
					}
					for(var i = data.length; i<10; i++){
						$("#pop-K").append("<li>-</li>");
					}
				}else{
					for(var i in data){
						$("#pop-K").append("<li><a href='/searchSimple.do?searchCondition=title&searchValue="+data[i].keyword+"'>"+data[i].keyword+"</a></li>");
					}
				}
			},
			error:function(){
				alert("실패");
			}
		})
	};

	setInterval("manyBookPeople()",60000);
	$("#manyPeople").on("click",function(){
		manyBookPeople();
	});
	manyBookPeople();
	function manyBookPeople(){
		$.ajax({
			type:'GET',
			url:'manyBook.do',
			dataType:"json",
			success : function(data){
				$("#many li").remove();
				if(data.length < 10){
					for(var i in data){
						$("#many").append("<li>"+data[i].userId+"</li>");
					}
					for(var i = data.length; i<10; i++){
						$("#many").append("<li>-</li>");
					}
				}else{
					for(var i in data){
						$("#many").append("<li>"+data[i].userId+"</li>");
					}
				}
			},
			error:function(){
				alert("실패");
			}
		})
	};
 	 </script>
</body>
</html>