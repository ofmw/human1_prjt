<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원탈퇴</title>

<link href="../resources/css/mypage/mypage.css" rel="stylesheet">
<link href="../resources/css/mypage/mypage-common.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../resources/js/mypage.js"></script>

<style>
	/* 버튼 및 선택 요소 공통 */
    #mp_header_area li span:hover{
    	text-decoration: underline;
    	cursor: pointer;
    }

	/* ---------------------회원탈퇴 내용 영역--------------------- */
	#mp_main_cancel{
		display: flex;
		flex-direction: column;
		align-items: center;
		color: #222
	}
	#mp_main_cancel_title {
	    font-size: 30px;
	    font-weight: bold;
	}
	#mp_main_cancel_notice {
		width: 100%;
	    height: 400px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    flex-direction: column;
	}
	#mp_main_cancel_notice_innerDiv{
		text-align: left;
	}
	#mp_main_cancel_btn_box button {
	    width: 250px;
	    height: 50px;
	    margin: 0 10px;
	    font-size: 20px;
	    cursor: pointer;
	}
	#cancel-confirm{
		background-color: #222;
		color: white;
		border: 0;
	}
	#cancel-decline{
		background-color: #fcfcfc;
		border: 1px solid #ddd;
	}
	
</style>

<script>
	$(function() {
        
		/* ---------------------회원 탈퇴--------------------- */
		//*** 회원탈퇴 버튼 클릭 이벤트 처리 ***//
		$("#cancel-confirm").on("click", function(){
        	
			// 페이지에서 회원의 가입 플랫폼 정보 가져옴
			let platform = $("#session_platform").val();
        	
			// 회원의 가입 플랫폼 체크 및 회원탈퇴 요청
			if (platform === "omart") {
				cancel("omart");
			} else if (platform === "kakao") {
				cancel("kakao");
			}
        	
		});
        
		//*** 회원탈퇴 처리 ***//
		function cancel(platform) {
      	
			$.ajax({
				type: "POST",
				url: platform +"Cancel.do",
				success: function (response) {
					if (response === "success") {
						alert('회원탈퇴가 정상적으로 완료되었습니다.');
						// 회원탈퇴 완료 후 메인 페이지로 이동
						location.href = "index.do"
					} else {
						alert("회원탈퇴 도중 문제가 발생했습니다.");
					}
				},
				error: function () {
				alert("오류가 발생하였습니다.");
				}
			}); // end of ajax
		}

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
	                    <li><a href="password_modifiy.do">비밀번호 변경</a></li>
	                </c:if>
                    <li><span id="manage_address">배송지 관리</span></li>
                    <li><a href="cancel.do">회원 탈퇴</a></li>
                </ul>
            </div>
        </div>

		<!-- 쿠폰 영역 -->
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

		<!-- 포인트 영역 -->
        <div id="mp_header_point" class="mp_header_obj">
            <div class="mp_header_obj_title">포인트</div>
            <div id="mp_header_point_num">
            	<fmt:formatNumber value="${point}" pattern="#,###"/> P
            </div>
        </div>

    </div>

    <!-- 마이페이지 내용부분 -->
    <div id="mp_main_area">

		<!-- 좌측 메뉴 영역 -->
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
                        <li><a href="#">상품 리뷰</a></li>
                        <li><a href="#">상품 Q&A</a></li>
                        <li><a href="inquiry.do">1:1 문의</a></li>
                    </ul>
                </div>
            </div>
        </div>
		
		<!-- 중앙 본문 영역 -->
        <div id="mp_main_contents">
            <div id="mp_main_cancel" class="mp_main_obj">
                <div id="mp_main_cancel_title">정말로 회원탈퇴 하시겠습니까?</div>
                <div id="mp_main_cancel_notice">
                	<div id="mp_main_cancel_notice_innerDiv">
	                	<b>"확인" 버튼을 누를 시 즉시 탈퇴 처리되며 취소하실 수 없습니다.</b><br>
	                	-신중하게 탈퇴 부탁드립니다.<br>
	                	-탈퇴 후 같은 아이디 및 개인정보로 재가입이 가능합니다.<br><br>
	                	<b>회원탈퇴시 회원님의 모든 정보가 즉시 삭제됩니다.</b><br>
	                	-삭제되는 정보<br>
	                	· 모든 개인정보 (결제 수단, 배송지 포함)<br>
	                	· 쿠폰 및 포인트<br>
	                	· 주문 및 결제, 문의와 관련된 모든 내역<br>
					</div>
                </div>
                <div id="mp_main_cancel_btn_box">
                	<button id="cancel-confirm">확인</button>
                	<button id="cancel-decline" onclick="history.back();">취소</button>
                </div>
            </div>
        </div>
    </div>

</section>

<!-- 푸터 -->
<footer><jsp:include page="../common/footer.jsp"></jsp:include></footer>

</body>
</html>