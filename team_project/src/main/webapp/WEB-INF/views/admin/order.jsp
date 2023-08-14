<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member</title>
<style>
    #div_left, #div_right{
        float: left;
        height: 100%;
    }
    #div_left{
        width: 300px;
    }
    #div_left *{
        margin-left: 15px;
        margin-top: 5px;
    }
    #div_left table{
        border-collapse: collapse;
        width: 250px;
    }
    #div_left td{
        border: 1px solid lightgray;
    }
    #div_left tr:nth-child(odd) td{
	    height: 27px;
	    font-size: 14px;
	    line-height: 14px;
	    font-weight: bold;
	    padding-left: 5px;
    }
    #div_left tr:nth-child(even) td{
        background-color: white;
        font-size: 13px;
        line-height: 25px;
        padding: 5px 0px;
    }
    #div_left input{
        float: left;
    }
    #div_left label{
        float: left;
        height: 20px;
        margin-top: -2px;
        user-select: none;
    }
    #div_right{
        position: relative;
        border: 1px solid lightgray;
        background-color: white;
        overflow-y: scroll;
        width: 500px;
        height: 500px;
        margin-top: 37px;
    }
    #div_right table{      
        position: absolute;
        border-collapse: collapse;
        width: 100%;
        table-layout: fixed;
    }   
    #div_right td{
        border: 1px solid lightgray;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        height: 20px;
        line-height: 20px;
        font-size: 12px;
        text-align: center;
    }
    #div_right tr:first-child td{
	    background-color: #f5f5f5;
	    padding: 0px 10px;
    }
    #div_right tr td:nth-child(1), #div_right tr td:nth-child(2){
        background-color: #f5f5f5;
        width: 25px;
        padding: 0;
    }
    #div_right button, #div_right img{
        width: 15px;
        height: 15px;
    }
    #div_right button{
        margin-top: 5px;
    }
    .div_shadow{
        position: absolute;
        width: 100%;
        height: 100%;
        background-color: rgba(50, 50, 50, 0.3);
        display: none;
    }
    .div_orderInfo{
        position: absolute;
        width: 500px;
        height: 320px;
        background-color: white;
        left: 50%;
        margin-left: -310px;
        top: 50%;
        margin-top: -260px;
    }
    .div_orderInfo p{
        font-size: 13px;
        line-height: 35px;      
        background-color: rgb(240, 240, 240);
        padding-left: 15px;
        font-weight: bold;
        border-bottom: 1px solid lightgray;
        
    }
    .tbl_orderInfo{
        margin: 10px 0px;
    }    
    .tbl_orderInfo th, .tbl_orderInfo td{
/*         border: 1px solid lightgray; */
        height: 35px;
        white-space: nowrap;
        font-size: 12px;
    }
   .tbl_orderInfo th{
        width: 70px;
        padding-right: 10px;
        text-align: right;
    }
    .tbl_orderInfo td{
        width: 150px;
    }
    .tbl_orderInfo input[type="text"]{
        width: 150px;
        height: 25px;
        border-radius: 0px;
        font-size: 11px;
    }
    .tbl_orderInfo input[type="text"]{
        border: 1px solid lightgray;
        padding-left: 5px;
        outline: none;
        line-height: 25px;
    }
    .tbl_orderInfo textarea{
        width: 390px;
        height: 55px;
        font-size: 11px;
        padding-left: 5px;
        line-height: 25px;
        resize: none;
    }
    .tbl_orderInfo input[type="number"]::-webkit-outer-spin-button,
    .tbl_orderInfo input[type="number"]::-webkit-inner-spin-button{
        height: 30px;
        opacity: 1;
    }
    .tbl_orderInfo tr:last-child td:nth-child(3){
	    text-align: right;
    }
    .tbl_orderInfo tr:nth-child(6) td{
        border: none;
    }
    .tbl_orderInfo select{
        width: 157px;
        height: 27px;
        border-radius: 0px;
        font-size: 11px;
        border: 1px solid lightgray;
        outline: none;
    }
    #btn_add, #btn_edit, .btn_cancel{
       width: 80px;
       height: 27px;
       margin-left: 5px;
       font-size: 11px;
       font-weight: bold;
       border: 1px solid lightgray;
       border-radius: 3px;
       cursor: pointer;
    }
    #btn_add, #btn_edit{
       background-color: rgb(52, 152, 219);
       color: white;
    }
    #btn_add:hover, #btn_edit:hover {
	   background-color: rgb(42, 142, 209);
    }
    .btn_cancel:hover {
	   background-color: rgb(230, 230, 230);
    }   
    #div_orderStateBtn{
        position: absolute;
        width: 500px;
        height: 37px;
        margin-left: 300px;        
    }
    .tbl_orderInfo tr:nth-child(7) td:nth-child(2) *{
        float: left;
    }
    .tbl_orderInfo tr:nth-child(7) td:nth-child(2) input[type="radio"]{
        margin-top: 3px;
        margin-left: 10px;
    }
    .tbl_orderInfo tr:nth-child(7) td:nth-child(2) label{
        margin-left: 5px;
        margin-right: 10px;
    }
    #div_orderStateBtn input{
        font-size: 13px;
        font-weight: bold;
        width: 70px;
        height: 25px;
        margin-top: 5px;
        margin-right: 5px;        
    }
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){		
		
		let orderStateMap = {"0": "결제완료", "1": "상품준비중", "2": "배송중", "3": "배송완료"};
		let paymentMap = {"1": "일반결제", "2": "카카오페이"};
	    let p_id; //상품코드
		let p_name; //상품명
		let brand; //브랜드명
		let price; //판매금액
		let cost; //구매금액		
		let category; //분류
		let standard; //규격
        let unit; //단위
        let stock; //재고
        let discount; //할인율
        let post_state; //게시상태

		$("#btn_reset").click(function(){
			
			$("input[type='checkbox']").prop("checked", false);
			$("#tbl_contents tr").show();
			
		});
		
		$("#btn_filter").click(function () {
            let selectedOrderState = [];
            let selectedPayment = [];

            $(".checkbox_orderState:checked").each(function () {
                let orderStateId = $(this).attr("id").replace("checkbox1_", "");
                selectedOrderState.push(orderStateMap[orderStateId]);
            });

            $(".checkbox_payment:checked").each(function () {
                let paymentId = $(this).attr("id").replace("checkbox2_", "");
                selectedPayment.push(paymentMap[paymentId]);
            });            

            applyFilter(selectedOrderState, selectedPayment);
        });

		function applyFilter(selectedOrderState, selectedPayment, selectedPostStates, selectedRequest) {
	        $("#tbl_contents tr:not(:first-child)").each(function () {
	            let orderState = $(this).find("td:nth-child(8)").text().trim();
	            let paymentName = $(this).find("td:nth-child(5)").text();
	            let requestDetail = $(this).find("td:nth-child(7)").text();
	            let showOrderState = selectedOrderState.length === 0 || selectedOrderState.includes(orderState);
	            let showPayment = selectedPayment.length === 0 || selectedPayment.includes(paymentName);
	            
	            if (showOrderState && showPayment) {
	                $(this).show();
	            } else {
	                $(this).hide();
	            }
	        });
	    }
		
        let divShadowEdit = document.getElementById("div_shadow_edit");
        let cancelBtns = document.querySelectorAll(".btn_cancel");
        let editProductBtns = document.querySelectorAll(".btn_editProduct");
                
        /* btn_addProduct: none/block 변환 function */

        
        cancelBtns.forEach(function(btn){
        	btn.addEventListener("click", function(){
        		divShadowEdit.style.display = "none";
                frm_add.reset();
                frm_edit.reset();
            }) 
        });
        
        editProductBtns.forEach(function (btn){
        	btn.addEventListener("click", function(){
        		divShadowEdit.style.display = "block";
        		
        		// 클릭된 버튼의 id를 가져옵니다.
                let productId = $(this).attr("id");
                // productId의 앞 두 글자 가져오기
                let categoryCode = productId.substring(0, 2);
                
                // category 코드를 해당 옵션 값으로 매핑
                let categoryOptionValue = getCategoryValue(categoryCode);                

                // 해당 id를 가진 상품 행(tr)을 선택합니다.
                let productRow = $("#tbl_contents tr").filter(function() {
                    return $(this).find("td:nth-child(3)").text() === productId;
                });
                
                $("#order_idx_info").val(productId);
                $("#orderState_info").val(productRow.find("td:nth-child(8)").text().trim());
                $("#payment_info").val(productRow.find("td:nth-child(5)").text());
                $("#paid_price").val(productRow.find("td:nth-child(4)").text()+' (포인트사용 : '+productRow.find("td:nth-child(6)").text()+')');
                $("#p_name_edit").val(productRow.find("td:nth-child(5)").text());
                $("#request_info").val(productRow.find("td:nth-child(7)").text());
                $("#price_edit").val(productRow.find("td:nth-child(8)").text());
                $("#cost_edit").val(productRow.find("td:nth-child(7)").text());
                $("#category_edit").val(categoryOptionValue);
                
             // 게시상태에 따라 라디오 버튼 선택
                let postState = productRow.find("td:nth-child(13)").text().trim();
                setPostStateRadio(postState);
        		
        	});
        	        	
        });
        
        function getCategoryValue(categoryCode) {
            // orderStateMap에서 categoryCode에 해당하는 값을 찾아서 반환
            return Object.keys(orderStateMap).find(key => orderStateMap[key] === categoryCode) || "0";
        }
        
        function setPostStateRadio(postState) {
            if (postState === "판매중") {
                $("#option1_edit").prop("checked", true);
            } else {
                $("#option2_edit").prop("checked", true);
            }
        }        
        
        $("#checkAll").click(function(){
        	
            $("#tbl_contents tr:visible input[type='checkbox']").prop("checked", this.checked);
            
        });
        
        $("#tbl_contents tr:visible").on("click", "input[type='checkbox']", function() {
            let allCheckboxes = $("#tbl_contents tr:visible input[type='checkbox']").not("#checkAll");
            let isChecked = allCheckboxes.filter(":checked").length === allCheckboxes.length;
            $("#checkAll").prop("checked", isChecked);
        });
        
        let btnChangeOrderState = document.getElementById("btn_changeOrderState");
        let checkedOrders = [];
        
        btnChangeOrderState.addEventListener("click", function(){
            
            checkedOrders = [];
            
            $("#tbl_contents tr").each(function(){
                
                let checkbox = $(this).find("input[type='checkbox']");
                
                if(checkbox.is(":checked")){
                    let orderIdx = $(this).find("td:nth-child(3)").text();
                    checkedOrders.push(orderIdx);
                }               
                
            });
            
            if (checkedOrders.length > 0) {
                $.ajax({
                    type: "post",
                    url: "changeOrderState.do",
                    data: { checkedOrders: checkedOrders },
                    success: function (response) {
                        alert("처리상태가 성공적으로 변경되었습니다.");
                        location.reload();
                    },
                    error: function (error) {
                        console.error("AJAX 오류 발생", error);
                        alert("처리상태 변경 중 오류가 발생했습니다.");
                    }
                }); //end of ajax
            } else {
                alert("선택된 주문이 없습니다.");
            }
            
        });
        
						
	});
	
</script>
</head>
<body>
    <div id="div_left">
        <h3>주문관리</h3>
        <table>
            <tr>
                <td>처리상태</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" class="checkbox_orderState" id="checkbox1_0"><label for="checkbox1_1">결제완료</label><br>
                    <input type="checkbox" class="checkbox_orderState" id="checkbox1_1"><label for="checkbox1_2">상품준비중</label><br>
                    <input type="checkbox" class="checkbox_orderState" id="checkbox1_2"><label for="checkbox1_3">배송중</label><br>
                    <input type="checkbox" class="checkbox_orderState" id="checkbox1_3"><label for="checkbox1_4">배송완료</label><br>
                </td>
            </tr>
            <tr>
                <td>결제유형</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" class="checkbox_payment" id="checkbox2_1"><label for="checkbox2_1">일반결제</label><br>
                    <input type="checkbox" class="checkbox_payment" id="checkbox2_2"><label for="checkbox2_2">카카오페이</label><br>
                </td>
            </tr> 
            <tr>
            	<td>
            	   <input id="btn_reset" type="button" value="초기화"/>
            	   <input id="btn_filter" type="button" value="선택완료"/>
            	</td>
            </tr>
        </table>
    </div>
    <div id="div_orderStateBtn">
        <input type="button" value="상태변경" id="btn_changeOrderState">
    </div>
    <div id="div_right">        
        <table id="tbl_contents">
            <tr>
                <td><input type="checkbox" id="checkAll"></td>
                <td></td>
                <td>주문번호</td>
                <td>결제금액</td>
                <td>결제유형</td>
                <td>포인트사용</td>
                <td>요청사항</td>
                <td>처리상태</td>                
            </tr>
            <c:forEach items="${orderList}" var="order">
                <tr>
                    <td><input type="checkbox" value="${order.order_idx}"></td>
                    <td>
                        <button class="btn_editProduct" id="${order.order_idx}">
                            <img alt="" src="">
                        </button>
                    </td>
	                <td>${order.order_idx}</td>
	                <td>${order.paid_price}</td>
                    <td>${order.paymentInfo}</td>
                    <td>${order.used_point}</td>
                    <td>${order.request}</td>
                    <td>
                        <c:choose>
                            <c:when test="${order.order_state == 0}">결제완료</c:when>
                            <c:when test="${order.order_state == 1}">상품준비중</c:when>
                            <c:when test="${order.order_state == 2}">배송중</c:when>
                            <c:otherwise>배송완료</c:otherwise>
                        </c:choose>
                    </td>

	            </tr>
            </c:forEach>            
        </table>
    </div>
    <div id="div_shadow_edit" class="div_shadow">
        <div id="div_orderInfo_edit" class="div_orderInfo">
        <p>상품수정</p>
           <form action="" name="frm_edit">
               <table id="tbl_orderInfo_edit" class="tbl_orderInfo">
                   <tr> 
                       <th>상품코드</th>
                       <td><input id="order_idx_info" type="text" disabled/></td>
                       <th>처리상태</th>
                       <td><input id="orderState_info" type="text" disabled/></td>
                   </tr>
                   <tr>
                       <th>결제유형</th>
                       <td><input id="payment_info" type="text" disabled/></td>
                       <th>결제금액</th>
                       <td><input id="paid_price" type="text" disabled/></td>
                   </tr>
                      
                   <tr>
                       <th>요청사항</th>
                       <td colspan="3" rowspan="2">
                            <textarea  id="request_info" rows="3" cols="3" disabled></textarea>
                       </td>                       
                   </tr>                   
                   <tr><th></th></tr>                
                   <c:forEach items="${selectedOrder}" var="product">
                        <tr>
                        	<th>제품명</th>
                        	<td>구매내용</td>
                        </tr>
                   </c:forEach>
                   <tr>    
                       <th></th>
                       <td></td>    
                       <td colspan="2">
                           <input class="btn_cancel" type="button" value="확인"/>
                       </td>
                   </tr>
               </table>
           </form>
        </div>
    </div>
</body>
</html>