<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>오!마트 - 결제</title>
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
        width: 100%;
        min-width: 1280px;
    }
    #div_payment{
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        padding: 0 20px;
        margin-top: 20px;
    }
    #payment_main {
        width: 900px;
    }
    #tbl_paymentInfo{
        width: 800px;
        margin: 20px 0px;
        border-collapse: collapse;
    }
    #tbl_paymentInfo th{
        border-top: 1px solid black;
        text-align: left;
        padding: 10px 0px;
    }
    #tbl_paymentInfo tr:not(:last-child):not(:nth-last-child(2)) td {
	    padding: 5px 0px;
	    line-height: 20px;
 	    border: 1px solid blue;
/*         border-bottom: 1px solid lightgray; */
    }
    #tbl_paymentInfo td:first-child{
        width: 120px;
    }
    #tbl_paymentInfo tr td:last-child{
        width: 150px;
    }
    #tbl_paymentInfo tr:not(:last-child) td:last-child *{
        margin-left: 15px;
    }
    #tbl_paymentInfo p{
        font-size: 12px;
    }
    #tbl_paymentInfo span{
        font-size: 12px;
        text-decoration: line-through;
        color: gray;
    }
    #tbl_paymentInfo img{
        width: 100px;
        height: 100px;
    }
    #request{
        border-color: lightgray;
        border-radius: 0px;
        width: 400px;
        height: 30px;
        outline: none;
        margin-bottom: 5px;
    }
    #save_request{
        display: flex;
        align-items: center;
    }
    #tbl_paymentInfo label{
        font-size: 12px;
        margin-left: 5px;
        top: -5px;
    }
    #payment_method{
        display: flex;
        align-items: center
    }
    #payment_method input{
        margin-right: 10px;
    }
    #btn_payment_main{
        width: 100%;
        height: 50px;
        border: 0;
        background-color: #ff3e3e;
        color: #fff;
        font-size: 21px;
        cursor: pointer;
        margin-top: 20px;
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
    button:hover {
	   background-color: #222 !important;
	   color: white;
    }
    #point_container{
        display: flex;
        align-items: center;
    }
    #point_container span:first-child {
        border: 1px solid lightgray;
        border-right: none;
        border-radius: 0px;
        width: 150px;
        height: 25px; 
        text-decoration: none;   
        display: flex;
        align-items: center;    
    }
    #point_container span span{
        color: black;
        text-decoration: none;   
        margin-left: 5px;
    }
    #point_container span input{
        outline: none;
        width: 120px;
        height: 22px;
        margin-left: 5px;
        border: none;
        text-align: right;
    }
    #point_container input[type="button"]{
        width: 100px;
        height: 27px;
        font-size: 12px;
        border-radius: 0px;
        border: 1px solid lightgray;
        cursor: pointer;
        background-color: rgb(245, 245, 245);
        margin-right: 10px;
    }
    
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		let shadow = $("#shadow");
		/* 로그인 모달창 열기 메서드 */
	    function showShadow() {
	        shadow.css({
	            'display': 'block',
	            'z-index': '5000'
	        });
	        $("body").css('overflow', 'hidden');
	    }
		
	    $("#open_login_btn").on("click", showShadow);
	    
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
            let url = "../cart/change_address.do?m_idx=" + $("#session_m_idx").val();
            // 자식창을 열고 그 여부를 변수에 저장
            childWindow = window.open(url, '_blank', 'menubar=no,width=700,height=750');
            //childWindow = window.open(url, '_blank', 'menubar=no,width=715,height=830');
        }
        
        //*** 배송지 변경 자식창 열기 이벤트 처리 ***//
        $("#change_address").on("click", openChangeAddress);
        
        $("#input_point").on("input", function(){
        	let inputValue = $(this).val().replace(/\D/g, '');

            $(this).val(Number(inputValue).toLocaleString());
        	
        });
        
        $("#input_point").on("blur", function(){
            let mPoint = parseInt($("#mPoint").val());
            let inputValue = parseInt($(this).val().replace(/\D/g, ''));
            
            if(inputValue > mPoint){
            	$(this).val(Number(mPoint).toLocaleString());
            }
            
            dc_final();
            
        });
        
        $("#use_allPoint").on("click", function(){
        	let mPoint = parseInt($("#mPoint").val());
        	
        	$("#input_point").val(Number(mPoint).toLocaleString());   
        	
        	dc_final();
        	
        });
        
        function dc_final(){
        	let dc_product = parseInt($("#discount_product").val());
        	let inputPoint = parseInt($("#input_point").val().replace(/\D/g, ''));
        	let dc_final = dc_product + inputPoint;
        	let price_before = parseInt($("#price_before").val().replace(/\D/g, ''));
        	let price_final = price_before - dc_final;
        	
        	$("#dc_final").text(" -"+Number(dc_final).toLocaleString()+"원");
        	$("#dc_final_nav").text(" -"+Number(dc_final).toLocaleString()+"원");
        	$("#payment-price").text(Number(price_final).toLocaleString());
        	$("#btn_payment_main").text(Number(price_final).toLocaleString()+"원 결제하기");
        	
        }
		
	});
</script>
</head>
<body>
	<!-- 헤더 -->
	<header><jsp:include page="../common/header2.jsp"></jsp:include></header>

    <section>
        <div id="div_payment">
            <div id="payment_main">
                <h2>결제하기</h2>
	            <table id="tbl_paymentInfo">
	                <tr>
	                    <th colspan="3"><h3>받는 분 정보</h3></th>
	                </tr>
	                <tr>
	                    <td><h6>배송지 정보</h6></td>
	                    <td>
	                       <h6>관리자 010-1111-1111</h6>
	                       <p>주소 띄우는 곳</p>
	                    </td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td><h6>배송 요청사항</h6></td>
	                    <td>
	                       <select id="request">
	                           <option value="0">배송기사에게 전달되는 메시지입니다. 선택해주세요.</option>
	                           <option value="1">부재시 경비실에 맡겨주세요.</option>
	                           <option value="2">부재시 문앞에 놓아주세요.</option>
	                           <option value="3">초인종을 눌러주세요.</option>
	                           <option value="4">배송전 연락주세요.</option>
	                           <option value="5">직접입력</option>
	                       </select><br>
	                       <span id="save_request">
	                           <input type="checkbox"/>
	                           <label for="save_request">다음 배송에도 계속 사용</label>
	                       </span>
	                    </td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <th colspan="3"><h3>주문상품: ${fn:length(CartList)}개</h3></th>
	                </tr>
	                <c:set var="price_before" value="0"></c:set>
	                <c:set var="price_final" value="0"></c:set>
	                <c:set var="discount_product" value="0"></c:set>
	                <c:forEach items="${CartList}" var="c">
	                   <tr>
                        <td><img src="../resources/img/kakao_icon.png" alt="상품이미지" /></td>
                        <td>
                           <h6>${c.brand}</h6>
                           <p>${c.p_name}</p>
                        </td>
                        <td>
                            <c:set var="discount" value="${(c.price*(c.discount/100))*c.amount}"></c:set>
                            <c:set var="price_discount" value="${(c.price*c.amount)- discount}"></c:set>                            
                            <h4><fmt:formatNumber value="${price_discount}" pattern="#,###" />원</h4>
                            <span><fmt:formatNumber value="${c.price*c.amount}" pattern="#,###" />원</span>
                            <p>${c.amount}개</p>
                            <c:set var="price_before" value="${price_before+c.price*c.amount}"></c:set>
                            <c:set var="price_final" value="${price_final+price_discount}"></c:set>
                            <c:set var="discount_product" value="${discount_product+discount}"></c:set>
                        </td>
                    </tr>
	                </c:forEach>	                
	                <tr>
	                    <th colspan="3"><h3>할인혜택</h3></th>
	                </tr>
	                <tr>
	                    <td><h6>주문금액</h6></td>
	                    <td><h4><fmt:formatNumber value="${price_before}" pattern="#,###" />원</h4></td>
	                    <td><input id="price_before" type="hidden" value="${price_before}"/></td>
	                </tr>
	                <tr>
	                    <td><h6>상품할인</h6></td>
	                    <td><p>- <fmt:formatNumber value="${discount_product}" pattern="#,###" />원</p></td>
	                    <td><input id="discount_product" type="hidden" value="${discount_product}"/></td>
	                </tr>
	                <tr>
	                    <td><h6>쿠폰할인</h6></td>
	                    <td></td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td><h6>포인트사용</h6></td>
	                    <td id="point_container">	                       
	                       <span><input id="input_point" type="text"/><span>원</span></span>	                       
	                       <input id="use_allPoint" type="button" value="전체사용"/>
	                       <p>(잔여: <fmt:formatNumber value="${member.point}" pattern="#,###" />원)</p>
	                       <input id="mPoint" type="hidden" value="${member.point}"/>
	                    </td>
	                    <td></td>
	                </tr>
	                <tr>
                        <td><h6>할인금액</h6></td>
                        <td><h4 id="dc_final">- <fmt:formatNumber value="${discount_product}" pattern="#,###" />원</h4></td>
                        <td></td>
                    </tr>
	                <tr>
	                    <th colspan="3"><h3>결제방법</h3></th>
	                </tr>
	                <tr>
	                    <td id="payment_method">
	                       <input type="radio" checked disabled/><h4>일반결제</h4>
	                    </td>
	                    <td></td>
	                    <td></td>
	                </tr>
	                <tr>
                        <td colspan="3">
                           <button id="btn_payment_main"><fmt:formatNumber value="${price_before - discount_product}" pattern="#,###" />원 결제하기</button>
                        </td>
                        
                    </tr>
	            </table>
            </div>
            
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
                                        <c:when test="${a.def_add eq '1'}">
                                            <div id="order-nav_address">
                                                <div>
                                                    <span id="address_preset">배송지: ${a.a_name} (기본배송지)</span>
                                                    <span id="address_detail">[${a.postnum}] ${a.address} ${a.detail}</span>
                                                </div>
                                                <div>
                                                    <button type="button" id="change_address">배송지 변경</button>
                                                </div>
                                            </div>
                                        </c:when>
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
                    <div id="product_total">전체상품: <span>${fn:length(CartList)}</span>개</div>
                    <div id="product_detail">
                        <div id="product_ordered-price">
                            <span>주문금액</span>
                            <span id="ordered-price"><fmt:formatNumber value="${price_before}" pattern="#,###" />원</span>
                        </div>
                        <div id="product_discount-price">
                            <span>할인금액</span>
                            <span id="dc_final_nav">- <fmt:formatNumber value="${discount_product}" pattern="#,###" />원</span>
                        </div>
                        <div id="product_shipping-fee">
                            <span>배송비</span>
                            <span id="shipping-fee"></span>
                        </div>
                    </div>
                    <div id="product_payment-price">
                        <span>결제예정금액</span>
                        <span>
                            <span id="payment-price" style="font-size:22px;font-weight:bold;"><fmt:formatNumber value="${price_before - discount_product}" pattern="#,###" /></span>
                            <span id="won" style="font-size:15px;font-weight:100;">원</span>
                        </span>
                    </div>
                </div>

                <!-- 주문하기 버튼 -->
                <div id="order-nav_btn">
                    <button>결제하기</button>
                </div>

            </div><!-- end of 네비게이션 창 -->
            
        </div>
    
    
    
    </section>

    <!-- 푸터 -->
<footer><jsp:include page="../common/footer.jsp"></jsp:include></footer>
</body>
</html>