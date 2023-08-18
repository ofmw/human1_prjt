<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>주문상세 조회</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="../resources/css/order_detail.css" rel="stylesheet">
    
    <style>
   		/* a태그 공통 */
		a:hover{text-decoration: underline;}
		
		#od_header_btn-addcart{
			width: 140px;
			padding: 2px 5px;
			border-radius: 3px;
		    border: 1px solid #ddd;
    		background-color: #fcfcfc;
		}
		#od_header_btn-addcart:hover{
			background-color: #222; !important;
			color: white;
		}
    </style>
    
    <script>
    	$(function() {
    		
    		//*** 장바구니에 다시 담기 ***//
    		$("#od_header_btn-addcart").click(function() {
    			
    			let check = confirm("상품들을 장바구니에 추가하시겠습니까?\n판매중인 상품만 추가됩니다.");
    			
    			if (check) {
    				
    				let p_idArray = [];

                    $(".p_id").each(function() {

                        p_idArray.push($(this).val());       

                    }); // end of .each()
    				
   	            	$.ajax({
   		                type: "POST",
   		                url: "addCart.do",
   		                data: {
   		                    p_id: p_idArray,
   		                },
   		                success: function (response) { // 해당 상품 수량이 업데이트된 새로운 장바구니 객체 반환
   		                   if (response === "success") { // 수량 업데이트가 성공한 경우
   		                	   	alert('장바구니에 상품이 추가되었습니다.');
   		                    } else {
   		                        alert("장바구니 상품 추가에 실패했습니다.");
   		                    }
   		                },
   		                error: function () {
   		                    alert("오류가 발생하였습니다.");
   		                }
   	            	}); // end of ajax
    			}
    			
    		});
    		
    		$(".btn_writeReview").click(function(){
    			let pId = $(this).closest("tr").find(".p_id").val();
    			let orderIdx = $("#od_header_ordernum span").text();
    		    let url ="write_review.do?order_idx="+orderIdx+"&pId="+pId; 
    		    let childWindow = null;
    		        		    
    		    // 기존에 자식창이 열려있는지에 대한 여부
                if (childWindow) { // 이미 자식창이 열려있으면
                    childWindow.close(); // 자식창을 닫음
                }
    		    
    		    childWindow = window.open(url, '리뷰 작성', 'menubar=no,width=700,height=750');
    		    
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

        <div id="mp_header_user" class="mp_header_obj">
            <div id="mp_header_user_name">${member.m_name}님</div>
            <div id="mp_header_user_menu">
                <ul>
                	<c:if test="${member.platform eq 'omart'}">
	                    <li><a href="#">회원정보 변경</a></li>
	                    <li><a href="#">비밀번호 변경</a></li>
	                </c:if>
                    <li><span id="manage_address">배송지 관리</span></li>
                    <li><a href="cancel.do">회원 탈퇴</a></li>
                </ul>
            </div>
        </div>

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
        
        <!-- 마이페이지 중앙 내용 -->
        <form>
            <div id="mp_main">
                <div id="mp_main_ph" class="mp_main_obj">

                    <!-- 마이페이지 주문상세 조회  -->
                    <div class="mp_main_title">주문상세 조회</div>
                    
                    <c:forEach items="${orderList}" var="o">
                    	<c:if test="${o.order_idx eq param.order_idx}">
		                    <!-- 주문상세 조회 헤더 -->
		                    <div id="mp_main_od_header">
		                        <div id="od_header_info_box">
		                            <span id="od_header_date"><fmt:formatDate value="${o.order_date}" pattern="yyyy-MM-dd"/></span>
		                            <span id="od_header_ordernum">주문번호 <span>${o.order_idx}</span></span>
		                        </div>
		                        
		                        <div id="od_header_opt_box">
		                            <button type="button" id="od_header_btn-addcart">장바구니에 다시 담기</button>
		                        </div>
		                    </div>
		
		                    <!-- 주문상세 배송상태 -->
		                    <div id="mp_main_od_shipstate">
		                        <ul>
		                            <c:choose>
			                              <c:when test="${o.order_state eq 0}">
			                                  <li id="selected_state"><div><span>결제완료</span></div></li>
			                              </c:when>
			                              <c:otherwise>
			                                  <li><div><span>결제완료</span></div></li>
			                              </c:otherwise>
		                            </c:choose>
		                            <c:choose>
                                          <c:when test="${o.order_state eq 1}">
                                              <li id="selected_state"><div><span>상품준비중</span></div></li>
                                          </c:when>
                                          <c:otherwise>
                                              <li><div><span>상품준비중</span></div></li>
                                          </c:otherwise>
                                    </c:choose>
		                            <c:choose>
                                          <c:when test="${o.order_state eq 2}">
                                              <li id="selected_state"><div><span>배송중</span></div></li>
                                          </c:when>
                                          <c:otherwise>
                                              <li><div><span>배송중</span></div></li>
                                          </c:otherwise>
                                    </c:choose>
		                            <c:choose>
                                          <c:when test="${o.order_state eq 3}">
                                              <li id="selected_state"><div><span>배송완료</span></div></li>
                                          </c:when>
                                          <c:otherwise>
                                              <li><div><span>배송완료</span></div></li>
                                          </c:otherwise>
                                    </c:choose>
		                        </ul>
		                    </div>
		
		                    <!-- 주문상세 조회 주문정보 table -->
		                    <div id="mp_main_od_tb_info">
		                        <table>
		                            <tr>
		                                <th>주문자 정보</th>
		                                <td><span>${member.m_name} </span>${member.selNum}</td>
		                            </tr>
		                            <tr>
		                                <th>받으시는 분</th>
		                                <td><span>${o.receiver} </span>${o.selnum}</td>
		                            </tr>
		                            <tr>
		                                <th>받으시는 주소</th>
		                                <td>${o.address}</td>
		                            </tr>
		                            <tr>
		                                <th>배송 요청사항</th>
		                                <td>${o.request}</td>
		                            </tr>
		                            <tr>
		                                <th>수령방법</th>
		                                <td>문 앞, 경비실 등등</td>
		                            </tr>
		                        </table>
		                    </div>
	                    </c:if>
                    </c:forEach>

                    <!-- 주문상세 조회 주문상품 table -->
                    <div>
                        <table id="mp_main_od_tb_product">
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:60%;">
                                <col style="width:20%;">
                                <col style="width:10%;">
                            </colgroup>
                            <c:forEach items="${p_info}" var="p">
	                            <tr>
	                                <td class="td_img"><a href="#"><img src="../resources/uploads/${p.saveFile1}" alt="이미지" width="90" height="90"></a></td>
	                                <td class="td_pname">
	                                	<input type="hidden" class="p_id" value="${p.p_id}">
	                                	<a href="../product/product_view.do?p_id=${p.p_id}">
	                                		[${p.brand}] ${p.p_name} ${p.standard}${p.unit}
	                                	</a>
	                                </td>
	                                <td class="td_odinfo">
	                                    <span class="td_odinfo_price"><fmt:formatNumber value="${p.price*p.stock}" pattern="#,###"/><span>원</span></span><br>
	                                    <span class="td_odinfo_amount">수량 ${p.stock}개</span>
	                                </td>
	                                <c:choose>
	                                   <c:when test="${p.review_state gt 0}">
	                                       <td class="td_review"><a style="text-decoration: none; cursor: default;">리뷰작성 완료</a></td>
	                                   </c:when>
	                                   <c:otherwise>
	                                       <td class="td_review"><a class="btn_writeReview" >리뷰작성</a></td>	                                       
	                                   </c:otherwise>
	                                </c:choose>	                                
	                            </tr>
                            </c:forEach>
                            <c:forEach items="${orderList}" var="o">
	                            <c:if test="${o.order_idx eq param.order_idx}">
			                        <tr>
	                                    <th>최종결제금액</th>
	                                    <td></td>
	                                    <td class="td_odinfo">
	                                       <span class="td_odinfo_price"><fmt:formatNumber value="${o.paid_price}" pattern="#,###"/><span>원</span></span><br>
	                                       <span class="td_odinfo_amount">(포인트차감 : -<fmt:formatNumber value="${o.used_point}" pattern="#,###" />원)</span>
	                                    </td>
	                                </tr>
			                    </c:if>			                    
                            </c:forEach>
                        </table>
                    </div>

                    <!-- 하단 버튼 모음 -->
                    <div id="mp_main_od_btnbox">
                        <ul>
                            <li><button></button></li>
                        </ul>
                    </div>
                </div>

            </div>
        </form>
    </div>

</section>
    
<!-- 푸터 -->
<footer><jsp:include page="../common/footer.jsp"></jsp:include></footer>

</body>
</html>