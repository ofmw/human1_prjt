<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>찜목록</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <style>
        /* Noto Sans KR */
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
        *{margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}

		body{min-width: 1280px;}

        /* 섹션 */
        section{
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* a태그 공통 */
        a{text-decoration: none; color: black;}
        a:hover{text-decoration: underline;}
        /* list 공통 */
        ul{list-style: none;}
        /* 버튼 및 선택 요소 공통 */
        button:hover, #sel_box:hover{
        	background-color: #222 !important;
        	color: white;
        }
        
        #mp_header_area li span:hover{
	    	text-decoration: underline;
	    	cursor: pointer;
	    }

        /* ---------------------마이페이지 헤더--------------------- */
        #mp_header_area{
            display: flex;
            justify-content: space-between;

            width: 1280px;
            height: 280px;
            /* background-color: rgb(230, 230, 230); */

            margin: 40px 0;
        }

        /* 마이페이지 헤더 내부 요소 공통 */
        .mp_header_obj{
            display: flex;
            flex-direction: column;

            width: 426px;
            height: 100%;
            background-color: rgb(250, 250, 250);

            padding: 30px 30px;
            box-sizing: border-box
        }
        /* 마이페이지 헤더 내부 요소 제목 공통(쿠폰, 포인트) */
        .mp_header_obj_title{font-size: 23px;}

        /* 마이페이지 헤더 유저 이름 */
        #mp_header_user_name{font-size: 35px; font-weight: bold;}
        /* 마이페이지 헤더 유저 메뉴 */
        #mp_header_user_menu ul{
            font-size: 16px;
            margin-top: 40px;
        }
        #mp_header_user_menu li{margin: 10px 0;}
        #mp_header_user_menu a{color: #222;}
        
        /* 마이페이지 헤더 쿠폰 공통 */
        #mp_header_coupon{color: #222;}
        /* 마이페이지 헤더 소지 쿠폰 영역 */
        #mp_header_coupon_num{margin-top: 15px;}
        /* 소지 쿠폰 숫자 */
        #mp_header_coupon_num span{
            font-weight: bold;
            font-size: 20px;
            margin-right: 5px;
        }
        /* 마이페이지 헤더 쿠폰 정보 영역 */
        #mp_header_coupon_info{margin-top: 50px;}
        .mp_coupon{
            display: flex;
            justify-content: space-between;

            margin: 5px 0;

            font-size: 16px;
            color: #444;
        }
        /* 마이페이지 헤더 포인트 영역 공통 */
        #mp_header_point{color: #222;}
        /* 마이페이지 헤더 소지 포인트 */
        #mp_header_point_num{margin-top: 15px; font-size: 20px;}

        /* ---------------------마이페이지 내용--------------------- */
        #mp_main_area{
            display: flex;
            flex-direction: row;
            justify-content: space-between;

            width: 1280px;
            /* background-color: plum; */
        }

        /* ---------------------마이페이지 내용 좌측 메뉴영역--------------------- */
        #mp_main_menu{
            display: flex;
            flex-direction: column;

            width: 150px;
            height: 260px;
            border: 1px solid #e5e5e5;
            border-radius: 8px;

            padding: 20px 20px;
        }
        /* 메뉴 각 범주 사이 구분선 */
        #mp_main_menu_division{
            margin: 30px auto;
            content: "";
            width: 150px;
            height: 1px;
            background-color: #e5e5e5;
        }
        /* 메뉴 각 범주 타이틀 공통 */
        .mp_main_menu_title{
            font-size: 17px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        /* 메뉴 li 공통 */
        .mp_main_menu_list li{
            margin-top: 3px;
        }
        /* 메뉴 a태그 공통 */
        .mp_main_menu_list a{
            color: #777;
        }

        /* ---------------------마이페이지 메인영역--------------------- */
        #mp_main{
            width: 1000px;
            padding-right: 30px;
            /* background-color: aquamarine; */
        }
        .mp_main_obj{
            margin-bottom: 50px;
        }

        /* ---------------------마이페이지 메인영역 헤더--------------------- */
        #mp_w_main_header{
            display: flex;
            flex-direction: column;
            padding-bottom: 5px;
            border-bottom: 2px solid #222;
        }
        .mp_w_main_header_title{
            padding-bottom: 15px;
            font-size: 20px;
            font-weight: bold;
        }
        #mp_w_main_header_opt-box{
        	display: flex;
        	flex-direction: row;
        	justify-content: space-between;
        	
        	font-size: 12px;
        	user-select: none;
        }
        #mp_w_main_header_btn-box{
        	display: flex;
       	    align-items: center;
        }
        #sel-all{
	        position: relative;
	        top: 1.5px;
	    }
	    #mp_w_main_header_btn-box button {
		    margin-left: 10px;
		    font-size: 12px;
		    padding: 2px 5px;
			border: 1px solid #ddd;
		    border-radius: 3px;
		    background-color: #fcfcfc;
		}
        #sel_box{
            background-color: #fcfcfc;
		    padding: 2px 5px;
		    border: 1px solid #ddd;
		    border-radius: 3px;
        }
        #mp_main_wish_notice{
            border-top: 1px solid #e5e5e5;
            padding-top: 10px;
            font-size: 13px;
            color: #777;
        }

        /* ---------------------섹션 상품 표시 영역--------------------- */
        #mp_w_main_products{
            margin: 20px 0;
        }
        #w_box{
            width: 100%;
        }
		#w_empty{
			height: 367px;
			font-size: 20px;
			line-height: 367px;
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
            width: 230px;
            min-height: 367px;
        }
        .w_inner_elements{
            display: flex;
		    flex-direction: row;
		    flex-wrap: wrap;
		    justify-content: space-between;
        }
        /* .w_inner_elements a:not(:nth-child(4n+1)) {
            margin-left: 52px;
        } */
        .w_img{
        	position: relative;
            display: inline-block;
            width: 100%;
            height: 230px;
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
        	height: 40px;
            position: absolute;
            text-align: center;
            line-height: 40px;
            bottom: 0;
            left: 0;
            user-select: none;
            
            background-color: rgba(255,255,255,0.9);
        }
        .w_img_opt-box button{
        	margin: auto 0;
        	background-color: #fcfcfc;
        }
        .w_info_brand{
            font-size: 14px;
            font-weight: bold;
        }
        .w_info_name{
            font-size: 15px;
        }
        .w_info_price{
            font-size: 13px;
            font-weight: bold;
            color: #8b96a1;
        	text-decoration: line-through;
        }
        .w_info_price_final{
	        font-size: 18px;
	        font-weight: bold;
	    }
	    .w_info_price_final span{
	        font-size: 20px;
	        color: rgb(255, 59, 32);
	    }
        .w_info_stars{
            font-size: 13px;
            color: #8b96a1;
        }
        
        /* ---------------------페이지 내비게이션--------------------- */
        #mp_main_wish_p-nav{
        	margin: 10px 0;
        	text-align: center;
        	user-select: none;
        }
        #mp_main_wish_p-nav button{
        	width: 25px;
        	height: 25px;
        	margin: 0 5px;
        	padding: 2px 5px;
        	
		    font-size: 14px;
		    cursor: pointer;
		    
		    border: 1px solid #ddd;
		    border-radius: 3px;
		    background-color: #fcfcfc;
        }
    </style>
    
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
        	
        	/* ---------------------상품에 마우스 커서 호버 옵션박스------------------- */
        	//*** 상품 이미지 마우스 커서 호버 이벤트 처리 ***//
            $(document).on("mouseenter", ".w_img", function() {
			    $(this).find(".w_img_opt-box").stop().fadeIn(300);
			});
			
			$(document).on("mouseleave", ".w_img", function() {
			    $(this).find(".w_img_opt-box").stop().fadeOut(300);
			});
             
            /* ---------------------상품 선택 체크박스------------------- */
            //*** "전체선택" 체크박스 클릭 이벤트 처리 ***//
            $("#sel-all").click(function() {

                // "전체선택" 체크박스의 checked 속성값 가져옴 (체크여부 따라 true / false)
                let isChecked = $(this).prop("checked");

                // class가 "sel_product"인 모든 체크박스를 선택 또는 해제
                $(".w_checkbox").prop("checked", isChecked);
            });


            //*** 개별 상품 체크박스 클릭 이벤트 처리 ***//
            $(".w_checkbox").click(function() {

                // 개별 상품 체크박스가 모두 선택되었는지 확인
                let allChecked = $(".w_checkbox:checked").length === $(".w_checkbox").length;

                // "전체선택" 체크박스의 상태를 개별 상품 체크박스들과 동기화
                // 모든 개별 상품이 체크되어 있으면 "전체선택"의 checked 속성이 true
                // 하나라도 체크가 풀려 있으면 "전체선택"의 checked 속성이 false
                $("#sel-all").prop("checked", allChecked);
            });
            
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
      
            
          	//*** "선택품목 삭제" 버튼 클릭 이벤트 처리 (.sel_product 체크된 항목 삭제) ***//
            $("#sel-delete").click(function() {

                // class가 sel_product인 체크박스 중 체크된 항목들을 선택
                let target = $(".w_checkbox:checked");

                // 체크된 항목이 있는지 확인
                if(target.length > 0){ // 체크된 항목이 있을 경우

                    // 품목 삭제 여부 결정
                    let confirmed = confirm("선택한 품목을 삭제하시겠습니까?");

                    // "확인" 을 눌렀을 경우
                    if (confirmed) {

                        // 선택된 품목들의 정보 담을 배열 초기화
                        let p_idArray = [];

                        // 선택된 체크박스들이 속한 각각의 행에 대한 함수
                        target.each(function() {

                            // each()로 선택된 행의 정보 배열에 저장
                            let p_id = $(this).siblings('.w_img').find('.p_id').val();
                            p_idArray.push(p_id);            

                        }); // end of .each()

                        // 장바구니 테이블에 삭제 요청
                        removeWish(p_idArray);

                    } // end of if (confirmed)
                } else { // 체크된 항목이 없을 경우

                    alert("삭제할 품목을 선택해주세요.");
                } // end of if (checkedProducts.length > 0)
                
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
          	
         	//*** "선택품목 장바구니 추가" 버튼 클릭 이벤트 처리 (.sel_product 체크된 항목 추가) ***//
            $("#sel-addcart").click(function() {

                // class가 sel_product인 체크박스 중 체크된 항목들을 선택
                let target = $(".w_checkbox:checked");

                // 체크된 항목이 있는지 확인
                if(target.length > 0){ // 체크된 항목이 있을 경우

                    // 품목 삭제 여부 결정
                    let confirmed = confirm("선택한 품목을 장바구니에 추가하시겠습니까?");

                    // "확인" 을 눌렀을 경우
                    if (confirmed) {

                        // 선택된 품목들의 정보 담을 배열 초기화
                        let p_idArray = [];

                        // 선택된 체크박스들이 속한 각각의 행에 대한 함수
                        target.each(function() {

                            // each()로 선택된 행의 정보 배열에 저장
                            let p_id = $(this).siblings('.w_img').find('.p_id').val();
                            p_idArray.push(p_id);       

                        }); // end of .each()

                        // 장바구니 테이블에 추가 요청
                        addCart(p_idArray);

                    } // end of if (confirmed)
                } else { // 체크된 항목이 없을 경우

                    alert("추가할 품목을 선택해주세요.");
                } // end of if (checkedProducts.length > 0)
                
            });
            
            /* ---------------------찜목록 정렬--------------------- */
            //*** 기존 찜목록 순서 저장 ***//
    		let originalOrder = $(".w_products").toArray();
            
            //*** 찜목록 정렬 기준 설정 ***//
            function sortElements(option) {
            	
                alert("정렬 메서드 실행");
                
            	if (option === "name") {
            		
            		alert("이름 정렬 시도!");
            		
            		// 모든 w_products 요소 선택
            	    let products = $(".w_products");

            	    // 제품 이름과 해당 요소를 연결하는 배열 생성
            	    let productData = [];

            	    // 빈 제품 이름을 가진 요소 저장하는 배열 생성
            	    let emptyProductData = [];

            	    // 각 제품 요소를 순회하면서 데이터 추출
            	    products.each(function(index, element) {
            	    	let productName = $(element).find(".w_info_name a").text();
            	        if (productName.trim() === "") {
            	            emptyProductData.push($(element));
            	        } else {
            	            productData.push({ element: $(element), name: productName });
            	        }
            	    });

            	    // 유니코드 값을 기반으로 정렬 (한글이 영어보다 앞에 오는 문제 있음)
            	    productData.sort(function(a, b) {
					    return a.name.localeCompare(b.name, undefined, { numeric: true, sensitivity: 'base' });
					});

            	    // 정렬된 순서대로 제품 요소를 재배치
            	    let sortedProducts = productData.map(function(item) {
            	        return item.element;
            	    });
            	    
            	    sortedProducts = sortedProducts.concat(emptyProductData);
            	    $(".w_inner_elements").empty().append(sortedProducts);
            	    
            	} else if (option === "date") {
            		
            		alert("날짜 정렬 시도!");
            		$(".w_inner_elements").empty().append(originalOrder);
            	}
            	
            	// 정렬과 동시에 1페이지 보내기
            	changePage(1);
            	
            }
            
            //*** sel1 정렬 옵션 선택 이벤트 처리 ***//
            $("#sel1").change(function() {
                var selectedOption = $(this).val();
                
                if (selectedOption === "name") { // 이름순 정렬
                    sortElements("name");
                } else if (selectedOption === "date") { // 추가순 정렬
                	sortElements("date");
                }
            });
            
            /* ---------------------찜목록 표시 개수--------------------- */
            //*** 표시 개수 설정 ***//
            function showElements(option) {
                
            	console.log("표시 개수: "+option);
            	
            	let elements = $(".w_products");
            	let page = 0;
            	
            	if (elements.length > option) { // 찜 상품 개수가 선택한 표시 수보다 클 경우
                	
            		page = Math.ceil(elements.length / option);
            		
            		console.log("찜 개수: "+elements.length);
                    console.log("박스 및 페이지 수: "+page);
                    
                    setNav(page);
                    
                } else { // 찜 상품 개수가 선택한 표시 수보다 작을 경우
                	
                	page = 1; // 표시할 페이지 내비게이션 버튼 1개
                	
                	console.log("찜 개수: "+elements.length);
                    console.log("페이지 수: "+page);
                    
                    setNav(page);
                }
            }
            
          	//*** sel2 표시 옵션 선택 이벤트 처리 ***//
            $("#sel2").change(function() {
                let selectedOption = parseInt($(this).val());
                
                if (selectedOption === 4) { // 4개씩 표시
                    showElements(4);
                } else if (selectedOption === 8) { // 8개씩 표시
                	showElements(8);
                } else if (selectedOption === 100) { // 100개씩 표시
                	showElements(100);
                }
            });
            
            /* ---------------------페이지 내비게이션------------------- */
            //*** 페이지 내비게이션 버튼 생성 ***//
            function setNav(page) {
				console.log("내비게이션 메서드 표시 값: " + page);
			
				let navDiv = $("#mp_main_wish_p-nav"); // 페이지 내비게이션 버튼 생성 위치
				navDiv.empty(); // 기존 버튼 삭제
			
				for (var i = 1; i <= page; i++) {
					let pagebtn = $("<button>", {
						class: "p-nav",
						type: "button",
						value: i,
						text: i
					});
				
					navDiv.append(pagebtn);
				}
				
				// 페이지 버튼 생성과 동시에 1페이지로 보내기
				changePage(1);
				
			}
            
            //페이지 로드시 기본 버튼 생성
            setNav(Math.ceil($(".w_products").length / 4)); // 나누는 값은 기본 표시 개수 (20개, 테스트용은 4개)
            
          	//*** 페이지 변환 ***//
            function changePage(pageNum) {
            
          		// 찜 상품 개수
          		let elements = $(".w_products");
          		// 한 페이지에 표시할 상품 개수
          		let showAmount = parseInt($("#sel2").val());
          		
          		console.log("한 페이지에 표시할 상품 개수: " +showAmount);
          		
          		// 해당 페이지에서 표시할 첫번째 상품 인덱스 번호
          		let startIndex = (pageNum - 1) * showAmount;
          		// 해당 페이지에서 표시할 마지막 상품 인덱스 번호
          		let endIndex = startIndex + showAmount - 1;
          		console.log("해당 페이지 상품 인덱스 시작값: " +startIndex);
          		console.log("해당 페이지 상품 인덱스 끝값: " +endIndex);
          		
          		for (let i=0; i<elements.length; i++) {
          			if (i >= startIndex && i <= endIndex) {
          				console.log("현재 인덱스: " +i)
          	            $(elements[i]).show();
          	        } else {
          	        	console.log("else 현재 인덱스: " +i)
          	            $(elements[i]).hide();
          	        }
				}
          	}
          	
          	//*** 페이지 내비게이션 버튼 클릭 이벤트 처리 ***//
          	
          	$(document).on("click", ".p-nav", function() {

          		// 클릭한 페이지 내비게이션 버튼 값
          		let pageNum = parseInt($(this).val());
          		console.log(pageNum);
          		changePage(pageNum);
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
            <input type="hidden" id="session_m_idx" value="${member.m_idx}">
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

        <div id="mp_header_point" class="mp_header_obj">
            <div class="mp_header_obj_title">포인트</div>
            <div id="mp_header_point_num">30 P</div>
        </div>

    </div>

    <!-- 마이페이지 내용부분 -->
    <div id="mp_main_area">

        <div id="mp_main_menu">
            <div id="mp_main_menu_order">
                <div class="mp_main_menu_title">나의 주문관리</div>
                <div class="mp_main_menu_list">
                    <ul>
                        <!-- <li><a href="mypage 주문배송.html">주문/배송조회</a></li> -->
                        <li><a href="purchase_history.do">주문/배송조회</a></li>
                        <!-- <li><a href="#">자주 구매한 상품</a></li> -->
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

        <div id="mp_main">
			<div id="mp_main_wish" class="mp_main_obj">
                <!-- 메인영역 헤더 -->
                <div id="mp_w_main_header">
                    <div class="mp_w_main_header_title">찜목록</div>
                    <div id="mp_w_main_header_opt-box">
                    	<div id="mp_w_main_header_btn-box">
                    		<div id="sel_box">
								<input type="checkbox" id="sel-all">
								<label for="sel-all">전체선택 / 선택해제</label>
							</div>
							<button type="button" id="sel-delete">선택품목 삭제</button>
							<button type="button" id="sel-addcart">선택품목 장바구니 추가</button>
                    	</div>
	                    <div id="mp_w_main_header_sel-box">
                        	<select id="sel1">
                       			<option value="date">추가순</option>
                       			<option value="name">이름순</option>
							</select>
	                        <select id="sel2">
	                            <option value="4">4개씩</option>
	                            <option value="8">8개씩</option>
	                            <option value="100">100개씩</option>
	                        </select>
	                    </div>
                    </div>
                </div>

                <!-- 상품 게시 영역 -->
                <div id="mp_w_main_products">

                    <div id="w_box">
                    	<c:choose>
							<c:when test="${!empty wishList[0]}">
                       			<div class="w_inner_elements">
									<c:forEach begin="0" end="${(fn:length(wishList) - 1) div 4}" var="i">
		                            	<c:forEach begin="${i*4}" end="${i*4+3}" var="j">
								            <div class="w_products">
								            	<c:if test="${!empty wishList[j] and !empty p_info[j]}">
								            		<input type="checkbox" class="w_checkbox">
									                <div class="w_img">
									                	<a href="product_view.do?p_id=${p_info[j].p_id}"><img src="#" alt="#"></a>
									                	<div style="display:none" class="w_img_opt-box">
									                		<button type="button" class="c_btn">카</button>
									                		<button type="button" class="w_btn">♥</button>
									                		<input type="hidden" class="p_id" value="${p_info[j].p_id}">
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
	                            	</c:forEach>
                        		</div>
                        	</c:when>
                        	<c:otherwise>
								<div id="w_empty">찜목록에 상품이 없습니다!</div>
							</c:otherwise>
						</c:choose>
                    </div>

                </div><!-- end of mp_w_main_products -->
                
                <!-- 페이지 내비게이션 -->
                <div id="mp_main_wish_p-nav"></div>

                <div id="mp_main_wish_notice">
                    <ul>
                        <li>·&nbsp;&nbsp;찜목록은 최대 xx개까지 저장 가능합니다.</li>
                        <li>·&nbsp;&nbsp;품절 및 판매중단 상품은 표시되지 않습니다.</li>
                        <li>·&nbsp;&nbsp;추가할 내용</li>
                    </ul>
                </div>
            </div>

        </div>

    </div>

</section>

<!-- 푸터 -->
<footer><jsp:include page="../common/footer.jsp"></jsp:include></footer>

</body>
</html>