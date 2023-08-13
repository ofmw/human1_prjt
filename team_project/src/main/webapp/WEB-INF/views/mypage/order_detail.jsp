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
    <link href="../resources/css/order_detail.css" rel="stylesheet">
</head>
<body>

<!-- 헤더 -->
<header><jsp:include page="../common/header2.jsp"></jsp:include></header>

<section>

    <!-- 마이페이지 헤더부분 -->
    <div id="mp_header_area">

        <div id="mp_header_user" class="mp_header_obj">
            <div id="mp_header_user_name">홍길동님</div>
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

                    <!-- 마이페이지 주문상세 조회  -->
                    <div class="mp_main_title">주문상세 조회</div>

                    <!-- 주문상세 조회 헤더 -->
                    <div id="mp_main_od_header">
                        <div id="od_header_info_box">
                            <span id="od_header_date">2023-07-17</span>
                            <span id="od_header_ordernum">주문번호 <span>20230717-00000012</span></span>
                        </div>
                        
                        <div id="od_header_opt_box">
                            <button id="od_header_del">주문내역에서 삭제 X</button>
                            <div id="od_header_division"></div>
                            <button id="od_header_addcart">장바구니 담기</button>
                        </div>
                    </div>

                    <!-- 주문상세 배송상태 -->
                    <div id="mp_main_od_shipstate">
                        <ul>
                            <li><div><span>결제완료</span></div></li>
                            <li><div><span>상품준비중</span></div></li>
                            <li><div><span>배송중</span></div></li>
                            <li><div><span>배송완료</span></div></li>
                        </ul>
                    </div>

                    <!-- 주문상세 조회 주문정보 table -->
                    <div id="mp_main_od_tb_info">
                        <table>
                            <tr>
                                <th>주문자 정보</th>
                                <td><span>${member.m_name} </span>${member.selNum}</td>
                            </tr>
                            <tr>
                                <th>받으시는 분</th>
                                <td><span>홍길동 </span>010-1111-2222</td>
                            </tr>
                            <tr>
                                <th>받으시는 주소</th>
                                <td><span>[주소지 프리셋 이름]</span> [31313] 충남 천안시 동남구 ~~~ (상세주소)</td>
                            </tr>
                            <tr>
                                <th>배송 요청사항</th>
                                <td>기본 요청사항, 추가 요청사항</td>
                            </tr>
                            <tr>
                                <th>수령방법</th>
                                <td>문 앞, 경비실 등등</td>
                            </tr>
                        </table>
                    </div>

                    <!-- 주문상세 조회 주문상품 table -->
                    <div>
                        <table id="mp_main_od_tb_product">
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:60%;">
                                <col style="width:20%;">
                                <col style="width:10%;">
                                <!-- <col style="width:10%;background-color: rgb(147, 255, 152);">
                                <col style="width:60%;background-color: #ffd89e;">
                                <col style="width:20%;">
                                <col style="width:10%;background-color: #d8a9ff;"> -->
                            </colgroup>
                            <tr>
                                <td class="td_img"><a href="#"><img src="#" alt="이미지" width="90" height="90"></a></td>
                                <td class="td_pname"><a href="#">[국산] 고구마500kg</a></td>
                                <td class="td_odinfo">
                                    <span class="td_odinfo_price">1,100<span>원</span></span><br>
                                    <span class="td_odinfo_amount">수량 1개</span>
                                </td>
                                <td class="td_review"><a href="#">리뷰작성</a></td>
                            </tr>
                            <tr>
                                <td class="td_img"><a href="#"><img src="#" alt="이미지"></a></td>
                                <td class="td_pname"><a href="#">[하림] 닭가슴살 260g</a></td>
                                <td class="td_odinfo">
                                    <span class="td_odinfo_price">31,300<span>원</span></span><br>
                                    <span class="td_odinfo_amount">수량 1개</span>
                                </td>
                                <td class="td_review"><a href="#">리뷰작성</a></td>
                            </tr>
                            <tr>
                                <td class="td_img"><a href="#"><img src="#" alt="이미지"></a></td>
                                <td class="td_pname"><a href="#">상품명</a></td>
                                <td class="td_odinfo">
                                    <span class="td_odinfo_price">1,100<span>원</span></span><br>
                                    <span class="td_odinfo_amount">수량 12개</span>
                                </td>
                                <td class="td_review"><a href="#">리뷰작성</a></td>
                            </tr>
                            <tr>
                                <td class="td_img"><a href="#"><img src="#" alt="이미지"></a></td>
                                <td class="td_pname"><a href="#">상품명2</a></td>
                                <td class="td_odinfo">
                                    <span class="td_odinfo_price">1,100<span>원</span></span><br>
                                    <span class="td_odinfo_amount">수량 1개</span>
                                </td>
                                <td class="td_review"><a href="#">리뷰작성</a></td>
                            </tr>
                        </table>
                    </div>

                    <!-- 하단 버튼 모음 -->
                    <div id="mp_main_od_btnbox">
                        <ul>
                            <li><button></button></li>
                        </ul>
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