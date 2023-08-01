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
    #p_best{
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
        /* background-color: aliceblue; */
    }
    .p_img{
        width: 100%;
        height: 295px;
        margin-bottom: 5px;
        background-color: gold;
    }
    .p_info_brand{
        font-size: 14px;
        font-weight: bold;
    }
    .p_info_name{
        font-size: 15px;
    }
    .p_info_price{
        font-size: 18px;
        font-weight: bold;
    }
    .p_info_stars{
        font-size: 13px;
        color: #8b96a1;;
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
                <div id="p_best">
                    <div class="p_elements">
                        <div class="p_title">베스트 상품</div>
                        <div class="p_inner_elements">
                        
                        	<!-- 판매중인 상품만 표시하는 변수 -->
                        	<c:set var="divCount" value="0" />
                        	<c:forEach items="${productList}" var="product">
                        		<!-- 판매중인 제품 판별 -->
                        		<c:if test="${product.post_state == 1}">
                        			<!-- 판매중인 상품을 최대 4개까지만 표시하는 조건 -->
                        			<c:if test="${divCount <= 3}">
                        		
			                            <a href="#"><!-- a태그 링크는 해당 상품 페이지 링크로 연결 -->
			                                <div class="p_img"><img src="#" alt="#"></div>
			                                <div class="p_info">
			                                    <div class="p_info_brand">${product.brand}</div>
			                                    <div class="p_info_name">${product.p_name} ${product.standard}${product.unit}</div>
			                                    <div class="p_info_price">
			                                    	<fmt:formatNumber value="${product.price}" pattern="#,###" />원
			                                    </div>
			                                    <div class="p_info_stars">★ 4.5 (1043)</div><!-- 괄호 안 숫자는 리뷰 갯수 -->
			                                </div>
			                            </a>
									</c:if>
									<!-- 상품 하나 출력 후 현재 표시갯수 +1 (최대 3) -->
									<c:set var="divCount" value="${divCount + 1}" />
	                            </c:if>
                            </c:forEach>
                            
                        </div>
                        
                    </div>
                </div>

				<!-- 세일중인 상품 -->
                <div id="p_best">
                    <div class="p_elements">
                        <div class="p_title">세일중인 상품</div>
                        <div class="p_inner_elements">
                            <a href="#">
                                <div class="p_img"><img src="#" alt="#"></div>
                                <div class="p_info">
                                    <div class="p_info_brand">농협</div>
                                    <div class="p_info_name">참돔</div>
                                    <div class="p_info_price">9억원</div>
                                    <div class="p_info_stars">★ 4.5 (1043)</div>
                                </div>
                            </a>
                            <a href="#">
                                <div class="p_img"><img src="#" alt="#"></div>
                                <div class="p_info">
                                    <div class="p_info_brand">농협</div>
                                    <div class="p_info_name">돌돔</div>
                                    <div class="p_info_price">8,700원</div>
                                    <div class="p_info_stars">★ 4.5 (3)</div>
                                </div>
                            </a>
                            <a href="#">
                                <div class="p_img"><img src="#" alt="#"></div>
                                <div class="p_info">
                                    <div class="p_info_brand">농협</div>
                                    <div class="p_info_name">문어세꼬시</div>
                                    <div class="p_info_price">32,165달러</div>
                                    <div class="p_info_stars">★ 4.5 (11)</div>
                                </div>
                            </a>
                            <a href="#">
                                <div class="p_img"><img src="#" alt="#"></div>
                                <div class="p_info">
                                    <div class="p_info_brand">농협</div>
                                    <div class="p_info_name">참돔</div>
                                    <div class="p_info_price">9억원</div>
                                    <div class="p_info_stars">★ 4.5 (123)</div>
                                </div>
                            </a>
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