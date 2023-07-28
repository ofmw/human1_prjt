<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>1:1 문의</title>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    
    <style>
        /* Noto Sans KR */
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
        
        *{margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}

        /* 섹션 */
        section{
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* a태그 공통 */
        a{text-decoration: none; color: black;}
        /* list 공통 */
        ul{list-style: none;}

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
            height: 287px;
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
        .mp_main_title{
            padding-bottom: 15px;
            font-size: 20px;
            font-weight: bold;
            border-bottom: 2px solid #222;
        }
        #mp_main_claim_title{
            padding-bottom: 15px;
            font-size: 20px;
            font-weight: bold;
            border-bottom: 2px solid #222;
        }
    </style>

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
                        <li><a href="inquiry.do">1:1 문의</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div id="mp_main">
            <div id="mp_main_osc" class="mp_main_obj">
                <div id="mp_main_claim_title">1:1 문의</div>
            </div>

        </div>

    </div>

</section>

<!-- 푸터 -->
<footer><jsp:include page="../common/footer.jsp"></jsp:include></footer>

</body>
</html>