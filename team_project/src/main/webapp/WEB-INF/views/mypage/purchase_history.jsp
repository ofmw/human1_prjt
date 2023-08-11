<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>mypage</title>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <link href="../resources/css/purchase_history.css" rel="stylesheet">
    <style>
        
    </style>
    <script>
        $(function() {
            $("input[name=dates]").daterangepicker({
                locale: {
                "format": 'YYYY-MM-DD',                  // 일시 노출 포맷
                "applyLabel": "확인",                    // 확인 버튼 텍스트
                "cancelLabel": "취소",                   // 취소 버튼 텍스트
                "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
                "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
                },
                showDropdowns: true,                     // 년월 수동 설정 여부
                autoApply: true,                         // 확인/취소 버튼 사용여부
                singleDatePicker: true                   // 하나의 달력 사용 여부
            });
            $("input[name=dates]").on('show.daterangepicker', function (ev, picker) {
                $(".yearselect").css("float", "left");
                $(".monthselect").css("float", "right");
                $(".cancelBtn").css("float", "right");
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
            <div id="mp_header_user_menu">
                <ul>
                    <li><a href="#">회원정보 변경</a></li>
                    <li><a href="#">비밀번호 변경</a></li>
                    <li><a href="#">배송지 관리</a></li>
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
                            <span class="mp_main_ph_search_calbox">
                                <input type="text" name="" class="cal_date" value="">
                                <span class="mp_main_ph_search_calbox_icon"></span>
                            </span>
                            <span id="cal_hipen">~</span>
                            <span class="mp_main_ph_search_calbox">
                                <input type="text" name="" class="cal_date">
                            </span>
                            <span><input type="button" value="조회하기" id="mp_main_ph_search_detail_btn"></span>
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
                                <td><a href="order_detail.do" class="ph_detail_btn">주문상세내역</a></td>
                            </tr>
                            <tr>
                                <td class="td_date">2023-07-14</td>
                                <td class="td_ordernum">20230714-00000001</td>
                                <td class="td_pname">[오뚜기] 삼양라면 <span>외 5건</span></td>
                                <td>상품준비중</td>
                                <td><a href="mypage 주문내역 상세.html" class="ph_detail_btn">주문상세내역</a></td>
                            </tr>
                            <tr>
                                <td class="td_date">2023-05-29</td>
                                <td class="td_ordernum">20230529-00012351</td>
                                <td class="td_pname">[풀무원] AA건전지 X 20입 <span>외 14건</span></td>
                                <td>베송중</td>
                                <td><a href="mypage 주문내역 상세.html" class="ph_detail_btn">주문상세내역</a></td>
                            </tr>
                            <tr>
                                <td class="td_date">2023-04-01</td>
                                <td class="td_ordernum">20230401-00037541</td>
                                <td class="td_pname">불스원 와이퍼 외 <span>외 2건</span></td>
                                <td>배송완료</td>
                                <td><a href="mypage 주문내역 상세.html" class="ph_detail_btn">주문상세내역</a></td>
                            </tr>
                            <tr>
                                <td colspan="5" id="td_pnav">네비게이션</td>
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