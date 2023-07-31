<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오!마트</title>

<style>
    /* ---------------------전체 요소 공통--------------------- */
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');       
    *{margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}

    /* a태그 공통 */
    a{text-decoration: none; color: #222;}

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
</style>

</head>
<body>

<!-- 헤더 -->
<header><jsp:include page="common/header1.jsp"></jsp:include></header>

<section>
	<div id="hp_area">
        <div id="hp_area_contents">

            <!-- 상단 광고이미지 슬라이드 영역 -->
            <div id="hp_area_adImg_box">
                <div id="img_box">
                    <div class="adImg"><a href="#"><img src="#" alt="#"></a></div>
                </div>
                <div id="nav">네비게이션</div>
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
			                                    <div class="p_info_name">${product.p_name}</div>
			                                    <div class="p_info_price">
			                                    	<fmt:formatNumber value="${product.price}" pattern="#,###" />원
			                                    </div>
			                                    <div class="p_info_stars">★ 4.5 (1043)</div><!-- 괄호 안 숫자는 리뷰 갯수 -->
			                                </div>
			                            </a>
									</c:if>
									<!-- 상품 하나 출력 후 현재 표시갯수 +1 (최대 4) -->
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