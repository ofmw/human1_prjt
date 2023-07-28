<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>마이페이지</title>

<link href="../resources/css/mypage.css" rel="stylesheet">

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
                        <li><a href="mypage 찜목록.html">찜목록</a></li>
                        <li><a href="mypage 상품리뷰.html">상품 리뷰</a></li>
                        <li><a href="mypage 상품QnA.html">상품 Q&A</a></li>
                        <li><a href="list_inquiry.do">1:1 문의</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div id="mp_main">
            <div id="mp_main_osc" class="mp_main_obj">
                <div id="mp_main_osc_title"><a href="purchase_history.do">주문/배송 조회</a></div>
                <div id="mp_main_osc_infobar">
                    <div class="mp_main_osc_infobar_obj_btw">결제완료<a href="#">5</a></div>
                    <div class="mp_main_osc_infobar_obj_btw"><span>상품준비중</span><a href="#">5</a></div>
                    <div class="mp_main_osc_infobar_obj_btw"><span>배송중</span><a href="#">1</a></div>
                    <div class="mp_main_osc_infobar_obj"><span>배송완료</span><a href="#">8000</a></div>
                </div>
                <div style="border-radius: 4px;background-color: #fafafa;height: 40px;width: 100%;margin-top: 5px;"></div>
            </div>
            
            <div id="mp_main_review" class="mp_main_obj">
                <div class="mp_main_title"><a href="#">상품 리뷰</a></div>
                <div id="mp_main_review_content">리뷰 작성 가능한 상품이 없습니다.</div>
            </div>

            <div id="mp_main_wish" class="mp_main_obj">
                <div class="mp_main_title"><a href="#">찜목록</a></div>
                <div id="mp_main_wish_content">찜한 상품이 없습니다.</div>
            </div>

        </div>

    </div>

</section>

<!-- 푸터 -->
<footer><jsp:include page="../common/footer.jsp"></jsp:include></footer>

</body>
</html>