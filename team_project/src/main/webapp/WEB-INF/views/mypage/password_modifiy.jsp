<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
    <title>회원정보수정</title>
    
    <link href="../resources/css/mypage.css" rel="stylesheet">
    
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    
    <style>
    	#mp_main {
    		height: auto;
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
        #tbl_join{
        	border-top: 1px solid black;
        	background-color: rgb(250, 250, 250);
        }
        #td_pnav{
            height: 50px;
        }
        #mp_main_inquiry_info{
            margin-top: 10px;
            font-size: 13px;
            color: #777;
        }
        .mp_memberPw_check{
        	position: absolute;
        	
        }
        .mp_password_modifiy{
        	display: none;
        }
        #mp_password_modify{
        	width: 400px;
        }
        p{
        	font-size: 14px;
        	user-select: none;
        }
        
    </style>

</head>
<script type="text/javascript">
	$(function(){
		$(".inquiry_detail_btn").click(function(){
		    let b_idx = $(this).closest("tr").find(".b_idx").val();
		let url ="inquiry_content.do?b_idx="+b_idx; 
		let childWindow = null;
		                        
		// 기존에 자식창이 열려있는지에 대한 여부
		if (childWindow) { // 이미 자식창이 열려있으면
		childWindow.close(); // 자식창을 닫음
		}
		
		childWindow = window.open(url, '리뷰 작성', 'menubar=no,width=700,height=750');
		
		});
	});	
</script>
<script>
	function hashPassword(password) {
		var hash = sha256(password);
		return hash;
	}
	
	function checkPw() {
		var password = $('#pw_check').val();
		$.ajax({
            type: 'POST',
            url: 'check_password', // 서버의 비밀번호 확인 엔드포인트 URL
            data: { password: password },
            success: function(response) {
                if (response === 'match') {
                    document.getElementById("mp_memberPw_check").style.display = "none";
                    document.getElementById("mp_password_modifiy").style.display = "block";
                    // 비밀번호 일치 시 추가 작업 수행
                } else {
                    alert("비밀번호를 확인해주세요");
                    document.getElementById("pw_check").value = "";
                    document.getElementById("pw_check").focus();
                }
            }
        });
	}
	
	$(document).ready(function(){
		var passwordPattern = /^(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[a-z\d@$!%*?&]{8,12}$/;
		
		/* $("#btn_update").click(function(){
			var newPassword = $("#m_pw").val();
			var newPasswordCheck = $("#m_pwCheck").val();
			
			if (newPassword !== newPasswordCheck){
				
			}
			
			$.ajax({
				type: 'POST',
				url: 'update_process.do',
				data: formData,
				success: function(response) {
					if (response === 'success') {
						alert("비밀번호 변경이 완료되었습니다.");
					} else {
						alert("비밀번호 변경을 실패하였습니다.");
					}
				}
			});
			return false;
		}); */
	
	
	$('#m_pw').blur(function(){
        var passwordInput = $(this);
        var passwordCheck = $('#pw_check');
        
        if (passwordPattern.test(passwordInput.val())) {
            passwordCheck.text('');
        } else {
            passwordCheck.text('8~12자리의 영소문자, 숫자 및 특수문자(@$!%*?&)를 포함해야 합니다.');
            passwordCheck.css('color', 'red');
        }
    });

    $('#m_pwCheck').blur(function(){
        var passwordInput = $('#m_pw');
        var passwordConfirmInput = $(this);
        var passwordConfirmCheck = $('#pw_check2');
        
        if (passwordInput.val() === passwordConfirmInput.val()) {
            passwordConfirmCheck.text('');
        } else {
            passwordConfirmCheck.text('비밀번호가 일치하지 않습니다.');
            passwordConfirmCheck.css('color', 'red');
        }
    });
});
</script>
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
                        <li><a href="inquiry.do">1:1 문의</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div id="mp_main">
			<div id="mp_memberPw_check" class="mp_memberPw_check">
				<p>회원정보수정</p>
                <table>
                	<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" id="pw_check"></td>
						                	
               		</tr>
				</table>
				<div>
					<button type="button" onclick="checkPw()">확인</button>
				</div>
        	</div>
        	<div id="mp_password_modifiy" class="mp_password_modifiy">
        		<div id="div_box">
        			<h4>비밀번호변경</h4>
        		</div>
        		<form action="updatePw_process.do" method="post" name="frm_update" id="frm_update">
        		<input type="hidden" name="m_id" value="${member.m_id}">
	        		<table id="tbl_join">
	                    <tr>
	                        <th>비밀번호</th>
	                        <td><input type="password" name="m_pw" id="m_pw"><br>
	                            <div class="check" id="pw_check"></div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>비밀번호 확인</th>
	                        <td>
	                        	<input type="password" name="m_pwCheck" id="m_pwCheck"><br>
	                            <div class="check" id="pw_check2"></div>
	                        </td>
	                    </tr>
	                </table>
	                <button type="submit" name="sbm_edit" id="sbm_edit">확인</button>
                </form>
        	</div>

   		</div>
   	</div>
	
</section>

<!-- 푸터 -->
<footer><jsp:include page="../common/footer.jsp"></jsp:include></footer>

</body>
</html>