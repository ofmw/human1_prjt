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
    <script type="text/javascript" src="../resources/js/mypage.js"></script>
    <link href="../resources/css/mypage/purchase_history.css" rel="stylesheet">
    <link href="../resources/css/mypage/mypage-common.css" rel="stylesheet">
    
    <style>
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
        /* ---------------------페이지 내비게이션--------------------- */
        .p-nav{
        	width: 25px;
        	height: 25px;
        	margin: 0 5px;
        	
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
          	
            /* ---------------------주문내역 기간 설정(라디오 버튼)------------------- */
            $('.quicksel_radio').change(function() {
                let range = $(this).val();
                console.log("기간조회 (라디오 버튼): " + range);
                
                let today = new Date();
                let targetDate = new Date();  // 초기값은 오늘 날짜로 설정

                switch (range) {
                    case "1":
                        targetDate.setDate(targetDate.getDate() - 8);
                        break;
                    case "2":
                        targetDate.setDate(targetDate.getDate() - 16);
                        break;
                    case "3":
                        targetDate.setMonth(targetDate.getMonth() - 1);
                        targetDate.setDate(targetDate.getDate() - 1);
                        break;
                    case "4":
                        targetDate.setMonth(targetDate.getMonth() - 3);
                        targetDate.setDate(targetDate.getDate() - 1);
                        break;
                }

                console.log("조회 날짜 구간: " + targetDate);

                $(".tr_history").removeClass('hide');

                $('.td_date').each(function() {
                    let dateString = $(this).text();
                    let dateParts = dateString.split('-');
                    let tdDate = new Date(dateParts[0], dateParts[1] - 1, dateParts[2]);

                    if (tdDate > targetDate && tdDate < today) {
                        $(this).closest('tr').show();
                        console.log("표시");
                    } else {
                        $(this).closest('tr').hide().addClass('hide');
                        console.log("숨김");
                    }
                    
                    checkEmpty();
                    
                });

                setNav(Math.ceil(countVisibleRows() / 4));
                changePage(1);
                
            });

            /* ---------------------달력 초기 날짜 설정------------------- */
            // 오늘 날짜 저장
            const today = new Date();
            today.setDate(today.getDate());
            // 6개월 전 날짜 계산
            const limitedMonth = new Date();
            limitedMonth.setMonth(today.getMonth() - 6);
            // 날짜를 YYYY-MM-DD 형식으로 변환
            const limitedtoday = today.toISOString().split("T")[0];
            const limitedStartDate = limitedMonth.toISOString().split("T")[0];
            // 시작, 종료 날짜 달력 생성            
            const calStart = $('<input>').attr('type', 'date').addClass('cal_date').attr('id', 'cal-start').attr('min', limitedStartDate).attr('max', limitedtoday);
            const calEnd = $('<input>').attr('type', 'date').addClass('cal_date').attr('id', 'cal-end').attr('min', limitedStartDate).attr('max', limitedtoday);
            
            // '~' 앞뒤에 달력 추가
            calStart.insertBefore('#cal_hipen');
            calEnd.insertAfter('#cal_hipen');

            /* ---------------------달력 날짜 설정------------------- */
            //*** 시작 날짜 달력 설정 ***//
            function setCalStart() {

                /***
                * 시작 날짜 달력 날짜 선택시
                * 종료 날짜 달력의 최소 날짜를 시작 날짜와 동기화
                ***/
                let calStart = $("#cal-start");
                let calEnd = $("#cal-end");
                let calStartDate = calStart.val();

                calEnd.prop("min", calStartDate);

                let dateString = calStart.val();
                let dateParts = dateString.split('-');
                console.log(dateParts[1]);
                if (dateParts[1] === undefined) {
                    $(".tr_history").show();
                    calStart.prop("min", limitedStartDate);
                    calStart.prop("max", limitedtoday);
                    calEnd.prop("min", limitedStartDate);
                    calEnd.prop("max", limitedtoday);
                }
            }

            //*** 종료 날짜 달력 설정 ***//
            function setCalEnd() {

                /***
                * 종료 날짜 달력 날짜 선택시
                * 시작 날짜 달력의 최대 날짜를 종료 날짜와 동기화
                ***/
                let calStart = $("#cal-start");
                let calEnd = $("#cal-end");
                let calEndDate = calEnd.val();

                calStart.prop("max", calEndDate);

                let dateString = calEnd.val();
                let dateParts = dateString.split('-');
                console.log(dateParts[1]);
                if (dateParts[1] === undefined) {
                    $(".tr_history").show();
                    calStart.prop("min", limitedStartDate);
                    calStart.prop("max", limitedtoday);
                    calEnd.prop("min", limitedStartDate);
                    calEnd.prop("max", limitedtoday);
                }
            }

            //*** 시작 날짜 달력 날짜 선택 이벤트 처리 ***//
            $(document).on("change", "#cal-start", function() {
                setCalStart();
            });

            //*** 종료 날짜 달력 날짜 선택 이벤트 처리 ***//
            $(document).on("change", "#cal-end", function() {
                setCalEnd();
            });


            /* ---------------------주문내역 기간 설정(달력 선택 조회하기)------------------- */
            //*** 조회하기 버튼 클릭 이벤트 처리 ***//
            $('#mp_main_ph_search_detail_btn').click(function() {
                
                let radio = $('.quicksel_radio:checked');
                radio.prop("checked", false);
                let label = radio.next();
                label.css({
                    'background-color': '',
                    'color': ''
                });


                let today = new Date();
                let startDate = new Date($('#cal-start').val());
		        let endDate = new Date($('#cal-end').val());
                let rows = 0;

                if (isNaN(startDate)) {
                    alert("시작 날짜를 선택해주세요");
                } else if (isNaN(endDate)) {
                    alert("끝 날짜를 선택해주세요");
                } else {

                    startDate.setDate(startDate.getDate() - 1);
                    endDate.setDate(endDate.getDate());
                    
                    console.log("조회 날짜 구간(시작): " +startDate);
                    console.log("조회 날짜 구간(끝): " +endDate);
                    
                    $(".tr_history").removeClass('hide');

                    $('.td_date').each(function() {
                        let dateString = $(this).text();
                        let dateParts = dateString.split('-');
                        let tdDate = new Date(dateParts[0], dateParts[1] - 1, dateParts[2]);
                        console.log(tdDate);

                        if (tdDate > startDate && tdDate < endDate) {
                            $(this).closest('tr').show();
                            console.log("표시");
                            rows += 1;
                        } else {
                            $(this).closest('tr').hide().addClass('hide');;
                            console.log("숨김");
                            rows -= 1;
                        }
                        
                        // 조회 결과가 비었을 경우 체크
                        checkEmpty();
                        
                    });
                    
                }

                setNav(Math.ceil(countVisibleRows() / 4));
                changePage(1);

            });
            
		    /* ---------------------주문내역 표시 개수--------------------- */
            //*** 표시 개수 설정 ***//
            function showElements(option) {
                
            	console.log("표시 개수: "+option);
            	
            	let elements = $('.tr_history:not(.hide)');
            	let page = 0;
            	
            	if (elements.length > option) { // 주문내역 개수가 선택한 표시 수보다 클 경우
                	
            		page = Math.ceil(elements.length / option);
            		
            		console.log("내역 개수: "+elements.length);
                    console.log("페이지 수: "+page);
                    
                    setNav(page);
                    changePage(1);
                    
                } else { // 주문내역 개수가 선택한 표시 수보다 같거나 작을 경우
                	
                	page = 1; // 표시할 페이지 내비게이션 버튼 1개
                	
                	console.log("내역 개수: "+elements.length);
                    console.log("페이지 수: "+page);
                    
                    setNav(page);
                    changePage(1);
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
	        //*** 테이블에 표시되는 주문내역 tr 요소 개수 확인 ***//
	        function countVisibleRows() {
			    // display가 block인 tr들만 선택하여 개수 반환
			    return $('.tr_history:visible').length;
			}
	        
            //*** 페이지 내비게이션 버튼 생성 ***//
            function setNav(page) {
            	
            	let visibleTr = countVisibleRows();

                console.log("몇개냐: " +visibleTr);
            	
            	console.log("내역 개수: " +countVisibleRows());
            	console.log("페이지 개수: " +page);
				
            	if (visibleTr === 0) {
            		page = 1;
            	}
            	
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
            
          		// 주문 내역 tr
          		elements = $('.tr_history:not(.hide)');
          		// 한 페이지에 표시할 내역 개수
          		// let showAmount = parseInt($("#sel2").val());
                let showAmount = 4;
          		
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
          	
          	
          	/* ---------------------빈 주문내역--------------------- */
          	//*** 빈 주문내역 목록 표시 ***//
          	function checkEmpty() {

          		let tr = countVisibleRows();
          		
          		console.log("현재 표시된 내역: " +tr);
          		
          		if (tr === 0) {
                    $("#tr_empty_history").show();
                } else {
                    $("#tr_empty_history").hide();
                }

                // setNav(Math.ceil(tr / 4));
          	}

            checkEmpty();

        });
    </script>
</head>
<body>

<!-- 헤더 -->
<header><jsp:include page="../common/header2.jsp"></jsp:include></header>

<section>

    <!-- 마이페이지 헤더부분 -->
    <div id="mp_header_area">

        <!-- 회원 정보 영역 -->
        <div id="mp_header_user" class="mp_header_obj">
            <div id="mp_header_user_name">${member.m_name}님</div>
            <input type="hidden" id="session_m_idx" value="${member.m_idx}">
            <input type="hidden" id="session_platform" value="${member.platform}">
            
            <div id="mp_header_user_menu">
                <ul>
                	<c:if test="${member.platform eq 'omart'}">
	                    <li><a href="member_modifiy.do">회원정보 변경</a></li>
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
            <div id="mp_main_contents">
                <div id="mp_main_ph" class="mp_main_obj">
                
                	<!-- 메인영역 헤더 -->
	                <div id="mp_main_ph_header">
	                    <div class="mp_main_title">주문/배송조회</div>
	                    <div id="mp_main_ph_header_opt-box">
		                    <div id="mp_main_ph_header_sel-box">
		                        <select id="sel2">
		                            <option value="4" selected>4개씩</option>
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
                            <span id="cal_hipen">~</span>
                            <div><input type="button" value="조회하기" id="mp_main_ph_search_detail_btn"></div>
                        </div>

                    </div>

                    <!-- 마이페이지 주문/배송내역 table -->
                    <div id="mp_main_ph_content">
                        <table>
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
                            
                            <c:if test="${!empty orderList}">
	                            <c:forEach begin="0" end="${fn:length(orderList) - 1}" var="i">
		                            <tr class="tr_history">
		                                <td class="td_date"><fmt:formatDate value="${orderList[i].order_date}" pattern="yyyy-MM-dd"/></td>
		                                <td class="td_ordernum">${orderList[i].order_idx}</td>
		                                <td class="td_pname">
		                                	<div>
			                                	<a href="order_detail.do?order_idx=${orderList[i].order_idx}">
			                                		[${phfInfo[i].brand}] ${phfInfo[i].p_name} ${phfInfo[i].standard}${phfInfo[i].unit}
			                                	</a>
		                                	</div>
		                                	<c:if test="${orderList[i].p_amount gt 1}">
		                                		<div class="extra_p">외 ${orderList[i].p_amount - 1}건</div>
		                                	</c:if>
		                                </td>
		                                <td class="td_shipstate">
		                                    <c:choose>
		                                         <c:when test="${orderList[i].order_state eq 0}">
		                                             결제완료
		                                         </c:when>
		                                         <c:when test="${orderList[i].order_state eq 1}">
	                                                       상품준비중
	                                                   </c:when>
	                                                   <c:when test="${orderList[i].order_state eq 2}">
	                                                       배송중
	                                                   </c:when>
	                                                   <c:when test="${orderList[i].order_state eq 3}">
	                                                       배송완료
	                                                   </c:when>
		                                    </c:choose>
		                                </td>
		                                <td><a href="order_detail.do?order_idx=${orderList[i].order_idx}" class="ph_detail_btn button">주문상세내역</a></td>
		                            </tr>
	                            </c:forEach>
                            </c:if>
                            <tr id="tr_empty_history" style="display:none;height:210px;"><td colspan="5">주문/배송 내역이 없습니다!</td></tr>
                            <tr>
                                <td colspan="5" id="td_pnav"></td>
                            </tr>
                        </table>
                    </div>

                    <!-- 마이페이지 주문/배송 조회 하단 안내문구 -->
					<div id="mp_notice">
						<div id="mp_notice_title">주문/배송조회 안내</div>
		                <div id="mp_notice_content">
                            <ul>
                                <li>주문 이력은 당일부터 최근 6개월까지의 정보만 조회 가능합니다.</li>
                                <li>판매제한 상품은 주문내역에 표시되지 않습니다.</li>
                                <li>추가할 내용</li>
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