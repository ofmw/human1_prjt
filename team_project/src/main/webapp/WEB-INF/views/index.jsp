<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오!마트</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
    /* ---------------------전체 요소 공통--------------------- */
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');       
    *{margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}

    /* a태그 공통 */
    a{text-decoration: none; color: #222;}
    
    body {
        overflow-x: hidden;
    }
	.p_img_opt-box-innerDiv button:hover{
		background-color: #222 !important;
		color: white !important;
    }

    /* ---------------------섹션--------------------- */
    section{
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-bottom: 100px;
        width: 100%;
        min-width: 1280px;
    }

    /* ---------------------홈페이지--------------------- */
    #hp_area{
        display: flex;
        flex-direction: column;
        align-items: center;

        width: 100%;
    }
    #hp_area_contents{
        width: 1280px;
        margin-top: 30px;
        /* background-color: aquamarine; */
    }

/* ---------------------상단 광고이미지--------------------- */
    #hp_area_adImg_box{
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 10px 0;
        /* background-color: orange; */
    }
    #img_box{
        display: flex;
        flex-direction: row;
        justify-content: center;
    }
    .adImg{
        width: 800px;
        height: 400px;
        border-radius: 30px;
        background-color: violet;
        overflow: hidden;
    }
    .adImg a{
        display: block;
        width: 100%;
        height: 100%;
        background-color: greenyellow;
    }
    .adImg img{
        display: block;
        width: 100%;
        height: 100%;
        background-color: greenyellow;
    }
    #nav{
        margin-top: 10px;
    }
/* ---------------------상품 영역 공통--------------------- */
    #hp_area_products_box{
        display: flex;
        flex-direction: column;
        align-items: center;

        width: 100%;
        /* background-color: aquamarine; */
    }
/* ---------------------상품 영역--------------------- */
    .p_best{
        width: 100%;
        margin-top: 100px;
    }
    .p_title{
        font-size: 35px;
        font-weight: bold;
        padding-left: 20px;
    }
    .p_inner_elements{
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
    
        width: 100%;
        padding: 20px;
        box-sizing: border-box;
    }
	.p_products{
		width: 295px;
		min-height: 429px;
	}
    .p_img{
        position: relative;
        display: inline-block;
        width: 100%;
        height: 295px;
        margin-bottom: 5px;
        background-color: gold;
    }
    .p_img a{
    	display: block;
        width: 100%;
        height: 100%;
    }
    .p_img_opt-box {
     	width: 100%;
     	height: 50px;
		position: absolute;
		text-align: center;
        bottom: 0;
        user-select: none;
         
		background-color: rgba(255,255,255,0.9);
	}
	.p_img_opt-box-innerDiv{
	    height: 100%;
	    display: flex;
	    align-items: center;
	    flex-direction: row;
		justify-content: center;
	}
	.p_img_opt-box-innerDiv button {
	    text-align: center;
	    width: 33px;
	    height: 29px;
	    margin: 0 5px;
	    background: none;
	    border: 0;
	    border-radius: 5px;
	    font-size: 22px;
	    padding-bottom: 6px;
	    padding-left: 2px;
	    box-sizing: content-box;
	    line-height: 33px;
	}
    .p_info_brand{
        font-size: 14px;
        font-weight: bold;
    }
    .p_info_name{
	    overflow: hidden;
	    text-overflow: ellipsis;
		display: -webkit-box;			/* box형태로 지정 */
		-webkit-line-clamp: 2;			/* 해당 영역의 최대 라인 수 */
		-webkit-box-orient: vertical;	/* 수직 정렬 */
        font-size: 15px;
    }
    .p_info_price{
        font-size: 13px;
        font-weight: bold;
        color: #8b96a1;
        text-decoration: line-through;
    }
    .p_info_price_final{
        font-size: 18px;
        font-weight: bold;
    }
    .p_info_price_final span{
        font-size: 20px;
        color: rgb(255, 59, 32);
    }
    .p_info_stars{
        font-size: 13px;
        font-weight: bold;
        color: #8b96a1;
    }
    
/* ---------------------이미지 슬라이드 영역--------------------- */
    
    .wrapper {
        max-width:1200px;
        width:75%;
        margin:0 auto;
    }

    .swiper {
        max-width: 700px;
        max-height: 350px;
        width:100%;
        height: 320px;
        position: relative;
        overflow: visible;
    }

    .swiper-slide {
        max-width: 700px;
        width:100%;
        height:320px;
        text-align: center;
        font-size: 18px;
        background: #fff;
        border-radius: 10px;
        
        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
    }

    .swiper-slide img {
        display: block;
        width: 650px;
        height: 320px;
        object-fit: cover;
        border-radius: 20px;
    }

    /**/

    .swiper-slide {opacity:0.5; transition:opacity 0.5s;}
    .swiper-slide-active {opacity:1;}

    .changing {
        transition:opacity 0.3s;
        pointer-events:none;
    }
    
    .changed {  
        transition:none;
    }


    /* pagination */
    .mySwiper .swiper-pagination {
        position: absolute;
        bottom: -40px;
        /* text-align:left; */
        
    }

    /* nav btn*/
    .mySwiper .swiper-button-next,
    .mySwiper .swiper-button-prev {
        top: 50%;
    }

    .mySwiper .swiper-button-prev {
        transform:translateX(-200%);
    }
    .mySwiper .swiper-button-next {
        transform:translateX(200%);
    }

    .custom-fraction {text-align:right; margin:15px 5px 0 0;}
    .btn-wrapper {
        margin-top:50px;        
    
    }
    .thumbnail{
        width: 295px;
        height: 295px;
    }
</style>
<script>
    $("document").ready(function () {
        // 문서의 dom이 준비되면
        // .mySwiper 클래스를 swiper 슬라이더로 만듦
        // 이후에 swiper변수에 할당했기 때문에 스크립트로 제어할 수도 있음.
        var swiper = new Swiper(".mySwiper", {
            slidesPerView: 'auto',
            autoplay: true,
            loop: true,
            centeredSlides: true,
            spaceBetween: 5,
    
            // pagination 기본은 bullet
            pagination: {
                el: ".swiper-pagination",
                clickable : true,
            },
    
            // 좌우 화살표 navigation element 지정
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev"
            },
            // 반응형
            breakpoints: {
                // 600px 이하가 되면 슬라이드 간 간격을 0으로
                600: {
                    spaceBetween: 10
                },
            },
    
            on: {
                init: function() {
                    $('.swiper-slide').addClass('changed');
    
                    // fraction에 현재 인덱스와 전체 인덱스 표시
                    // this.loopedSlides는 loop, slidesPerView: 'auto'일 때 제대로 동작
                    $('.custom-fraction .current').text(this.realIndex + 1);
                    $('.custom-fraction .all').text(this.loopedSlides);
                    // console.log(this);
                    // console.log(this.loopedSlides)
                },
    
                slideChangeTransitionStart: function() {
                    // 기본적으로 제공하는 swiper-slide-active 클래스를 이용해
                    // css transition 애니메이션 작성 가능하다.
                    // 다만 루프 모드일 때에는 루프 픽스를 하며 slide를 바꿔치기를 하는데,
                    // 이 때 플리커링이 발생할 수 있다.
                    // css transition을 서로 다르게 설정한 changed, changing 클래스를 이용
                    $('.swiper-slide').addClass('changing');
                    $('.swiper-slide').removeClass('changed');
    
                    // 페이지 넘어갈 때마다 fraction 현재 인덱스 변경
                    $('.custom-fraction .current').text(this.realIndex + 1);
                },
    
                slideChangeTransitionEnd: function() {
                    // changing : transition O
                    // changed : transition X
                    $('.swiper-slide').removeClass('changing');
                    $('.swiper-slide').addClass('changed');
                }
            },
        });
    
        // 슬라이더 할당한 swiper로 슬라이더 제어
        $(".auto-start").on("click", function() {
            // 기본 설정으로 autoplay 시작
            console.log("autoplay start");
            swiper.autoplay.start();
        });
    
        $(".auto-stop").on("click", function() {
            console.log("autoplay stop");
            swiper.autoplay.stop();
        });
        
        $('.swiper-slide').hover(function(){
			swiper.autoplay.stop();
        }, function(){
			swiper.autoplay.start();
        });
        
    
		/* ---------------------상품에 마우스 커서 호버 옵션박스------------------- */
		//*** 상품 이미지 마우스 커서 호버 이벤트 처리 ***//
	    $(document).on("mouseenter", ".p_img", function() {
		    $(this).find(".p_img_opt-box").stop().fadeIn(300);
		});
		
		$(document).on("mouseleave", ".p_img", function() {
		    $(this).find(".p_img_opt-box").stop().fadeOut(300);
		});
		
		/* ---------------------찜목록 상품 추가, 삭제--------------------- */
	    //*** 찜목록 상품 추가 메서드 ***//
	    function addWish(p_id) {
	    	
	    	let m_idx = parseInt($("#m_idx").val());
	    	
	    	if (isNaN(m_idx)) {
	    		alert("로그인 후 이용 가능합니다.");
	    		$("#shadow").show();
	    	} else {
	    	
	        	$.ajax({
	                type: "POST",
	                url: "product/add_wishList.do",
	                data: {
	                	m_idx: m_idx,
	                    p_id: p_id,
	                },
	                success: function (response) { // 해당 상품 수량이 업데이트된 새로운 장바구니 객체 반환
	                   if (response === "success") { // 수량 업데이트가 성공한 경우
	                	   	alert("찜목록에 추가되었습니다!");
	
	                	   	/* 페이지 새로고침 없이 class를 수정하여 업데이트된 세션객체의 찜목록과
	                	  	*  같은 상태로 임의변경 */
	                   		$('.p_id[value='+p_id+']').siblings(".p_btn").text("❤").css('color','red').addClass("inWish");
	                    } else if (response === "max") {
	                        alert("찜목록이 꽉 찼습니다! (최대 100개)");
	                    } else {
	                        alert("찜목록 추가에 실패했습니다.");
	                    }
	                }.bind(this), // 증감 버튼이 속한 행으로 한정
	                error: function () {
	                    alert("오류가 발생하였습니다.");
	                }
	            }); // end of ajax
	    	}
	    }
		
	  	//*** 찜목록 상품 삭제 메서드 ***//
	    function removeWish(p_id) {
	  		
			let m_idx = parseInt($("#m_idx").val());
	    	
	    	if (isNaN(m_idx)) {
	    		alert("로그인 후 이용 가능합니다.");
	    		$("#shadow").show();
	    	} else {
	    	
	        	$.ajax({
	                type: "POST",
	                url: "product/remove_wishList.do",
	                data: {
	                	m_idx: m_idx,
	                    p_id: p_id,
	                },
	                success: function (response) { // 해당 상품 수량이 업데이트된 새로운 장바구니 객체 반환
	                   if (response != null) { // 수량 업데이트가 성공한 경우
	                	   	alert("찜목록에서 삭제되었습니다!");
	                	  	
	                	  	/* 페이지 새로고침 없이 class를 수정하여 업데이트된 세션객체의 찜목록과
	                	  	*  같은 상태로 임의변경 */
	                	   	$('.p_id[value='+p_id+']').siblings(".p_btn").text("♡").css({
	                	   		'color':'#222',
	                	   		'font-size':'24px',
	                	   		'font-weight':'bold',
	                	   		'width':'34px',
	                	   		'padding-left':'1px',
	                	   		'padding-top':'1px',
	                	   		'padding-bottom':'3px',
	                	   		'height':'31px'
	                	   	}).removeClass("inWish");
	                    } else {
	                        alert("찜목록 삭제에 실패했습니다.");
	                    }
	                }.bind(this), // 증감 버튼이 속한 행으로 한정
	                error: function () {
	                    alert("오류가 발생하였습니다.");
	                }
	            }); // end of ajax
	        
	    	}
	    }
	  	
	  	//*** 찜버튼 클릭 이벤트 처리 ***//
	  	$(".p_btn").click(function() {
	  		
	  		if ($(this).hasClass('inWish')) {
	  			
	  			let p_id = $(this).siblings(".p_id").val();
	  			removeWish(p_id);
	  	    } else {
	  	    	
	  	    	let p_id = $(this).siblings(".p_id").val();
	           	addWish(p_id);
	  	    }
	  	});
		
	    /* ---------------------장바구니 상품 추가--------------------- */
	    //*** 장바구니에 선택한 상품 추가 ***//
	    function addCart(p_idArray) {
	    	
	    	let m_idx = parseInt($("#m_idx").val());
	    	
	    	if (isNaN(m_idx)) {
	    		alert("로그인 후 이용 가능합니다.");
	    		$("#shadow").show();
	    	} else {
	    	
	        	$.ajax({
	                type: "POST",
	                url: "mypage/addCart.do",
	                data: {
	                    p_id: p_idArray,
	                },
	                success: function (response) { // 해당 상품 수량이 업데이트된 새로운 장바구니 객체 반환
	                   if (response === "success") { // 수량 업데이트가 성공한 경우
	                	   	alert('장바구니에 상품이 추가되었습니다.');
	                	  	//페이지 새로고침
	                    } else if (response === "max"){
	                        alert("해당 상품이 장바구니 최대 상품 수량을 초과했습니다.\n(최대 20개)");
	                    } else {
	                        alert("장바구니 상품 추가에 실패했습니다.");
	                    }
	                },
	                error: function () {
	                    alert("오류가 발생하였습니다.");
	                }
	        	}); // end of ajax
	    	}
	    	
	    }
	    
	    
	  	//*** 장바구니 버튼 클릭 이벤트 처리 ***//
	    $(".c_btn").click(function() {
	    	let p_idArray = [$(this).siblings(".p_id").val()];
	    	console.log(p_idArray);
	    	
	    	addCart(p_idArray);
	    });
	  	
    });
</script>

</head>
<body>

<!-- 헤더 -->
<header><jsp:include page="common/header1.jsp"></jsp:include></header>

<section>
	<div id="hp_area">
        <div id="hp_area_contents">

            <!-- 상단 광고이미지 슬라이드 영역 -->
            <div class="wrapper">
                <!-- Swiper -->
                <div class="swiper mySwiper">
                  <div class="swiper-wrapper">
                    <div class="swiper-slide"><a href="product/product_view.do?p_id=AA0001"><img src="resources/img/삼겹살.jpg" alt="구운_삼겹살" /></a></div>
                    <div class="swiper-slide"><a href="product/product_list.do?category=BB&check=과자"><img src="resources/img/과자모음.jpg" alt="과자모음" /></a></div>
                    <div class="swiper-slide"><a href="product/product_list.do?category=DD"><img src="resources/img/야채모음.jpg" alt="야채모음" /></a></div>
                    <div class="swiper-slide"><a href="product/product_list.do?category=CC"><img src="resources/img/해산물요리.jpg" alt="해산물요리" /></a></div>
                    <div class="swiper-slide"><a href="product/product_list.do?category=BB&check=김치"><img src="resources/img/김치.jpg" alt="김치" /></a></div> 
                  </div>
                  <div class="swiper-pagination"></div>
                  <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div>
                  <!-- <div class="custom-fraction">
                    <span class="current">1</span>/<span class="all">9
                  </div> -->
                </div>
            </div>

            <!-- 상품 게시 영역 -->
            <div id="hp_area_products_box">

				<!-- 베스트 상품 -->
                <div class="p_best">
                    <div class="p_elements">
                        <div class="p_title">베스트 상품</div>
                        <div class="p_inner_elements">                        

                        	<c:forEach begin="0" end="3" var="i">
	                            
	                            <div class="p_products">
	                                <div class="p_img">
	                                	<a href="product/product_view.do?p_id=${bestList[i].p_id}"><img class="thumbnail" src="resources/uploads/${bestList[i].saveFile1}" alt="${bestList[i].p_name}"></a>
		                                <div style="display:none" class="p_img_opt-box">
		                                	<div class="p_img_opt-box-innerDiv">
				                                <input type="hidden" class="p_id" value="${bestList[i].p_id}">
						                		<button type="button" class="c_btn">🛒</button>
						                		<c:choose>
	               									<c:when test="${!empty wishList and wishList.contains(bestList[i].p_id)}">
						                				<button type="button" class="p_btn inWish" style="color:red;font-size:26px;">❤</button>
					                				</c:when>
					                				<c:otherwise>
					                					<button type="button" class="p_btn noWish" style="font-size:24px;font-weight:bold;width:34px;padding-left:1px;padding-top:1px;padding-bottom:3px;height:31px">♡</button>
					                				</c:otherwise>
					                			</c:choose>
		                                	</div>
		                                </div>                                
	                                </div>
	                                <a href="product/product_view.do?p_id=${bestList[i].p_id}">
		                                <div class="p_info">
		                                    <div class="p_info_brand">${bestList[i].brand}</div>
		                                    <div class="p_info_name">${bestList[i].p_name} ${bestList[i].standard}${bestList[i].unit}</div>
		                                    <c:if test="${bestList[i].discount gt 0}">
		                                       <div class="p_info_price"><fmt:formatNumber value="${bestList[i].price}" pattern="#,###" />원</div>
		                                    </c:if>	                                    
		                                    <div class="p_info_price_final">
		                                        <c:if test="${bestList[i].discount gt 0}">
	                                                <span>${bestList[i].discount}% </span>
	                                            </c:if>
		                                    	<c:set var="discount_best" value="${bestList[i].price*(bestList[i].discount/100)}"></c:set>
		                                    	<fmt:formatNumber value="${bestList[i].price - discount_best}" pattern="#,###" />원
		                                    </div>
		                                    <c:if test="${bestList[i].reviews ne 0}">
		                                       <div class="p_info_stars">★ ${bestList[i].stars_avg} (${bestList[i].reviews})</div><!-- 괄호 안 숫자는 리뷰 갯수 -->
		                                    </c:if>
		                                </div>
	                                </a>
                                </div>
	                            
                            </c:forEach>                            
                        </div>
                        
                    </div>
                </div>

				<!-- 세일중인 상품 -->
                <div class="p_best">
                    <div class="p_elements">
                        <div class="p_title">세일중인 상품</div>
                        <div class="p_inner_elements">
                            <c:forEach begin="0" end="3" var="i">
	                            <div class="p_products">
	                                <div class="p_img">
	                                	<a href="product/product_view.do?p_id=${saleList[i].p_id}"><img class="thumbnail" src="resources/uploads/${saleList[i].saveFile1}" alt="${saleList[i].p_name}"></a>
		                                <div style="display:none" class="p_img_opt-box">
		                                	<div class="p_img_opt-box-innerDiv">
				                                <input type="hidden" class="p_id" value="${saleList[i].p_id}">
						                		<button type="button" class="c_btn">🛒</button>
						                		<c:choose>
	               									<c:when test="${!empty wishList and wishList.contains(saleList[i].p_id)}">
						                				<button type="button" class="p_btn inWish" style="color:red;font-size:26px;">❤</button>
					                				</c:when>
					                				<c:otherwise>
					                					<button type="button" class="p_btn noWish" style="font-size:24px;font-weight:bold;width:34px;padding-left:1px;padding-top:1px;padding-bottom:3px;height:31px">♡</button>
					                				</c:otherwise>
					                			</c:choose>
		                                	</div>
		                                </div>                                
	                                </div>
	                                <a href="product/product_view.do?p_id=${saleList[i].p_id}">
		                                <div class="p_info">
		                                    <div class="p_info_brand">${saleList[i].brand}</div>
		                                    <div class="p_info_name">${saleList[i].p_name} ${saleList[i].standard}${saleList[i].unit}</div>
		                                    <c:if test="${saleList[i].discount gt 0}">
		                                       <div class="p_info_price"><fmt:formatNumber value="${saleList[i].price}" pattern="#,###" />원</div>
		                                    </c:if>	                                    
		                                    <div class="p_info_price_final">
		                                        <c:if test="${saleList[i].discount gt 0}">
	                                                <span>${saleList[i].discount}% </span>
	                                            </c:if>
		                                    	<c:set var="discount_best" value="${saleList[i].price*(saleList[i].discount/100)}"></c:set>
		                                    	<fmt:formatNumber value="${saleList[i].price - discount_best}" pattern="#,###" />원
		                                    </div>
		                                    <c:if test="${saleList[i].reviews ne 0}">
		                                       <div class="p_info_stars">★ ${saleList[i].stars_avg} (${saleList[i].reviews})</div><!-- 괄호 안 숫자는 리뷰 갯수 -->
		                                    </c:if>
		                                </div>
	                                </a>
                                </div>
                            </c:forEach>  
                        </div>
                        
                    </div>
                </div>
                
                <!-- 새로운 상품 -->
                <div class="p_best">
                    <div class="p_elements">
                        <div class="p_title">신규 상품</div>
                        <div class="p_inner_elements">
                            <c:forEach begin="0" end="3" var="i">                                 
                                <div class="p_products">
	                                <div class="p_img">
	                                	<a href="product/product_view.do?p_id=${newList[i].p_id}"><img class="thumbnail" src="resources/uploads/${newList[i].saveFile1}" alt="${newList[i].p_name}"></a>
		                                <div style="display:none" class="p_img_opt-box">
		                                	<div class="p_img_opt-box-innerDiv">
				                                <input type="hidden" class="p_id" value="${newList[i].p_id}">
						                		<button type="button" class="c_btn">🛒</button>
						                		<c:choose>
	               									<c:when test="${!empty wishList and newList.contains(newList[i].p_id)}">
						                				<button type="button" class="p_btn inWish" style="color:red;font-size:26px;">❤</button>
					                				</c:when>
					                				<c:otherwise>
					                					<button type="button" class="p_btn noWish" style="font-size:24px;font-weight:bold;width:34px;padding-left:1px;padding-top:1px;padding-bottom:3px;height:31px">♡</button>
					                				</c:otherwise>
					                			</c:choose>
		                                	</div>
		                                </div>                                
	                                </div>
	                                <a href="product/product_view.do?p_id=${newList[i].p_id}">
		                                <div class="p_info">
		                                    <div class="p_info_brand">${newList[i].brand}</div>
		                                    <div class="p_info_name">${newList[i].p_name} ${newList[i].standard}${newList[i].unit}</div>
		                                    <c:if test="${newList[i].discount gt 0}">
		                                       <div class="p_info_price"><fmt:formatNumber value="${newList[i].price}" pattern="#,###" />원</div>
		                                    </c:if>	                                    
		                                    <div class="p_info_price_final">
		                                        <c:if test="${newList[i].discount gt 0}">
	                                                <span>${newList[i].discount}% </span>
	                                            </c:if>
		                                    	<c:set var="discount_best" value="${newList[i].price*(newList[i].discount/100)}"></c:set>
		                                    	<fmt:formatNumber value="${newList[i].price - discount_best}" pattern="#,###" />원
		                                    </div>
		                                    <c:if test="${newList[i].reviews ne 0}">
		                                       <div class="p_info_stars">★ ${newList[i].stars_avg} (${newList[i].reviews})</div><!-- 괄호 안 숫자는 리뷰 갯수 -->
		                                    </c:if>
		                                </div>
	                                </a>
                                </div>
                            </c:forEach>  
                        </div>
                        
                    </div>
                </div>

            </div> <!-- end of hp_area_products_box -->

        </div>
    </div>
</section>

<!-- 푸터 -->
<footer><jsp:include page="common/footer.jsp"></jsp:include></footer>

</body>
</html>