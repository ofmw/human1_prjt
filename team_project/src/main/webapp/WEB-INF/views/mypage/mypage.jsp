<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>마이페이지</title>

<link href="../resources/css/mypage.css?v=1234" rel="stylesheet">
<style>

	/* a태그 공통 */
	a:hover{text-decoration: underline;}
	/* 버튼 및 선택 요소 공통 */
	button:hover, #sel_box:hover{
		background-color: #222 !important;
		color: white;
    }
    
    #mp_header_area li span:hover{
    	text-decoration: underline;
    	cursor: pointer;
    }
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
		height: 30px;
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
		margin: 0 5px;
		background-color: #fcfcfc;
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


<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>

	<script>
        $(function() {
        	
        	
        	
        	/* ---------------------배송지 변경--------------------- */
            // 기존에 열려있는 자식 창에 대한 변수 초기화
            let childWindow = null;
            
            //*** 배송지 변경 자식창 열기 ***//
            function openManageAddress() {
            	
            	// 기존에 자식창이 열려있는지에 대한 여부
            	if (childWindow) { // 이미 자식창이 열려있으면
                    childWindow.close(); // 자식창을 닫음
                }
            	
            	// 자식창에 로그인한 회원이 m_idx 파라미터 값 넘겨줌
            	let url = "manage_address.do?m_idx=" + $("#session_m_idx").val() + "&page=1";
            	// 자식창을 열고 그 여부를 변수에 저장
            	childWindow = window.open(url, '배송지 설정', 'menubar=no,width=700,height=750');
            	//childWindow = window.open(url, '_blank', 'menubar=no,width=715,height=830');
            }
            
            //*** 배송지 변경 자식창 열기 이벤트 처리 ***//
            $("#manage_address").on("click", function(){
            	openManageAddress();
            });
            
            /* ---------------------회원 탈퇴--------------------- */
            //*** 회원탈퇴 버튼 클릭 이벤트 처리 ***//
            $("#cancel").on("click", function(){
            	
            	let platform = $("#session_platform").val();
            	
            	if (platform === "omart") {
            		location.href = "omartCancel.do";
            	} else if (platform === "kakao") {
            		location.href = "kakaoCancel.do";
            	}
            	
            });
        	
        	/* ---------------------상품에 마우스 커서 호버 옵션박스------------------- */
        	//*** 상품 이미지 마우스 커서 호버 이벤트 처리 ***//
            $(".w_img").hover(
                function() {
                	$(this).find(".w_img_opt-box").stop().fadeIn(300);
                },
                function() {
                	$(this).find(".w_img_opt-box").stop().fadeOut(300);
                }
            );
            
            /* ---------------------찜한 상품 삭제 관리--------------------- */
            //*** 찜목록 상품 삭제 메서드 ***//
            function removeWish(p_idArray) {
            	
            	$.ajax({
	                type: "POST",
	                url: "remove_wishList.do",
	                data: {
	                    p_id: p_idArray,
	                },
	                success: function (response) { // 해당 상품 수량이 업데이트된 새로운 장바구니 객체 반환
	                   if (response === "success") { // 수량 업데이트가 성공한 경우
	                	   	alert('찜목록에서 상품이 삭제되었습니다.');
	                	  	//페이지 새로고침
	                	   	location.reload();
	                    } else {
	                        alert("찜목록 삭제에 실패했습니다.");
	                    }
	                },
	                error: function () {
	                    alert("오류가 발생하였습니다.");
	                }
            	}); // end of ajax
            	
            }
            
            
         	//*** 찜 버튼 클릭 이벤트 처리 ***//
            $(".w_btn").click(function() {
            	let p_idArray = [$(this).siblings(".p_id").val()];
            	console.log(p_idArray);
            	
            	// 상품 삭제 여부 결정
                let confirmed = confirm("해당 상품을 찜목록에서 삭제하시겠습니까?");

                // "확인" 을 눌렀을 경우
                if (confirmed) {

                	removeWish(p_idArray);

                } // end of if (confirmed)
            	
            });
      
            /* ---------------------찜한 상품 관리--------------------- */
            //*** 장바구니에 선택한 상품 추가 ***//
            function addCart(p_idArray) {
            	
            	$.ajax({
	                type: "POST",
	                url: "addCart.do",
	                data: {
	                    p_id: p_idArray,
	                },
	                success: function (response) { // 해당 상품 수량이 업데이트된 새로운 장바구니 객체 반환
	                   if (response === "success") { // 수량 업데이트가 성공한 경우
	                	   	alert('장바구니에 상품이 추가되었습니다.');
	                	  	//페이지 새로고침
	                	   	location.reload();
	                    } else {
	                        alert("장바구니 상품 추가에 실패했습니다.");
	                    }
	                },
	                error: function () {
	                    alert("오류가 발생하였습니다.");
	                }
            	}); // end of ajax
            	
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
                <div style="border-radius: 4px;background-color: #fafafa;height: 40px;width: 100%;margin-top: 5px;"></div>
            </div>
            
            <div id="mp_main_review" class="mp_main_obj">
                <div class="mp_main_title"><a href="#">상품 리뷰</a></div>
                <div id="mp_main_review_content">리뷰 작성 가능한 상품이 없습니다.</div>
            </div>

            <div id="mp_main_wish" class="mp_main_obj">
                <div class="mp_main_title"><a href="wish.do?option1=none">찜목록</a></div>
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
										                		<button type="button" class="c_btn">카</button>
										                		<button type="button" class="w_btn" style="color:red;">♥</button>
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
									                    <div class="w_info_stars">★ 4.5 (1043)</div>
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