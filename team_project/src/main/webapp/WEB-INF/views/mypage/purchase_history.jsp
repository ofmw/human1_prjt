<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <li><a href="#">회원정보 변경</a></li>
                    <li><a href="#">비밀번호 변경</a></li>
                    <li><span id="manage_address">배송지 관리</span></li>
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

                    <!-- 마이페이지 주문/배송내역  -->
                    <div class="mp_main_title">주문/배송 내역</div>
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
                            <input type="date" class="cal_date" id="cal_start">
                            <span id="cal_hipen">~</span>
                            <input type="date" class="cal_date" id="cal_end">
                            <div><input type="button" value="조회하기" id="mp_main_ph_search_detail_btn"></div>
                        </div>

                    </div>

                    <!-- 마이페이지 주문/배송내역 table -->
                    <div id="mp_main_ph_content">
                        <table>
                            <colgroup>
                                <col style="width:9%;">
                                <col style="width:17%;">
                                <col style="width:50%;">
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
                            <tr>
                                <td class="td_date">2023-07-17</td>
                                <td class="td_ordernum">20230717-00000012</td>
                                <td class="td_pname">[국산] 고구마500kg <span>외 8건</span></td>
                                <td class="td_shipstate">결제완료</td>
                                <td><a href="order_detail.do" class="ph_detail_btn button">주문상세내역</a></td>
                            </tr>
                            <tr>
                                <td class="td_date">2023-07-14</td>
                                <td class="td_ordernum">20230714-00000001</td>
                                <td class="td_pname">[오뚜기] 삼양라면 <span>외 5건</span></td>
                                <td>상품준비중</td>
                                <td><a href="mypage 주문내역 상세.html" class="ph_detail_btn button">주문상세내역</a></td>
                            </tr>
                            <tr>
                                <td class="td_date">2023-05-29</td>
                                <td class="td_ordernum">20230529-00012351</td>
                                <td class="td_pname">[풀무원] AA건전지 X 20입 <span>외 14건</span></td>
                                <td>베송중</td>
                                <td><a href="mypage 주문내역 상세.html" class="ph_detail_btn button">주문상세내역</a></td>
                            </tr>
                            <tr>
                                <td class="td_date">2023-04-01</td>
                                <td class="td_ordernum">20230401-00037541</td>
                                <td class="td_pname">불스원 와이퍼 외 <span>외 2건</span></td>
                                <td>배송완료</td>
                                <td><a href="mypage 주문내역 상세.html" class="ph_detail_btn button">주문상세내역</a></td>
                            </tr>
                            <tr>
                                <td colspan="5" id="td_pnav">
                                	<button type="button" class="p-nav button" value="">1</button>
                                	<button type="button" class="p-nav button" value="">2</button>
                                </td>
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