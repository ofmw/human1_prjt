<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.omart.vo.MemberVo" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>비로그인 헤더</title>

<link href="../resources/css/header.css?v=1234" rel="stylesheet">
<link href="../resources/css/login.css?v=1234" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../resources/js/login.js?v=1234"></script>
<script src="../resources/js/header.js?v=1234"></script>

</head>
<body>

    <!-- 헤더 -->
    <div id="div_header">
        
        <!-- 헤더 윗부분 -->
        <div id="div_header_upper">
            <!-- 헤더 윗부분 내부요소 -->
            <div id="div_header_upper_elements">

                <!-- 사이트 로고 -->
                <div id="div_omart_logo">
                    <a href="../index.do"><img id="omart_logo" src="../resources/img/omart.png" alt="omart로고"></a>
                </div>
                <!-- 검색 -->
                <div id="input_search_area">
                    <form action="../product/product_list.do" method="get" name="frm_keyword">
                       <input id="input_search" type="search" name="keyword" value="${keyword}">
                    </form>
                </div>
                
                <!-- ㅁㄴㅇㄹ -->
				<div id="div_persnal">
					<div id="div_member_menu">
						<c:choose>
							<c:when test="${empty member}">
            		            <span id="login_btn2">로그인</span>
    		                    <a href="../member/join.do">회원가입</a>
		                        <a href="../boardFile/faq_member.do">고객센터</a>
							</c:when>
							<c:otherwise>
                                <input type="hidden" id="m_idx" value="${member.m_idx}"/>
                                <input type="hidden" id="m_id" value="${member.m_id}"/>
                                <input type="hidden" id="m_name" value="${member.m_name}"/>
                                <input type="hidden" id="selNum" value="${member.selNum}"/>
                                <c:choose>
                                    <c:when test="${member.grade eq 9 or member.grade eq 8 or member.grade eq 7}">
                                        <a href="../admin/member.do">${member.m_name}님</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="../mypage/mypage.do">${member.m_name}님</a>
                                    </c:otherwise>
                                </c:choose> 
                                <c:choose>
                                    <c:when test="${member.platform eq 'kakao'}">
                                        <a href="kakaologout.do">로그아웃</a>
                                    </c:when>
                                    <c:when test="${member.platform eq 'omart'}">
                                        <a href="member/logout.do">로그아웃</a>
                                    </c:when>
                                </c:choose>                               
                                <a href="../boardFile/list_notice.do">고객센터</a>                               
                            </c:otherwise>
						</c:choose>
					</div>
					<div id="div_division"></div>
	                <div id="div_persnal_menu">
                        <c:choose>
                            <c:when test="${empty member}">
                                <a class="need_login" href="#">마이페이지</a>
                                <a class="need_login" href="#">장바구니</a>
                            </c:when>
                            <c:otherwise>
                                <a href="../mypage/mypage.do">마이페이지</a>
                                <a href="../cart/cart.do">장바구니</a>
                            </c:otherwise>
                        </c:choose>                     
                    </div>
				</div>
			</div>
		</div>

        <!-- 헤더 아랫부분 -->
        <div id="div_header_lower">
            <!-- 헤더 아랫부분 내부요소 -->
            <div id="div_header_lower_elements">

                <!-- 카테고리 -->
                <div>
                    <div id="div_category_block">
                        전체 카테고리
                    </div>
                    <div id="div_category">
                            <a href="../product/product_list.do">전체 카테고리</a>
                            <ul>
                                <li><a href="../product/product_list.do?category=AA">육류</a></li>
	                            <li><a href="../product/product_list.do?category=BB">가공</a></li>
	                            <li><a href="../product/product_list.do?category=CC">수산</a></li>
	                            <li><a href="../product/product_list.do?category=DD">야채</a></li>
                            </ul>                           
                        </div>
                </div>
                
                <!-- 메뉴모음 -->
                <div id="div_quick_menu">
                    <a href="">베스트</a>
                    <a href="">할인</a>
                    <a href="">신상품</a>
                    <a href="">이벤트</a>
                </div>
            </div>
        </div>
    </div><!-- end of header -->
    
    <!-- 로그인 모달창 -->
    <div id="shadow" style="display:none;">
        <div id="login_container">
            <div id="login_close_button"><img src="../resources/img/close3.png" alt="닫기" id="close_btn"></div>
            
            <div id="login_inner_elements">

                <div id="login_head_area">
                    <div id="login_title">로그인</div>
                    <div id="unregist_tracking"><a href="#">비회원 배송조회</a></div>
                </div>

				<!-- 로그인 -->
                <div id="login_input_area">
                    <input type="text" name="m_id" id="m_id" class="input_object" placeholder="아이디를 입력해주세요">
                    <input type="password" name="m_pw" id="m_pw" class="input_object" placeholder="비밀번호를 입력해주세요">
                </div>
                <div id="checkCapsLock">
                    <span id="ccl_message">Caps Lock이 켜져 있습니다</span>
                </div>
                <div id="login_button_area">
                    <input type="button" value="로그인" id="login_btn">
                </div>

				<div id="forgot_account_area">
				    <a href="#">아이디 찾기</a><span id="division">|</span><a href="#">비밀번호 찾기</a>
				</div>
				
				<div id="login_sns_area">
				    <div id="sns_title">SNS 로그인</div>
				    <div id="sns_box">
				    	<img src="../resources/img/네이버.png" alt="네이버로그인" width="157" id="sns_naver_btn">
					    <img src="../resources/img/카카오.png" alt="카카오로그인" width="157" id="sns_kakao_btn">
					</div>
				</div>
				
            </div><!-- end of 로그인창 내부요소 -->
        </div><!-- end of login container -->
    </div><!-- end of shadow -->
    <div id="shadow_addCart" style="display:none;">
        <div id="addCart_container">
            제품이 장바구니에 추가되었습니다.
        </div>
    </div>
</body>
</html>