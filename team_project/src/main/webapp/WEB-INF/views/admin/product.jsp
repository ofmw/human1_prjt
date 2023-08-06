<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    #div_right tr td:nth-child(n + 8):nth-child(-n + 11){
        width: 35px;
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
    .div_product{
        position: absolute;
        width: 500px;
        height: 320px;
        background-color: white;
        left: 50%;
        margin-left: -310px;
        top: 50%;
        margin-top: -260px;
    }
    .div_product p{
        font-size: 13px;
        line-height: 35px;      
        background-color: rgb(240, 240, 240);
        padding-left: 15px;
        font-weight: bold;
        border-bottom: 1px solid lightgray;
        
    }
    .tbl_product{
        margin: 10px 0px;
    }    
    .tbl_product th, .tbl_product td{
/*         border: 1px solid lightgray; */
        height: 35px;
        white-space: nowrap;
        font-size: 12px;
    }
   .tbl_product th{
        width: 70px;
        padding-right: 10px;
        text-align: right;
    }
    .tbl_product td{
        width: 150px;
    }
    .tbl_product input[type="text"], .tbl_product input[type="file"], .tbl_product input[type="number"]{
        width: 150px;
        height: 25px;
        border-radius: 0px;
        font-size: 11px;
    }    
    .tbl_product input[type="text"], .tbl_product input[type="number"]{
        border: 1px solid lightgray;
        padding-left: 5px;
        outline: none;
    }
    .tbl_product input[type="number"]::-webkit-outer-spin-button,
    .tbl_product input[type="number"]::-webkit-inner-spin-button{
        height: 30px;
        opacity: 1;
    }
    .tbl_product tr:last-child td:nth-child(3){
	    text-align: right;
    }
    .tbl_product tr:nth-child(6) td{
        border: none;
    }
    .tbl_product select{
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
    #div_productBtns{
        position: absolute;
        width: 500px;
        height: 37px;
        margin-left: 300px;        
    }
    .tbl_product tr:nth-child(6) td:last-child *{
        float: left;
    }
    .tbl_product tr:nth-child(6) td:last-child input[type="radio"]{
        margin-top: 3px;
        margin-left: 10px;
    }
    .tbl_product tr:nth-child(6) td:last-child label{
        margin-left: 5px;
        margin-right: 10px;
    }
    #div_productBtns input{
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
		
		let categoryMap = {"1": "AA", "2": "BB", "3": "CC", "4": "DD"};
		let brandMap = {"1": "농협", "2": "목우촌", "3": "하림", "4": "수협"};
		let postStateMap = {"1": "판매중", "0": "판매중단"};
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
		
        $("#category").change(function(){
            
            let selectedCategory = $(this).val();
            
            if(selectedCategory != "0"){
                
                let categoryCode = categoryMap[selectedCategory];
                
                $.ajax({
                    type: "get",
                    url: "countCategory.do?category=" + categoryCode,
                    success: function(count){
                        let generatedCode = generateProductCode(categoryCode, count);
                        $("#p_id").val(generatedCode);
                    },
                    error: function(error){
                        console.error("AJAX 오류 발생", error);
                    }
                }); //end of ajax
                
            }else{
                $("#p_id").val("");
            }
            
        });
        
        // 상품코드 생성 로직
		function generateProductCode(categoryCode) {
		    // 카테고리 내 모든 제품 코드를 가져옵니다.
		    let productCodesInCategory = [];
		    $("#tbl_contents tr:not(:first-child)").each(function () {
		        let productId = $(this).find("td:nth-child(3)").text();
		        if (productId.substring(0, 2) === categoryCode) {
		            productCodesInCategory.push(productId);
		        }
		    });
		
		    // 카테고리 내 제품 코드들의 숫자 부분 중 최대값을 찾습니다.
		    let maxCodeNumber = 0;
		    productCodesInCategory.forEach(function (productCode) {
		        let codeNumber = parseInt(productCode.substring(2));
		        if (!isNaN(codeNumber) && codeNumber > maxCodeNumber) {
		            maxCodeNumber = codeNumber;
		        }
		    });
		
		    // 다음 제품 코드를 최대값에 1을 더해 생성합니다.
		    let nextCodeNumber = (maxCodeNumber + 1).toString().padStart(4, "0");
		    let generatedCode = categoryCode + nextCodeNumber;
		    return generatedCode;
		}
        
		$("#btn_add").click(function(){			
			
			p_id = $("#p_id").val();
			p_name = $("#p_name").val();
			brand = $("#brand").val();
			price = $("#price").val();
			cost = $("#cost").val();
			standard = $("#standard").val();
		    unit = $("#unit").val();
		    stock = $("#stock").val();
		    discount = $("#discount").val();
		    post_state = $("input[name='option']:checked").val() || 0;
			
			if(p_name == "" || brand == "" || price == "" || cost == "" || standard == "" || unit == "" ){
				alert("모든 항목을 입력해주세요.");
			}else if(category == "0"){
				alert("분류를 선택해주세요.");
			}else{
				let formData = {
						p_id: p_id,
						p_name: p_name,
			            brand: brand,
			            price: parseInt(price),
			            cost: parseInt(cost),
			            standard: parseInt(standard),
			            unit: unit,
			            stock: parseInt(stock),
			            discount: parseInt(discount),
			            post_state: post_state,
				};
				
				$.ajax({
					
					type: "post",
					url: "insertProduct.do",
					data: formData,
					success: function(response){
						alert("상품이 성공적으로 등록되었습니다.")
						location.reload();
					},
					error: function(error){
						console.error("AJAX 오류 발생", error);
						alert("상품 등록 중 오류가 발생했습니다.");
					}					
				}); //end of ajax
				
			}
		});

		$("#btn_reset").click(function(){
			
			$("input[type='checkbox']").prop("checked", false);
			$("#tbl_contents tr").show();
			
		});
		
		$("#btn_filter").click(function () {
            let selectedCategories = [];
            let selectedBrands = [];
            let selectedPostStates = [];
            let selectedStocks = [];

            $(".checkbox_category:checked").each(function () {
                let categoryId = $(this).attr("id").replace("checkbox1_", "");
                selectedCategories.push(categoryMap[categoryId]);
            });

            $(".checkbox_brand:checked").each(function () {
                let brandId = $(this).attr("id").replace("checkbox2_", "");
                selectedBrands.push(brandMap[brandId]);
            });
            
            $(".checkbox_postState:checked").each(function () {
                let postStateId = $(this).attr("id").replace("checkbox3_", "");
                selectedPostStates.push(postStateMap[postStateId]);
            });
            
            $(".checkbox_stock:checked").each(function () {
                let stockId = $(this).attr("id").replace("checkbox4_", "");
                selectedStocks.push(stockId);
            });

            applyFilter(selectedCategories, selectedBrands, selectedPostStates, selectedStocks);
        });

		function applyFilter(selectedCategories, selectedBrands, selectedPostStates, selectedStocks) {
	        $("#tbl_contents tr:not(:first-child)").each(function () {
	            let productId = $(this).find("td:nth-child(3)").text();
	            let brandName = $(this).find("td:nth-child(5)").text();
	            let postState = $(this).find("td:nth-child(12)").text();
	            let stockState = $(this).find("td:nth-child(10)").text();
	            let showCategory = selectedCategories.length === 0 || selectedCategories.includes(productId.substring(0, 2));
	            let showBrand = selectedBrands.length === 0 || selectedBrands.includes(brandName);
	            let showPostState = selectedPostStates.length === 0 || selectedPostStates.includes(postState.trim());
	            let showStock = selectedStocks.length === 0 || (stockState === "0" && selectedStocks.includes("0")) || (stockState !== "0" && selectedStocks.includes("1"));
	            if (showCategory && showBrand && showPostState && showStock) {
	                $(this).show();
	            } else {
	                $(this).hide();
	            }
	        });
	    }
		
        let addProduct = document.getElementById("btn_addProduct");
        let divShadowAdd = document.getElementById("div_shadow_add");
        let divShadowEdit = document.getElementById("div_shadow_edit");
        let cancelBtns = document.querySelectorAll(".btn_cancel");
        let editProductBtns = document.querySelectorAll(".btn_editProduct");
                
        /* btn_addProduct: none/block 변환 function */
        addProduct.addEventListener("click", function(){
        	divShadowAdd.style.display = "block";
        
        });
        
        cancelBtns.forEach(function(btn){
        	btn.addEventListener("click", function(){
        		divShadowAdd.style.display = "none";
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
                
                $("#p_id_edit").val(productId);
                $("#p_name_edit").val(productRow.find("td:nth-child(4)").text());
                $("#brand_edit").val(productRow.find("td:nth-child(5)").text());
                $("#price_edit").val(productRow.find("td:nth-child(7)").text());
                $("#cost_edit").val(productRow.find("td:nth-child(6)").text());                
                $("#standard_edit").val(productRow.find("td:nth-child(8)").text());
                $("#unit_edit").val(productRow.find("td:nth-child(9)").text());
                $("#stock_edit").val(productRow.find("td:nth-child(10)").text());
                $("#discount_edit").val(productRow.find("td:nth-child(11)").text());
                $("#category_edit").val(categoryOptionValue);
                
             // 게시상태에 따라 라디오 버튼 선택
                let postState = productRow.find("td:nth-child(12)").text().trim();
                setPostStateRadio(postState);
        		
        	});
        	        	
        });
        
        function getCategoryValue(categoryCode) {
            // categoryMap에서 categoryCode에 해당하는 값을 찾아서 반환
            return Object.keys(categoryMap).find(key => categoryMap[key] === categoryCode) || "0";
        }
        
        function setPostStateRadio(postState) {
            if (postState === "판매중") {
                $("#option1_edit").prop("checked", true);
            } else {
                $("#option2_edit").prop("checked", true);
            }
        }
        
        let editApply = document.getElementById("btn_edit");
        
        
        
        editApply.addEventListener("click", function(){
        	
        	p_id = $("#p_id_edit").val();
            p_name = $("#p_name_edit").val();
            brand = $("#brand_edit").val();
            price = $("#price_edit").val();
            cost = $("#cost_edit").val();
            standard = $("#standard_edit").val();
            unit = $("#unit_edit").val();
            stock = $("#stock_edit").val();
            discount = $("#discount_edit").val();
            post_state = $("input[name='option_edit']:checked").val() || 0;
        	
            if(p_name == "" || brand == "" || price == "" || cost == "" || standard == "" || unit == "" ){
                alert("모든 항목을 입력해주세요.");
            }else{
                let formData = {
                        p_id: p_id,
                        p_name: p_name,
                        brand: brand,
                        price: parseInt(price),
                        cost: parseInt(cost),
                        standard: parseInt(standard),
                        unit: unit,
                        stock: parseInt(stock),
                        discount: parseInt(discount),
                        post_state: post_state,
                };
                
                $.ajax({
                    
                    type: "post",
                    url: "editProduct.do",
                    data: formData,
                    success: function(response){
                        alert("상품이 성공적으로 수정되었습니다.")
                        location.reload();
                    },
                    error: function(error){
                        console.error("AJAX 오류 발생", error);
                        alert("상품 수정 중 오류가 발생했습니다.");
                    }                   
                }); //end of ajax
                
            }
            
        });
        
        $("#checkAll").click(function(){
        	
            $("#tbl_contents tr:visible input[type='checkbox']").prop("checked", this.checked);
            
        });
        
        $("#tbl_contents tr:visible").on("click", "input[type='checkbox']", function() {
            let allCheckboxes = $("#tbl_contents tr:visible input[type='checkbox']").not("#checkAll");
            let isChecked = allCheckboxes.filter(":checked").length === allCheckboxes.length;
            $("#checkAll").prop("checked", isChecked);
        });
        
        let btnStateTrue = document.getElementById("btn_postState_true");
        let btnStateFalse = document.getElementById("btn_postState_false");
        let btnDelProduct = document.getElementById("btn_deleteProduct");
        let checkedProducts = [];
        
        btnStateTrue.addEventListener("click", function(){
        	
            checkedProducts = [];
            
            $("#tbl_contents tr").each(function(){
            	
            	let checkbox = $(this).find("input[type='checkbox']");
            	
            	if(checkbox.is(":checked")){
            		let productId = $(this).find("td:nth-child(3)").text();
            		checkedProducts.push(productId);
            	}            	
            	
            });
            
            if (checkedProducts.length > 0) {
                $.ajax({
                    type: "post",
                    url: "productStateTrue.do",
                    data: { checkedProducts: checkedProducts },
                    success: function (response) {
                        alert("게시 상태가 성공적으로 변경되었습니다.");
                        location.reload();
                    },
                    error: function (error) {
                        console.error("AJAX 오류 발생", error);
                        alert("게시 상태 변경 중 오류가 발생했습니다.");
                    }
                }); //end of ajax
            } else {
                alert("선택된 상품이 없습니다.");
            }
        	
        });
        
        btnStateFalse.addEventListener("click", function(){
            
            checkedProducts = [];
            
            $("#tbl_contents tr").each(function(){
                
                let checkbox = $(this).find("input[type='checkbox']");
                
                if(checkbox.is(":checked")){
                    let productId = $(this).find("td:nth-child(3)").text();
                    checkedProducts.push(productId);
                }               
                
            });
            
            if (checkedProducts.length > 0) {
                $.ajax({
                    type: "post",
                    url: "productStateFalse.do",
                    data: { checkedProducts: checkedProducts },
                    success: function (response) {
                        alert("게시 상태가 성공적으로 변경되었습니다.");
                        location.reload();
                    },
                    error: function (error) {
                        console.error("AJAX 오류 발생", error);
                        alert("게시 상태 변경 중 오류가 발생했습니다.");
                    }
                }); //end of ajax
            } else {
                alert("선택된 상품이 없습니다.");
            }
            
        });
        
        btnDelProduct.addEventListener("click", function(){
            
            checkedProducts = [];
            
            $("#tbl_contents tr").each(function(){
                
                let checkbox = $(this).find("input[type='checkbox']");
                
                if(checkbox.is(":checked")){
                    let productId = $(this).find("td:nth-child(3)").text();
                    checkedProducts.push(productId);
                }               
                
            });
            
            if (checkedProducts.length > 0) {
                $.ajax({
                    type: "post",
                    url: "deleteProduct.do",
                    data: { checkedProducts: checkedProducts },
                    success: function (response) {
                        alert("상품이 성공적으로 삭제되었습니다.");
                        location.reload();
                    },
                    error: function (error) {
                        console.error("AJAX 오류 발생", error);
                        alert("상품 삭제 중 오류가 발생했습니다.");
                    }
                }); //end of ajax
            } else {
                alert("선택된 상품이 없습니다.");
            }
            
        });
						
	});
	
</script>
</head>
<body>
    <div id="div_left">
        <h3>제품관리</h3>
        <table>
            <tr>
                <td>분류</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" class="checkbox_category" id="checkbox1_1"><label for="checkbox1_1">육류</label><br>
                    <input type="checkbox" class="checkbox_category" id="checkbox1_2"><label for="checkbox1_2">가공</label><br>
                    <input type="checkbox" class="checkbox_category" id="checkbox1_3"><label for="checkbox1_3">수산</label><br>
                    <input type="checkbox" class="checkbox_category" id="checkbox1_4"><label for="checkbox1_4">야채</label><br>
                </td>
            </tr>
            <tr>
                <td>브랜드</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" class="checkbox_brand" id="checkbox2_1"><label for="checkbox2_1">농협</label><br>
                    <input type="checkbox" class="checkbox_brand" id="checkbox2_2"><label for="checkbox2_2">목우촌</label><br>
                    <input type="checkbox" class="checkbox_brand" id="checkbox2_3"><label for="checkbox2_3">하림</label><br>
                    <input type="checkbox" class="checkbox_brand" id="checkbox2_4"><label for="checkbox2_4">수협</label><br>
                </td>
            </tr>
            <tr>
                <td>게시상태</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" class="checkbox_postState" id="checkbox3_1"><label for="checkbox3_1">판매중</label><br>
                    <input type="checkbox" class="checkbox_postState" id="checkbox3_0"><label for="checkbox3_0">판매중단</label><br>
                </td>
            </tr>
            <tr>
                <td>재고</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" class="checkbox_stock" id="checkbox4_1"><label for="checkbox4_1">있음</label><br>
                    <input type="checkbox" class="checkbox_stock" id="checkbox4_0"><label for="checkbox4_0">없음</label><br>
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
    <div id="div_productBtns">
        <input type="button" value="상품등록" id="btn_addProduct">
        <input type="button" value="판매등록" id="btn_postState_true">
        <input type="button" value="판매중단" id="btn_postState_false">
        <input type="button" value="선택삭제" id="btn_deleteProduct">
    </div>
    <div id="div_right">        
        <table id="tbl_contents">
            <tr>
                <td><input type="checkbox" id="checkAll"></td>
                <td></td>
                <td>코드</td>
                <td>제품명</td>
                <td>브랜드</td>
                <td>구매가</td>
                <td>판매가</td>
                <td>규격</td>
                <td>단위</td>
                <td>재고</td>
                <td>할인율</td>
                <td>게시상태</td>                
            </tr>
            <c:forEach items="${productList}" var="product">
                <tr>
                    <td><input type="checkbox" value="${product.p_id}"></td>
                    <td>
                        <button class="btn_editProduct" id="${product.p_id}">
                            <img alt="" src="">
                        </button>
                    </td>
	                <td>${product.p_id}</td>
	                <td>${product.p_name}</td>
	                <td>${product.brand}</td>
	                <td>${product.cost}</td>
                    <td>${product.price}</td>
                    <td>${product.standard}</td>
                    <td>${product.unit}</td>
                    <td>${product.stock}</td>
                    <td>${product.discount}</td>
                    <td>
                        <c:choose>
                            <c:when test="${product.post_state == 1}">판매중</c:when>
                            <c:otherwise>판매중단</c:otherwise>
                        </c:choose>
                    </td>

	            </tr>
            </c:forEach>            
        </table>
    </div>
    <div id="div_shadow_add" class="div_shadow">
	    <div id="div_product_add" class="div_product">
	    <p>상품등록</p>
	       <form action="" name="frm_add">
		       <table id="tbl_product_add" class="tbl_product">
		           <tr>
			           <th>상품명</th>
			           <td><input id="p_name" type="text"/></td>
			           <th>분류</th>
			           <td>
				           <select id="category">
				                <option value="0">선택</option>
				                <option value="1">육류</option>
				                <option value="2">가공</option>
				                <option value="3">수산</option>
				                <option value="4">야채</option>
				           </select>
			           </td>
		           </tr>
		           <tr>
			           <th>브랜드</th>
			           <td><input id="brand" type="text"/></td>
			           <th>상품코드</th>
                       <td><input id="p_id" type="text" disabled/></td>
			           
		           </tr>
		           <tr>
			           <th>판매금액</th>
			           <td><input id="price" type="text"/></td>
			           <th>규격</th>
                       <td><input id="standard"  type="text" /></td>
		           </tr>
		           <tr>
			           <th>구매금액</th>
                       <td><input id="cost" type="text"/></td>
                       <th>단위</th>
                       <td><input id="unit" type="text" /></td>
		           </tr>
		           <tr>
			           <th>할인율</th>
                       <td><input id="discount" type="number" min="0" max="90" value="0"/></td>
                       <th>재고</th>
                       <td><input id="stock" type="number" min="0" value="0"/></td>
		           </tr>		           
		           <tr>
			           <th>썸네일</th>
			           <td><input type="file" /></td>
			           <th>게시상태</th>
                       <td>
                           <input type="radio" name="option" id="option1" value="1"/><label for="option1">판매중</label>
                           <input type="radio" name="option" id="option2" value="0"/><label for="option2">판매중단</label>
                       </td>
		           </tr>
		           <tr>                
		               <th>상품정보</th>
                       <td><input type="file" /></td>
		               <td colspan="2">
		                   <input id="btn_add" type="button" value="등록"/>
			               <input class="btn_cancel" id="btn_cancel" type="button" value="취소"/>
		               </td>
	               </tr>
		       </table>
	       </form>
	    </div>
    </div>
    <div id="div_shadow_edit" class="div_shadow">
        <div id="div_product_edit" class="div_product">
        <p>상품수정</p>
           <form action="" name="frm_edit">
               <table id="tbl_product_edit" class="tbl_product">
                   <tr>
                       <th>상품명</th>
                       <td><input id="p_name_edit" type="text"/></td>
                       <th>분류</th>
                       <td>
                           <select id="category_edit">
                                <option value="0">선택</option>
                                <option value="1">육류</option>
                                <option value="2">가공</option>
                                <option value="3">수산</option>
                                <option value="4">야채</option>
                           </select>
                       </td>
                   </tr>
                   <tr>
                       <th>브랜드</th>
                       <td><input id="brand_edit" type="text"/></td>
                       <th>상품코드</th>
                       <td><input id="p_id_edit" type="text" disabled/></td>
                       
                   </tr>
                   <tr>
                       <th>판매금액</th>
                       <td><input id="price_edit" type="text"/></td>
                       <th>규격</th>
                       <td><input id="standard_edit"  type="text" /></td>
                   </tr>
                   <tr>
                       <th>구매금액</th>
                       <td><input id="cost_edit" type="text"/></td>
                       <th>단위</th>
                       <td><input id="unit_edit" type="text" /></td>
                   </tr>
                   <tr>
                       <th>할인율</th>
                       <td><input id="discount_edit" type="number" min="0" max="90" value="0"/></td>
                       <th>재고</th>
                       <td><input id="stock_edit" type="number" min="0" value="0"/></td>
                   </tr>                   
                   <tr>
                       <th>썸네일</th>
                       <td><input type="file" /></td>
                       <th>게시상태</th>
                       <td>
                           <input type="radio" name="option_edit" id="option1_edit" value="1"/><label for="option1_edit">판매중</label>
                           <input type="radio" name="option_edit" id="option2_edit" value="0"/><label for="option2_edit">판매중단</label>
                       </td>
                   </tr>
                   <tr>                
                       <th>상품정보</th>
                       <td><input type="file" /></td>
                       <td colspan="2">
                           <input id="btn_edit" type="button" value="수정"/>
                           <input class="btn_cancel" type="button" value="취소"/>
                       </td>
                   </tr>
               </table>
           </form>
        </div>
    </div>
</body>
</html>