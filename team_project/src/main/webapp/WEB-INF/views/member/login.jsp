<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>login</title>
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="resources/js/login.js"></script>
    <link href="resources/css/login.css" rel="stylesheet"/> 

    
</head>
<body>
    @<br>
    @<br>
    <button id="re">재생성</button>
    @<br>
    @<br>
    @<br>
    @<br>
    @@@@@@@@@@@@@@@@@@@@@<br>@<br>
    @<br>
    @<br>
    @<br>
    @<br>
    @<br>
    @<br>
    <button id="re2">재생성</button>
    @<br>
    @<br>
    @@@@@@@@@@@@@@@@@@@<br>
    @<br>

	<!-- 전체화면 어둡게 -->
    <div id="shadow">
    	<!-- 로그인 창 전체영역 -->
        <div id="login_container">
        	<!-- 로그인 창 닫기버튼 -->
            <div id="login_close_button"><img src="resources/img/close3.png" alt="닫기" id="close_btn"></div>
            <!-- 로그인 창 내부요소 -->
            <div id="login_inner_elements">
				
				<!-- 로그인 헤더 -->
                <div id="login_head_area">
                    <div id="login_title">로그인</div>
                    <div id="unregist_tracking"><a href="#">비회원 배송조회</a></div>
                </div>

                <form>
                	<!-- ID, PW 입력 영역 -->
                    <div id="login_input_area">
                        <input type="text" name="login_id" id="login_id" class="input_object" placeholder="아이디를 입력해주세요">
                        <input type="password" name="login_pw" id="login_pw" class="input_object" placeholder="비밀번호를 입력해주세요">
                    </div>

					<!-- Caps Lock 감지 안내문구 영역 -->
                    <div id="checkCapsLock">
                        <span id="ccl_message">Caps Lock이 켜져 있습니다</span>
                    </div>
                
                	<!-- 로그인 버튼 영역 -->
                    <div id="login_button_area">
                        <input type="button" value="로그인" id="login_btn">
                    </div>

					<!-- ID, PW 찾기버튼 영역 -->
                    <div id="forgot_account_area">
                        <a href="#">아이디 찾기</a><span id="division">|</span><a href="#">비밀번호 찾기</a>
                    </div>

					<!-- SNS 로그인 영역 -->
                    <div id="login_sns_area">
                        <div id="sns_title">SNS 로그인</div>
                        <div id="sns_box">
                        	<!-- 네이버 로그인 -->
							<label id="sns_naver" class="sns">
								<a href="#" id="sns_naver_btn" class="sns_button">네이버 로그인</a>
							</label>
							<!-- 카카오 로그인 -->
							<label id="sns_kakao" class="sns">
								<a href="#" id="sns_kakao_btn" class="sns_button">카카오 로그인</a>
							</label>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</body>
</html>