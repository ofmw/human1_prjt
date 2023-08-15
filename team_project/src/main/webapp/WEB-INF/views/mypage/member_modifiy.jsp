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
        th{
            
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
        .mp_member_modifiy{
        	
        	display: none;
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
	function checkPwAndShowForm() {
		var PwCheck = document.getElementById("m_pw").value;		
		var Pw = ${member.m_pw};
		
		console.log(${member.m_pw});
		
		if(PwCheck === pw){
		document.getElementById("mp_memberPw_check").style.display = "none";
		document.getElementById("mp_member_modifiy").style.display = "block";
		} else {
			alert("비밀번호가 일치하지 않습니다.");
		}
	}
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
						<td><input type="password" id="m_pwCheck"></td>
						                	
               		</tr>
				</table>
				<div>
					<button type="button" onclick="checkPwAndShowForm()">확인</button>
				</div>
        	</div>
        	<div id="mp_member_modifiy" class="mp_member_modifiy">
        		<table id="tbl_join">
                    <tr>
                        <td>
                            <p>이름</p>
                            <input type="text" name="m_name" id="m_name" value="${member.m_name}">
                            <div class="check" id="name_check"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>생년월일 및 성별</p>
                                <fieldset>
                                    <input type="text" name="birth" id="birth" placeholder="●●●●●●" maxlength="6">
                                    <p>-</p>
                                    <input type="text" name="gender" id="gender" placeholder="●" maxlength="1">
                                    <input type="text" id="fld_block" value="●●●●●●" disabled style="background-color: white;">
                                </fieldset>
                                <div class="check" id="birth_check"></div>
                        </td>
                    </tr>
                    <tr>
                        <td id="sel_aNum">
                            <p>휴대폰 번호</p>
                                    <input type="text" name="selNum" id="selNum">
                                    <button type="button" id="btn_get_aNum">인증번호 받기</button>
                                    <div class="check" id="selNum_check"></div>
                        </td>
                    </tr>
                    <tr>
                        <td id="aNum_behind">
                            <input type="text" id="aNum">
                            <button onclick="location.href=''" id="btn_check_aNum">인증하기</button></td>
                    </tr>
                    <tr>
                        <td id="aNum_behind">
                            <p>아이디</p>
                            	<input type="text" name="m_id" id="m_id"><br>
                            	<div class="check" id="id_check"></div>
                    
                            <p>비밀번호</p>
                                <input type="password" name="m_pw" id="m_pw"><br>
                                <div class="check" id="pw_check"></div>
                        
                            <p>비밀번호 확인</p>
                           		<input type="password" name="m_pwCheck" id="m_pwCheck"><br>
                            	<div class="check" id="pw_check2"></div>
                        
                            <button type="submit" name="btn_join" id="btn_join">가입하기</button>
                        </td>
                    </tr>
                </table>
        	</div>

   		</div>
   	</div>
	
</section>

<!-- 푸터 -->
<footer><jsp:include page="../common/footer.jsp"></jsp:include></footer>

</body>
</html>