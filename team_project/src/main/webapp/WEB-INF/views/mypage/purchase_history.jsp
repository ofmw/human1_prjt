<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>주문/배송조회</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="../resources/css/purchase_history.css" rel="stylesheet">
    
    <style>
	    /* a태그 공통 */
		a:hover{text-decoration: underline;}
    	/* 버튼 및 선택 요소 공통 */
        button:hover, #sel_box:hover{
        	background-color: #222 !important;
        	color: white;
        }
        
        #mp_header_area li span:hover{
	    	text-decoration: underline;
	    	cursor: pointer;
	    }
	    /* ---------------------마이페이지 메인영역 헤더--------------------- */
        #mp_main_ph_header{
            display: flex;
            flex-direction: column;
            padding-bottom: 5px;
            border-bottom: 2px solid #222;
        }
        .mp_main_ph_header_title{
            padding-bottom: 15px;
            font-size: 20px;
            font-weight: bold;
        }
        #mp_main_ph_header_opt-box{
        	display: flex;
        	flex-direction: row;
        	justify-content: flex-end;
        	
        	font-size: 12px;
        	user-select: none;
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
        /* ---------------------페이지 내비게이션--------------------- */
        .p-nav{
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
        #mp_main_ph_search_quicksel{
        	user-select: none;
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
        	
            /* ---------------------버튼 색상 변경--------------------- */
	      	//*** 기간조회 라디오 버튼 클릭 이벤트 처리 ***//
	        $('.quicksel_radio').change(function() {
	            // 모든 radio를 순회한다.
	            $('.quicksel_radio').each(function() {
	            	
	                let checked = $(this).prop('checked');
	                let label = $(this).next();
	        
	                if(checked) {
	                	
	                    label.css({
	                    	'background-color': '#222',
	                    	'color': 'white'
	                    });
	                } else {
	                	
	                	label.css({
	                    	'background-color': '',
	                    	'color': ''
	                    });
	                }
	            });
	        });
	        /* ---------------------회원 탈퇴--------------------- */
            //*** 회원탈퇴 버튼 클릭 이벤트 처리 ***//
            $("#cancel").on("click", function(){
            	
            	let platform = $("#session_platform").val();
            	
            	if (platform === "omart") {
            		location.href = "omartCancel.do";
            	} else if (platform === "kakao") {
            		location.href = "kakaoCancel.do";
            	}
            	
            });
            
	        /* ---------------------주문/배송내역 표시 개수--------------------- */
            //*** 표시 개수 설정 ***//
            function showElements(option) {
                
            	console.log("표시 개수: "+option);
            	
            	let elements = countVisibleRows();
            	let page = 0;
            	
            	if (elements.length > option) { // 내역 개수가 선택한 표시 수보다 클 경우
                	
            		page = Math.ceil(elements.length / option);
            		
            		console.log("내역 개수: "+elements.length);
                    console.log("페이지 수: "+page);
                    
                    setNav(page);
                    
                } else { // 내역 개수가 선택한 표시 수보다 작을 경우
                	
                	page = 1; // 표시할 페이지 내비게이션 버튼 1개
                	
                	console.log("내역 개수: "+elements.length);
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
          	
            /* ---------------------기간조회 (라디오 버튼 프리셋)--------------------- */
            $('.quicksel_radio').change(function() {
            	let range = $(this).val();
            	console.log("기간조회 (프리셋): " +range);
            	
            	// 오늘 날짜
            	let today = new Date();
            	
            	// 오늘 날짜 기준으로 프리셋에 해당되는 날짜 계산
            	let targetDate = new Date();
            	switch (range) {
            		case "1": targetDate.setDate(targetDate.getDate() - 8); break;
            		case "2": targetDate.setDate(targetDate.getDate() - 16); break;
            		case "3": targetDate.setDate(targetDate.getDate() - 1); 
    							targetDate.setMonth(targetDate.getMonth() - 1); break;
            		case "4": targetDate.setDate(targetDate.getDate() - 1);
            					targetDate.setMonth(targetDate.getMonth() - 3); break;
            	}
            	
            	console.log("조회 날짜 구간: " +targetDate);
            	 
             	// 모든 td_date 요소 반복
                $('.td_date').each(function() {
                    let dateString = $(this).text();
                    let dateParts = dateString.split('-');
                    
                    // td에 있는 날짜 정보로 날짜 객체 생성
                    let tdDate = new Date(dateParts[0], dateParts[1] - 1, dateParts[2]);

                    // 기간조회 날짜와 비교하여 표시 여부 결정
                    if (tdDate > targetDate && tdDate <= today) {
                        // td 요소의 부모인 tr 요소를 보이게 설정
                        $(this).closest('tr').show();
                    } else {
                        // td 요소의 부모인 tr 요소를 숨김 처리
                        $(this).closest('tr').hide();
                    }
                });
             	
                setNav(Math.ceil(countVisibleRows() / 4));
            });
            
            /* ---------------------기간조회 (달력 선택)--------------------- */
            // 조회하기 버튼 클릭 이벤트 처리
		    $('#mp_main_ph_search_detail_btn').click(function() {
		    	
		        let startDate = new Date($('#cal-start').val());
		        let endDate = new Date($('#cal-end').val());
		        
		        startDate.setDate(startDate.getDate() - 1);
		        endDate.setDate(endDate.getDate() + 1);
		        
		        console.log("조회 날짜 구간(시작): " +startDate);
            	console.log("조회 날짜 구간(끝): " +endDate);
		
		        if (startDate > endDate) {
		        	
		            alert("시작 날짜는 종료 날짜보다 이전 날짜여야 합니다.");
		            $('#cal-end').val(''); // 종료 날짜 초기화
		            return;
		        } else {
		        	
	             	// 모든 td_date 요소 반복
	                $('.td_date').each(function() {
	                    let dateString = $(this).text();
	                    let dateParts = dateString.split('-');
	                    
	                    // td에 있는 날짜 정보로 날짜 객체 생성
	                    let tdDate = new Date(dateParts[0], dateParts[1] - 1, dateParts[2]);

	                    // 일주일 전 날짜와 비교하여 표시 여부 결정
	                    if (startDate < tdDate && tdDate < endDate) {
	                        // td 요소의 부모인 tr 요소를 보이게 설정
	                        $(this).closest('tr').show();
	                    } else {
	                        // td 요소의 부모인 tr 요소를 숨김 처리
	                        $(this).closest('tr').hide();
	                    }
	                });
	             	
	                setNav(Math.ceil(countVisibleRows() / 4));
		        }
		        
		    });
            
	        /* ---------------------페이지 내비게이션------------------- */
	        //*** 테이블의 tr 요소 개수 확인 ***//
	        function countVisibleRows() {
	            // 제목 행을 제외한 표시된 tr의 갯수 반환
	            return $('#tb_ph-list tr:not(:first-child, :last-child)').filter(function() {
	                return $(this).css('display') !== 'none';
	            }).length;
	        }
	        
            //*** 페이지 내비게이션 버튼 생성 ***//
            function setNav(page) {
            	
            	console.log("내역 개수: " +countVisibleRows());
            	console.log("페이지 개수: " +page);
			
				let navDiv = $("#td_pnav"); // 페이지 내비게이션 버튼 생성 위치
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
            setNav(Math.ceil(countVisibleRows() / 4)); // 나누는 값은 기본 표시 개수 (20개, 테스트용은 4개)
            
          	//*** 페이지 변환 ***//
            function changePage(pageNum) {
            
          		// 찜 상품 개수
          		let elements = $('#tb_ph-list tr:not(:first-child, :last-child)').filter(function() {
	                return $(this).css('display') !== 'none';
	            });
          		// 한 페이지에 표시할 내역 개수
          		let showAmount = parseInt($("#sel2").val());
          		
          		console.log("한 페이지에 표시할 상품 개수: " +showAmount);
          		
          		// 해당 페이지에서 표시할 첫번째 내역 인덱스 번호
          		let startIndex = (pageNum - 1) * showAmount;
          		// 해당 페이지에서 표시할 마지막 내역 인덱스 번호
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
    <script>
	    
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

        <!-- 마이페이지 좌측 메뉴 -->
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
                
                	<!-- 메인영역 헤더 -->
	                <div id="mp_main_ph_header">
	                    <div class="mp_main_title">주문/배송 내역</div>
	                    <div id="mp_main_ph_header_opt-box">
		                    <div id="mp_main_ph_header_sel-box">
		                        <select id="sel2">
		                            <option value="4">4개씩</option>
		                            <option value="8">8개씩</option>
		                            <option value="100">100개씩</option>
		                        </select>
		                    </div>
	                    </div>
	                </div>

                    <!-- 마이페이지 주문/배송내역  -->
                    
                    <div id="mp_main_ph_searchbar">

                        <div>기간조회</div>
                        <div id="mp_main_ph_search_seld">
                            <div id="mp_main_ph_search_quicksel">
                                <ul>
                                    <li><input type="radio" id="qs_r1" class="quicksel_radio" name="qs_r" value="1"><label for="qs_r1">1주일</label></li>
                                    <li><input type="radio" id="qs_r2" class="quicksel_radio" name="qs_r" value="2"><label for="qs_r2">15일</label></li>
                                    <li><input type="radio" id="qs_r3" class="quicksel_radio" name="qs_r" value="3"><label for="qs_r3">1개월</label></li>
                                    <li><input type="radio" id="qs_r4" class="quicksel_radio" name="qs_r" value="4"><label for="qs_r4">3개월</label></li>
                                </ul>
                            </div>
                        </div>

                        <div class="mp_main_ph_search_detail">
                            <input type="date" class="cal_date" id="cal-start">
                            <span id="cal_hipen">~</span>
                            <input type="date" class="cal_date" id="cal-end">
                            <div><input type="button" value="조회하기" id="mp_main_ph_search_detail_btn"></div>
                        </div>

                    </div>

                    <!-- 마이페이지 주문/배송내역 table -->
                    <div id="mp_main_ph_content">
                        <table id="tb_ph-list">
                            <colgroup>
                                <col style="width:9%;">
                                <col style="width:19%;">
                                <col style="width:48%;">
                                <col style="width:10%;">
                                <col style="width:14%;">
                            </colgroup>
                            <tr id="mp_main_ph_content_header">
                                <th scope="col">구매일자</th>
                                <th scope="col">주문번호</th>
                                <th scope="col">구매상품</th>
                                <th scope="col">배송상태</th>
                                <th scope="col">선택</th>
                            </tr>
                            <c:choose>
                            	<c:when test="${!empty phInfo}">
		                            <c:forEach begin="0" end="${fn:length(phInfo) - 1}" var="i">
			                            <tr>
			                                <td class="td_date"><fmt:formatDate value="${phInfo[i].order_date}" pattern="yyyy-MM-dd"/></td>
			                                <td class="td_ordernum">${phInfo[i].order_idx}</td>
			                                <td class="td_pname">
				                                <div>
				                                	<a href="order_detail.do?order_idx=${phInfo[i].order_idx}">
				                                		[${phfInfo[i].brand}] ${phfInfo[i].p_name} ${phfInfo[i].standard}${phfInfo[i].unit}
				                                	</a>
			                                	</div>
			                                	<c:if test="${phInfo[i].p_amount gt 1}"><div class="extra-products">외 ${phInfo[i].p_amount - 1}건</div></c:if>
			                                </td>
			                                <td class="td_shipstate">결제완료</td>
			                                <td><a href="order_detail.do?order_idx=${phInfo[i].order_idx}" class="ph_detail_btn button">주문상세내역</a></td>
			                            </tr>
		                            </c:forEach>
	                            </c:when>
	                            <c:otherwise>
	                            	<tr id="tr_empty_history"><td colspan="5">주문/배송 내역이 없습니다!</td></tr>
	                            </c:otherwise>
                            </c:choose>
                            <tr>
                                <td colspan="5" id="td_pnav"></td>
                            </tr>
                        </table>
                    </div>

                    <!-- 마이페이지 구매내역 하단 안내문구 -->
                    <div id="mp_main_ph_notice">
                        <div id="mp_main_ph_notice_title">구매내역 안내</div>
                        <div id="mp_main_ph_notice_content">
                            <ul>
                                <li>구매한 상품이력은 당일부터 최근 6개월까지의 정보를 제공합니다.</li>
                                <li>구메할 수 없는 판매제한 상품은 구매내역에 표기되지 않습니다.</li>
                                <li>123</li>
                            </ul>
                        </div>
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