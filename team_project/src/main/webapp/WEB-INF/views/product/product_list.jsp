<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>상품 페이지</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- <script src="../resources/js/cart2.js?v=1234"></script> -->

<style>
/* ---------------------전체 요소 공통--------------------- */
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
}

/* a태그 공통 */
a {
	text-decoration: none;
	color: #222;
}

button:hover, #sel_box:hover {
	background-color: #222 !important;
	color: white !important;
}

/* ---------------------상품 페이지--------------------- */
#pl_area {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
}

#pl_area_contents {
	width: 1280px;
	margin-top: 20px;
}

/* ---------------------섹션--------------------- */
section {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-bottom: 100px;
	width: 100%;
	min-width: 1280px;
}

/* ---------------------상품페이지 상단 버튼--------------------- */
#pl_header {
	width: 100%;
	height: 100px;
	/*         background-color: aquamarine; */
}

#pl_header_btn_box {
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
	align-items: center;
	width: 100%;
	height: 100%;
	padding-left: 180px;
}

.quick_btn {
	position: relative;
	width: 70px;
	height: 70px;
	margin-top: 35px;
	margin-right: 20px;
	border-radius: 15px;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1); /* 수정 가능 */
}

.quick_btn a {
	position: absolute;
	width: 100%;
	height: 100%;
}

.quick_btn img {
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: chartreuse;
}

.quick_btn p {
	position: absolute;
	top: 100%;
	width: 100%;
	color: #333;
	font-size: 14px;
	text-align: center;
}

/* ---------------------상품페이지 메인--------------------- */
#pl_main {
	width: 100%;
	margin-top: 50px;
	padding: 0 20px;
	color: #222;
	box-sizing: border-box;
}
/* ---------------------메인 헤더--------------------- */
#pl_main_header {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	padding-bottom: 5px;
	width: 100%;
	border-bottom: 2px solid #666;
}

.pl_main_header_title {
	font-size: 25px;
	font-weight: bold;
}

#pl_main_header_sel_box {
	margin-top: 15px;
}

/* ---------------------상품페이지 섹션--------------------- */
#pl_main_section {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	margin-top: 20px;
	width: 100%;
}

#pl_main_products {
	width: 87%;
	margin-top: 5px;
	/* background-color: greenyellow; */
}

/* ---------------------섹션 좌측 옵션 테이블--------------------- */
#opt_table {
	border-spacing: 0;
	border-collapse: collapse;
	width: 150px;
	/* background-color: aquamarine; */
}

#opt_table th {
	text-align: left;
	font-size: 17px;
	padding: 5px 0px;
}

#opt_table tr:not(:first-child) th {
    padding-top: 10px;
	border-top: 1px solid lightgray;
}

#opt_table tr:nth-child(2) td:last-child {
	padding-bottom: 10px
}

#opt_table td {
	padding-bottom: 3px;
}

#opt_table td input {
	margin-top: 6px;
	width: 14px;
	height: 14px;
}

#opt_table td label {
	font-size: 14px;
	position: absolute;
	margin: 1px 5px;
}

/* ---------------------섹션 상품 표시 영역--------------------- */
#p_box {
	width: 100%;
}

.p_inner_elements_box {
	display: flex;
	flex-flow: row;
	justify-content: flex-start;
	align-items: center;
	width: 100%;
	box-sizing: border-box;
}

.p_products {
	width: 230px;
	/*         background-color: aliceblue; */
	min-height: 350px;
	margin-right: 40px;
}

.p_inner_elements_box:not(:first-child) {
	margin-top: 30px;
}
/* .p_inner_elements a:not(:nth-child(4n+1)) {
        margin-left: 52px;
    } */
.p_img {
	position: relative;
	width: 100%;
	height: 230px;
	margin-bottom: 5px;
	background-color: gold;
}

.p_img a {
	display: block;
	width: 100%;
	height: 100%;
}

.p_img_opt-box {
	width: 100%;
	height: 40px;
	position: absolute;
	text-align: center;
	bottom: 0;
	user-select: none;
	background-color: rgba(255, 255, 255, 0.9);
}

.p_img_opt-box-innerDiv {
	height: 100%;
	display: flex;
	align-items: center;
	flex-direction: row;
	justify-content: center;
}

.p_img_opt-box-innerDiv button {
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

.p_info_brand {
	font-size: 14px;
	font-weight: bold;
}

.p_info_name {
	font-size: 15px;
}

.p_info_price {
	font-size: 13px;
	font-weight: bold;
	color: #8b96a1;
	text-decoration: line-through;
}

.p_info_price_final {
	font-size: 18px;
	font-weight: bold;
}

.p_info_price_final span {
	font-size: 20px;
	color: rgb(255, 59, 32);
}

.p_info_stars {
	font-size: 13px;
	color: #8b96a1;
}

.thumbnail {
	width: 230px;
	height: 230px;
}

.soldout {
	position: absolute;
	width: 230px;
	height: 230px;
	background-color: rgba(100, 100, 100, 0.5);
	text-align: center;
	line-height: 230px;
	font-size: 17px;
	color: white;
	font-weight: bold;
	user-select: none;
}
</style>
<script>
	$(function() {		

		let check_request = $("#check_request");
		let check_param = check_request.val();

		let opt_checkbox = $(".opt_checkbox");
		opt_checkbox.each(function() {
			if (check_param == $(this).val()) {
				let check_this = $(this); // 현재 요소를 변수에 저장
				setTimeout(function() {
					check_this.click(); // 저장한 변수 사용
				}, 1);
			}
		});
	    		
		/* ---------------------상품에 마우스 커서 호버 옵션박스------------------- */
		//*** 상품 이미지 마우스 커서 호버 이벤트 처리 ***//
		$(document).on("mouseenter", ".p_img", function() {
			$(this).find(".p_img_opt-box").stop().fadeIn(300);
		});

		let perants_div = $(".p_inner_elements_box");

		perants_div.each(function() {
			let first_div = $(this).find("div:first-child");
			let p_id = first_div.text().trim();
			if (p_id == "") {
				$(this).hide();
			}

		});

		let category = '${param.category}';

		$(document).on("mouseleave", ".p_img", function() {
			$(this).find(".p_img_opt-box").stop().fadeOut(300);
		});

		/* ---------------------찜목록 상품 추가, 삭제--------------------- */
		//*** 찜목록 상품 추가 메서드 ***//
		function addWish(p_id) {

			let m_idx = parseInt($("#m_idx").val());

			if (isNaN(m_idx)) {
				alert("로그인 후 이용 가능합니다.");
				$("#shadow").show();
			} else {

				$.ajax({
					type : "POST",
					url : "add_wishList.do",
					data : {
						m_idx : m_idx,
						p_id : p_id,
					},
					success : function(response) { // 해당 상품 수량이 업데이트된 새로운 장바구니 객체 반환
						if (response === "success") { // 수량 업데이트가 성공한 경우
							alert("찜목록에 추가되었습니다!");

							/* 페이지 새로고침 없이 class를 수정하여 업데이트된 세션객체의 찜목록과
							 *  같은 상태로 임의변경 */
							$('.p_id[value=' + p_id + ']').siblings(".w_btn")
									.text("❤").css('color', 'red').addClass(
											"inWish");
						} else if (response === "max") {
							alert("찜목록이 꽉 찼습니다! (최대 100개)");
						} else {
							alert("찜목록 추가에 실패했습니다.");
						}
					}.bind(this), // 증감 버튼이 속한 행으로 한정
					error : function() {
						alert("오류가 발생하였습니다.");
					}
				}); // end of ajax
			}
		}

		//*** 찜목록 상품 삭제 메서드 ***//
		function removeWish(p_id) {

			let m_idx = parseInt($("#m_idx").val());

			if (isNaN(m_idx)) {
				alert("로그인 후 이용 가능합니다.");
				$("#shadow").show();
			} else {

				$.ajax({
					type : "POST",
					url : "../mypage/remove_wishList.do",
					data : {
						m_idx : m_idx,
						p_id : p_id,
					},
					success : function(response) { // 해당 상품 수량이 업데이트된 새로운 장바구니 객체 반환
						if (response === "success") { // 수량 업데이트가 성공한 경우
							alert("찜목록에서 삭제되었습니다!");

							/* 페이지 새로고침 없이 class를 수정하여 업데이트된 세션객체의 찜목록과
							 *  같은 상태로 임의변경 */
							$('.p_id[value=' + p_id + ']').siblings(".w_btn")
									.text("♡").css('color', '#222')
									.removeClass("inWish");
						} else {
							alert("찜목록 삭제에 실패했습니다.");
						}
					}.bind(this), // 증감 버튼이 속한 행으로 한정
					error : function() {
						alert("오류가 발생하였습니다.");
					}
				}); // end of ajax

			}
		}

		//*** 찜버튼 클릭 이벤트 처리 ***//
		$(".w_btn").click(function() {

			if ($(this).hasClass('inWish')) {

				let p_id = [$(this).siblings(".p_id").val()];
				removeWish(p_id);
			} else {

				let p_id = $(this).siblings(".p_id").val();
				addWish(p_id);
			}
		});

		let optCheckbox = $(".opt_checkbox");
		let selectSort = $("#select_sort");
		let keyword = $("#keyword").val();

		optCheckbox.change(function() {
			changeList();
		});

		selectSort.change(function() {
			changeList();
		});

		function changeList() {
			let checkedItems = $(".opt_checkbox:checked");
			let checkedMap = {};
			let selectedSort = selectSort.val();

			checkedItems.each(function() {
				let key = this.id.charAt(0);
				let value = this.value;

				if (!checkedMap[key]) {
					checkedMap[key] = []; // 배열 초기화
				}

				checkedMap[key].push(value); // 배열에 값 추가
			});

			console.log(checkedMap);
			console.log(checkedMap[1]);

			$.ajax({
				type : "post",
				url : "update_product_list.do?category=" + category
						+ "&selectedSort=" + selectedSort + "&keyword="
						+ keyword,
				data : JSON.stringify(checkedMap),
				dataType : "json",
				contentType : "application/json;charset=UTF-8",
				success : function(response) {
					updateProduct(response);
					console.log("ajax 통신 성공");
				},
				error : function(error) {
					alert("ajax 통신 테스트 실패");
				}
			});
		}

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
					if (product.stock == 0) {
						rebuilding += "<div class='p_img'><div class='soldout'>품절</div><a href='product_view.do?p_id=" + product.p_id + "'><img class='thumbnail' src='../resources/uploads/" + product.saveFile1 + "' alt='" + product.p_name + "'></a>";
					} else {
						rebuilding += "<div class='p_img'><a href='product_view.do?p_id=" + product.p_id + "'><img class='thumbnail' src='../resources/uploads/" + product.saveFile1 + "' alt='" + product.p_name + "'></a>";
					}
					
					console.log("테스트");
					console.log("p_id : " + product.p_id);
					
					let wishList = "${wishList}";
				    					
					/* 여기부터 장바구니, 찜 버튼 부분 */
					rebuilding += "<div style='display:none' class='p_img_opt-box'>";
					rebuilding += "<div class='p_img_opt-box-innerDiv'>";
					rebuilding += "<input type='hidden' class='p_id' value='"+ product.p_id + "'/>";
					rebuilding += "<input type='hidden' class='stock' value='"+ product.stock + "'/>";
					rebuilding += "<button type='button' class='c_btn' onclick='addCartBtn(this)'>🛒</button>";
					if (wishList != null && wishList.includes(product.p_id)) {
						rebuilding += "<button type='button' class='w_btn inWish' style='color:red;font-size:22px;'>❤</button>";
					} else {
						rebuilding += "<button type='button' class='w_btn noWish' style='font-size:20px;font-weight:bold;padding:0;height:30px'>♡</button>";
					}
					rebuilding += "</div></div></div>";
					/* 여기까지 장바구니, 찜 버튼 부분 */
					
					rebuilding += "<a href='product_view.do?p_id=" + product.p_id + "'>";                    
					rebuilding += "<div class='p_info'>";
					rebuilding += "<div class='p_info_brand'>" + product.brand
							+ "</div>";
					rebuilding += "<div class='p_info_name'>" + product.p_name
							+ "</div>";
					if (product.discount > 0) {
						rebuilding += "<div class='p_info_price'>"
								+ formatNumber(product.price) + "원</div>";
					}

					rebuilding += "<div class='p_info_price_final'>";

					if (product.discount > 0) {
						var discount = product.price * (product.discount / 100);
						rebuilding += "<span>" + product.discount + "% </span>";
						rebuilding += formatNumber(product.price - discount)
								+ "원";
					} else {
						rebuilding += formatNumber(product.price) + "원";
					}

					rebuilding += "</div>";
					if (product.reviews > 0) {
						rebuilding += "<div class='p_info_stars'>★ "
								+ product.stars_avg + " (" + product.reviews
								+ ")</div>";
					}
					
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
	
	function addCartBtn(obj){
		// obj를 jQuery 객체로 감싸기
	    let $obj = $(obj);
	    		
	    // 형제 요소들에 접근하기 위해 parent()를 사용하여 부모 요소에 접근 후 find()로 찾기
	    let stock = $obj.parent().find(".stock").val();
	    	    
	    if (stock == 0) {
	        alert("품절상품은 담을 수 없습니다.");
	        return;
	    }

	    let p_idArray = [$obj.parent().find(".p_id").val()];
	    console.log(p_idArray);

	    addCart(p_idArray);
    };
    
    /* ---------------------장바구니 상품 추가--------------------- */
    //*** 장바구니에 선택한 상품 추가 ***//
    function addCart(p_idArray) {
        
        let m_idx = parseInt($("#m_idx").val());        
        
        if (isNaN(m_idx)) {
            alert("로그인 후 이용 가능합니다.");
            $("#shadow").show();
        } else {
        
            $.ajax({
                type: "POST",
                url: "../cart/addCart.do",
                data: {
                    p_id: p_idArray,
                },
                success: function (response) { // 해당 상품 수량이 업데이트된 새로운 장바구니 객체 반환
                   if (response === "success") { // 수량 업데이트가 성공한 경우
                       showShadow_addCart();
                       /* alert("상품이 장바구니에 추가되었습니다.") */
                        //페이지 새로고침
                    } else if (response === "max"){
                        alert("해당 상품이 장바구니 최대 상품 수량을 초과했습니다.\n(최대 20개)");
                    } else {
                        alert("장바구니 상품 추가에 실패했습니다.");
                    }
                },
                error: function () {
                    alert("오류가 발생하였습니다.");
                }
            }); // end of ajax
        }
            
    }  
    
    /* 장바구니 추가 알림창 열기 메서드 */
    function showShadow_addCart() {
    	let shadow_addCart = $("#shadow_addCart");
    	
        shadow_addCart.css({
            'display': 'block',
            'z-index': '5000'
        });
        setTimeout(hideShadow_addCart, 500);
    }

    /* 장바구니 추가 알림창 닫기 메서드 */
    function hideShadow_addCart() {
    	let shadow_addCart = $("#shadow_addCart");
    	
        shadow_addCart.fadeOut(500, function() {
            $(this).css({
                'display': 'none',
                'z-index': '0'
            });
        });
        $("body").css('overflow-y', 'visible');
    };
	
</script>
</head>
<body>

	<!-- 헤더 -->
	<header><jsp:include page="../common/header2.jsp"></jsp:include></header>

	<section>
		<div id="pl_area">
			<div id="pl_area_contents">
				<input type="hidden" id="m_idx" value="${member.m_idx}"> <input
					type="hidden" id="check_request" value="${param.check}" /> <input
					type="hidden" id="keyword" value="${keyword}" />
				<!-- 상단 버튼 모음 -->
				<div id="pl_header">
					<div id="pl_header_btn_box">
						<div class="quick_btn">
							<a href="product_list.do?"><img
								src="../resources/img/ALL.png" alt="전체">
							<p>전체</p></a>
						</div>
						<div class="quick_btn">
							<a href="product_list.do?category=AA"><img
								src="../resources/img/육류.jpg" alt="육류">
							<p>육류</p></a>
						</div>
						<div class="quick_btn">
							<a href="product_list.do?category=BB"><img
								src="../resources/img/가공.jpg" alt="가공">
							<p>가공</p></a>
						</div>
						<div class="quick_btn">
							<a href="product_list.do?category=CC"><img
								src="../resources/img/수산.jpg" alt="수산">
							<p>수산</p></a>
						</div>
						<div class="quick_btn">
							<a href="product_list.do?category=DD"><img
								src="../resources/img/야채.jpg" alt="야채">
							<p>야채</p></a>
						</div>
					</div>
				</div>

				<!-- 상품 페이지 메인영역 -->
				<div id="pl_main">
					<!-- 메인영역 헤더 -->
					<div id="pl_main_header">
						<div class="pl_main_header_title">
							<c:choose>
								<c:when test="${keyword eq null}">
									<c:choose>
										<c:when test="${param.category eq 'AA'}">육류</c:when>
										<c:when test="${param.category eq 'BB'}">가공</c:when>
										<c:when test="${param.category eq 'CC'}">수산</c:when>
										<c:when test="${param.category eq 'DD'}">야채</c:when>
										<c:otherwise>전체</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
                                '${keyword}'(으)로 검색된 상품 ${productList.size()}건
                            </c:otherwise>
							</c:choose>
						</div>
						<div id="pl_main_header_sel_box">
							<select id="select_sort">
								<option value="1">추천순</option>
								<option value="2">판매량순</option>
								<option value="3">낮은가격순</option>
								<option value="4">높은가격순</option>
								<option value="5">할인율순</option>
								<option value="6">신상품순</option>
								<option value="7">리뷰많은순</option>
								<option value="8">별점높은순</option>
							</select>
						</div>
					</div>


					<div id="pl_main_section">
						<!-- 메인영역 좌측 옵션 박스 -->
						<div id="pl_main_opt">
							<form>
								<table id="opt_table">
									<c:forEach items="${categoryList}" var="category"
										varStatus="status">
										<tr>
											<th>${category.key}</th>
										</tr>
										<c:forEach items="${category.value}" var="item" varStatus="s">
											<tr>
												<td><input type="checkbox"
													id="${status.index+1}_${s.index+1}" class="opt_checkbox"
													value="${item}" /> <label
													for="${status.index+1}_${s.index+1}">${item}</label></td>
											</tr>
										</c:forEach>
									</c:forEach>
								</table>
							</form>

						</div>
						<!-- end of pl_main_opt -->

						<div id="pl_main_products">

							<div id="p_box">
								<div class="p_elements">
									<div class="p_inner_elements">
										<c:forEach begin="0" end="${productList.size() div 4}" var="i">
											<div class="p_inner_elements_box">
												<c:forEach begin="${i*4}" end="${i*4+3}" var="j">
													<div class="p_products">
														<c:if test="${productList[j] ne null}">
															<div class="p_img">
																<c:if test="${productList[j].stock eq 0}">
																	<div class="soldout">품절</div>
																</c:if>
																<a href="product_view.do?p_id=${productList[j].p_id}"><img
																	class="thumbnail"
																	src="../resources/uploads/${productList[j].saveFile1}"
																	alt="#"></a>
																<div style="display: none" class="p_img_opt-box">
																	<div class="p_img_opt-box-innerDiv">
																		<input type="hidden" class="p_id" value="${productList[j].p_id}">
																        <input type="hidden" class="stock" value="${productList[j].stock}" />
																		<button type="button" class="c_btn" onclick='addCartBtn(this)'>🛒</button>
																		<c:choose>
																			<c:when
																				test="${!empty wishList and wishList.contains(productList[j].p_id)}">
																				<button type="button" class="w_btn inWish"
																					style="color: red; font-size: 22px;">❤</button>
																			</c:when>
																			<c:otherwise>
																				<button type="button" class="w_btn noWish"
																					style="font-size: 20px; font-weight: bold; padding: 0; height: 30px">♡</button>
																			</c:otherwise>
																		</c:choose>
																	</div>
																</div>
															</div>
															<a href="product_view.do?p_id=${productList[j].p_id}">
																<div class="p_info">
																	<div class="p_info_brand">${productList[j].brand}</div>
																	<div class="p_info_name">${productList[j].p_name}</div>
																	<c:if test="${productList[j].discount gt 0}">
																		<div class="p_info_price">
																			<fmt:formatNumber value="${productList[j].price}"
																				pattern="#,###" />
																			원
																		</div>
																	</c:if>
																	<div class="p_info_price_final">
																		<c:if test="${productList[j].discount gt 0}">
																			<span>${productList[j].discount}% </span>
																		</c:if>
																		<c:set var="discount"
																			value="${productList[j].price*(productList[j].discount/100)}"></c:set>
																		<fmt:formatNumber
																			value="${productList[j].price - discount}"
																			pattern="#,###" />
																		원
																	</div>
																	<c:if test="${productList[j].reviews ne 0}">
																		<div class="p_info_stars">★
																			${productList[j].stars_avg}
																			(${productList[j].reviews})</div>
																		<!-- 괄호 안 숫자는 리뷰 갯수 -->
																	</c:if>
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

						</div>
						<!-- end of pl_main_products -->

					</div>
					<!-- end of pl_main_section -->

				</div>
				<!-- end of pl_main -->

			</div>
			<!-- end of pl_area_contents -->
		</div>
	</section>

	<!-- 푸터 -->
	<footer><jsp:include page="../common/footer.jsp"></jsp:include></footer>

</body>
</html>