<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>마이페이지</title>
    
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../resources/js/mypage.js"></script>
<script type="text/javascript" src="../resources/js/mypage-wish.js"></script>
<link href="../resources/css/mypage/mypage.css?v=1234" rel="stylesheet">
<link href="../resources/css/mypage/mypage-common.css?v=1234" rel="stylesheet">

<style>
	/* ---------------------섹션 상품 표시 영역--------------------- */
	#mp_w_main_products{
    	margin: 20px 0;
    }
	#w_box{
		width: 100%;
	}
	#w_empty{
		height: 150px;
		font-size: 18px;
		line-height: 150px;
		text-align: center;
		user-select: none;
	}
    .w_inner_elements_box{
        display: flex;
        flex-flow: row wrap;
        justify-content: space-between;
        align-items: center;
		width: 100%;
        box-sizing: border-box;
    }
    .w_products{
        width: 180px;
        min-height: 280px;
    }
    .w_inner_elements_box:not(:first-child){
        margin-top: 30px;
    }
    .w_img{
     	position: relative;
        display: inline-block;
        width: 100%;
        height: 180px;
        margin-bottom: 5px;
        background-color: gold;
    }
    .w_img a{
       	display: block;
      	width: 100%;
     	height: 100%;
    }
	.w_img_opt-box {
		width: 100%;
		height: 40px;
		position: absolute;
		text-align: center;
		bottom: 0;
		user-select: none;
          
		background-color: rgba(255,255,255,0.9);
	}
	.w_img_opt-box-innerDiv{
		height: 100%;
		display: flex;
		align-items: center;
		flex-direction: row;
		justify-content: center;
	}
	.w_img_opt-box-innerDiv button{
		width: 30px;
		height: 28px;
		margin: 0 5px;
		background: none;
		border: 0;
		border-radius: 5px;
		font-size: 18px;
		padding-bottom: 2px;
		box-sizing: content-box;
		line-height: 28px;
	}
	.w_info_brand{
        font-size: 12px;
    	font-weight: bold;
    }
	.w_info_name{
    	font-size: 14px;
    }
	.w_info_price{
        font-size: 12px;
        font-weight: bold;
        color: #8b96a1;
    	text-decoration: line-through;
	}
	.w_info_price_final{
		font-size: 15px;
		font-weight: bold;
	}
	.w_info_price_final span{
		font-size: 17px;
		color: rgb(255, 59, 32);
	}
	.w_info_stars{
		font-size: 11px;
		color: #8b96a1;
	}
</style>

</head>
<body>

<!-- 헤더 -->
<header><jsp:include page="../common/header2.jsp"></jsp:include></header>

<section>

    <!-- 마이페이지 헤더부분 -->
    <div id="mp_header_area">

		<!-- 회원 정보 영역 -->
        <div id="mp_header_user" class="mp_header_obj">
            <div id="mp_header_user_name">${member.m_name}님</div>
            <input type="hidden" id="session_m_idx" value="${member.m_idx}">
            <input type="hidden" id="session_platform" value="${member.platform}">
            
            <div id="mp_header_user_menu">
                <ul>
                	<c:if test="${member.platform eq 'omart'}">
	                    <li><a href="member_modifiy.do">회원정보 변경</a></li>
	                </c:if>
                    <li><span id="manage_address">배송지 관리</span></li>
                    <li><a href="cancel.do">회원 탈퇴</a></li>
                </ul>
            </div>
        </div>

		<!-- 쿠폰 영역 -->
        <div id="mp_header_coupon" class="mp_header_obj">
            <div class="mp_header_obj_title">쿠폰</div>
            <div id="mp_header_coupon_num"><span>2198419841657</span>장</div>
            <div id="mp_header_coupon_info">
                <div class="mp_coupon">
                    <span>다운로드 가능한 쿠폰</span>
                    <span>0장</span>
                </div>
                <div class="mp_coupon">
                    <span>7일이내 만료예정 쿠폰</span>
                    <span>2198419841657장</span>
                </div>
            </div>
        </div>

		<!-- 포인트 영역 -->
        <div id="mp_header_point" class="mp_header_obj">
            <div class="mp_header_obj_title">포인트</div>
            <div id="mp_header_point_num">
            	<fmt:formatNumber value="${point}" pattern="#,###"/> P
            </div>
        </div>

    </div>

    <!-- 마이페이지 내용부분 -->
    <div id="mp_main_area">

		<!-- 좌측 메뉴 영역 -->
        <div id="mp_main_menu">
            <div id="mp_main_menu_order">
                <div class="mp_main_menu_title">나의 주문관리</div>
                <div class="mp_main_menu_list">
                    <ul>
                        <li><a href="purchase_history.do">주문/배송조회</a></li>
                    </ul>
                </div>
            </div>
            <div id="mp_main_menu_division"></div>
            <div id="mp_main_menu_activation">
                <div class="mp_main_menu_title">나의 활동관리</div>
                <div class="mp_main_menu_list">
                    <ul>
                        <li><a href="wish.do">찜목록</a></li>
                        <li><a href="mypage 상품리뷰.html">상품 리뷰</a></li>
                        <li><a href="mypage 상품QnA.html">상품 Q&A</a></li>
                        <li><a href="inquiry.do">1:1 문의</a></li>
                    </ul>
                </div>
            </div>
        </div>
		
		<!-- 중앙 본문 영역 -->
        <div id="mp_main">
            <div id="mp_main_osc" class="mp_main_obj">
                <div id="mp_main_osc_title"><a href="purchase_history.do">주문/배송 조회</a></div>
                <div id="mp_main_osc_infobar">
                    <c:set var="payment_completed" value="0"></c:set><!-- 결제완료 -->
                    <c:set var="ready_to_products" value="0"></c:set><!-- 상품준비중 -->
                    <c:set var="delivery_in_progress" value="0"></c:set><!-- 배송중 -->
                    <c:set var="delivery_completed" value="0"></c:set><!-- 배송완료 -->
                    
                    <c:forEach items="${orderList}" var="order">
                        <c:if test="${order.order_state eq 0}">
                            <c:set var="payment_completed" value="${payment_completed + 1}"></c:set><!-- 결제완료 -->
                        </c:if>
                        <c:if test="${order.order_state eq 1}">
				            <c:set var="ready_to_products" value="${ready_to_products + 1}"></c:set><!-- 상품준비중 -->
				        </c:if>
				        <c:if test="${order.order_state eq 2}">
				            <c:set var="delivery_in_progress" value="${delivery_in_progress + 1}"></c:set><!-- 배송중 -->
				        </c:if>
				        <c:if test="${order.order_state eq 3}">
				            <c:set var="delivery_completed" value="${delivery_completed + 1}"></c:set><!-- 배송완료 -->
				        </c:if>
                    </c:forEach>
                    
                    <div class="mp_main_osc_infobar_obj_btw">결제완료<p>${payment_completed}</p></div>
                    <div class="mp_main_osc_infobar_obj_btw"><span>상품준비중</span><p>${ready_to_products}</p></div>
                    <div class="mp_main_osc_infobar_obj_btw"><span>배송중</span><p>${delivery_in_progress}</p></div>
                    <div class="mp_main_osc_infobar_obj"><span>배송완료</span><p>${delivery_completed}</p></div>
                </div>
            </div>
            
            <div id="mp_main_review" class="mp_main_obj">
                <div class="mp_main_title"><a href="#">상품 리뷰</a></div>
                <div id="mp_main_review_content">리뷰 작성 가능한 상품이 없습니다.</div>
            </div>

            <div id="mp_main_wish" class="mp_main_obj">
                <div class="mp_main_title"><a href="wish.do">찜목록</a></div>
                <div id="mp_w_main_products">

                    <div id="w_box">
                        <div class="w_inner_elements">
							<c:choose>
								<c:when test="${!empty wishList[0]}">
									<div class="w_inner_elements_box">
		                            	<c:forEach begin="0" end="4" var="j">
								            <div class="w_products">
								            	<c:if test="${!empty wishList[j] and !empty p_info[j]}">
									                <div class="w_img">
									                	<a href="product_view.do?p_id=${p_info[j].p_id}"><img src="#" alt="#"></a>
									                	<div style="display:none" class="w_img_opt-box">
									                		<div class="w_img_opt-box-innerDiv">
										                		<button type="button" class="c_btn">🛒</button>
										                		<button type="button" class="w_btn" style="color:red;font-size:22px;">❤</button>
										                		<input type="hidden" class="p_id" value="${p_info[j].p_id}">
									                		</div>
									                	</div>
									                </div>
									                <div class="w_info">
									                    <div class="w_info_brand">${p_info[j].brand}</div>
									                    <div class="w_info_name">
									                    	<a href="product_view.do?p_id=${p_info[j].p_id}">${p_info[j].p_name}</a>
									                    </div>
									                    <c:if test="${p_info[j].discount gt 0}">
										                    <div class="w_info_price">
										                        <fmt:formatNumber value="${p_info[j].price}" pattern="#,###"/>원
										                    </div>
									                    </c:if>
									                    <div class="w_info_price_final">
				                                            <c:if test="${p_info[j].discount gt 0}">
				                                                <span>${p_info[j].discount}% </span>
				                                            </c:if>
				                                            <c:set var="discount_new" value="${p_info[j].price*(p_info[j].discount/100)}"></c:set>
				                                            <fmt:formatNumber value="${p_info[j].price - discount_new}" pattern="#,###" />원
				                                        </div>
									                    <c:if test="${p_info[j].reviews ne 0}">
															<div class="w_info_stars">★
																${p_info[j].stars_avg}
																(${p_info[j].reviews})</div>
															<!-- 괄호 안 숫자는 리뷰 갯수 -->
														</c:if>
									                </div>
								                </c:if>
								            </div>
										</c:forEach>
	                            	</div>
								</c:when>
								<c:otherwise>
									<div id="w_empty">찜목록에 상품이 없습니다!</div>
								</c:otherwise>
							</c:choose>
                        </div>
                    </div>

                </div><!-- end of mp_w_main_products -->
                
            </div>

        </div>

    </div>

</section>

<!-- 푸터 -->
<footer><jsp:include page="../common/footer.jsp"></jsp:include></footer>

</body>
</html>