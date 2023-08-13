<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 설정</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
	/* ---------------------전체 요소 공통--------------------- */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');       
    *{margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}

    /* 임시(삭제삭제) */
    body{
        width: 700px;
        height: 750px;
    }

    /* ---------------------배송지 추가 메인영역--------------------- */
    #aa_area{
        width: 100%;
        height: 100%;
        color: #222;
    }

    /* ---------------------배송지 추가 헤더--------------------- */
    #aa_header{
        border-bottom: 2px solid #222;
        padding: 10px 0;
        text-align: center;
        font-size: 22px;
        box-sizing: border-box;
    }
    
    /* ---------------------배송지 추가 섹션--------------------- */
    #aa_section{
        display: flex;
        flex-direction: column;
        align-items: center;

        width: 100%;
        height: 100%;
    }

    /* ---------------------배송지 관리--------------------- */
    #aa_management_area{
        display: flex;
        flex-direction: column;
        width: 95%;

        margin-top: 50px;
    }

    /* ---------------------초기화 버튼--------------------- */
    #btn_reset{
        width: 70px;
        height: 25px;

        margin-bottom: 5px;
        float: right;
        background-color: #e53838;
        border: 0;
        color: white;
        font-size: 12px;

        cursor: pointer;
    }

    /* ---------------------배송지 추가 테이블--------------------- */
    #aa_m_table{
        width: 100%;
        border-spacing: 0;
        border-collapse: collapse;
        font-size: 12px;
        color: #666;
        text-align: center;
        border-top: 1px solid #222;
        border-bottom: 1px solid #222;
    }
    #aa_m_table tr:not(:last-child){
        border-bottom: 1px solid #e5e5e5;
        
        
    }
    #aa_m_table tr th{
        height: 60px;
        font-size: 13px;
        color: #222;
        background-color: #f2f2f2;
    }
    #aa_m_table tr:not(:last-child){
        border-bottom: 1px solid #e5e5e5;
    }
    #aa_m_table tr td{
        padding-left: 10px;
        text-align: left;
        box-sizing: border-box;
    }
    #aa_m_table tr td input{
        width: 150px;
        height: 30px;
        padding: 3px 10px;
        margin-right: 10px;
        font-size: 16px;
        border: 1px solid #dddddd;
        outline: 0;
    }
    #tr_address td{
        padding: 11px 0;
    }
    /* 우편번호찾기 버튼 */
    #search_btn{
        width: 100px;
        height: 38px;
        font-size: 13px;
        border: 1px solid #dddddd;
        border-radius: 3px;
        background-color: #fcfcfc;
        cursor: pointer;
    }
    /* ---------------------배송지 추가 테이블 주소 div--------------------- */
    .div_Addr_contents{
        display: flex;
        flex-direction: row;
        align-items: center;
    }
    #div_roadAddr{
        margin: 5px 0;
    }
    #div_jibunAddr{
        margin-bottom: 5px;
    }
    .Addr_title{   
        width: 45px;
        height: 25px;
        margin-right: 10px;
        text-align: center;
        line-height: 25px;
        background-color: #f5f5f5;
        border: 1px solid #666;
        color: #222;
        user-select: none;
    }
    #roadAddr_contents, #jibunAddr_contents{
        font-size: 14px;
    }
    #input_detail:not(:last-child){
        width: 400px;
    }

    /* ---------------------배송지 설정 안내문구--------------------- */
    #aa_m_notice{
        margin: 10px 0;
        padding: 0 10px;
        font-size: 12px;
        color: #777777;
    }
    #aa_m_notice ul{
        list-style: none;
    }

    /* ---------------------배송지 설정 버튼 박스--------------------- */
    #aa_m_btn_box{
        display: flex;
        flex-direction: row;
        justify-content: center;

        margin-top: 25px;
    }
    /* 버튼 공통 */
    #aa_m_btn_box button{
        width: 150px;
        height: 45px;
        margin: 0 5px;
        font-size: 16px;
        line-height: 45px;
        border-radius: 3px;
        cursor: pointer;
    }
    /* 기본 배송지로 설정 버튼 */
    #btn_confirm{
        border: 1px solid #3b3b3b;
        background: #3b3b3b;
        color: white;
    }
    /* 현재 주문 배송지로 설정 버튼 */
    #btn_cancel{
        border: 1px solid #ccc;
        background-color: #f9f9f9;
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
	        self.close();
	    });

        /* ---------------------초기화 버튼------------------- */
        $("#btn_reset").click(function(){
            $("#div_Addr").hide();
        });


        /* ---------------------주소 찾기------------------- */
        //*** 우편번호찾기 버튼 클릭 이벤트 처리 ***//
        $("#search_btn").click(function(){
            search_address();
        });
        
        //*** 주소찾기 api 팝업창 ***//
        function search_address() {
            new daum.Postcode({
                oncomplete: function(data) {

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    let roadAddr = data.roadAddress; // 도로명 주소 변수
                    let extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    $("#input_postnum").val(data.zonecode);
                    $("#roadAddr_contents").text(roadAddr);
                    $("#jibunAddr_contents").text(data.jibunAddress);
                    
                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                    if(extraRoadAddr !== ''){
                        $("#roadAddr_contents").text($("#roadAddr_contents").text() + ", " + extraRoadAddr);
                    }

                    var guideTextBox = document.getElementById("guide");
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if(data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';

                    } else if(data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                    }
                },

                onclose: function(state) {
                    
                    if(state === 'COMPLETE_CLOSE'){
                        $("#div_Addr").show();
                    }
                }
            }).open();
            
        }
        
        /* ---------------------새 배송지 테이블 저장------------------- */
        //*** 저장 전 입력 데이터 유효성 검사 ***//
        function checkInput() {
			
        	let m_idx = $("#m_idx");
			let a_name = $("#input_a_name");
			let receiver = $("#input_receiver");
			let selnum = $("#input_selnum");
			let postnum = $("#input_postnum");
			let roadAddr = $("#roadAddr_contents");
			let jibunAddr = $("#jibunAddr_contents");
			let detail = $("#input_detail");
			
			if (a_name.val() === "") {
				alert("주소별칭을 입력해주세요.");
				a_name.focus();
			} else if (receiver.val() === "") {
				alert("받는분 성함을 입력해주세요.");
				receiver.focus();
			} else if (selnum.val() === "") {
				alert("전화번호를 입력해주세요.");
				selnum.focus();
			} else if (roadAddr.text() === "") {
				alert("우편번호 찾기를 해주세요.");
			} else if (detail.val() === "") {
				alert("상세주소를 입력해주세요.");
				detail.focus();
			} else {
								
				$.ajax({
	        		type: "POST",
	                url: "checkNewAddr.do", // AjaxCartController
	                data: {
	                	m_idx: parseInt(m_idx.val()),
	                	a_name: a_name.val(),
	                	receiver: receiver.val(),
	                	selnum: selnum.val(),
	                	postnum: postnum.val(),
	                	roadAddr: roadAddr.text(),
	                	jibunAddr: jibunAddr.text(),
	                	detail: detail.val()
	                },
	                success: function (response) { // 업데이트된 배송지 목록 객체 반환
	                    if (response === 0) { // 업데이트가 성공한 경우
	                    	alert("배송지 등록이 완료되었습니다.");
	                    	// 배송지 등록 후 이전 페이지로 복귀 + 새로고침
	                    	location.href = document.referrer;
	                     } else if (response === 1) { // 주소별칭 중복
							alert("이미 등록된 주소별칭입니다.");
	                     } else if (response === 2) { // 주소 중복 (상세주소까지 완전 일치)
	                    	alert("이미 등록된 주소입니다.");
	                     } else {
	                    	alert("새 배송지 등록 실패");
	                     }
					},
					error: function () {
						alert("오류가 발생하였습니다.");
					}
				}); // end of ajax
				
				
			}
        }
        
		//*** 확인 버튼 클릭 이벤트 처리 ***//
		$("#btn_confirm").click(function(){
			checkInput();
		});
		
    });
</script>

</head>
<body>
	
<div id="aa_area">

	<div id="aa_header">
		배송지 추가
		<input type="hidden" id="m_idx" value="${param.m_idx}">
	</div>

	<div id="aa_section">
	
		
		
		<div id="aa_management_area">
            <form id="aa_form">
                <button type="reset" id="btn_reset">초기화</button>
                <div id="aa_m_table_box">
                    <table id="aa_m_table">
                        <colgroup>
                            <col style="width:15%;">
                            <col style="width:85%;">
                        </colgroup>
                        <tr id="tr_a_name">
                            <th>주소별칭</th>
                            <td><input type="text" id="input_a_name" maxlength="7"><span>7자 이내</span></td>
                        </tr>
                        <tr id="tr_receiver">
                            <th>받는분</th>
                            <td><input type="text" id="input_receiver" maxlength="5"><span>5자 이내</span></td>
                        </tr>
                        <tr id="tr_selnum">
                            <th>휴대폰</th>
                            <td><input type="text" id="input_selnum" maxlength="11"><span>- 없이 입력</span></td>
                        </tr>
                        <tr id="tr_address">
                            <th>배송주소</th>
                            <td>
                                <div style="display: flex;">
                                    <input type="text" id="input_postnum" readonly>
                                    <button type="button" id="search_btn">우편번호찾기</button>
                                </div>
                                <div id="div_Addr" style="display: none;">
                                    <div class="div_Addr_contents" id="div_roadAddr">
                                        <div class="Addr_title">도로명</div><div id="roadAddr_contents"></div>
                                    </div>
                                    <div class="div_Addr_contents" id="div_jibunAddr">
                                        <div class="Addr_title">지번</div><div id="jibunAddr_contents"></div>
                                    </div>
                                    <input type="text" id="input_detail" placeholder="상세주소 입력" maxlength="100">
                                    <span id="guide" style="color:#999;display:none"></span>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
			
			<div id="aa_m_notice">
				<ul>
					<li>·&nbsp;&nbsp;배송지는 최대 5개 까지 저장 가능합니다.</li>
					<li>·&nbsp;&nbsp;배송지 수정 시 이미 존재하는 주소별칭 또는 주소와 중복될 수 없습니다.</li>
					<li>·&nbsp;&nbsp;휴대폰 번호는 연락 가능한 번호여야 합니다.</li>
					<li>·&nbsp;&nbsp;상세주소를 정확하게 입력해주세요.</li>
				</ul>
			</div>
			
			<div id="aa_m_btn_box">
				<button type="button" id="btn_confirm">확인</button>
				<button type="button" id="btn_cancel" onclick="history.back()">취소</button>
			</div>
			
					
		</div>
		
	</div>	
</div>
	
	
</body>
</html>