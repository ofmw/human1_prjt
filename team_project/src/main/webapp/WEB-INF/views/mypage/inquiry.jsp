<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>1:1 문의</title>
    
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../resources/js/mypage.js"></script>
<link href="../resources/css/mypage/mypage.css" rel="stylesheet">
<link href="../resources/css/mypage/mypage-common.css" rel="stylesheet">
<style>
	.mp_main_title{
		padding-bottom: 15px;
		font-size: 20px;
		font-weight: bold;
		border: none;
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
		text-align: center;
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
		cursor: pointer;
	}
	.td_ans_date{
		font-size: 14px;
		color: #777;
	}
	#td_pnav{
		height: 50px;
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
        
       	checkEmpty();
        
	});	
	
	function checkEmpty() {
		
		let visibleRowCount = $("#mp_main_inquiry_content table tr:visible").length;
			
			console.log("현재 표시된 내역: " +visibleRowCount);
			
			if (visibleRowCount === 1) {
	        $("#tr_empty_history").show();
	    } else {
	        $("#tr_empty_history").hide();
	    }
	}


</script>
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

        <div id="mp_main">
			<div id="mp_main_inquiry" class="mp_main_obj">
                <div class="mp_main_title">1:1 문의</div>
                <div id="mp_main_inquiry_content">
                    <table >
                        <colgroup>
                            <col style="width: 9%;">
                            <col style="width: 54%;">
                            <col style="width: 15%;">
                            <col style="width: 7%;">
                            <col style="width: 15%;">
                        </colgroup>
                        <tr>
                            <th>작성일</th>
                            <th>제목</th>
                            <th>답변일자</th>
                            <th>진행상태</th>
                            <th>선택</th>
                        </tr>
                        <c:forEach items="${inquiryList}" var="inquiry">
                        <tr>
                            <td class="td_date"><fmt:formatDate value="${inquiry.post_date}" pattern="yyyy-MM-dd"/></td>
                            <td class="td_title">${inquiry.title}</td>
                            <td class="td_ans_date">
                            	<c:choose>
		                    		<c:when test="${inquiry.reply_state eq '0'}">
								        -
								    </c:when>
								    <c:when test="${inquiry.reply_state eq '1'}">
								        <fmt:formatDate value="${inquiry.ans_date}" pattern="MM-dd HH:mm"/>
								    </c:when>
								    <c:otherwise>
								        <fmt:formatDate value="${inquiry.ans_date}" pattern="MM-dd HH:mm"/>
								    </c:otherwise>
								 </c:choose>
                            </td>
                            <td class="td_state">
								<c:choose>
		                    		<c:when test="${inquiry.reply_state eq '0'}">
								        진행중
								    </c:when>
								    <c:when test="${inquiry.reply_state eq '1'}">
								        답변완료
								    </c:when>
								    <c:otherwise>
								        ${inquiry.reply_state}
								    </c:otherwise>
								 </c:choose>
							</td>
                            <td><input type="hidden" class="b_idx" value="${inquiry.b_idx}"/><a class="inquiry_detail_btn">문의상세내역</a></td>
                        </tr>
                        </c:forEach>
                        <tr id="tr_empty_history" style="display:none;height:210px;"><td colspan="5">1:1 문의 내역이 없습니다!</td></tr>
                    </table>
                </div>
					<div id="mp_notice">
						<div id="mp_notice_title">1:1 문의 안내</div>
		                <div id="mp_notice_content">
	                	<ul>
	                		<li>고객센터 1:1 문의에 작성하신 문의 내역입니다.</li>
	                		<li>상세 내용은 '문의상세내역' 버튼을 클릭하여 확인 가능합니다.</li>
	                	</ul>
	                </div>
	            </div>
           	</div>
        </div>

    </div>

</section>

<!-- 푸터 -->
<footer><jsp:include page="../common/footer.jsp"></jsp:include></footer>

</body>
</html>