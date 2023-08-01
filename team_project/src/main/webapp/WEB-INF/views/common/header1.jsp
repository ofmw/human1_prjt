<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>비로그인 헤더</title>

<link href="resources/css/header.css" rel="stylesheet">
<link href="resources/css/login.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/js/login.js"></script>
<script src="resources/js/header.js"></script>

</head>
<body>

    <!-- 헤더 -->
    <div id="div_header">
        <!-- <div id="div_header_contents"> -->
        	<!-- 헤더 윗부분 -->
	        <div id="div_header_upper">
	            <!-- 헤더 윗부분 내부요소 -->
	            <div id="div_header_upper_elements">
	
	                <!-- 사이트 로고 -->
	                <div id="div_omart_logo">
	                    <a href="index.do"><img id="omart_logo" src="resources/img/omart.png" alt="omart로고"></a>
	                </div>
	                <!-- 검색 -->
	                <div id="input_search_area">
	                    <input id="input_search" type="search">
	                </div>
	                
	                <!-- ㅁㄴㅇㄹ -->
					<div id="div_persnal">
						<div id="div_member_menu">
							<c:choose>
								<c:when test="${empty member}">
	            		            <span id="login_btn2">로그인</span>
	    		                    <a href="member/join.do">회원가입</a>
			                        <a href="boardFile/list_notice.do">고객센터</a>
								</c:when>
								<c:otherwise>
								     <c:choose>
								         <c:when test="${member.grade eq 9}">
								             <a href="admin/member.do">${member.m_name}님</a>
								         </c:when>
								         <c:otherwise>
								             <a href="mypage/mypage.do">${member.m_name}님</a>
								         </c:otherwise>
								     </c:choose>								
									<a href="boardFile/list_notice.do">고객센터</a>
									<c:choose>
										<c:when test="${member.platform eq 'kakao'}">
											<a href="kakaologout.do">로그아웃</a>
										</c:when>
										<c:when test="${member.platform eq 'omart'}">
											<a href="member/logout.do">로그아웃</a>
										</c:when>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</div>
		                    	
	                    <div id="div_persnal_menu">
	                        <a href="">ㅇ</a>
	                        <c:choose>
	                        	<c:when test="${empty member}">
	                        		<a id="open_login" href="#">ㅁ</a>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<a href="mypage/mypage.do">ㅁ</a>
	                        	</c:otherwise>
	                        </c:choose>
	                        <a href="">ㅇ</a>
	                        <a href="">ㅇ</a>
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
	                        전체 카테고리
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
        </div>
        
    </div><!-- end of header -->
    
    <!-- 로그인 모달창 -->
    <div id="shadow">
        <div id="login_container">
            <div id="login_close_button"><img src="resources/img/close3.png" alt="닫기" id="close_btn"></div>
            
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
						<label id="sns_naver" class="sns">
						    <a href="#" id="sns_naver_btn" class="sns_button">네이버 로그인</a>
						</label>
						<label id="sns_kakao" class="sns">
						    <a href="#" id="sns_kakao_btn" class="sns_button">카카오 로그인</a>
						</label>
					</div>
				</div>
				
            </div><!-- end of 로그인창 내부요소 -->
        </div><!-- end of login container -->
    </div><!-- end of shadow -->
</body>
</html>