<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
    <title>회원정보수정</title>
    
    <link href="../resources/css/mypage/mypage.css" rel="stylesheet">
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="../resources/js/mypage.js"></script>
    
    <style>
    
    	/* a태그 공통 */
		a:hover:not(#div_category a){text-decoration: underline;}
    	
    	#mp_header_area li span:hover{
    	text-decoration: underline;
    	cursor: pointer;
    	}
    
    	#mp_main {
    		height: 600px;
    		position: relative;
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
        	width: 1000px;
        }
        .mp_memberPw_check p{
          	margin-bottom: 40px;
          	padding-bottom: 10px;
          	border-bottom: 1px solid black;
        	font-size: 24px;
        }
        .mp_memberPw_check th{
        	text-align: left;
        	width: 200px;
        }
        .mp_memberPw_check td{
        	text-align: left;
        }
        .mp_memberPw_check table input{
        	padding-left: 5px;
        	width: 200px;
        	height: 24px;
        	border: 1px solid #777;
        }
        .mp_memberPw_check button {
        	margin-top: 30px;
		    margin-left: -65px;
		    display: flex;
		    align-items: center;
		    justify-content: center;
        	position: absolute;
        	padding: 12px 16px 10px;
		    width: 130px;
		    height: 42px;
		    font-size: 16px;
		    left: 50%;
		    background: #f14f4f;
    		border: 1px solid #da3a3a;
    		color: #fff;
    		cursor: pointer;
		}
        .mp_member_modifiy{
        	display: none;
        }
        .mp_member_modifiy tr:first-child{
        	border-top: 1px solid black;
        }
        .mp_member_modifiy tr:last-child{
        	border-bottom: 1px solid black;
        }
        .mp_member_modifiy tr{
        	border-bottom: 1px solid #e5e5e5;
        }
        .mp_member_modifiy th{
        	text-align: left;
        	width: 200px;
        	user-select: none;
        }
        .mp_member_modifiy td{
        	text-align: left;
        	padding: 15px 0 15px 0;
        }
        .mp_member_modifiy input{
        	padding: 0 5px 0 5px;
        	height: 22px;
        	border: 1px solid black;
        }
		#div_box p{
			margin-bottom: 40px;
          	padding-bottom: 10px;
          	border-bottom: 1px solid black;
        	font-size: 24px;		
		}        
        fieldset{
	        display: flex;
	        justify-content: flex-start;
	        align-items: center;
	        padding: 0;
	        width: 200px;
	        height: 24px;
	        border: none;
	        user-select: none;
	        pointer-events: none;
	    }
	    fieldset input{
	        outline: none;
	        font-size: 17px;
	        letter-spacing: 2px;
	    }
	    #birth, #gender, #fld_block{
	        font-size: 13px;
	        border: none;
	    } 
	    #birth{
	        padding-left: 5px;
	        padding-right: 10px;
	        width: 55px;
	    }
	    #gender{
	        width: 13px;
	        padding-left: 10px;
	        padding-right: 1px;
	        margin-right: 0px;
	    }
	    #fld_block{
	        width: 90px;
	        padding-left: 0px;
	        padding-right: 20px;
	    }
	    #m_id{
	    	border: none;
	    	user-select: none;
	    	pointer-events: none;
	    }
	    #star{
	    	color: red;
	    }
	    #div_button{
			position: absolute;
	    	margin-top: 30px;
		    margin-left: -140px;
        	padding: 12px 16px 10px;
		    width: 280px;
		    height: 42px;
		    left: 50%;
	    }
	    #cancel_btn, #btn_update{
		    width: 130px;
		    height: 42px;
		    font-size: 16px;
		    background: #f14f4f;
    		border: 1px solid #da3a3a;
    		color: #fff;
    		cursor: pointer;
	    }
	    #cancel_btn{
	    	margin-right: 16px;
	    	background: #e5e5e5;
	    	border: 1px solid #777; 
	    	color: black; 
	    }
	    .td_input-container{
	    	display: flex;
	    	align-items: center;	
	    }
	    #name_check, #selNum_check {
	    	padding-left: 5px;
	    	font-size: 13px;
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

	function hashPassword(password) {
		var hash = sha256(password);
		return hash;
	}
	
	function checkPw() {
		var password = $('#pw_check').val();
		console.log("비번: " + password);
		$.ajax({
            type: 'POST',
            url: 'check_password', // 서버의 비밀번호 확인 엔드포인트 URL
            data: { password: password },
            success: function(response) {
                if (response === 'match') {
                    document.getElementById("mp_memberPw_check").style.display = "none";
                    document.getElementById("mp_member_modifiy").style.display = "block";
                    // 비밀번호 일치 시 추가 작업 수행
                } else {
                    alert("비밀번호를 확인해주세요");
                    document.getElementById("pw_check").value = "";
                    document.getElementById("pw_check").focus();
                }
            }
        });
	}
	

	document.addEventListener("DOMContentLoaded", function(){
		var birthInput = document.getElementById("birth");
		var formattedBirth = birthInput.value.split("-").join("").substring(2);
		birthInput.value = formattedBirth;
	});
	
	$(document).ready(function(){
		var namePattern = /^[가-힣]{2,6}$/;
		var selNumPattern = /^(010|011)[0-9]{7,8}$/;
		
		$('#frm_update').submit(function(event){

	        var nameInput = $('#input_name');
	        var nameValue = nameInput.val().trim();
	        var selNumInput = $('#input_selNum');
	        var selNumValue = selNumInput.val().trim();
	        
	        if (!namePattern.test(nameValue)) {
	            alert('이름을 올바른 형식에 맞게 작성해주세요.');
	            nameInput.focus();
	            event.preventDefault(); // 폼 전송 막기
	            return; // 전송 중단
	        }

	        if (nameValue === '') {
	        	event.preventDefault(); // 폼 전송 막기
	        	nameInput.focus();
	            alert('이름을 입력해주세요.');
	            return; // 전송 중단
	        }
	        
	        if (!selNumPattern.test(selNumValue)) {
	            alert('전화번호를 올바른 형식에 맞게 작성해주세요.');
	            selNumInput.focus();
	            event.preventDefault(); // 폼 전송 막기
	            return; // 전송 중단
	        }

	        if (selNumValue === '') {
	        	event.preventDefault(); // 폼 전송 막기
	        	selNumInput.focus();
	            alert('전화번호를 입력해주세요.');
	            return; // 전송 중단
	        }

	        // 유효성 검사를 모두 통과한 경우, 폼 전송
	        alert("회원정보 수정이 완료되었습니다.");
	        this.submit();
	    });
		
		$('#input_name').blur(function(){
            var nameInput = $(this);
            var nameCheck = $('#name_check');
            
            if (namePattern.test(nameInput.val())) {
                nameCheck.text('');
            } else {
                nameCheck.text('이름을 확인해주세요');
                nameCheck.css('color', 'red');
            }
        });
		
		$('#input_selNum').blur(function(){
            var selNumInput = $(this);
            var selNumCheck = $('#selNum_check');
            
            if(selNumPattern.test(selNumInput.val())) {
                selNumCheck.text('');
            } else {
                selNumCheck.text('올바른 핸드폰 번호 형식이 아닙니다.');
                selNumCheck.css('color', 'red');
            }
            console.log(selNumInput.val());
        });
	});
	
	$(function() {
		/* ---------------------배송지 변경--------------------- */
	    // 기존에 열려있는 자식 창에 대한 변수 초기화
	    let childWindow = null;
		
		//*** 배송지 변경 자식창 열기 ***//
	    function openManageAddress() {
	    	
	    	// 기존에 자식창이 열려있는지에 대한 여부
	    	if (childWindow) { // 이미 자식창이 열려있으면
	            childWindow.close(); // 자식창을 닫음
	        }
	    	
	    	// 자식창에 로그인한 회원이 m_idx 파라미터 값 넘겨줌
	    	let url = "manage_address.do?m_idx=" + $("#session_m_idx").val() + "&page=1";
	    	// 자식창을 열고 그 여부를 변수에 저장
	    	childWindow = window.open(url, '배송지 설정', 'menubar=no,width=700,height=750');
	    	//childWindow = window.open(url, '_blank', 'menubar=no,width=715,height=830');
	    }
	    
	    //*** 배송지 변경 자식창 열기 이벤트 처리 ***//
	    $("#manage_address").on("click", function(){
	    	openManageAddress();
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
            <input type="hidden" id="session_m_idx" value="${member.m_idx}">
            
            <div id="mp_header_user_menu">
                <ul>
                    <li><a href="member_modifiy.do">회원정보 변경</a></li>
                    <li><a href="password_modifiy.do">비밀번호 변경</a></li>
                    <li><span id="manage_address">배송지 관리</span></li>
                    <li><a href="cancel.do">회원 탈퇴</a></li>
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
				<p>회원정보 변경</p>
                <table>
                	<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" id="pw_check"></td>
               		</tr>
               		<tr style="border-bottom: 1px solid black; height: 40px;"></tr>
				</table>
				<div>
					<button type="button" onclick="checkPw()">확인</button>
				</div>
        	</div>
        	<div id="mp_member_modifiy" class="mp_member_modifiy">
        		<div id="div_box">
        			<p>회원정보 변경</p>
        		</div>
        			<h4>필수정보입력</h4><br>
        			<p><span id="star">*</span>표시는 필수입력 항목 이오니 반드시 입력해 주세요.</p>
        		<form action="updateMember_process.do" method="post" name="frm_update" id="frm_update">
        		<table id="tbl_join">
                    <tr>
                    	<th>이름&nbsp;<span id="star">*</span></th>
                        <td class="td_input-container">
                            <input type="text" name="input_name" id="input_name" value="${member.m_name}">
                            <div class="check" id="name_check"></div>
                        </td>
                    </tr>
                    <tr>
                    	<th>생년월일 및 성별&nbsp;<span id="star">*</span></th>
                        <td>
                                <fieldset>
                                    <input type="text" name="birth" id="birth" maxlength="6" value="${member.birth}" readonly>
                                    <p>-</p>
                                    <input type="text" name="gender" id="gender" maxlength="1" value="${member.gender}" readonly>
                                    <input type="text" id="fld_block" value="●●●●●●" readonly style="background-color: white;">
                                </fieldset>
                        </td>
                    </tr>
                    <tr>
                    	<th>휴대폰 번호&nbsp;<span id="star">*</span></th>
                        <td class="td_input-container">
                                    <input type="text" name="input_selNum" id="input_selNum" value="${member.selNum}">
                                    <div class="check" id="selNum_check"></div>
                        </td>
                    </tr>
                    <tr>
                    	<th>아이디&nbsp;<span id="star">*</span></th>
                        <td id="aNum_behind">
                            	<input type="text" name="m_id" id="m_id" value="${member.m_id}" readonly><br>
                            	<div class="check" id="id_check"></div>
                        </td>
                    </tr>
                </table>
                	<div id="div_button">
                			<input type="button" id="cancel_btn" value="취소하기" onclick="history.back()">
                            <button type="submit" name="btn_update" id="btn_update">수정하기</button>
                    </div>
                </form>
        	</div>

   		</div>
   	</div>
	
</section>

<!-- 푸터 -->
<footer><jsp:include page="../common/footer.jsp"></jsp:include></footer>

</body>
</html>