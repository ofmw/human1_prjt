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

        table{
            margin-top: 10px;
            text-align: center;
            border-spacing: 0;
            border-collapse: collapse;
            color: #222;
            width: 100%;
        }
        th{
            height: 40px;
            font-size: 15px;
            border-top: 1px solid black;
            border-bottom: 1px solid #e5e5e5;
            background-color: #f9f9f9;
        }
        /* 리스트 테이블 td 공통 */
        td:not(#td_pnav){
            height: 50px;
            border-bottom: 1px solid #e5e5e5;
        }
        /* 리스트 테이블 구매일자 */
        .td_date{
            /* background-color: skyblue; */
            font-size: 14px;
            color: #777;
        }
        /* 리스트 테이블 구매상품 이름 */
        .td_title{
            text-align: left;
        }
        /* 리스트 테이블 주문상세내역 버튼 */
        .inquiry_detail_btn{
            display: inline-block;
            padding-top: 3px;
            width: 110px;
            height: 30px;
            font-size: 14px;
            color: #777;
            border: 1px solid #cfcfcf;
            box-sizing: border-box;
        }
        #td_pnav{
            height: 50px;
        }
        #mp_main_inquiry_info{
            margin-top: 10px;
            font-size: 13px;
            color: #777;
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
			<div id="mp_main_inquiry" class="mp_main_obj">
                <div class="mp_main_title">1:1 문의</div>
                <div id="mp_main_inquiry_info">
                	<p>
                		＊ 고객님께서 고객센터 1:1문의에 작성하신 문의 내역입니다.<br>
                		＊ 상세 내용은 문의내역상세 버튼을 클릭하여 확인 가능합니다.
                	</p>
                </div>
                <div id="mp_main_inquiry_content">
                    <table >
                        <colgroup>
                            <col style="width: 9%;">
                            <col style="width: 69%;">
                            <col style="width: 7%;">
                            <col style="width: 15%;">
                        </colgroup>
                        <tr>
                            <th>작성일</th>
                            <th>제목</th>
                            <th>진행상태</th>
                            <th>선택</th>
                        </tr>
                        <tr>
                            <td class="td_date">2023.07.28</td>
                            <td class="td_title">[주문/배송] 배송이 오지 않았습니다</td>
                            <td class="td_state">진행중</td>
                            <td><a href="#" class="inquiry_detail_btn">문의상세내역</a></td>
                        </tr>
                        <tr>
                            <td class="td_date">2023.07.21</td>
                            <td class="td_title">[취소/환불] ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄹ</td>
                            <td class="td_state">답변완료</td>
                            <td><a href="#" class="inquiry_detail_btn">문의상세내역</a></td>
                        </tr>
                        <tr>
                            <td colspan="4" id="td_pnav">네비게이션</td>
                        </tr>
                    </table>
                </div>
            </div>

        </div>

    </div>

</section>

<!-- 푸터 -->
<footer><jsp:include page="../common/footer.jsp"></jsp:include></footer>

</body>
</html>