<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inquiry</title>
<style>
    #div_left, #div_right{
        float: left;
        height: 100%;
    }
    #div_left{
        width: 300px;
    }
    #div_left *{
        margin-left: 15px;
        margin-top: 5px;
    }
    #div_left table{
        border-collapse: collapse;
        width: 250px;
    }
    #div_left td{
        border: 1px solid lightgray;
    }
    #div_left tr:nth-child(odd) td{
	    height: 27px;
	    font-size: 14px;
	    line-height: 14px;
	    font-weight: bold;
	    padding-left: 5px;
    }
    #div_left tr:nth-child(even) td{
        background-color: white;
        font-size: 13px;
        line-height: 25px;
        padding: 5px 0px;
    }
    #div_left input{
        float: left;
    }
    #div_left label{
        float: left;
        height: 20px;
        margin-top: -2px;
        user-select: none;
    }
    #div_right{
        position: relative;
        border: 1px solid lightgray;
        margin-top: 37px;
        background-color: white;
        overflow-y: scroll;
        width: 500px;
        height: 500px;
    }
    #div_right table{      
        position: absolute;
        border-collapse: collapse;
        width: 100%;
        table-layout: fixed;
    }   
    #div_right td{
        border: 1px solid lightgray;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        height: 20px;
        line-height: 20px;
        font-size: 12px;
        text-align: center;
    }
    #div_right tr:first-child td{
	    background-color: #f5f5f5;
	    padding: 0px 10px;
    }
    #div_right tr td:nth-child(1){
        background-color: #f5f5f5;
        width: 25px;
        padding: 0;
    }
    #div_right tr td:nth-child(2), #div_right tr td:nth-child(10){
        width: 45px;
    }
    #div_right tr td:nth-child(3), #div_right tr td:nth-child(4), #div_right tr td:nth-child(7), #div_right tr td:nth-child(8), #div_right tr td:nth-child(9){
        width: 60px;
    }
    #div_right tr td:nth-child(5){
        width: 80px;
    }
    #div_right button, #div_right img{
        width: 15px;
        height: 15px;
    }
    #div_right button{
        margin-top: 5px;
    }
    #div_shadow_info{
        position: absolute;
        width: 100%;
        height: 100%;
        background-color: rgba(50, 50, 50, 0.3);
        display: none;
    }
    #div_member_info{
        position: absolute;
        width: 500px;
        height: 400px;
        background-color: white;
        left: 50%;
        margin-left: -310px;
        top: 50%;
        margin-top: -300px;
    }
    #div_inquiry_info{
        position: absolute;
	    width: 600px;
	    height: 700px;
	    background-color: white;
	    left: 50%;
	    top: 50%;
	    transform: translate(-50%, -60%);
    }
    #div_member_info p, #div_inquiry_info p{
        font-size: 13px;
        line-height: 35px;      
        background-color: rgb(240, 240, 240);
        padding-left: 15px;
        font-weight: bold;
        border-bottom: 1px solid lightgray;
        
    }
    #tbl_contents_info, #tbl_contents_inquiry {
        margin: 10px 0px;
    }
    #tbl_contents_inquiry{
    	width: 500px;
    	margin-left: auto;
    	margin-right: auto;    	
    }    
    #tbl_contents_info th, #tbl_contents_info td, #tbl_contents_inquiry th, #tbl_contents_inquiry td {
/*         border: 1px solid lightgray; */
        height: 32px;
        white-space: nowrap;
        font-size: 12px;
    }
    #tbl_contents_info th{
        width: 80px;
        padding-right: 10px;
        text-align: right;
    }
    #tbl_contents_inquiry th{
    	width: 50px;
    	padding-right: 10px;
        text-align: right;
    }
    #tbl_contents_inquiry tr:nth-child(2) th, #tbl_contents_inquiry tr:nth-child(2) td, #tbl_contents_inquiry tr:nth-child(2) th, #tbl_contents_inquiry tr:nth-child(3) td
    #tbl_contents_inquiry tr:nth-child(4) th, #tbl_contents_inquiry tr:nth-child(4) td, #tbl_contents_inquiry tr:nth-child(5) th, #tbl_contents_inquiry tr:nth-child(5) td,
    #tbl_contents_inquiry tr:nth-child(6) th, #tbl_contents_inquiry tr:nth-child(6) td{
    	padding-top: 10px;
    }
    #tbl_contents_inquiry input[type="button"]{
    	float: right;
    	margin-top: 10px;
    	margin-right: 14px;
    	width: 80px;
       	height: 27px;
       	font-size: 11px;
       	font-weight: bold;
       	border: 1px solid lightgray;
       	border-radius: 3px;
       	cursor: pointer;
    }
    #tbl_contents_info td, #tbl_contents_inquiry td{
        width: 150px;
    }
    #tbl_contents_info input[type="text"], #tbl_contents_inquiry input[type="text"]{
        width: 150px;
        height: 25px;
        border: 1px solid lightgray;
        border-radius: 0px;
        font-size: 12px;
        padding-left: 5px;      
        color: black;  
    }
    #tbl_contents_info tr:nth-child(n+4):nth-child(-n+6) td:nth-child(3) input[type="text"]{
	   width: 220px;
	   margin-left: 2px;
    }
    #tbl_contents_info tr th:nth-child(3) {
	   width: 60px;
    }
    #tbl_contents_info tr:last-child td{
	   text-align: right;
	   padding-top: 6px;
    }
    #ans_content{
    	height: 200px;
    	white-space: pre-line;
    }
    #inquiry_content{
    	height: 150px;
    }
    #inquiry_content, #ans_content{
    	padding-left: 5px;
    	padding-right: 5px;
    	width: 407px;
    	resize: none;
    }    	
    #btn_info, #btn_cancel{
       width: 80px;
       height: 27px;
       margin-left: 5px;
       font-size: 11px;
       font-weight: bold;
       border: 1px solid lightgray;
       border-radius: 3px;
       cursor: pointer;
    }
    #btn_info{
       background-color: rgb(52, 152, 219);
       color: white;
    }
    .btn_inquiry{
    	background-color: transparent;
   		min-width: 85px;
   		border: none;
   		color: blue;
	    cursor: pointer;
	    font-size: 12px;
    }
    #btn_info:hover {
	    background-color: rgb(42, 142, 209);
    }
    #btn_cancel:hover {
	    background-color: rgb(230, 230, 230);
    }
    #tbl_contents a{
        color: black;
    }    
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function () {
	  let divShadowInfo = document.getElementById("div_shadow_info");
	  let memberInfoBtns = document.querySelectorAll(".btn_memberInfo");
	  let inquiryBtns = document.querySelectorAll(".btn_inquiry");

	  memberInfoBtns.forEach(function (btn) {
	    btn.addEventListener("click", function () {
	      // 클릭된 버튼의 id를 가져옵니다.
	      let memberId = $(this).attr("id");
	      // 해당 id를 가진 상품 행(tr)을 선택합니다.
	      let memberRow = $("#tbl_contents tr").filter(function () {
	        return $(this).find("td:nth-child(2)").text() === memberId;
	      });
	      // 고객 정보를 보여줍니다.
	      $("#name_info").val(memberRow.find("td:nth-child(4)").text().trim());
	      $("#m_id_info").val(memberId);
	      $("#selNum_info").val(memberRow.find("td:nth-child(7)").text().trim());
	      $("#grade_info").val(memberRow.find("td:nth-child(3)").text().trim());
	      $("#birth_info").val(memberRow.find("td:nth-child(5)").text().trim());
	      $("#gender_info").val(memberRow.find("td:nth-child(6)").text().trim());
	      $("#j_date_info").val(memberRow.find("td:nth-child(9)").text().trim());
	      $("#e_date_info").val(memberRow.find("td:nth-child(10)").text().trim());
	      $("#platForm_info").val(memberRow.find("td:nth-child(13)").text().trim());
	      $("#a_date_info").val(memberRow.find("td:nth-child(11)").text().trim());
	      $("#a_state_info").val(memberRow.find("td:nth-child(12)").text().trim());
	      divShadowInfo.style.display = "block";
	    });
	  });
	  
	  //문의 내용 보기
	  let tableNameMap = {
			  "inquiries" : "1:1",
			  "qna" : "QA"
	  }
	  let categoryMap = {
			  "0": "상품문의",
			  "2": "회원정보", 
			  "3": "주문/결제/배송",
			  "4": "취소/환불"
	  };
	  // 답변완료 시 문의내용 보기 글자 색상 변경
	  $(".btn_inquiry").each(function(){
		  let replyState = $(this).data("reply-state");
		  
		  if (replyState === 1){
			  $(this).css("color", "gray");  
		  }
		  	
	  });
	  
	  $(".btn_inquiry").click(function () {
		    let tableNameId = $(this).data("table-name");
		    let categoryId = $(this).data("category");
		    let replyState = $(this).data("reply-state");
		    let ansContent = $(this).data("ans-content");
		    console.log("답변내용: " + ansContent);
		    $("#ans_content").val(ansContent);
		    //답변완료 상태일때 답변 내용이랑 확인 버튼 disabled
		    if (replyState === 1) {
	            // reply_state가 1인 경우에 처리할 작업
	            $("#ans_content").prop("disabled", true); // ans_content를 비활성화
	            $("#btn_save").prop("disabled", true);     // btn_save를 비활성화
	        } else {
	            // reply_state가 0인 경우에 처리할 작업 (필요에 따라 추가 가능)
	            $("#ans_content").prop("disabled", false); // ans_content를 활성화
	            $("#btn_save").prop("disabled", false);     // btn_save를 활성화
	        }
		    
		    let inquiryData = {
		      tableName: tableNameMap[tableNameId],
		      category: categoryMap[categoryId], //카테고리 번호 대신 카테고리 이름 가져옴
		      p_id: $(this).data("p-id"),
		      memberid: $(this).data("memberid"),
		      name: $(this).data("name"),
		      post_date: $(this).data("post-date"),
		      title: $(this).data("title"),
		      content: $(this).data("content"),
		      ans_content: $(this).data("ans-content"),
		      b_idx: $(this).data("b-idx")
		    };

		    // 문의 정보를 팝업 창에 표시
		    showInquiryInfo(inquiryData);
		    
		 	// 제품코드 입력란의 보이거나 숨김 여부 설정
		    if (tableNameId === "qna") {
		        $("#tbl_contents_inquiry tr:nth-child(5)").show(); // 제품코드 행 보이기
		    } else {
		        $("#tbl_contents_inquiry tr:nth-child(5)").hide(); // 제품코드 행 숨기기
		    }
		    
		  });

		  function showInquiryInfo(inquiryData) {
			  
		    // 팝업 창에 문의 내용 표시
		    $("#inquiry_table-name").val(inquiryData.tableName);
		    $("#inquiry_category").val(inquiryData.category);
		    $("#inquiry_p-id").val(inquiryData.p_id);
		    $("#inquiry_id_info").val(inquiryData.memberid);
		    $("#inquiry_name").val(inquiryData.name);
		    $("#inquiry_post-date").val(inquiryData.post_date);
		    $("#inquiry_title").val(inquiryData.title);
		    $("#inquiry_content").val(inquiryData.content);
		    $("#inquiry_b-idx").val(inquiryData.b_idx);
		    $("#ans_content").val(inquiryData.ans_content);
		    // 팝업 창 표시
		    $("#div_member_info").hide();
		    $("#div_inquiry_info").show();
		    divShadowInfo.style.display = "block";
		   
		  }

		  let cancelBtn = document.getElementById("btn_cancel");
		  /* let inquiryCancelBtn = document.getElementById("btn_save"); */
		  
		  cancelBtn.addEventListener("click", function () {
		    divShadowInfo.style.display = "none";
		    frm_info.reset();
		  /*   $("#div_member_info").show(); */
		  });
	  
	  /* inquiryCancelBtn.addEventListener("click", function () {
	    divShadowInfo.style.display = "none";
	    frm_inquiry.reset();
	    $("#div_inquiry_info").hide();
	    $("#div_member_info").show();
	  });*/
  		 }); 
	
	  //문의내용보기 폼 확인 버튼 눌렀을 때
	  $(document).ready(function(){
		
		 $("#btn_save").click(function(){
			 let b_idx = $("#inquiry_b-idx").val();
			 let p_id = $("#inquiry_p-id").val();
			 let ans_content = $("#ans_content").val();
			 let formData = {
					 b_idx: parseInt(b_idx),
					 p_id: p_id,
					 ans_content: ans_content
			 };
			 if (ans_content == ""){
				 alert("답변 내용을 작성해주세요")
				 return; // 답변 내용이 비어있으면 여기서 함수 종료
			 }
			 
			 if ($("#inquiry_table-name").val() === "1:1") {
		        saveAnswerTo1to1Table(formData);
		        
		   	 } else if ($("#inquiry_table-name").val() === "QA") {
		        saveAnswerToQATable(formData);
		        
		 	 } else {
		        console.log("오류");
		  	 }
		
		 });
		 		 
		 //취소 버튼 클릭 시 목록 페이지로 이동
		 $("#btn_cancel_inquiry").click(function(){
			 location.href = "inquiry.do"; 
		 });
		 
			// 1:1 답변 저장 함수
	        function saveAnswerTo1to1Table(formData) {
	            $.ajax({
	                type: "post",
	                url: "insert_inquiry_answer_process.do", 
	                data: formData,
	                success: function(response){
	                    alert("저장되었습니다.");
	                    changeInquiryState(formData.b_idx);
	                    location.href = "inquiry.do"; 
	                },
	                error: function(error){
	                    alert("실패했습니다.");
	                }
	            });
	        }

	        // Q&A 답변 저장 함수
	        function saveAnswerToQATable(formData) {
	        	$.ajax({
	                type: "post",
	                url: "insert_qna_answer_process.do", 
	                data: formData,
	                success: function(response){
	                    alert("저장되었습니다.");
	                    changeQnaState(formData.b_idx);
	                    location.href = "inquiry.do"; 
	                },
	                error: function(error){
	                    alert("실패했습니다.");
	                }
	            });
	        }
	        
	        // 1:1문의 답변여부
			function changeInquiryState(b_idx){
	        	$.ajax({
	                type: "POST",
	                url: "changeInquiryState",
	                data: {
	                    reply_state: 1,
	                    b_idx: parseInt(b_idx)
	                },
	                success: function(response) {
						alert("답변완료.");
	                	location.href = "inquiry.do";
	                },
	                error: function(xhr, status, error) {
						alert("실패했습니다.")
	                }
	            });
	        }
			
	        // qna문의 답변여부
			function changeQnaState(b_idx){
	        	$.ajax({
	                type: "POST",
	                url: "changeQnaState",
	                data: {
	                    reply_state: 1,
	                    b_idx: parseInt(b_idx)
	                },
	                success: function(response) {
						alert("답변완료.");
	                	location.href = "inquiry.do";
	                },
	                error: function(xhr, status, error) {
						alert("실패했습니다.")
	                }
	            });
	        }
	 });
	$(document).ready(function(){
	
	$("#btn_reset").click(function(){
        
        $("input[type='checkbox']").prop("checked", false);
        $("#tbl_contents tr").show();
        
    });
	
	 let tableNameMap = {"1": "1:1", "2": "QA"};
	 let categoryMap = {"1": "상품문의", "2": "회원정보", "3": "주문/결제/배송", "4": "취소/환불"};
	 let reply_stateMap = {"1": "답변대기", "2": "답변완료"};

	 $("#btn_filter").click(function () {
	     let selectedTableNames = [];
	     let selectedCategorys = [];
	     let selectedReply_states = [];

	     $(".checkbox_tableName:checked").each(function () {
	         let tableNameId = $(this).attr("id").replace("checkbox1_", "");
	         selectedTableNames.push(tableNameMap[tableNameId]);
	     });

	     $(".checkbox_category:checked").each(function () {
	         let categoryId = $(this).attr("id").replace("checkbox2_", "");
	         selectedCategorys.push(categoryMap[categoryId]);
	     });
	     
	     $(".checkbox_reply_state:checked").each(function () {
	         let replyStateId = $(this).attr("id").replace("checkbox3_", "");
	         selectedReply_states.push(reply_stateMap[replyStateId]);
	     });
	     
	     applyFilter(selectedTableNames, selectedCategorys, selectedReply_states);
	 });

	 function applyFilter(selectedTableNames, selectedCategorys, selectedReply_states) {
	     $("#tbl_contents tr:not(:first-child)").each(function () {
	         let tableName = $(this).find("td:nth-child(2)").text();
	         let category = $(this).find("td:nth-child(7)").text();
	         let reply_state = $(this).find("td:nth-child(8)").text();
	         let showTableName = selectedTableNames.length === 0 || selectedTableNames.includes(tableName.trim());
	         let showCategory = selectedCategorys.length === 0 || selectedCategorys.includes(category.trim());
	         let showReplyState = selectedReply_states.length === 0 || selectedReply_states.includes(reply_state.trim());
	         if (showTableName && showCategory && showReplyState) {
	             $(this).show();
	         } else {
	             $(this).hide();
	         }
	     });
	 }
	});

</script>
<script>
    // 답변 내용의 textarea 엘리먼트
    var ansContentTextarea = document.getElementById('ans_content');

    // 답변 내용이 변경될 때 호출되는 함수
    ansContentTextarea.addEventListener('input', function () {
        // textarea의 내용을 읽어옴
        var content = ansContentTextarea.value;
        // 내용에서 줄바꿈을 <br> 태그로 변환
        var contentWithBr = content.replace(/\n/g, "<br>");
        // 변환한 내용을 해당 엘리먼트에 표시
        ansContentTextarea.innerHTML = contentWithBr;
    });
</script>
</head>
<body>
    <div id="div_left">
        <h3>회원관리</h3>
        <table>
            <tr>
                <td>게시판</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" id="checkbox1_1" class="checkbox_tableName"><label for="checkbox1_1">1:1</label><br>
                    <input type="checkbox" id="checkbox1_2" class="checkbox_tableName"><label for="checkbox1_2">QA</label><br>
                </td>
            </tr>
            <tr>
                <td>문의목록</td>
            </tr>
            <tr>
                <td>
                	<input type="checkbox" id="checkbox2_1" class="checkbox_category"><label for="checkbox2_1">상품문의</label><br>
                    <input type="checkbox" id="checkbox2_2" class="checkbox_category"><label for="checkbox2_2">회원정보</label><br>
                    <input type="checkbox" id="checkbox2_3" class="checkbox_category"><label for="checkbox2_3">주문/결제/배송</label><br>
                    <input type="checkbox" id="checkbox2_4" class="checkbox_category"><label for="checkbox2_4">취소/환불</label><br>
                </td>
            </tr>
            <tr>
                <td>답변여부</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" id="checkbox3_1" class="checkbox_reply_state"><label for="checkbox3_1">답변대기</label><br>
                    <input type="checkbox" id="checkbox3_2" class="checkbox_reply_state"><label for="checkbox3_2">답변완료</label><br>
                </td>
            </tr>
            <tr>
                <td>
                   <input id="btn_reset" type="button" value="초기화"/>
                   <input id="btn_filter" type="button" value="선택완료"/>
                </td>
            </tr>
        </table>
    </div>
    <div id="div_right">
        <table id="tbl_contents">
            <tr>
                <td></td>
                <td>게시판</td>
                <td>아이디</td>
                <td>이름</td>
                <td>제목</td>
                <td>문의내용</td>
                <td>문의목록</td>
                <td>답변여부</td>
                <td>작성일</td>
         		<td>제품코드</td>                             
            </tr>
            <c:if test="${combinedList ne null}">
            <c:forEach items="${combinedList}" var="item">
                <tr>
                    <td>
                        <button class="btn_memberInfo" id="${item.m_id}">
                            <img alt="" src="">
                        </button>
                    </td>                    
	                <td>
		                <c:choose>
		                	<c:when test="${item.tableName eq 'inquiries'}">
						        1:1
						    </c:when>
						    <c:when test="${item.tableName eq 'qna'}">
						        QA
						    </c:when>
						    <c:otherwise>
						        ${item.tableName}
						    </c:otherwise>
		                </c:choose>
	                </td>
                    <td>${item.m_id}</td>
                    <td>${item.m_name}</td>
                    <td>${item.title}</td>
                    <td>
                    	<button class="btn_inquiry" data-table-name="${item.tableName}" data-category="${item.category}" 
                    	data-memberid="${item.m_id}" data-name="${item.m_name}" data-post-date="${item.post_date}" 
                    	data-title="${item.title}" data-p-id="${item.p_id}" data-content="${item.content}"
                    	data-reply-state="${item.reply_state}" data-b-idx="${item.b_idx}"
                    	data-ans-content="${item.ans_content}">
                    		문의내용 보기
                    	</button>
                    </td>
                    <td>
						<c:choose>
							<c:when test="${item.category eq '0'}">
						        상품문의
						    </c:when>
		                	<c:when test="${item.category eq '2'}">
						        회원정보
						    </c:when>
						    <c:when test="${item.category eq '3'}">
						        주문/결제/배송
						    </c:when>
						    <c:when test="${item.category eq '4'}">
						        취소/환불
						    </c:when>
						    <c:otherwise>
						        ${item.category}
						    </c:otherwise>
		                </c:choose>
                    </td>
                    <td>
                    	<c:choose>
                    		<c:when test="${item.reply_state eq '0'}">
						        답변대기
						    </c:when>
						    <c:when test="${item.reply_state eq '1'}">
						        답변완료
						    </c:when>
						    <c:otherwise>
						        ${item.reply_state}
						    </c:otherwise>
						 </c:choose>
					</td>
                    <td><fmt:formatDate value="${item.post_date}" pattern="yyyy-MM-dd"/></td>
                    <td>
						<c:choose>
		                	<c:when test="${empty item.p_id}">
						        -
						    </c:when>
						    <c:otherwise>
						        ${item.p_id}
						    </c:otherwise>
		                </c:choose>
					</td>
	            </tr>
            </c:forEach>
            </c:if>            
        </table>
    </div>
    <div id="div_shadow_info">
	    <div id="div_member_info">
	    <p>고객정보</p>
	       <form action="" name="frm_info">
		       <table id="tbl_contents_info">
		           <tr>
			           <th>이름</th>
			           <td><input type="text" id="name_info" disabled/></td>
			           <th>아이디</th>
			           <td><input type="text" id="m_id_info" disabled/></td>
		           </tr>
		           <tr>
			           <th>전화번호</th>
			           <td><input type="text" id="selNum_info" disabled/></td>
			           <th>등급</th>
			           <td><input type="text" id="grade_info" disabled/></td>
		           </tr>
		           <tr>
			           <th>생년월일</th>
			           <td><input type="text" id="birth_info" disabled/></td>
			           <th>성별</th>
			           <td><input type="text" id="gender_info" disabled/></td>
		           </tr>
		           <tr>
			           <th>주소지1</th>
			           <td><input type="text" disabled/></td>	           	
			           <td colspan="2"><input type="text" disabled/></td>
		           </tr>
		           <tr>
			           <th>주소지2</th>
			           <td><input type="text" disabled/></td>
			           <td colspan="2"><input type="text" disabled/></td>
		           </tr>
		           <tr>
			           <th>주소지3</th>
			           <td><input type="text" disabled/></td>
			           <td colspan="2"><input type="text" disabled/></td>
		           </tr>
		           <tr>
			           <th>가입일</th>
			           <td><input type="text" id="j_date_info" disabled/></td>
			           <th>수정일</th>
			           <td><input type="text" id="e_date_info" disabled/></td>
		           </tr>
		           <tr>
			           <th>최근접속일</th>
			           <td><input type="text" /></td>
			           <th>플랫폼</th>
			           <td><input type="text" id="platForm_info" disabled/></td>
		           </tr>
		           <tr>
			           <th>전환일</th>
			           <td><input type="text" id="a_date_info" disabled/></td>
			           <th>활성여부</th>
			           <td><input type="text" id="a_state_info" disabled/></td>
		           </tr>
		           <tr>                
		               <td colspan="2"></td>
		               <td colspan="2">
			               <input id="btn_cancel" type="button" value="확인"/>
		               </td>
	               </tr>
		       </table>
	       </form>
	    </div>
	    
	    <!--  문의내용 보기 폼 -->
	    <div id="div_inquiry_info" style="display: none;">
        <p>문의내용</p>
	        <form action="" name="frm_inquiry">
	            <table id="tbl_contents_inquiry">
	                <!-- 문의내용과 관련된 필드들을 추가 -->
	                <tr>
	                    <th>게시판</th>
	                    <td><input type="text" id="inquiry_table-name" disabled/></td>
	                    <th>문의 카테고리</th>
	                    <td><input type="text" id="inquiry_category" disabled/></td>
	                </tr>
	                <tr>
	                    <th>제목</th>
	                    <td><input type="text" id="inquiry_title" disabled/></td>
	                    <th>아이디</th>
	                    <td><input type="text" id="inquiry_id_info" disabled/></td>
	                </tr>
	                <tr>
	                    <th>이름</th>
	                    <td><input type="text" id="inquiry_name" disabled/></td>
	                    <th>작성일</th>
	                    <td><input type="text" id="inquiry_post-date" disabled/></td>
	                </tr>
	                <tr>
	                	<th>문의 내용</th>
	                    <td colspan="3"><textarea id="inquiry_content" disabled></textarea></td>
	                </tr>
	                <tr>
	                	<th>제품코드</th>
	                    <td><input type="text" id="inquiry_p-id" disabled/></td>
	                </tr>
	                <tr>
	                	<th>답변 내용</th>
	                	<td colspan="3"><textarea id="ans_content"></textarea></td>
	                </tr>
	                <tr>
	                	<td colspan="4">
						   <input id="btn_save" type="button" value="확인"/>
						   <input id="btn_cancel_inquiry" type="button" value="취소"/>
			               <input id="inquiry_b-idx" type="hidden"/>
		               </td>
	                </tr>
	            </table>
	        </form>
    	</div>
    </div>
</body>
</html>