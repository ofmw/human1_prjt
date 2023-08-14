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
        margin-top: 20px;
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
    .p_inner_elements a{
        width: 295px;
        
        /* 상품 박스 최소높이 */
        min-height: 429px;
    }
    .p_img{
        width: 100%;
        height: 295px;
        margin-bottom: 5px;
        background-color: gold;
        position: relative;
    }
    .p_img img{
        width: 100%;
        height: 100%;
    }
    .p_img input{
        position: absolute;
        right: 0;
        bottom: 0;
        width: 30px;
        height: 30px;
        margin: 10px 5px;
        cursor: pointer;
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
        max-width: 550px;
        width:100%;
        height: 360px;
        position: relative;
        overflow: visible;
    }

    .swiper-slide {
        max-width: 550px;
        width:100%;
        height:360px;
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
        width: 100%;
        width: 480px;
        height: 100%;
        object-fit: cover;
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
        bottom: -30px;
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
            spaceBetween: 10,
    
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
            <!-- <div id="hp_area_adImg_box">
                <div id="img_box">
                    <div class="adImg"><a href="#"><img src="#" alt="#"></a></div>
                </div>
                <div id="nav">네비게이션</div>
            </div> -->
            <!-- 상단 광고이미지 슬라이드 영역 -->
            <div class="wrapper">
                <!-- Swiper -->
                <div class="swiper mySwiper">
                  <div class="swiper-wrapper">
                    <div class="swiper-slide">Slide 1</div>
                    <div class="swiper-slide">Slide 2</div>
                    <div class="swiper-slide">Slide 3</div>
                    <div class="swiper-slide">Slide 4</div>
                    <div class="swiper-slide">Slide 5</div>
                    <div class="swiper-slide">Slide 6</div>
                    <div class="swiper-slide">Slide 7</div>
                    <div class="swiper-slide">Slide 8</div>
                    <div class="swiper-slide">Slide 9</div>
                    <div class="swiper-slide">Slide 7</div>
                    <div class="swiper-slide">Slide 8</div>
                    <div class="swiper-slide">Slide 9</div>
                    <div class="swiper-slide">Slide 7</div>
                    <div class="swiper-slide">Slide 8</div>
                    <div class="swiper-slide">Slide 9</div>
                  </div>
                  <div class="swiper-pagination"></div>
                  <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div>
                  <!-- <div class="custom-fraction">
                    <span class="current">1</span>/<span class="all">9
                  </div> -->
                </div>
                <div class="btn-wrapper">
                  <button class="auto-start">slide autoplay start</button>
                  <button class="auto-stop">slide autoplay stop</button>
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
	                            <a href="product/product_view.do?p_id=${bestList[i].p_id}"><!-- a태그 링크는 해당 상품 페이지 링크로 연결 -->
	                                <div class="p_img">
		                                <img src="#" alt="상품 이미지">
		                                <c:choose>
		                                  <c:when test="${empty member}">
		                                      <input class="need_login" id="${bestList[i].p_id}" type="button" value="C"/>
		                                  </c:when>
		                                  <c:otherwise>
		                                      <input class="btn_addCart" id="${bestList[i].p_id}" type="button" value="C"/>
		                                  </c:otherwise>
		                                </c:choose>		                                
	                                </div>
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
	                                    <div class="p_info_stars">★ 4.5 (1043)</div><!-- 괄호 안 숫자는 리뷰 갯수 -->
	                                </div>
	                            </a>
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
	                            <a href="#"><!-- a태그 링크는 해당 상품 페이지 링크로 연결 -->
	                                <div class="p_img"><img src="#" alt="상품 이미지">
                                        <c:choose>
	                                        <c:when test="${empty member}">
	                                            <input class="need_login" id="${saleList[i].p_id}" type="button" value="C"/>
	                                        </c:when>
	                                        <c:otherwise>
	                                            <input class="btn_addCart" id="${saleList[i].p_id}" type="button" value="C"/>
	                                        </c:otherwise>
                                        </c:choose>                                     
                                    </div>
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
	                                        <c:set var="discount_sale" value="${saleList[i].price*(saleList[i].discount/100)}"></c:set>
	                                        <fmt:formatNumber value="${saleList[i].price - discount_sale}" pattern="#,###" />원
	                                    </div>
	                                    <div class="p_info_stars">★ 4.5 (1043)</div><!-- 괄호 안 숫자는 리뷰 갯수 -->
	                                </div>
	                            </a>
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
                                <a href="#"><!-- a태그 링크는 해당 상품 페이지 링크로 연결 -->
                                    <div class="p_img"><img src="#" alt="상품 이미지">
                                    <c:choose>
                                            <c:when test="${empty member}">
                                                <input class="need_login" id="${newList[i].p_id}" type="button" value="C"/>
                                            </c:when>
                                            <c:otherwise>
                                                <input class="btn_addCart" id="${newList[i].p_id}" type="button" value="C"/>
                                            </c:otherwise>
                                        </c:choose>                                     
                                    </div>
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
                                            <c:set var="discount_new" value="${newList[i].price*(newList[i].discount/100)}"></c:set>
                                            <fmt:formatNumber value="${newList[i].price - discount_new}" pattern="#,###" />원
                                        </div>
                                        <div class="p_info_stars">★ 4.5 (1043)</div><!-- 괄호 안 숫자는 리뷰 갯수 -->
                                    </div>
                                </a>
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