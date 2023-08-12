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

    /* ---------------------상품페이지 상단 버튼--------------------- */
    #pl_header{
        width: 100%;
        height: 100px;
/*         background-color: aquamarine; */
    }
    #pl_header_btn_box{
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: center;
        width: 100%;
        height: 100%;
        padding-left: 180px;
    }
    .quick_btn{
        position: relative;
        width: 70px;
        height: 70px;
        background-color: orange;
        border-radius: 15px;
        overflow: hidden;
        margin-top: 35px;
        margin-right: 20px;
    }
    .quick_btn a{
        position: absolute;
        width: 100%;
        height: 100%;
        background-color: palevioletred;
    }
    .quick_btn img{
        position: absolute;
        width: 100%;
        height: 100%;
        background-color: chartreuse;
    }

    /* ---------------------상품페이지 메인--------------------- */
    #pl_main{
        width: 100%;
        margin-top: 50px;
        padding: 0 20px;
        color: #222;
        box-sizing: border-box;
    }
    /* ---------------------메인 헤더--------------------- */
    #pl_main_header{
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        padding-bottom: 5px;
        width: 100%;
        border-bottom: 2px solid #666;
    }
    .pl_main_header_title{
        font-size: 25px;
        font-weight: bold;
    }
    #pl_main_header_sel_box{
        margin-top: 15px;
    }

    /* ---------------------상품페이지 섹션--------------------- */
    #pl_main_section{
        display: flex;
        flex-direction: row;
        justify-content: space-between;

        margin-top: 20px;
        width: 100%;
    }
    #pl_main_products{
        width: 87%;
        margin-top: 5px;
        /* background-color: greenyellow; */
    }

    /* ---------------------섹션 좌측 옵션 테이블--------------------- */
    #opt_table{
        border-spacing: 0;
        border-collapse: collapse;

        width: 150px;
        /* background-color: aquamarine; */
    }
        
    #opt_table th{
        text-align: left;
        font-size: 17px;
        padding: 5px 0px;
    }
    #opt_table tr:not(:first-child) th{
        border-top: 1px solid lightgray;
    }
    #opt_table td{
        padding-bottom: 3px;
    }    
    #opt_table td input{
        margin-top: 6px;
        width: 14px;
        height: 14px;
        
    }
    #opt_table td label{
        font-size: 14px;
        position: absolute;
        margin: 1px 5px;
    }

    /* ---------------------섹션 상품 표시 영역--------------------- */
    #p_box{
        width: 100%;
    }

    .p_inner_elements_box{
        display: flex;
        flex-flow: row;
        justify-content: flex-start;
        align-items: center;    
        width: 100%;
        box-sizing: border-box;
    }
    .p_products{
        width: 230px;
/*         background-color: aliceblue; */
        min-height: 350px;
        margin-right: 40px;
    }
    .p_inner_elements_box:not(:first-child){
        margin-top: 30px;
    }
    /* .p_inner_elements a:not(:nth-child(4n+1)) {
        margin-left: 52px;
    } */
    .p_img{
        width: 100%;
        height: 230px;
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
        font-size: 13px;
        font-weight: bold;
        color: #8b96a1;
        text-decoration: line-through;
    }
    .p_info_price_final{
        font-size: 18px;
        font-weight: bold;
    }
    .p_info_price_final span{
        font-size: 20px;
        color: rgb(255, 59, 32);
    }
    .p_info_stars{
        font-size: 13px;
        color: #8b96a1;
    }
    </style>
<script>
	$(function(){
		
		let category = '${param.category}';		
		
		$(".opt_checkbox").change(function(){
			  let checkedItems = $(".opt_checkbox:checked");
			  
			  let checkedMap = {};
			  
			  

			  checkedItems.each(function(){
				  let key = this.id.charAt(0);
				  let value = this.value;				  

		            if (!checkedMap[key]) {
		                checkedMap[key] = [];  // 배열 초기화
		            }

		            checkedMap[key].push(value);  // 배열에 값 추가
			  });
			  
			  console.log(checkedMap);
			  console.log(checkedMap[1]);
			  
			  $.ajax({
				 type: "post",
				 url: "update_product_list.do?category="+category,
				 data : JSON.stringify(checkedMap),
				 dataType: "json",
				 contentType:"application/json;charset=UTF-8",
				 success: function(response){					 					 
					 updateProduct(response);
					 console.log("ajax 통신 성공");
				 },
				 error: function(error){
					 alert("ajax 통신 테스트 실패")
				 }
			  });
			  
		});
	});
	
	function updateProduct(response) {
	    var pl_main_products = $("#pl_main_products");
	    
	    pl_main_products.empty();

	    var rebuilding = "<div id='p_box'><div class='p_elements'><div class='p_inner_elements'>";
	    
	    for (var i = 0; i < response.length; i++) {
	        rebuilding += "<div class='p_inner_elements_box'>";
	        
	        for (var j = i * 4; j < Math.min((i + 1) * 4, response.length); j++) {
	            var product = response[j];
	            if (product !== null) {
	                rebuilding += "<div class='p_products'>";
	                rebuilding += "<a href='product_view.do?p_id=" + product.p_id + "'>";
	                rebuilding += "<div class='p_img'><img src='#' alt='#'></div>";
	                rebuilding += "<div class='p_info'>";
	                rebuilding += "<div class='p_info_brand'>" + product.brand + "</div>";
	                rebuilding += "<div class='p_info_name'>" + product.p_name + "</div>";
	                
	                if (product.discount > 0) {
	                    rebuilding += "<div class='p_info_price'>" + formatNumber(product.price) + "원</div>";
	                }
	                
	                rebuilding += "<div class='p_info_price_final'>";
	                
	                if (product.discount > 0) {
	                    var discount = product.price * (product.discount / 100);
	                    rebuilding += "<span>" + product.discount + "% </span>";
	                    rebuilding += formatNumber(product.price - discount) + "원";
	                }else{
	                	rebuilding += formatNumber(product.price) + "원";
	                }
	                
	                rebuilding += "</div>";
	                rebuilding += "<div class='p_info_stars'>★ 4.5 (1043)</div>";
	                rebuilding += "</div></a></div>";
	            }
	        }
	        
	        rebuilding += "</div>";
	    }
	    
	    rebuilding += "</div></div></div></div>";
	    
	    pl_main_products.append(rebuilding);
	}

	function formatNumber(number) {
	    return new Intl.NumberFormat('ko-KR').format(number);
	}
</script>
</head>
<body>

<!-- 헤더 -->
<header><jsp:include page="../common/header2.jsp"></jsp:include></header>

<section>
    <div id="pl_area">
        <div id="pl_area_contents">

            <!-- 상단 버튼 모음 -->
            <div id="pl_header">
                <div id="pl_header_btn_box">
                    <div class="quick_btn"><a href="product_list.do?"><img src="#" alt="#"></a></div>
                    <div class="quick_btn"><a href="product_list.do?category=AA"><img src="#" alt="#"></a></div>
                    <div class="quick_btn"><a href="product_list.do?category=BB"><img src="#" alt="#"></a></div>
                    <div class="quick_btn"><a href="product_list.do?category=CC"><img src="#" alt="#"></a></div>
                    <div class="quick_btn"><a href="product_list.do?category=DD"><img src="#" alt="#"></a></div>                    
                </div>
            </div>

            <!-- 상품 페이지 메인영역 -->
            <div id="pl_main">
                <!-- 메인영역 헤더 -->
                <div id="pl_main_header">
                    <div class="pl_main_header_title">
                        <c:choose>
                            <c:when test="${param.category eq 'AA'}">육류</c:when>
                            <c:when test="${param.category eq 'BB'}">가공</c:when>
                            <c:when test="${param.category eq 'CC'}">수산</c:when>
                            <c:when test="${param.category eq 'DD'}">야채</c:when>
                            <c:otherwise>전체상품</c:otherwise>
                        </c:choose>                    
                    </div>
                    <div id="pl_main_header_sel_box">
                        <select id="sel1">
                            <option value="1">추천순</option>
                            <option value="2">판매량순</option>
                            <option value="3">낮은가격순</option>
                            <option value="4">높은가격순</option>
                            <option value="5">할인율순</option>
                            <option value="6">신상품순</option>
                            <option value="7">리뷰많은순</option>
                        </select>
                        <select id="sel2">
                            <option value="40">40개씩</option>
                            <option value="60">60개씩</option>
                            <option value="80">80개씩</option>
                            <option value="100">100개씩</option>
                        </select>
                    </div>
                </div>
            

                <div id="pl_main_section">
                    <!-- 메인영역 좌측 옵션 박스 -->
                    <div id="pl_main_opt">
                        <form>
                            <table id="opt_table">
                                <c:forEach items="${categoryList}" var="category" varStatus="status">
	                                <tr>
	                                    <th>${category.key}</th>
	                                </tr>
	                                <c:forEach items="${category.value}" var="item" varStatus="s">
	                                   <tr>
	                                       <td>
	                                           <input type="checkbox" id="${status.index+1}_${s.index+1}" class="opt_checkbox" value="${item}"/>
	                                           <label for="${status.index+1}_${s.index+1}">${item}</label>
	                                       </td>
	                                   </tr>
	                                </c:forEach>
                                </c:forEach>
                            </table>
                        </form>

                    </div><!-- end of pl_main_opt -->

                    <div id="pl_main_products">

                        <div id="p_box">
                            <div class="p_elements">
                                <div class="p_inner_elements">
                                    <c:forEach begin="0" end="${productList.size() div 4}" var="i">
                                        <div class="p_inner_elements_box">
                                            <c:forEach begin="${i*4}" end="${i*4+3}" var="j">
	                                            <div class="p_products">	                                                
                                                    <c:if test="${productList[j] ne null}">
                                                    <a href="product_view.do?p_id=${productList[j].p_id}">
	                                                    <div class="p_img"><img src="#" alt="#"></div>
	                                                    <div class="p_info">
	                                                        <div class="p_info_brand">${productList[j].brand}</div>
	                                                        <div class="p_info_name">${productList[j].p_name}</div>
	                                                        <c:if test="${productList[j].discount gt 0}">
					                                           <div class="p_info_price"><fmt:formatNumber value="${productList[j].price}" pattern="#,###" />원</div>
					                                        </c:if>
	                                                        <div class="p_info_price_final">
	                                                           <c:if test="${productList[j].discount gt 0}">
					                                                <span>${productList[j].discount}% </span>
					                                            </c:if>
	                                                           <c:set var="discount" value="${productList[j].price*(productList[j].discount/100)}"></c:set>
	                                                           <fmt:formatNumber value="${productList[j].price - discount}" pattern="#,###" />원
	                                                        </div>
	                                                        <div class="p_info_stars">★ 4.5 (1043)</div>
	                                                    </div>
	                                                    </a>
                                                    </c:if>		                                            
			                                        
												</div>
											</c:forEach>                                                                                
                                        </div>
                                    </c:forEach>
                                    
                                                                        
                                </div>
                                
                            </div>
                            
                        </div>

                    </div><!-- end of pl_main_products -->

                </div><!-- end of pl_main_section -->

            </div><!-- end of pl_main -->

        </div><!-- end of pl_area_contents -->
    </div>
</section>

<!-- 푸터 -->
<footer><jsp:include page="../common/footer.jsp"></jsp:include></footer>

</body>
</html>