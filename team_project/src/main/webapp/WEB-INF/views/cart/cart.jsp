<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>오!마트 - 장바구니</title>

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
    #sel_box{
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
    .calprice{
        font-size: 22px;
    }
    /* 상품 개당 가격 */
    .td_odinfo_op{
    	font-size: 11px;
    	color: #888
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
    	
    	//*** 배송비 (수정시 전체 반영) ***//
    	const shipping_fee = 3000;

        /* ---------------------상품 선택 체크박스------------------- */
        //*** "전체선택" 체크박스 클릭 이벤트 처리 ***//
        $("#sel_all").click(function() {

            // "전체선택" 체크박스의 checked 속성값 가져옴 (체크여부 따라 true / false)
            let isChecked = $(this).prop("checked");

            // class가 "sel_product"인 모든 체크박스를 선택 또는 해제
            $(".sel_product").prop("checked", isChecked);
        });


        //*** 개별 상품 체크박스 클릭 이벤트 처리 ***//
        $(".sel_product").click(function() {

            // 개별 상품 체크박스가 모두 선택되었는지 확인
            let allChecked = $(".sel_product:checked").length === $(".sel_product").length;

            // "전체선택" 체크박스의 상태를 개별 상품 체크박스들과 동기화
            // 모든 개별 상품이 체크되어 있으면 "전체선택"의 checked 속성이 true
            // 하나라도 체크가 풀려 있으면 "전체선택"의 checked 속성이 false
            $("#sel_all").prop("checked", allChecked);
        });

        /* ---------------------장바구니 상품 삭제------------------- */
        //*** 장바구니 테이블에서 해당 상품 삭제 메서드 ***//
        // 매개변수로 html 테이블의 각 행의 m_idx, p_id가 담긴 배열을 사용
        function removeCart(mIdxArray, pIdArray) {
            
            $.ajax({
                type: "POST",
                url: "remove_cart2.do", // AjaxCartController
                data: {
                	m_idx: mIdxArray,
                    p_id: pIdArray
                },
                success: function (response) { // 해당 상품이 삭제된 새로운 장바구니 객체 반환
                   if (response != null) { // 삭제가 성공한 경우
                	   	sessionStorage.setItem("cartList", response); // 세션 객체 업데이트
                    } else {
                        alert("장바구니 품목 삭제에 실패하였습니다.");
                    }
                }.bind(this), // "삭제하기" 버튼이 속한 행으로 한정
                error: function () {
                    alert("오류가 발생하였습니다.");
                }
            }); // end of ajax
        } // end of removeCart()


        //*** 각 행의 "삭제하기" 버튼 클릭 이벤트 처리 ***//
        $(".td_delete button").click(function() {
            
            // 상품 삭제 여부 결정
            let confirmed = confirm("해당 상품을 삭제하시겠습니까?");

            // "확인" 을 눌렀을 경우
            if (confirmed) {

                // "삭제하기" 버튼이 속한 행의 장바구니 정보 저장
                let mIdxArray = [parseInt($(this).closest('tr').find('.m_idx').val())];
                let pIdArray = [$(this).closest('tr').find('.p_id').val()];
                
                // 장바구니 상품 삭제 메서드
                removeCart(mIdxArray, pIdArray);

                // 해당 버튼이 속한 tr 삭제
                $(this).closest("tr").remove();
                
                /*** 삭제 후 페이지 정보 갱신 ***/
                checkEmptyCart();           // 빈 장바구니 체크
                updateNav();  // 주문정보 내비게이션 갱신

            } // end of if (confirmed)

        });
        
        
        //*** "선택품목 삭제" 버튼 클릭 이벤트 처리 (.sel_product 체크된 항목 삭제) ***//
        $("#sel_delete").click(function() {

            // class가 sel_product인 체크박스 중 체크된 항목들을 선택
            let checkedProducts = $(".sel_product:checked");

            // 체크된 항목이 있는지 확인
            if(checkedProducts.length > 0){ // 체크된 항목이 있을 경우

                // 품목 삭제 여부 결정
                let confirmed = confirm("선택한 품목을 삭제하시겠습니까?");

                // "확인" 을 눌렀을 경우
                if (confirmed) {

                    // 선택된 행들의 정보 담을 배열 초기화
                    let mIdxArray = [];
                    let pIdArray = [];

                    // 선택된 체크박스들이 속한 각각의 행에 대한 함수
                    checkedProducts.each(function() {

                        // each()로 선택된 행의 정보 배열에 저장
                        let m_idx = parseInt($(this).closest("tr").find(".m_idx").val());
                        let p_id = $(this).closest("tr").find(".p_id").val();
                        mIdxArray.push(m_idx);
                        pIdArray.push(p_id);            

                        // each()로 선택된 행을 삭제
                        $(this).closest("tr").remove();

                    }); // end of .each()

                    // 장바구니 테이블에 삭제 요청
                    removeCart(mIdxArray, pIdArray);

                    /*** 삭제 후 페이지 정보 갱신 ***/
                    checkEmptyCart();           // 빈 장바구니 체크
                    updateNav();  // 주문정보 내비게이션 갱신

                } // end of if (confirmed)
            } else { // 체크된 항목이 없을 경우

                alert("삭제할 품목을 선택해주세요.");
            } // end of if (checkedProducts.length > 0)
            
        });

        /* ---------------------주문정보 내비게이션--------------------- */
        //*** 주문정보 내비게이션 상단 고정 ***//
        $(window).scroll(function() {
            let ordernav = $("#cart_main_order-nav");

            // 스크롤이 헤더 높이보다 아래로 내려올 경우 (139px)
            if ($(window).scrollTop() >= 139) {

                ordernav.css({
                    "position": "sticky", // 내비게이션 포지션 속성 변경
                    "top": "0", // 내비게이션 화면 상단 고정
                });

            } else { // 스크롤이 헤더 높이보다 위에 있을 경우
                ordernav.css("position", "static"); // 내비게이션 포지션 속성 초기화
            }

        });

        /* ---------------------버튼 색상 변경--------------------- */
        //*** 버튼에 마우스 커서가 올라갔을 때의 이벤트 처리 ***//
        $("button").mouseenter(function() {
            $(this).css({
                "background-color": "#222",
                "color": "white"
                });
        });


        //*** 버튼에서 마우스 커서가 벗어났을 때의 이벤트 처리 ***//
        $("button").mouseleave(function() {
            $(this).css({
                "background-color": "",
                "color": ""
            }); // 원래 배경색 및 폰트 색상으로 되돌리기
        });

        /* ---------------------빈 장바구니 표시--------------------- */
        //*** 테이블의 tr 요소 개수 확인 ***//
        function countVisibleRows() {
            // 숨김처리된 #tr_empty_cart 행을 제외한 나머지 행의 개수 반환
            return $('table tr:not(#tr_empty_cart)').length;
        }
        //*** tr_empty_cart를 보이도록 처리 ***//
        function showEmptyCartRow() {
            $('#tr_empty_cart').show();
        }
        //*** tr_empty_cart를 숨기도록 처리하는 함수 ***//
        function hideEmptyCartRow() {
            $('#tr_empty_cart').hide();
        }
        //*** 장바구니를 품목 개수 체크 및 .tr_empty_cart 표시여부 결정 ***//
        function checkEmptyCart() {

            // 테이블의 행의 개수 확인
            let rowCount = countVisibleRows();

            if (rowCount === 0) { // 장바구니가 비었을 경우
                showEmptyCartRow();
            } else { // 장바구니에 상품이 1개 이상일 경우
                hideEmptyCartRow();
            }
        }

        // 페이지 로드 시 장바구니 상품 개수 확인 후 초기 처리
        checkEmptyCart();

        // Mutation Observer 생성
        const observer = new MutationObserver(function(mutationsList, observer) {
            for (let mutation of mutationsList) {
                if (mutation.type === 'childList') {
                    // 테이블의 DOM 하위 트리가 변경되었을 때 처리할 내용
                    checkEmptyCart();
                }
            }
        });

        // Observer 설정
        const targetNode = document.querySelector('table'); // 감시할 DOM 요소
        const config = { childList: true }; // 감시할 변화 타입 설정
        observer.observe(targetNode, config); // Observer 시작
        
        /* ---------------------상품 수량 조절, 상품 가격 조절--------------------- */
     	//*** 페이지 로드 시 초기 계산하여 표시 ***//
        calculateTotal();
        updateNav(); 

        //*** 상품 가격 계산 ***//
        function calculatePrice(price, amount){
        	let calprice = price * amount;
        	return calprice;
        }

        //*** 각 행의 상품 가격 계산 ***//
        function calculateTotal() {

            // 각각의 상품 수량 요소 each()로 선택
            $(".plist_amount_value").each(function() {
                
                // each()로 선택된 행의 판매가격
                let price = parseInt($(this).siblings(".price").val());
                // each()로 선택된 행의 상품 수량
                let amount = parseInt($(this).val());

                // each()로 선택된 행의 상품 가격 계산
                let calPrice = calculatePrice(price, amount);

                // each()로 선택된 행의 상품 가격에 반영
                $(this).closest("tr").find(".calprice").text(calPrice.toLocaleString());
            });
        }
        
        //*** 주문정보 내비게이션 갱신 ***//
        function updateNav() {

            // 빈 장바구니 체크
            if(countVisibleRows() != 0) { // 장바구니에 상품이 있을 경우

                // "주문금액" 초기화
                let totalPrice = 0;

                // 각 행의 상품 가격 each()로 선택
                $(".calprice").each(function() {
                    // each()로 선택된 행의 상품 가격 저장
                    let calPriceValue = parseInt($(this).text().replace(/[^0-9]/g, ""));
                    // "주문금액"에 합산
                    totalPrice += calPriceValue;
                });

                // "주문금액" 에 주문금액 반영
                $("#ordered-price").text(totalPrice.toLocaleString() + " 원");
                
                // 주문금액에 따른 배송비 계산 및 결제예정금액 계산
                if(totalPrice != 0){ // 주문금액이 있을 경우 (장바구니에 상품이 있을 경우)

                    // 주문금액이 25,000원 이상일 경우 배송비 0원
                    // 주문금액이 25,000원 미만일 경우 배송비 = 최상단 전역 변수 (배송비)
                    const shippingFee = (totalPrice >= 25000) ? 0 : shipping_fee;
                    // "결제예정금액" 에 배송비 반영된 주문금액 저장
                    const paymentPrice = totalPrice + shippingFee;

                    // "배송비" 에 계산된 배송비 반영
                    $("#shipping-fee").text('+' +shippingFee.toLocaleString() +' 원');
                    // "결제예정금액" 에 계산된 결제예정금액 반영
                    $("#payment-price").text(paymentPrice.toLocaleString());

                }

                // "전체상품" 수량 초기화
                let totalAmount = 0;

                // 각 행의 수량 each()로 선택
                $(".plist_amount_value").each(function() {
                
                    // .plist_amount_value의 모든 요소들을 선택하여 각 값들을 합산
                    let amountValue = parseInt($(this).val());
                    // "전체상품" 수량에 합산
                    totalAmount += amountValue;
                });
                
                // "전체상품" 수량에 반영
                $("#product_total span").text(totalAmount);

            } else { // 장바구니에 상품이 있을 경우
                $("#shipping-fee").text("+0 원");
                $("#ordered-price").text("0 원");
                $("#payment-price").text("0");
                $("#product_total span").text("0");
            }
        }

        
        //*** '+' 버튼 클릭 이벤트 처리 ***//
        $(".plist_plus-btn").click(function() {

            // 현재 버튼이 속한 행의 상품 수량 선택
            let currentAmount = $(this).siblings(".plist_amount_value");
            // 선택된 상품 수량을 int형으로 변환하여 저장
            let currentAmountValue = parseInt(currentAmount.val());

            // 현재 버튼이 속한 행의 정보 저장
            let m_idx = parseInt($(this).siblings(".m_idx").val());
        	let p_id = $(this).siblings(".p_id").val();
        	let price = parseInt($(this).siblings(".price").val()); // 판매가격
        	
            // 장바구니 테이블의 상품 수량 갱신
        	if (currentAmountValue < 20) { // 상품 수량이 20개 미만일 때
                // 장바구니 테이블 amount 갱신
                currentAmount.val(Math.min(currentAmountValue + 1, 20));
                updateAmount(m_idx, p_id, currentAmountValue + 1);
                let calPrice = calculatePrice(price, currentAmountValue + 1);
	        	let calPriceElement = $(this).closest('tr').find('.calprice');
	            calPriceElement.text(calPrice.toLocaleString());
            } else { 
                // 값이 20이상이면 경고창을 띄웁니다.
                alert("최대 주문 수량은 20개 입니다.");
            }

            // 페이지 값 갱신
        	calculateTotal();
        	updateNav();
        	
        });


        //*** '-' 버튼 클릭 이벤트 처리 ***//
        $(".plist_minus-btn").click(function() {

            // 현재 버튼이 속한 행의 상품 수량 선택
            let currentAmount = $(this).siblings(".plist_amount_value");
            // 선택된 상품 수량을 int형으로 변환하여 저장
            let currentAmountValue = parseInt(currentAmount.val());

            // 현재 버튼이 속한 행의 각 값 저장
            let m_idx = parseInt($(this).siblings(".m_idx").val());
        	let p_id = $(this).siblings(".p_id").val();
        	let price = parseInt($(this).siblings(".price").val()); // 판매가격
            
        	 // 장바구니 테이블의 상품 수량 갱신
             if (currentAmountValue > 1) { // 상품 수량이 20개 미만일 때
                // 장바구니 테이블 amount 갱신
                currentAmount.val(Math.max(currentAmountValue - 1, 1));
                updateAmount(m_idx, p_id, currentAmountValue - 1);
                let calPrice = calculatePrice(price, currentAmountValue - 1);
	        	let calPriceElement = $(this).closest('tr').find('.calprice');
	            calPriceElement.text(calPrice.toLocaleString());
            }

            // 페이지 값 갱신
            calculateTotal();
            updateNav();
            
        });
        
        
        //*** 테이블 상품 수량 업데이트 ***//
        function updateAmount(m_idx, p_id, newAmount) {

            $.ajax({
                type: "POST",
                url: "update_cart_amount.do", // AjaxCartController
                data: {
                	m_idx: m_idx,
                    p_id: p_id,
                    amount: newAmount
                },
                success: function (response) { // 해당 상품 수량이 업데이트된 새로운 장바구니 객체 반환
                   if (response != null) { // 수량 업데이트가 성공한 경우
                	   	sessionStorage.setItem("cartList", response); // 세션 객체 업데이트
                    } else {
                        alert("수량 업데이트에 실패하였습니다.");
                    }
                }.bind(this), // 증감 버튼이 속한 행으로 한정
                error: function () {
                    alert("오류가 발생하였습니다.");
                }
            }); // end of ajax
        } // end of updateAmount()
        
        
		//*** 각 행의 기존 상품 수량 저장 ***//        
        $(".plist_amount_value").each(function() {
            $(this).data("prev-value", $(this).val());
        });
        
        
        
     	//*** 각 행의 상품 수량 입력 상자의 값이 변경되었을 때 이벤트 처리 ***//
        $(".plist_amount_value").on("change", function() {
        	
        	// 새로 입력된 값
            let inputValue = parseInt($(this).val());
        	// 기존에 입력된 값
            let prevValue = parseInt($(this).data("prev-value"));

            if (isNaN(inputValue)) {
                // 숫자가 아닌 값을 입력한 경우 이전 값으로 복구
                $(this).val(prevValue);
            } else if (inputValue < 1) {
                // 최소 주문 수량 1개로 제한
                alert("최소 주문 수량은 1개 입니다.");
                $(this).val(1); // 최소값으로 설정
            } else if (inputValue > 20) {
                // 최대 주문 수량 20개로 제한
                alert("최대 주문 수량은 20개 입니다.");
                $(this).val(20); // 최대값으로 설정
            }

            // 기존 값을 새로 입력된 값으로 다시 저장
            $(this).data("prev-value", $(this).val());

            // 변경된 값을 기반으로 업데이트 실행
            let m_idx = $(this).siblings(".m_idx").val();
            let p_id = $(this).siblings(".p_id").val();
            let newAmount = parseInt($(this).val());

            updateAmount(m_idx, p_id, newAmount);
            
            // 총계 및 가격 계산 함수 호출
            calculateTotal();
            updateNav();
            
        });
     	
        /* ---------------------비회원 주문정보 내비게이션--------------------- */
        let shadow = $("#shadow");
        
        function showShadow() {
            shadow.css({
                'display': 'block',
                'z-index': '5000'
            });
            $("body").css('overflow', 'hidden');
        }
     	
        $("#open_login_btn").on("click", showShadow);
        
        /* ---------------------배송지 변경--------------------- */
        // 기존에 열려있는 자식 창에 대한 변수 초기화
        let childWindow = null;
        
        //*** 배송지 변경 자식창 열기 ***//
        function openChangeAddress() {
        	
        	// 기존에 자식창이 열려있는지에 대한 여부
        	if (childWindow) { // 이미 자식창이 열려있으면
                childWindow.close(); // 자식창을 닫음
            }
        	
        	// 자식창에 로그인한 회원이 m_idx 파라미터 값 넘겨줌
        	let url = "change_address.do?m_idx=" + $("#session_m_idx").val();
        	// 자식창을 열고 그 여부를 변수에 저장
        	childWindow = window.open(url, '배송지 설정', 'menubar=no,width=700,height=750');
        	//childWindow = window.open(url, '_blank', 'menubar=no,width=715,height=830');
        }
        
        //*** 배송지 변경 자식창 열기 이벤트 처리 ***//
        $("#change_address").on("click", openChangeAddress);
        
        //let current_add = opener.sessionStorage.getItem("current_add");
        //sessionStorage.setItem("current_add", current_add);
        
        
        

    }); // end of jqeury
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
                                        <td colspan="4">장바구니에 담긴 상품이 없습니다!</td>
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
		                                            <div class="td_odinfo_price">
		                                            	<span class="calprice"></span>
		                                            	<span style="font-size:11px;padding-left:1px;">원</span>
		                                            </div>
		                                            <div class="td_odinfo_op">
		                                            	개당 가격:
		                                            	&nbsp;<fmt:formatNumber value="${c.price}" pattern="#,###"/>
		                                            	원
		                                            </div>
		                                            <div class="td_odinfo_amount">
		                                                <button type="button" class="plist_minus-btn">-</button>
		                                                <input type="text" class="plist_amount_value" value="${c.amount}">
		                                                <button type="button" class="plist_plus-btn">+</button>
		                                                <input type="hidden" class="m_idx" value="${c.m_idx}">
		                                                <input type="hidden" class="p_id" value="${c.p_id}">
		                                                <input type="hidden" class="price" value="${c.price}">
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
							<c:if test="${!empty member}">
								<input type="hidden" id="session_m_idx" value="${member.m_idx}">
							</c:if>
                            <!-- 배송지 -->
                          	<c:choose>

                          		<c:when test="${!empty member}"><!-- 로그인한 경우 -->
                          		
	                            	<c:choose>
	                            		
		                            	<c:when test="${!empty AddressList}"><!-- 등록된 배송지가 있을 경우 -->
											<c:forEach items="${AddressList}" var="a">
											
												<c:choose>
													<c:when test="${!empty current_add}">
													
														<c:if test="${current_add eq a.a_name}">
															<div id="order-nav_address">
								                                <div>
								                                    <span id="address_preset">배송지: ${a.a_name}</span>
								                                	<span id="address_detail">[${a.postnum}] ${a.address} ${a.detail}</span>
								                                </div>
								                                <div>
								                                	<button type="button" id="change_address">배송지 변경</button>
								                                </div>
								                            </div>
														</c:if>
													
													</c:when>
													<c:otherwise>
														<c:if test="${a.def_add eq '1'}">
								                            <div id="order-nav_address">
								                                <div>
								                                    <span id="address_preset">배송지: ${a.a_name} (기본배송지)</span>
								                                	<span id="address_detail">[${a.postnum}] ${a.address} ${a.detail}</span>
								                                </div>
								                                <div>
								                                	<button type="button" id="change_address">배송지 변경</button>
								                                </div>
								                            </div>
							                            </c:if>
						                            </c:otherwise>
					                            </c:choose>
					                            
			                            	</c:forEach>
		                            	</c:when>
		                            	
		                            	<c:otherwise><!-- 등록된 배송지가 없을 경우 -->
		                            		<div id="order-nav_address">
				                                <div>
				                                    <span id="address_preset">등록된 배송지가 없습니다!</span>
				                                	<span id="address_detail">아래 배송지 설정 버튼을 눌러 배송지를 등록하거나 결제 정보 입력란에서 입력하실 수 있습니다.</span>
				                                </div>
				                                <div>
				                                	<button type="button" id="change_address">배송지 등록</button>
				                                </div>
				                            </div>
		                            	</c:otherwise>
		                            	
	                            	</c:choose>
	                            	
	                            </c:when>
	                            
                            	<c:otherwise><!-- 로그인하지 않은 경우 (비회원인 경우) -->
                            		<div id="order-nav_address">
		                                <div>
		                                    <span id="address_preset">로그인을 해보세요</span>
		                                	<span id="address_detail">로그인을 하시면 지금 보고있는 상품을 나중에도 확인하실 수 있습니다.</span>
		                                </div>
		                                <div>
		                                	<button type="button" id="open_login_btn">로그인</button>
		                                </div>
		                            </div>
                            	</c:otherwise>
							</c:choose>
	                            
                            

                            <!-- 주문 정보 -->
                            <div id="order-nav_product">
                                <div id="product_total">전체상품: <span></span>개</div>
                                <div id="product_detail">
                                    <div id="product_ordered-price">
                                        <span>주문금액</span>
                                        <span id="ordered-price"></span>
                                    </div>
                                    <div id="product_discount-price">
                                        <span>상품할인</span>
                                        <span>-0 원</span>
                                    </div>
                                    <div id="product_shipping-fee">
                                        <span>배송비</span>
                                        <span id="shipping-fee"></span>
                                    </div>
                                </div>
                                <div id="product_payment-price">
                                    <span>결제예정금액</span>
                                    <span>
                                    	<span id="payment-price" style="font-size:22px;font-weight:bold;"></span>
                                    	<span id="won" style="font-size:15px;font-weight:100;">원</span>
                                    </span>
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