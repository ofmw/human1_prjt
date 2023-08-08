<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 설정</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
	/* ---------------------전체 요소 공통--------------------- */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');       
    *{margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}

    /* 임시(삭제삭제) */
    body{
        width: 700px;
        height: 770px;
    }

    /* ---------------------배송지 변경 메인영역--------------------- */
    #ca_area{
        width: 100%;
        height: 100%;
        color: #222;
    }

    /* ---------------------배송지 변경 헤더--------------------- */
    #ca_header{
        border-bottom: 2px solid #222;
        padding: 10px 0;
        text-align: center;
        font-size: 22px;
        box-sizing: border-box;
    }
    
    /* ---------------------배송지 변경 섹션--------------------- */
    #ca_section{
        display: flex;
        flex-direction: column;
        align-items: center;

        width: 100%;
        height: 100%;
    }

    /* ---------------------현재 선택된 배송지--------------------- */
    #ca_selected_address{
        width: 95%;
        margin: 20px 0;
        padding: 10px 5px;
        font-size: 13px;
        color: #666;
        border-top: 1px solid #222;
        border-bottom: 1px solid #222;
        box-sizing: border-box;
    }
    #selected_address_title{
        margin-bottom: 5px;
        font-size: 18px;
        color: #00aeef;
    }
    #selected_address_nickname span:first-child{
        color: #e24f4f;
    }
    #selected_address_nickname span:last-child{
        font-weight: bold;
    }
    #empty_selected_address{
    	text-align: center;
    	color: #00aeef;
    	font-size: 18px;
    }

    /* ---------------------배송지 관리--------------------- */
    #ca_management_area{
        width: 95%;
        display: flex;
        flex-direction: column;
        /* align-items: center; */
    }

    /* ---------------------새 배송지 추가 버튼--------------------- */
    #ca_m_addNewAddress{
        margin-bottom: 5px;
    }
    #ca_m_addNewAddress button{
        width: 100px;
        height: 25px;

        float: right;
        background-color: #4a4643;
        border: 1px solid #000;
        color: #fff;
        font-size: 12px;
        box-sizing: border-box;

        cursor: pointer;
    }

    /* ---------------------배송지 목록 테이블--------------------- */
    #ca_m_table{
    	width: 100%;
        border-spacing: 0;
        border-collapse: collapse;
        font-size: 12px;
        color: #666;
        text-align: center;
        border-top: 1px solid #222;
        border-bottom: 1px solid #222;
    }
    #ca_m_table tr:first-child{
        border-bottom: 1px solid #e5e5e5;
        font-size: 13px;
        color: #222;
    }
    #ca_m_table tr:first-child th{
        height: 40px;
        background-color: #f2f2f2;
    }
    #ca_m_table tr:not(:last-child){
        border-bottom: 1px solid #e5e5e5;
    }
    .td_sel_address, .td_selnum{
        border-right: 1px solid #e5e5e5;
    }
    .td_address_nickname .div_def_add{
        color: #e53838;
    }
    .td_address_nickname .div_cur_add{
        color: #00aeef;
    }
    .td_address{
        padding: 15px 0;
        text-align: left;
    }
    /* 수정, 삭제 버튼 */
    .td_option button{
        width: 40px;
        height: 25px;
        margin: 1px 0;
        background-color: #fcfcfc;
        border: 1px solid #e1dfde;
        cursor: pointer;
        font-size: 12px;
    }
    
    /* 주소 목록이 비었을 경우 */
    #tr_empty_address td{
        height: 200px;
        text-align: center;
        font-size: 20px;
    }

    /* ---------------------배송지 설정 안내문구--------------------- */
    #ca_m_notice{
        margin: 10px 0;
        padding: 0 10px;
        font-size: 12px;
        color: #777777;
    }
    #ca_m_notice ul{
        list-style: none;
    }

    /* ---------------------배송지 설정 버튼 박스--------------------- */
    #ca_m_btn_box{
        display: flex;
        flex-direction: row;
        justify-content: center;

        margin-top: 25px;
    }
    /* 버튼 공통 */
    #ca_m_btn_box button{
        height: 45px;
        margin: 0 5px;
        font-size: 16px;
        border-radius: 3px;
        line-height: 45px;
        cursor: pointer;
    }
    #ca_m_btn_box button:not(:last-child){
        width: 200px;
        border: 0;
        color: white;
    }
    /* 기본 배송지로 설정 버튼 */
    #btn_set_default{
        background-color: #e53838;
    }
    /* 현재 주문 배송지로 설정 버튼 */
    #btn_set_current{
        background-color: #00aeef;
    }
    /* 창 닫기 버튼 */
    #btn_close_window{
        width: 100px;
        background-color: #fcfcfc;
        border: 1px solid #dddddd;
    }
</style>
	
<script>
	$(function() {
		
		let close_btn = $("#btn_close_window");
		
		close_btn.click(function() {
			opener.document.location.reload();
			self.close();
	    });
		
		
		/* ---------------------빈 배송지 목록 표시--------------------- */
        //*** 테이블의 tr 요소 개수 확인 ***//
        function countVisibleRows() {
            // 숨김처리된 #tr_empty_address 행을 제외한 나머지 행의 개수 반환
            return $('table tr:not(#tr_empty_address)').length;
        }
        //*** tr_empty_address를 보이도록 처리 ***//
        function showEmptyAddressRow() {
            $('#tr_empty_address').show();
        }
        //*** tr_empty_address를 숨기도록 처리하는 함수 ***//
        function hideEmptyAddressRow() {
            $('#tr_empty_address').hide();
        }
        //*** 배송지 목록 개수 체크 및 .tr_empty_address 표시여부 결정 ***//
        function checkEmptyAddress() {

            // 테이블의 행의 개수 확인
            let rowCount = countVisibleRows();

            if (rowCount === 1) { // 배송지 목록이 비었을 경우
                showEmptyAddressRow();
            } else { // 배송지 목록에 배송지가 1개 이상일 경우
                hideEmptyAddressRow();
            }
        }

        // 페이지 로드 시 배송지 목록 확인 후 초기 처리
        checkEmptyAddress();

        // Mutation Observer 생성
        const observer = new MutationObserver(function(mutationsList, observer) {
            for (let mutation of mutationsList) {
                if (mutation.type === 'childList') {
                    // 테이블의 DOM 하위 트리가 변경되었을 때 처리할 내용
                    checkEmptyAddress();
                }
            }
        });

        // Observer 설정
        const targetNode = document.querySelector('table'); // 감시할 DOM 요소
        const config = { childList: true }; // 감시할 변화 타입 설정
        observer.observe(targetNode, config); // Observer 시작
        
        /* ---------------------기본 배송지로 설정--------------------- */
        
        $("#btn_set_default").on("click", function(){
        	
        	let m_idx = parseInt($("#m_idx").val());
        	let tr = $("input[type='radio']:checked").closest("tr");
        	let a_name = tr.find(".a_name").val();
        	let def_add = parseInt(tr.find(".def_add").val());
        	
        	if(def_add === 0) {
				$.ajax({
	        		type: "POST",
	                url: "update_def_address.do", // AjaxCartController
	                data: {
	                	m_idx: m_idx,
	                    a_name: a_name
	                },
	                success: function (response) { // 업데이트된 배송지 목록 객체 반환
	                    if (response != null) { // 업데이트가 성공한 경우
	                    	alert('기본 배송지가 "' +a_name+ '" (으)로 변경되었습니다.');
	                    	checkRadio();
	                 	    $("#ca_area").load(location.href + "#ca_m_table");
							$("#ca_area").load(location.href + "#ca_selected_address");
	                     } else {
	                         alert("기본 배송지 업데이트에 실패하였습니다.");
	                     }
					},
					error: function () {
						alert("오류가 발생하였습니다.");
					}
				}); // end of ajax
        	} else {
        		alert("이미 기본배송지로 설정되어 있습니다.");
        	}
        });
        
        /* ---------------------현재 주문 배송지로 선택--------------------- */
        $("#btn_set_current").on("click", function(){
        	
        	let tr = $("input[type='radio']:checked").closest("tr");
        	let a_name = tr.find(".a_name").val();
        	let flag = tr.find(".div_cur_add");
        	
        	if(flag.length === 0) {
        	
	        	$.ajax({
	        		type: "POST",
	                url: "set_cur_address.do", // AjaxCartController
	                data: {
	                    a_name: a_name
	                },
	                success: function (response) { // 업데이트된 배송지 목록 객체 반환
	                    if (response === "success") { // 업데이트가 성공한 경우
	                    	alert("현재 주문 배송지로 설정되었습니다.\n웹 브라우저를 종료할 경우 등록하신 기본 배송지로 재설정됩니다.");
	                    	opener.document.location.reload();
	                    	self.close();
	                 	    //$("#ca_area").load(location.href + "#ca_m_table");
							//$("#ca_area").load(location.href + "#ca_selected_address");
	                     } else {
	                         alert("현재 배송지로 설정에 실패하였습니다.");
	                     }
					},
					error: function () {
						alert("오류가 발생하였습니다.");
					}
				}); // end of ajax
        	  	
        	} else {
        		alert("이미 현재 주문 배송지로 선택되었습니다.");
        	} // end of flag
        	
        });
        
        /* ---------------------라디오 버튼 미리 선택--------------------- */
        function checkRadio() {
        	
        	let divCurAdd = $(".div_cur_add");
            let divDefAdd = $(".div_def_add");

            if (divCurAdd.length === 0) {
                let target = divDefAdd.closest("tr");
                target.find(".sel_address").prop("checked", true);
            } else {
                let target = divCurAdd.closest("tr");
                target.find(".sel_address").prop("checked", true);
            }
        }
        
        //*** 자식창이 열렸을 때 라디오 버튼 체크 확인 ***//
        checkRadio();
	});
</script>

</head>
<body>
	
<div id="ca_area">

	<div id="ca_header">
		배송지 설정
		<input type="hidden" id="m_idx" value="${m_idx}">
	</div>

	<div id="ca_section">
	
		<div id="ca_selected_address">
			<c:choose>
				<c:when test="${!empty AddressList}">
					
					<c:forEach items="${AddressList}" var="a">
						<c:choose>
							<c:when test="${!empty current_add}">
								<c:if test="${current_add eq a.a_name}">
									<div id="selected_address_title">현재 선택된 배송지</div>
									<div id="selected_address_nickname">
						                <span>[${a.a_name}]</span>
						                <span>홍길동</span>
						            </div>
									<div id="selected_address_postnum">(${a.postnum})</div>
									<div id="selected_address_1">도로명: ${a.address}, ${a.detail}</div>
									<div id="selected_address_2">지번: ${a.address}, ${a.detail}</div>
								</c:if>
							</c:when>
							<c:otherwise>
								<c:if test="${a.def_add eq '1'}">
									<div id="selected_address_title">현재 선택된 배송지</div>
									<div id="selected_address_nickname">
						                <span>[${a.a_name}]</span>
						                <span>홍길동</span>
						            </div>
									<div id="selected_address_postnum">(${a.postnum})</div>
									<div id="selected_address_1">도로명: ${a.address}, ${a.detail}</div>
									<div id="selected_address_2">지번: ${a.address}, ${a.detail}</div>
								</c:if>
							</c:otherwise>
						</c:choose>
					</c:forEach>
										
				</c:when>
				<c:otherwise>
					<div id="empty_selected_address">현재 선택된 배송지가 없습니다!</div>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div id="ca_management_area">
			<div id="ca_m_addNewAddress"><button type="button">새 배송지 추가</button></div>
			<div id="ca_m_table_box">
				<table id="ca_m_table">
					<colgroup>
						<col style="width:5%;">
						<col style="width:12%;">
						<col style="width:10%;">
						<col style="width:52%;">
						<col style="width:14%;">
						<col style="width:7%;">
					</colgroup>
					<tr>
						<th>선택</th>
						<th>주소별칭</th>
						<th>받는분</th>
						<th>주소</th>
						<th>연락처</th>
						<th>설정</th>
					</tr>
					<tr id="tr_empty_address" style="display: none;">
						<td colspan="6">등록된 배송지가 없습니다!<br>배송지를 등록해주세요.</td>
					</tr>
					
					<c:if test="${!empty AddressList}">
						<c:forEach items="${AddressList}" var="a">
							<tr>
								<td class="td_sel_address"><input type="radio" name="sel_address" class="sel_address"></td>
								<td class="td_address_nickname">
								<input type="hidden" class="a_name" value="${a.a_name}">
								<input type="hidden" class="def_add" value="${a.def_add}">
									<c:choose>
										<c:when test="${a.def_add eq '1' and current_add eq a.a_name}">
											<div class="div_def_add">기본배송지</div>
											<div class="div_cur_add">현재배송지</div>
											<div>${a.a_name}</div>
										</c:when>
										<c:when test="${a.def_add eq '1'}">
											<div class="div_def_add">기본배송지</div>
											<div>${a.a_name}</div>
										</c:when>
										<c:when test="${current_add eq a.a_name}">
											<div class="div_cur_add">현재배송지</div>
											<div>${a.a_name}</div>
										</c:when>
										<c:otherwise>
											<div>${a.a_name}</div>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="td_receiver">홍길동</td>
								<td class="td_address">
		                            <div>(${a.postnum})</div>
		                            <div>도로명: ${a.address}, ${a.detail}</div>
		                            <div>지번: ${a.address}, ${a.detail}</div>
		                        </td>
								<td class="td_selnum">010-1234-1324</td>
								<td class="td_option">
									<c:choose>
										<c:when test="${a.def_add eq '1'}">
											<button type="button">수정</button>
										</c:when>
										<c:otherwise>
											<button type="button">수정</button>
											<button type="button">삭제</button>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
			
			<div id="ca_m_notice">
				<ul>
					<li>·&nbsp;&nbsp;배송지는 최대 5개 까지 저장 가능합니다.</li>
					<li>·&nbsp;&nbsp;기본 배송지로 설정할 경우 주문결제 시 자동으로 해당 주소로 자동 설정됩니다.</li>
                    <li>·&nbsp;&nbsp;기본 배송지는 삭제할 수 없습니다.</li>
					<li>·&nbsp;&nbsp;결제 전 배송지를 반드시 확인해주세요.</li>
				</ul>
			</div>
			
			<div id="ca_m_btn_box">
				<button type="button" id="btn_set_default">기본 배송지로 설정</button>
				<button type="button" id="btn_set_current">현재 주문 배송지로 설정</button>
				<button type="button" id="btn_close_window">닫기</button>
			</div>
			
					
		</div>
		
	</div>	
</div>
	
	
</body>
</html>