<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>상품 페이지</title>

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <style>
    /* ---------------------전체 요소 공통--------------------- */
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');       
    *{margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}

    /* a태그 공통 */
    a{text-decoration: none; color: #222;}

    /* ---------------------상품 페이지--------------------- */
    #pl_area{
        display: flex;
        flex-direction: column;
        align-items: center;

        width: 100%;
    }
    #pl_area_contents{
        width: 1280px;
        margin-top: 20px;
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

/* ---------------------장바구니 메인영역--------------------- */
    #cart_main{
        display: flex;
        flex-direction: row;
        justify-content: space-between;

        padding: 0 20px;
    }

/* ---------------------장바구니 메인 상품목록 헤더--------------------- */
    #cart_plist{
        width: 900px;

    }

/* ---------------------장바구니 메인 상품목록 헤더--------------------- */
    #cart_plist_header{
        padding-bottom: 5px;
        border-bottom: 2px solid #222;
    }
    .cart_plist_header_title{
        padding-bottom: 15px;
        font-size: 20px;
        font-weight: bold;
    }
    #cart_plist_header_opt_box *{
        color: #777;
        font-size: 13px;
    }
    #cart_plist_header_opt_box{
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }
    #cart_plist_header_opt_box label{
        padding-right: 10px;
        user-select: none;
    }
    #sel_all{
        position: relative;
        top: 1.5px;
    }
    #sel_delete{
        border: 0;
        background-color: white;
    }

/* ---------------------장바구니 주문결제 네비게이션 메뉴--------------------- */
    #cart_main_order-nav{
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 300px;
        height: 143px;
        color: #222;
        background-color: aquamarine;
        box-sizing: border-box;
    }

    /*** 배송지 주소 ***/
    #order-nav_address{
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 15px 10px;
        width: 100%;
        background-color: #f5f5f5;
        box-sizing: border-box;
    }
    #order-nav_address div:first-child{
        display: flex;
        flex-direction: column;
        width: 100%;
    }
    #address_preset{
        font-size: 13px;
        font-weight: bold;
    }
    #address_detail{
        font-size: 13px;
    }
    #order-nav_address div:last-child{
        text-align: center;
        width: 100%;
        margin-top: 25px;
    }
    #order-nav_address button{
        width: 100%;
        height: 35px;
        border: 1px solid #ccc;
        background-color: #fff;
        cursor: pointer;
    }

    /*** 주문 정보 ***/
    #order-nav_product{
        display: flex;
        flex-direction: column;
        width: 100%;
        padding: 15px 10px;
        box-sizing: border-box;
        background-color: #fff;
    }
    #product_total{
        font-size: 13px;
        font-weight: bold;
    }
    #product_detail{
        margin-top: 40px;
        font-size: 13px;
        border-bottom: 1px solid #e0e0e0;
    }
    #product_detail div{
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }
    #product_detail div:last-child{
        margin-bottom: 10px;
    }
    #product_payment-price{
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        color: #ff3e3e;
        margin-top: 10px;
    }
    #product_payment-price span:first-child{
        font-size: 13px;
    }
    #product_payment-price span:last-child{
        line-height: 0px;
    }

    /*** 주문 버튼 ***/
    #order-nav_btn{
        display: flex;
        flex-direction: column;
        width: 100%;
        padding: 15px 10px;
        box-sizing: border-box;
        background-color: #fff;
    }
    #order-nav_btn button{
        width: 100%;
        height: 50px;
        border: 0;
        background-color: #ff3e3e;
        color: #fff;
        font-size: 21px;
        cursor: pointer;
    }

/* ---------------------주문상세 조회 내역 테이블 (주문상품)--------------------- */
    /* 테이블 */
    #cart_plist_tb{
        width: 100%;
        margin-top: 20px;
        border-spacing: 0;
        
        border-top: 1px solid #eee;
    }
    /* td (공통) */
    #cart_plist_tb td{
        height: 110px;
        box-sizing: border-box;
        border-collapse: collapse;
    }
    /* td (아래 테두리) */
    #cart_plist_tb tr td:nth-child(n+1):not(tr:last-child){
        border-bottom: 1px solid #eee;
    }
    /*** 썸네일 이미지 ***/
    .td_img{
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .td_img div{
        position: relative;
        width: 90px;
        height: 90px;
        box-sizing: border-box;
    }
    .td_img a{
        position: absolute;
        border: 1px solid black;
        box-sizing: border-box;
        width: 100%;
        height: 100%;
    }
    .td_img img{
        position: absolute;
        width: 100%;
        height: 100%;
    }
    .td_img input{
        position: absolute;
    }
    /*** 상품명 ***/
    .td_pname{
        text-align: left;
        padding: 10px 15px;
    }
    .td_pname a{
        font-size: 14px;
        color: #555;
    }
    /*** 상품 가격,수량 ***/
    .td_odinfo{
        text-align: left;
        padding: 10px 15px;
        border-left: 1px solid #eee;
        border-right: 1px solid #eee;
        color: #222;
    }
    .td_odinfo_price{
        font-size: 22px;
    }
    .td_odinfo_price span{
        padding-left: 1px;
        font-size: 11px;
    }
    /* 수량 조절 */
    .td_odinfo_amount{
        display: flex;
        flex-direction: row;
        margin-top: 5px;
        font-size: 11px;
    }
    .td_odinfo_amount button{
        width: 25px;
        height: 25px;
        color: #555;

        background-color: white;
        border: 1px solid #888;
        box-sizing: border-box;

        cursor: pointer;
    }
    .td_odinfo_amount button:last-child{
        line-height: 10px;
    }
    .td_odinfo_amount input{
        width: 40px;
        height: 25px;

        text-align: center;

        border-left: 0;
        border-right: 0;
        border-top: 1px solid #888;
        border-bottom: 1px solid #888;
        box-sizing: border-box;
    }
    /*** 삭제하기 버튼 ***/
    .td_delete{
        text-align: center;
    }
    .td_delete button{
        display: inline-block;
        width: 80px;
        height: 30px;
        font-size: 13px;
        border: 1px solid #e0e0e0;
        background-color: white;
        color: #222;
        cursor: pointer;
        text-align: center;
        line-height: 30px;
    }
    /* 장바구니가 비었을 때 표시문구 */
    #tr_empty_cart td{
        height: 200px;
        text-align: center;
        font-size: 20px;
    }

/* ---------------------무료배송 안내문구--------------------- */
    #cart_main_info{
        width: 100%;
        height: 60px;
        text-align: center;
        font-size: 18px;
        color: #222;
        line-height: 60px;
        margin-top: 20px;
        background-color: #f9f9f9;
        border: 1px solid #eee;
        box-sizing: border-box;
    }

/* ---------------------장바구니 안내문구--------------------- */
    #cart_main_notice{
        margin-top: 40px;
        height: 100px;
        font-size: 13px;
        color: #222;
    }
    #notice_title{
        font-weight: bold;
    }
    #notice_contents ul{
        list-style: none;
    }
    #notice_contents li{
        margin: 5px 0;
        font-size: 12px;
    }

    </style>

<script>
    $(function() {
        /* ---------------------상품 수량 조절--------------------- */
        // + 버튼 클릭 이벤트 처리
        

        /* ---------------------상품 선택 체크박스------------------- */
        // "전체 선택" 체크박스 클릭 이벤트 처리
        $("#sel_all").click(function() {
            // 전체 선택 체크박스의 상태를 가져옵니다.
            var isChecked = $(this).prop("checked");
            // class가 "sel_product"인 모든 체크박스를 선택 또는 해제합니다.
            $(".sel_product").prop("checked", isChecked);
        });

        // 개별 상품 체크박스 클릭 이벤트 처리 (옵션)
        $(".sel_product").click(function() {
            // 개별 상품 체크박스가 모두 선택되었는지 확인합니다.
            var allChecked = $(".sel_product:checked").length === $(".sel_product").length;
            // "전체 선택" 체크박스의 상태를 개별 상품 체크박스들과 동기화합니다.
            $("#sel_all").prop("checked", allChecked);
        });

        // 삭제 버튼 클릭 이벤트 처리
        $(".td_delete button").click(function() {
            // 해당 버튼이 속한 tr 요소를 찾아서 삭제합니다.
            $(this).closest("tr").remove();
        });

        // sel_delete 버튼 클릭 이벤트 처리 (sel_product 체크된 항목 삭제)
        $("#sel_delete").click(function() {
            // class가 sel_product인 체크박스 중 체크된 항목들을 선택합니다.
            var checkedProducts = $(".sel_product:checked");
            // 선택된 체크박스들이 속한 행을 모두 삭제합니다.
            checkedProducts.closest("tr").remove();
        });

        /* ---------------------주문정보 네비게이션--------------------- */
        $(window).scroll(function() {
            let ordernav = $("#cart_main_order-nav");

            if ($(window).scrollTop() >= 139) {
                ordernav.css({
                    "position": "sticky",
                    "top": "0",
                });

            } else {
                ordernav.css("position", "static");
            }
        });

        /* ---------------------버튼 색상 변경--------------------- */
        // 버튼에 마우스 커서가 올라갔을 때의 이벤트 처리
        $("button").mouseenter(function() {
            $(this).css({
                "background-color": "#222",
                "color": "white"
                });
        });

        // 버튼에서 마우스 커서가 벗어났을 때의 이벤트 처리
        $("button").mouseleave(function() {
            $(this).css({
                "background-color": "",
                "color": ""
            }); // 원래 배경색 및 폰트 색상으로 되돌리기
        });

        /* ---------------------빈 장바구니 표시--------------------- */
        // 테이블의 tr 요소 개수를 확인하는 함수
        function countVisibleRows() {
            return $('table tr:not(#tr_empty_cart)').length;
        }
        // tr_empty_cart를 보이도록 처리하는 함수
        function showEmptyCartRow() {
            $('#tr_empty_cart').show();
        }
        // tr_empty_cart를 숨기도록 처리하는 함수
        function hideEmptyCartRow() {
            $('#tr_empty_cart').hide();
        }
        // 페이지 로딩 시 tr_empty_cart를 체크하고 필요에 따라 보이기/숨기기 처리
        function checkEmptyCart() {
            var rowCount = countVisibleRows();
            if (rowCount === 0) {
                showEmptyCartRow();
            } else {
                hideEmptyCartRow();
            }
        }
        // 페이지 로딩 시 tr_empty_cart를 체크하고 초기 처리
        checkEmptyCart();
        // tr이 추가되거나 삭제될 때마다 tr_empty_cart를 체크하고 처리
        $('table').on('DOMSubtreeModified', function() {
            checkEmptyCart();
        });
        
        
        
     	// 페이지 로드 시 기존 값들을 합산하여 #product_total에 표시
        calculateTotal();

        // 버튼 클릭 시 이벤트 처리
        $(".plist_minus-btn, .plist_plus-btn").on("click", function() {
            // plist_amount_value의 모든 요소들을 선택하여 각 값들을 합산
            calculateTotal();
        });

        function calculateTotal() {
            // plist_amount_value의 모든 요소들을 선택하여 각 값들을 합산
            let total = 0;
            $(".plist_amount_value").each(function() {
                const amountValue = parseFloat($(this).val());
                if (!isNaN(amountValue)) {
                    total += amountValue;
                }
            });
            
            // 합산 결과를 #product_total에 표시
            $("#product_total span").text(total);
        }
        
        
        
        
        
        
        
        	
        	
        	
            // - 버튼 클릭 이벤트 처리
            $(document).on('click', '.plist_minus-btn', function () {
                let amountInput = $(this).siblings('.plist_amount_value');
                let currentAmount = parseInt(amountInput.val());
                let m_idx = $(this).siblings(".m_idx").val();
            	let p_id = $(this).siblings(".p_id").val();
            	
                console.log(currentAmount);
                if (currentAmount > 1) {
                    updateAmount(m_idx, p_id, currentAmount - 1);
                }
            });

            // + 버튼 클릭 이벤트 처리
            $(document).on('click', '.plist_plus-btn', function () {
                let amountInput = $(this).siblings('.plist_amount_value');
                let currentAmount = parseInt(amountInput.val());
                let m_idx = $(this).siblings(".m_idx").val();
            	let p_id = $(this).siblings(".p_id").val();
            	
                if (currentAmount < 20) {
                    updateAmount(m_idx, p_id, currentAmount + 1);
                }
            });

            function updateAmount(m_idx, p_id, newAmount) {
                $.ajax({
                    type: "POST",
                    url: "update_cart_amount.do", // 증감된 값을 데이터베이스에 업데이트하는 서버 사이드 코드
                    data: {
                    	m_idx: m_idx,
                        p_id: p_id,
                        amount: newAmount
                    },
                    success: function (response) {
                        if (response === "success") {
                            amountInput.val(newAmount);
                        } else {
                            alert("수량 업데이트에 실패하였습니다.");
                        }
                    },
                    error: function () {
                        alert("오류가 발생하였습니다.");
                    }
                });
            }

    });
</script>
</head>
<body>

<!-- 헤더 -->
<header><jsp:include page="../common/header2.jsp"></jsp:include></header>

<section>
    <div id="pl_area">
        <div id="pl_area_contents">


            <!-- 장바구니 페이지 메인영역 -->
            <div id="pl_main">

                <!-- 장바구니 중앙 내용 -->
                <form>
                    <div id="cart_main">
                        <div id="cart_plist" class="cart_plist">

                            <!-- 장바구니 헤더  -->
                            <div id="cart_plist_header">
                                <div class="cart_plist_header_title">장바구니</div>
                                <div id="cart_plist_header_opt_box">
                                    <form>
                                        <div id="sel_box">
                                            <input type="checkbox" id="sel_all">
                                            <label for="sel_all">전체선택 / 선택해제</label>
                                        </div>
                                        <button type="button" id="sel_delete">선택품목 삭제</button>
                                    </form>
                                </div>
                            </div>

                            <!-- 주문상세 조회 주문상품 table -->
                            <div>
                                <table id="cart_plist_tb">
                                    <colgroup>
                                        <col style="width:10%;">
                                        <col style="width:60%;">
                                        <col style="width:20%;">
                                        <col style="width:10%;">
                                    </colgroup>
                                    <tr id="tr_empty_cart" style="display: none;">
                                        <td colspan="4">장바구니에 담긴 상품이 없습니다!${CartList}</td>
                                    </tr>
                                   	<c:if test="${!empty CartList}">
                                    	<c:forEach items="${CartList}" var="c">
	                                    	
                                   			<tr>
		                                        <td class="td_img">
		                                            <div>
		                                                <a href="#"><img src="#" alt="이미지" width="90" height="90"></a>
		                                                <input type="checkbox" class="sel_product">
		                                            </div>
		                                        </td>
		                                        <td class="td_pname">
		                                        	<a href="#">
		                                        		[${c.brand}] ${c.p_name} ${c.standard}${c.unit}
		                                        	</a>
		                                        </td>
		                                        <td class="td_odinfo">
		                                            <span class="td_odinfo_price">
		                                            	<fmt:formatNumber value="${c.price}" pattern="#,###" />
		                                            	<span>원</span>
		                                            </span><br>
		                                            <div class="td_odinfo_amount">
		                                                <button type="button" class="plist_minus-btn">-</button>
		                                                <input type="text" class="plist_amount_value" value="${c.amount}">
		                                                <button type="button" class="plist_plus-btn">+</button>
		                                                <input type="hidden" class="m_idx" value="${c.m_idx}">
		                                                <input type="hidden" class="p_id" value="${c.p_id}">
		                                            </div>
		                                        </td>
		                                        <td class="td_delete"><button type="button">삭제하기</button></td>
											</tr>
											
										</c:forEach>
									</c:if>
                                </table>
                            </div>

                            <div id="cart_main_info">25,000원 이상 주문시 무료배송!</div>

                            <!-- 장바구니 메인영역 하단 안내문구 -->
                            <div id="cart_main_notice">
                                <div id="notice_title">장바구니 상품 안내</div>
                                <div id="notice_contents">
                                    <ul>
                                        <li>·&nbsp;&nbsp;장바구니에 담은 상품은 최대 150개까지 보관됩니다.</li>
                                        <li>·&nbsp;&nbsp;포인트, 쿠폰 적용 금액은 결제 페이지에서 확인 가능합니다.</li>
                                        <li>·&nbsp;&nbsp;비회원 주문인 경우 브라우저 종료 시 장바구니가 초기화됩니다.</li>
                                    </ul>
                                </div>
                            </div>

                        </div><!-- end of 장바구니 메인영역-->

                        <!-- 주문결제 네비게이션 창 -->
                        <div id="cart_main_order-nav">
                            
                            <!-- 배송지 -->
                            <div id="order-nav_address">
                                <div>
                                    <span id="address_preset">기본배송지: 우리집</span>
                                <span id="address_detail">[31148] 충청남도 천안시 동남구 봉서8길 13, 306동 1302호 (봉명동, 청솔3차아파트)</span>
                                </div>
                                <div><button type="button">배송지 변경</button></div>
                            </div>

                            <!-- 주문 정보 -->
                            <div id="order-nav_product">
                                <div id="product_total">전체상품: <span></span>개</div>
                                <div id="product_detail">
                                    <div id="product_ordered-price">
                                        <span>주문금액</span>
                                        <span>30,000 원</span>
                                    </div>
                                    <div id="product_discount-price">
                                        <span>상품할인</span>
                                        <span>-0 원</span>
                                    </div>
                                    <div id="product_shipping-fee">
                                        <span>배송비</span>
                                        <span>+0 원</span>
                                    </div>
                                </div>
                                <div id="product_payment-price">
                                    <span>결제예정금액</span>
                                    <span style="font-size:22px;font-weight:bold;">30,000<span id="won" style="font-size:15px;font-weight:100;">원</span></span>
                                    
                                </div>
                            </div>

                            <!-- 주문하기 버튼 -->
                            <div id="order-nav_btn">
                                <button type="button">주문하기</button>
                            </div>

                        </div><!-- end of 네비게이션 창 -->
                        
                    </div>
                </form>

            </div><!-- end of pl_main -->

        </div><!-- end of pl_area_contents -->
    </div>
</section>

<!-- 푸터 -->
<footer><jsp:include page="../common/footer.jsp"></jsp:include></footer>

</body>
</html>