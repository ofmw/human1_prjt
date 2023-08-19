<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객센터</title>
    
<link href="../resources/css/header.css?v=1234" rel="stylesheet">
<link href="../resources/css/login.css" rel="stylesheet">    
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
    * {
        margin: 0;
        padding: 0;
        font-family: 'Noto Sans KR', sans-serif;
    }
    #div_logo{
    	position: absolute;
    	margin-right: 1000px;
    	height: 70px;
    	width: 195px;
    	cursor: pointer;
    }
    #div_logo img{
    	width: 100%;
    	height: 100%;
    	cursor: pointer;
    }
    /*전체 영역*/
    #div_notice {
    	height: auto;
        min-width: 1280px;
        position: relative;
        display: flex;
        justify-content: center;
        padding-top: 20px;
    }
    /*사이드메뉴, 공지사항내용 엮은 영역*/
    #div_div_notice {
        position: relative;
        display: flex;
        margin-top: 100px;
        justify-content: flex-start; /* 화면 왼쪽에 위치하도록 수정 */
        width: 1200px; /* div_div_notice를 화면 가로 너비 100%로 설정 */
        max-width: 1200px; /* 최대 너비 설정 */
    }
    /*---------- 사이드메뉴 ----------*/
    #div_side_menu {
        position: relative;
        margin-top: 15px;
        width: 200px;
        height: 650px; /* 화면 세로 높이 전체로 설정 */
    }
    #div_side_menu p{
        padding: 6px 0;
        text-align: center;
        font-size: 20px;
        font-weight: bold;
        border-bottom: 3px solid black;
    }
    #div_side_menu td{
        padding: 12px 0;
        width: 200px;
        text-align: center;
        cursor: pointer;
    }
    /*--------------------------------*/
    #div_section {
    	position: relative;
    	width: 750px;
    	margin-left: 150px;
    }
    /*---------------footer---------------*/
    #div_footer{
    	margin-top: 30px;
        padding-left: 10px;
	    padding-top: 10px;
	    border-top: 3px solid black;
	    font-size: 23px;
	    min-width: 1260px;
	    height: 50px;
    }
    #div_footer span{
        font-size: 17px;
        color: rgb(224, 224, 224);
    }
    /*------------------------------------*/
    table{
        width: 100%;
        border-collapse: collapse;
    }
    a{
        text-decoration: none;
        color: black;
    }
    .close {
        display: none;
        position: relative;
        padding: 10px;
        white-space: normal;
    }
    #btn_write{
    	margin-top: 40px;
    	float: right;
    }

    /* PC, 테블릿 가로 (해상도 768px ~ 1023px) */
    @media all and (min-width: 768px) and (max-width: 1023px) {
        #div_side_menu {
            min-width: 150px;
        }

        #div_section {
            min-width: 500px;
        }
    }
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="../resources/js/login.js?v=1234"></script>
<script src="../resources/js/header.js?v=1234"></script>
<script>
	$(document).ready(function(){
		var isLoggedIn = false;
		$("#inquiryLink").click(function(event){
			if(!isLoggedIn){
				document.getElementById("shadow").style.display = "block";
				event.preventDefault();
				
			} else {
				location.href("inquiry.do");
			}
		});
		return false;
	});
</script>
<body>

    <div id="div_notice">
     <div id="div_logo">
		<img src="../resources/img/로고_블랙.png" onclick="location.href='../index.do'">
		<p>${member.m_name}님</p>
	 </div>
        <div id="div_div_notice">
            <div id="div_side_menu">
                <table id="tbl_side_menu">
                    <p>고객센터</p>
                    <tr>
                        <td><a href="faq_member.do">FAQ</a></td>
                    </tr>
                    <tr>
                        <td><a href="notice.do">공지사항</a></td>
                    </tr>
                    <tr>
                        <td><a href="event.do">이벤트</a></td>
                    </tr>
                    <tr>
                        <td>
                        	<c:choose>
                        		<c:when test="${empty member}">
                        			<a href="inquiry.do" id="inquiryLink">1:1문의하기</a>
                        		</c:when>
								<c:otherwise>
									<a href="inquiry.do">1:1문의하기</a>
								</c:otherwise>                        		
                        	</c:choose>
                        </td>
                    </tr>
                </table>
            </div>            
            	<c:choose>
            		<c:when test="${status == 'faq_member'}">
            			<div id="div_section">
            			<jsp:include page="faq_member.jsp"></jsp:include>
            			</div>
            		</c:when>
            		<c:when test="${status == 'faq_order'}">
            			<div id="div_section">
            			<jsp:include page="faq_order.jsp"></jsp:include>
            			</div>
            		</c:when>
            		<c:when test="${status == 'faq_cancel'}">
            			<div id="div_section">
            			<jsp:include page="faq_cancel.jsp"></jsp:include>
            			</div>
            		</c:when>
            		<c:when test="${status == 'faq_return'}">
            			<div id="div_section">
            			<jsp:include page="faq_return.jsp"></jsp:include>
            			</div>
            		</c:when>
            		<c:when test="${status == 'faq_other'}">
            			<div id="div_section">
            			<jsp:include page="faq_other.jsp"></jsp:include>
            			</div>
            		</c:when>
            		<c:when test="${status == 'faq_write'}">
            			<div id="div_section">
            			<jsp:include page="faq_write.jsp"></jsp:include>
            			</div>
            		</c:when>
            		<c:when test="${status == 'notice'}">
            			<div id="div_section">
            			<jsp:include page="notice.jsp"></jsp:include>
            			</div>
            		</c:when>
            		<c:when test="${status == 'notice_write'}">
            			<div id="div_section">
            			<jsp:include page="notice_write.jsp"></jsp:include>
            			</div>
            		</c:when>
            		<c:when test="${status == 'event'}">
            			<jsp:include page="event.jsp"></jsp:include>
            		</c:when>
            		<c:when test="${status == 'event_write'}">
            			<div id="div_section">
            			<jsp:include page="event_write.jsp"></jsp:include>
            			</div>
            		</c:when>
            		<c:when test="${status == 'inquiry'}">
            			<div id="div_section">
            			<jsp:include page="inquiry.jsp"></jsp:include>
            			</div>
            		</c:when>
           		</c:choose>
            </div>
        </div>
    </div>
    <div id="div_footer">
        고객센터 이용안내 <span>운영시간09:00~21:00</span>
    </div>
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
