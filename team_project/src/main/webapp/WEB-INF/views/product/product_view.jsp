<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품페이지</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');       
    *{margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}
    a{text-decoration: none; color: #222;}    
/*     #div_view, #div_view div{border: 1px solid red}; */
    <!-- vs code -->
    body{
    overflow: scroll;
    }    
	#div_view {
	    position: relative;
	    width: 1200px;
	    left: 50%;
	    margin-left: -600px;
	    padding-top: 30px;
	}
	#div_preview{
	    float: left;
	    /* border: 1px solid green; */
	    width: 600px;
	    height: 550px;
	}
	#div_buy_main{
	    float: left;
	    /* border: 1px solid green; */
	    width: 596px;
	    height: 550px;
	}
	#div_buy_main span{
	    float: left;
	    font-size: 30px;
        color: rgb(255, 59, 32);
        font-weight: bold;
        margin: 0 10px;
	}
	#div_productInfo {
	    position: relative;
	    display: inline-block;
        vertical-align: top;
	    /* border: 1px solid blue; */
	    width: 800px;
	    /* height: 2000px; */

	}        
	#div_productBar {
	    position: relative;
	    border-bottom: 1px solid black;
	    width: 798px;
	    height: 55px;
	    background-color: white;
	}
	
	#div_buy_quick{
	    /* border: 1px solid orangered; */
	    display: inline-block;
        vertical-align: top;
	    width: 394px;
	    height: 500px;
	}
	#div_productInfo p {
	    line-height: 1500px;
	    text-align: center;
	}
	#div_preview img{
	    border: 1px solid gray;
	    width: 500px;
	    height: 500px;
	    margin: 20px 40px;
	}
	#div_buy_main p, #div_buy_main h1, #div_buy_main h3, #div_buy_main h4 {
	    margin: 10px 10px;
	}
	#div_buy_main h4 {
	   color: gray;
	   text-decoration: line-through;
	}
	#div_buy_main input{
	    margin: 0;
	}	
	#select_product {
	    width: 500px;
	    height: 70px;
	    border-radius: 5px;
	    margin: 30px 10px;
	    border-color: rgb(200, 200, 200);
	    font-size: 17px;
	    padding-left: 10px;
	    line-height: 50px;
	}
	.option_product {
	    width: 500px;
	    height: 55px;
	}
	.option_product img {
	    border: 1px solid gray;
	    width: 50px;
	    height: 50px;
	}
	.btn1 {
	    float: left;
	    width: 70px;
	    height: 70px;
	    margin-top: 20px;    
	    line-height: 70px;   
	    text-align: center;
	    cursor: pointer;
	    font-size: 20px;
	    font-weight: bold;
	}
	.btn2 {
	    float: left;
	    width: 55px;
	    height: 50px;
	    line-height: 50px;
	    text-align: center;
	    cursor: pointer;
	    font-size: 20px;
	    font-weight: bold;
	}
	#div_buy_main #div_wish_btn, #div_wish_btn2 {
	    margin-left: 10px;
	    font-size: 35px;
	    border: 1px solid rgb(200, 200, 200);
	    color: rgb(64, 64, 64);
	}
	#div_buy_quick #div_wish_btn, #div_wish_btn2 {
	    margin-left: 30px;
	    font-size: 30px;
	    border: 1px solid rgb(200, 200, 200);
	    color: rgb(64, 64, 64);
	}
	#div_buy_main #div_cart_btn, #div_buy_main #div_buy_btn {
	    width: 211px;
	}
	#div_buy_quick #div_cart_btn {
	    width: 270px;
	}
	#div_buy_quick #div_buy_btn {
	    margin-top: 5px;
	    margin-left: 30px;
	    width: 327px;
	}
	#div_cart_btn {
	    background-color: rgb(64, 64, 64);
	    color: white;
	    border: 1px solid rgb(64, 64, 64);
	}
	#div_buy_btn {
	    background-color: rgb(230, 75, 60);
	    color: white;
	    border: 1px solid rgb(230, 75, 60);
	}
	#div_scrollProduct_btn, #div_scrollReview_btn{
	    float: left;
	    width: 395px;
	    line-height: 55px;
	    cursor: pointer;
	    user-select: none;
	    text-align: center;
	}
	#div_productContent {
	    /* border: 1px solid green; */
	    width: 798px;
	    height: 2000px;
	}
	#div_price_area {
	    /* border: 1px solid rgb(247, 247, 247); */
	    background-color: rgb(247, 247, 247);
	    width: 327px;
	    height: 300px;
	    margin-left: 30px;
	    padding-top: 10px;
	}
	#div_price_area h4 {
	    margin-left: 20px;
	}        
	#div_totalPrice {
	    /* border: 1px solid gray; */
	    width: 327px;
	    height: 70px;
	    margin-left: 30px;
	    text-align: right;
	}
	#div_totalPrice h1 {
	    float: right;
	    line-height: 70px;
	    margin-left: 50px;
	}
	#div_totalPrice h2 {
	    float: right;
	    margin-top: 20px;
	}
	.other {
	    float: left;
	    /* border: 1px solid gray; */
	    width: 800px;
	    margin-top: 100px;
	}
	.other div:first-child {
	    border-bottom: 1px solid gray;
	    height: 50px;
	}
	.other div h3 {
	    margin: 10px 10px;
	    float: left;
	}
	.other select {
	    float: right;
	    width: 150px;
	    height: 40px;
	    border-radius: 5px;
	    margin: 5px 5px;
	    padding-left: 5px;
	    font-weight: bold;
	    border-color: rgb(190, 190, 190);
	    outline: none;
	}
	.other option {
	    font-weight: bold;
	}
	.other table {
	    float: left;
	    /* border: 1px solid black; */
	    width: 800px;
	    border-collapse: collapse;
	    margin-top: 5px;
	}
	.other tr {
	    border-bottom: 1px solid rgb(190, 190, 190);
	}
	.other tr td:first-child {
	    width: 200px;
	    padding-right: 20px;
	}
	.other td {
	    padding: 15px 0px;
	    padding-right: 15px;
	}
	.other p {
	    font-size: 13px;
	}
	#div_reviewContents {
	    float: left;
	    width: 800px;
	}
	#div_reviewContents {
	    padding-top: 10px;
	    width: 800px;
	    border-bottom: 1px solid rgb(190, 190, 190);
	}
	#div_reviewContents * {
	    float: left;
	    margin-left: 7px;
	    margin-bottom: 7px;
	    line-height: 20px;
	}
	#div_reviewContents h6 {
	    line-height: 22px;
	}
	#div_reviewContents p {
	    line-height: 21px;
	    font-size: 11px;
	    color: gray;
	}
	#div_reviewContents textarea {
	    width: 750px;
	    height: auto;
	    resize: none;
	    color: black;
	    background-color: white;
	    border: none;
	}
	.div_reviewContent {
	    width: 780px;
	    display: flex;
	    align-items: center;
	    height: 50px;
	}
	#div_pageNav {
	    /* border: 1px solid green; */
	    width: 780px;
	    height: 40px;
	    line-height: 40px;
	    text-align: center;
	}
	.div_price {
	    /* border: 1px solid gray; */
	    width: 287px;
	    height: 40px;
	    line-height: 40px;
	    margin: 10px 20px;
	}
	.div_price  h3 {
	    float: right;
	}
	fieldset {
	    width: 106px;
	    height: 27px;
	    border: none;
	    float: left;
	    margin-top: 7px;
	}        
	fieldset * {
	    float: left;
	    border: 1px solid rgb(190, 190, 190);
	    color: gray;
	    height: 27px;
	    text-align: center;
	}
	fieldset input[type="text"] {
	    width: 50px;
	    height: 25px;
	    border-left: none;
	    border-right: none;
	}
	.btn_plus:nth-child(1), .btn_minus:nth-child(1) {
	    width: 27px;
	    font-size: 30px;
	    line-height: 15px;
	    background-color: white;     
	    cursor: pointer;       
	}
	.btn_plus:nth-child(3), .btn_minus:nth-child(3) {
	    width: 27px;
	    font-size: 20px;
	    line-height: 15px;
	    background-color: white;
	    margin-left: -1px;       
	    cursor: pointer;  
	}
	#div_verticaLine{
	   float: left;
	   width: 5px;
	   line-height: 55px;
	   user-select: none;
	   text-align: center;
	}
	#div_main_price_area{
/* 	   border: 1px solid red; */
	   margin-left: 10px;	
	   font-size: 14px;
	   width: 500px;	
	   display: flex;
	   align-items: center;
	   margin-top: -10px;
	   margin-bottom: -20px;
	}	
	#div_main_price_area fieldset {
	   margin-left: 20px;
	   padding-bottom: 5px;
	}
	#div_main_price_area div{
	   position: absolute;
	   right: 100px;
	}
	.div_reviewContent *{
	   white-space: nowrap;
	}
	#div_stars{
	   display: flex;
	}
	.stars_img{
	   width: 97px;
	}
	#stars{
	   position: absolute;
	   font-weight: normal;
	   color: gray;
	}
    
</style>
<script>
    window.onload = function(){
    	
    	let starsAvg = parseFloat($(".stars_avg").text()) * 20;
        let starsImg = $(".stars_img");
        
        if(starsAvg == 0){
        	$(".stars_avg").text("리뷰없음");
        	$(".stars_avg").css("color", "lightgray");
        }
        
        let starsWidth = starsImg.width();
        let visibleWidth = 100 - (starsWidth * starsAvg) / 100;

        starsImg.css("clip-path", "inset(0 " + visibleWidth + "px 0 0)");
    	
        let productBar = document.getElementById("div_productBar");
        let buy_quick = document.getElementById("div_buy_quick");
        let detail = document.getElementById("div_productDetail");

        window.addEventListener("scroll", function(){
            if(window.scrollY >= 705){
                productBar.style.position = "fixed";
                productBar.style.top = "0";
                buy_quick.style.position = "fixed";
                buy_quick.style.top = "0";
                //detail.style.marginTop = "55px";
            }else{
                productBar.style.position = "static";
                buy_quick.style.position = "static";
                //detail.style.marginTop = "0px";
            }
        });

        let scrollProduct = document.getElementById("div_scrollProduct_btn");
        let scrollReview = document.getElementById("div_scrollReview_btn");
        let reviewContents = document.getElementById("div_reviewContents");

        scrollReview.addEventListener("click", function(){
            let scrollToY = reviewContents.offsetTop + 20;
            window.scrollTo({top: scrollToY, behavior: "smooth"});
        });

        scrollProduct.addEventListener("click", function(){
            window.scrollTo({ top: 705, behavior: 'smooth' });
        });
        
        let minusBtn = $(".btn_minus");
        let plusBtn = $(".btn_plus");
        let amount = $(".input_amount");
        let dcPrice = parseInt($("#div_dcPrice h1").text().replace(/\D/g, ''));
        let dCalPrice = $("#div_calPrice");
        let hCalPrice = $("#h3_calPrice");
        let totalPrice = $("#h1_totalPrice");
        
        minusBtn.on("click",function(){
       		if(amount.val()>1){
       			amount.val(amount.val()-1);
       			dCalPrice.text((dcPrice*amount.val()).toLocaleString()+"원");
       			hCalPrice.text(dCalPrice.text());
       			totalPrice.text(hCalPrice.text());
            }
            
        });
        
        plusBtn.on("click",function(){
       		if(amount.val()<20){
                amount.val(parseInt(amount.val())+1);
                dCalPrice.text((dcPrice*amount.val()).toLocaleString()+"원");
                hCalPrice.text(dCalPrice.text());
                totalPrice.text(hCalPrice.text());
            }else{
                alert("상품 최대 구매갯수는 20개입니다.");
            }            
        });
        
        amount.each(function(){
        	let p = $(this);
        	
        	p.on("blur", function(){
        		if(p.val()>20){
        			amount.val(20);
                    alert("상품 최대 구매갯수는 20개입니다.");
        		}else if(p.val()<1 || p.val() == ""){
                    amount.val(1);
        		}else{
                    amount.val(p.val());
                }
        		
        	});
        	
        });
        
        let buyThisBtn = $(".btn_buyThis");
        
        buyThisBtn.on("click", function(){        	
        	
        	let frm_buyThis = $("#frm_buyThis");
        	
        	var requestor = $("<input>").attr("type", "hidden").attr("name", "requestor").val("buyThis");
        	
        	frm_buyThis.append(requestor);
        	
        	frm_buyThis.attr("action", "../payment/buyThis.do");
        	
        	frm_buyThis.submit();
        	        	
        });
        
        // 찜 버튼 클릭 이벤트 처리
        $("#div_wish_btn").click(function() {
        	
        	// 로그인 상태 판멸
        	if ($("#m_idx").val() !== "") { // 로그인한 경우
        		checkWish();	
        	} else { // 비로그인 상태인 경우
        		alert("로그인 후 사용 가능한 기능입니다.");
        	}
        	
        });
        
       	$("#div_wish_btn2").click(function(){
       		$("#div_wish_btn").click()
       	});
        
        // 찜 여부 체크
        function checkWish() {
        	
        	let flag = $("#div_wish_btn input").val();
        	console.log(flag);
        	// 찜 여부 체크
        	if (flag === "Y") { // 이미 찜한 상품인 경우
        		removeWish();
        	} else { // 찜하지 않은 상품인 경우
        		addWish();
        	}
        	
        }
        
        // 찜목록 추가
        function addWish() {
        	
        	let m_idx = parseInt($("#m_idx").val());
        	let p_id = $("#p_id").val();
        	
        	$.ajax({
                type: "POST",
                url: "add_wishList.do",
                data: {
                	m_idx: m_idx,
                    p_id: p_id
                },
                success: function (response) { // 해당 상품 수량이 업데이트된 새로운 장바구니 객체 반환
                   if (response === "success") { // 수량 업데이트가 성공한 경우
                	   	alert("찜목록에 추가되었습니다!");
                   		//페이지 새로고침
                	   	location.reload();
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
        
        
        //찜목록 삭제
        function removeWish() {
        	
        	let m_idx = parseInt($("#m_idx").val());
        	let p_id = $("#p_id").val();
        	
        	$.ajax({
                type: "POST",
                url: "remove_wishList.do",
                data: {
                	m_idx: m_idx,
                    p_id: p_id,
                },
                success: function (response) { // 해당 상품 수량이 업데이트된 새로운 장바구니 객체 반환
                   if (response != null) { // 수량 업데이트가 성공한 경우
                	   	alert("찜목록에서 삭제되었습니다!");
                	  	//찜 버튼 새로고침
                	   	location.reload();
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
</script>
</head>
<body>
<header>
<jsp:include page="../common/header2.jsp"></jsp:include>
</header>
<div id="div_view">
    <div id="div_preview">
        <img src="" alt="">
    </div>
    <div id="div_buy_main">        
        <p>${product.brand}</p>
        <h1>${product.p_name}</h1>
        <div id="div_stars">
            <h3 id="stars">☆☆☆☆☆</h3><h3 class="stars_img">★★★★★</h3><h3 class="stars_avg"> ${product.stars_avg}</h3>
        </div>        
        <h3>원산지 : 상세설명참조</h3>
        <div id="div_dcPrice">
	        <c:choose>
	            <c:when test="${product.discount eq 0}">
	                <h1><fmt:formatNumber value="${product.price}" pattern="#,###" />원</h1>
	            </c:when>
	            <c:otherwise>
	                <c:set var="discount_price" value="${product.price * ((100 - product.discount)/100)}"></c:set>
	                <h4><fmt:formatNumber value="${product.price}" pattern="#,###" />원</h4>
	                <span>${product.discount}%</span><h1><fmt:formatNumber value="${discount_price}" pattern="#,###" />원</h1>
	            </c:otherwise>
	        </c:choose>
        </div>
        <select name="" id="select_product">
            <option class="option_product" value="1">
                ${product.brand}&nbsp;${product.p_name}&nbsp;${product.standard}${product.unit}
            </option>
        </select>
        <br>
        <form id="frm_buyThis">
            <div id="div_main_price_area">
	            <input type="hidden" id="p_id" name="p_id" value="${product.p_id}"/>
	            <input type="hidden" id="m_idx" name="m_idx" value="${member.m_idx}">
	            ${product.brand}&nbsp;${product.p_name}&nbsp;${product.standard}${product.unit}
	            <fieldset>
	                <input type="button" class="btn_minus" value="-">
	                <input type="text" class="input_amount" value="1" id="amount" name="amount">
	                <input type="button" class="btn_plus" value="+">
	            </fieldset>
	            <div id="div_calPrice">
	               <c:choose>
	                   <c:when test="${product.discount eq 0}">
	                       <fmt:formatNumber value="${product.price}" pattern="#,###" />원
	                   </c:when>
	                   <c:otherwise>
	                       <fmt:formatNumber value="${discount_price}" pattern="#,###" />원
	                   </c:otherwise>
	               </c:choose>	               
	            </div>
	        </div>
        </form>        
        <br>
        <c:choose>
            <c:when test="${empty member}">
                <div class="need_login btn1" id="div_wish_btn">♡</div>
                <div class="need_login btn1" id="div_cart_btn">장바구니</div>
                <div class="need_login btn1" id="div_buy_btn">구매하기</div>
            </c:when>
            <c:otherwise>
                <div class="btn_addWish btn1" id="div_wish_btn">
	                <c:choose>
	                    <c:when test="${not empty wishList and wishList.contains(product.p_id)}">
	                       <span style="color: red; padding-left: 10px;">♥</span>
	                       <input type="hidden" value="Y">
	                    </c:when>
	                    <c:otherwise>♡<input type="hidden" value="N"></c:otherwise>
	                </c:choose>
                </div>
                <div class="btn_addCart2 btn1" id="div_cart_btn">장바구니</div>
                <div class="btn_buyThis btn1" id="div_buy_btn">구매하기</div>
            </c:otherwise>
        </c:choose> 
    </div>
    <div id="div_productInfo">
        <div id="div_productBar">
            <div id="div_scrollProduct_btn">상품정보</div>
            <div id="div_verticaLine">|</div>
            <div id="div_scrollReview_btn">리뷰</div>
        </div>
        <div id="div_productContent">
            <p>테스트</p>
        </div>            
    </div>
    <div id="div_buy_quick">
        <div id="div_price_area">
            <h4>${product.brand}&nbsp;${product.p_name}&nbsp;${product.standard}${product.unit}</h4>
            <div class="div_price">
                <fieldset>
                    <input type="button" class="btn_minus" value="-">
                    <input type="text" class="input_amount" value="1">
                    <input type="button" class="btn_plus" value="+">
                </fieldset>                
                <h3 id="h3_calPrice">
                    <c:choose>
                       <c:when test="${product.discount eq 0}">
                           <fmt:formatNumber value="${product.price}" pattern="#,###" />원
                       </c:when>
                       <c:otherwise>
                           <fmt:formatNumber value="${discount_price}" pattern="#,###" />원
                       </c:otherwise>
                   </c:choose>                 
                </h3>
            </div>
        </div>
        <div id="div_totalPrice">
            <h1 id="h1_totalPrice">
                <c:choose>
                    <c:when test="${product.discount eq 0}">
                        <fmt:formatNumber value="${product.price}" pattern="#,###" />원
                    </c:when>
                    <c:otherwise>
                        <fmt:formatNumber value="${discount_price}" pattern="#,###" />원
                    </c:otherwise>
                </c:choose>       
            </h1>
            <h2>합계</h2>
        </div>
        <c:choose>
            <c:when test="${empty member}">
                <div class="need_login btn2" id="div_wish_btn2">♡</div>
		        <div class="need_login btn2" id="div_cart_btn">장바구니</div>
		        <div class="need_login btn2" id="div_buy_btn">구매하기</div>
            </c:when>
            <c:otherwise>
                <div class="btn_addWish btn2" id="div_wish_btn2">
                    <c:choose>
                        <c:when test="${!empty wishList and wishList.contains(product.p_id)}">
                           <span style="color: red;">♥</span>
                        </c:when>
                        <c:otherwise>♡</c:otherwise>
                    </c:choose>
                </div>
		        <div class="btn_addCart2 btn2" id="div_cart_btn">장바구니</div>
		        <div class="btn_buyThis btn2" id="div_buy_btn">구매하기</div>
            </c:otherwise>
        </c:choose>        
    </div>
    <div id="div_requiredInfo" class="other">
        <div>
            <h3>상품필수정보</h3>
            <table>
                <tr>
                    <td><h5>품명 및 모델명</h5></td>
                    <td><p>상세설명참조</p></td>
                </tr>
                <tr>
                    <td>
                        <h5>제품의 유형</h5>
                    </td>
                    <td>
                        <p>${product.sub_category}</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>생산자 및 소재지</h5>
                    </td>
                    <td>
                        <p>KELLOGG ASIA PRODUCTS SDN.BHD (제조국 : 말레이시아)</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>수입자</h5>
                    </td>
                    <td>
                        <p>(주)오마트 / 천안시 동남구 대흥로 215</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>제조연월일/유통기한, 소비기한 또는 품질유지기한</h5>
                    </td>
                    <td>
                        <p>점포 배송 상품으로 각 점포별 제조일과 입고일이 상이하여, 유통기한이 다릅니다. 오마트 점포상품과 동일한 품질을 유지한 상품이 배송됩니다. ※ 해당 정보에 대한 문의는 고객센터(1577-3419)로 문의해주세요.</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>포장 단위별 내용물의 용량 (중량), 수량, 크기</h5>
                    </td>
                    <td>
                        <p>${product.standard}${product.unit}</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>주원료/함량(원료 원산지)</h5>
                    </td>
                    <td>
                        <p>[상세설명참조]</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>영양성분</h5>
                    </td>
                    <td>
                        <p>[상세설명참조]</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>유전자 변형식품 여부</h5>
                    </td>
                    <td>
                        <p>해당사항 없음</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>소비자 안전을 위한 주의 사항</h5>
                    </td>
                    <td>
                        <p>상세설명 참조</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>소비자 상담 관련 전화번호</h5>
                    </td>
                    <td>
                        <p>000-000-0000</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>수입식품안전관리특별법에 따른 수입신고 필함 여부</h5>
                    </td>
                    <td>
                        <p>수입식품안전관리특별법 에 따른 수입신고를 필함</p>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="div_review" class="other">
        <div>
            <c:set var="reviewNum" value="${ReviewList.size()}"></c:set>
            <h3>리뷰(${reviewNum}건)</h3>
            <select name="" id="">
                <option value="">최신순</option>
                <option value="">평점높은순</option>
                <option value="">평점낮은순</option>
            </select>                
        </div>
        <div id="div_reviewContents">
            <c:forEach items="${ReviewList}" var="review">
	            <div class="div_reviewContent">
	                <h5>★ ${review.stars}</h5>
	                <c:choose>
	                   <c:when test="${review.grade eq 0}"><h6>브론즈</h6></c:when>
	                   <c:when test="${review.grade eq 1}"><h6>실버</h6></c:when>
	                   <c:when test="${review.grade eq 2}"><h6>골드</h6></c:when>
                       <c:otherwise><h6>관리자</h6></c:otherwise>
	                </c:choose>
	                <p>${review.m_name.substring(0, 2)}**</p>
	                <p><fmt:formatDate value="${review.post_date}" pattern="yyyy-MM-dd" /></p>
	                <textarea name="" id="" cols="30" rows="1" disabled>${review.content}</textarea>
	            </div>  
            </c:forEach>            
<!--             <div id="div_pageNav">여기에 페이지 네비게이션</div> -->
        </div>
    </div>
    <div id="div_refundInfo" class="other">
        <div>
            <h3>교환및반품안내</h3>
        </div>
        <table>
            <tr>
                <td><h5>교환/반품 신청기간</h5></td>
                <td><p>단순변심 및 사이즈/색상 불만에 관련된 교환/반품 신청은 배송완료 후 7일 이내에 가능합니다.
                    상품이 표기/광고내용과 다르거나 계약내용과 다른 경우 상품을 받으신 날부터 3개월 이내,
                    또는 사실을 알게된 날(알 수 있었던 날)부터 30일 이내에 신청 가능합니다.</p></td>
            </tr>
            <tr>
                <td>
                    <h5>교환/반품 회수(배송)비용</h5>
                </td>
                <td>
                    <p>상품의 불량/하자 또는 표시광고 및 계약 내용과 다른 경우 해당 상품의 회수(배송)비용은 무료이나, 고객님의 단순변심 및 사이즈/색상 불만에 관련된 교환/반품의 경우 택배비는 고객님 부담입니다.
                        ※ 구매 시 선택한 옵션과 수량 또는 프로모션 적용 여부에 따라 반품/교환 배송비가 변경될 수 있습니다. 자세한 반품/교환 배송비는 MY SSG에서 반품/교환 시 확인 가능합니다.
                        반품 배송비: 3,000원 (최초 배송비가 무료인 경우, 6,000원 부과)
                        교환 배송비: 6,000원
                        제주/도서산간 지역은 추가 운임이 발생할 수 있습니다. 단, 반품/교환 비용은 상품 및 반품/교환 사유에 따라 변경될 수 있으므로
                        반품/교환 신청 화면에서 확인 부탁드립니다.</p>
                </td>
            </tr>
            <tr>
                <td>
                    <h5>교환/반품 불가 안내</h5>
                </td>
                <td>
                    <p>전자상거래 등에서 소비자보호에 관한 법률에 따라 다음의 경우 청약철회가 제한될 수 있습니다.
                        고객님이 상품 포장을 개봉하여 사용 또는 설치 완료되어 상품의 가치가 훼손된 경우
                        (단, 내용 확인을 위한 포장 개봉의 경우는 예외)
                        고객님의 단순변심으로 인한 교환/반품 신청이 상품 수령한 날로부터 7일이 경과한 경우
                        신선식품(냉장/냉동 포함)을 단순변심/주문착오로 교환/반품 신청하는 경우
                        고객님의 사용 또는 일부 소비에 의해 상품의 가치가 훼손된 경우
                        시간 경과에 따라 상품 등의 가치가 현저히 감소하여 재판매가 불가능한 경우
                        복제가 가능한 재화 등의 포장을 훼손한 경우(DVD, CD, 도서 등 복제 가능한 상품)
                        고객님이 이상 여부를 확인한 후 설치가 완료된 상품의 경우(가전, 가구, 헬스기구 등)
                        고객님의 요청에 따라 개별적으로 주문제작되는 상품으로 재판매가 불가능한 경우(이니셜 표시상품, 사이즈 맞춤상품 등)
                        구매한 상품의 구성품이 누락된 경우(화장품 세트, 의류부착 악세서리, 가전제품 부속품, 사은품 등)
                        기타, 상품의 교환, 환불 및 상품 결함 등의 보상은 소비자분쟁해결기준(공정거래위원회 고시)에 의함</p>
                </td>
            </tr>                
        </table>
    </div>
</div>
<footer>
<jsp:include page="../common/footer.jsp"></jsp:include>
</footer>
</body>
</html>