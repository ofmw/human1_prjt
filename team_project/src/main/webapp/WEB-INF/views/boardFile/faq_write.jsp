<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
        *{margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}
    
    /*------------사이드메뉴---------------*/   
    #tbl_side_menu tr:first-child, #tbl_side_menu tr:first-child a{
        background-color: black;
        color: white;
    }
    /*--------------------------------*/
    /*---------- 테이블 세팅 ----------*/
    #div_faqWrite_section p{
        font-size: 28px;
        font-weight: bold;
        padding-bottom: 30px;
    }
    #div_faqWrite_section table tr td:first-child{
        padding: 10px 0;
        padding-left: 15px;
        width: 150px;
        background-color: rgb(224, 224, 224);
    }
    #div_faqWrite_section td{
        border-top: 1px solid black;
    }
    #category, #m_name, #title, #content{
        margin: 10px 20px;
        font-size: 15px;
    }
    #m_name, #title{
        padding: 5px 0;
        width: 560px;
        font-size: 15px;
        border: none;
    }
    #m_name:focus,#title,#content{
        outline: none;
    }
    #m_name{
    	pointer-events: none;
    }
    #content{
        width: 560px;
        height: 300px;
        resize: none;
    }
    /*------------------------------*/
    /*---------- 이전, 저장 버튼 ----------*/
    #div_sbm{
        margin-left: 1px;
        padding-top: 20px;;
        width: 755px;
        text-align: center;
        border-top: 1px solid black;
    }
    #div_sbm input{
        margin: 0 15px;
        width: 120px;
        height: 40px;
        font-size: 15px;
        border-radius: 3px;
        cursor: pointer;
    }
    #btn_back{
        background-color: white;
        border: 1px solid rgb(190, 190, 190);
    }
    #smt_save{
        background-color: black;
        border: 1px solid black;
        color: white;
    }
    /*--------------------------------*/
   
    table{
        width: 100%;
        border-collapse: collapse;
    }
    a{
        text-decoration: none;
        color: black;
    }
 
</style>
<!-- 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	     $(document).ready(function(){ 
	   		var fileTarget = $('#file'); 
	   		fileTarget.on('change', function(){ // 값이 변경되면
	        var cur=$("#div_filebox input[type='file']").val();
	     $("#upload_name").val(cur);
	   }); 
	 }); 
</script>
 -->
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script>
 $(function(){
	$("#smt_save").click(function(){
		let category = $("#category").val();
		let title = $("#title").val();
		let content = $("#content").val();
		let m_idx = $("#m_idx").val();
	
		if(category == "" || title == "" || content == ""){
			alert("모든 항목을 입력해주세요")
		}else{
			let formData = {
				category: parseInt(category),
				title: title,
				content: content,
				m_idx: parseInt(m_idx)
			};
			
			$.ajax({
				type: "post",
				url: "insert_faq_write.do",
				data: formData,
				success: function(response){
					alert("글 등록이 완료되었습니다.");
					console.log("ajax통신 성공");
					location.href = "faq_member.do"
				},
				error: function(error){
					console.log("ajax통실 실패");
				}
			});
		};
	});	 
 });
 $(document).ready(function(){
	 $("#btn_back").click(function(){
		window.history.back();	 
	 });
 });
 </script>
<body>
    		<div id="div_faqWrite_section">
			        <p>자주 찾는 질문</p>
			        <table>
			          <tr>
			            <td>말머리</td>
			            <td>
			              <select id="category" name="category" required>
			                <option value="1">회원</option>
			                <option value="2">주문/결제/배송</option>
			                <option value="3">취소/환불</option>
			                <option value="4">반품/교환</option>
			                <option value="5">기타</option>
			              </select>
			            </td>
			          </tr>
			          <tr>
			            <td>작성자</td>
			            <td>
			              <input type="text" id="m_name" name="m_name" required value="${member.m_name}">
			              <input type="hidden" id="m_idx" name="m_idx" value="${member.m_idx}">
			            </td>
			          </tr>
			          <tr>
			            <td>제목</td>
			            <td>
			              <input type="text" id="title" name="title" required placeholder="제목을 입력하세요.">
			            </td>
			          </tr>
			          <tr>
			            <td>본문</td>
			            <td>
			              <textarea id="content" name="content" required></textarea>
			            </td>
			          </tr>
			          
			        </table>
		        <div id="div_sbm">
		            <input type="button" value="이전" id="btn_back">
		            <input type="button" value="저장" id="smt_save">
		        </div>
      		</div>
</body>