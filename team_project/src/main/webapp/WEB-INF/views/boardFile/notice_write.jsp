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
   
   	/*-----------사이드메뉴------------*/
    #tbl_side_menu tr:nth-child(2), #tbl_side_menu tr:nth-child(2) a{
        background-color: black;
        color: white;
    }
    /*----------------------------------*/
    /*---------- 테이블 세팅 ----------*/
    #div_noticeWrite_section p{
        font-size: 28px;
        font-weight: bold;
        padding-bottom: 30px;
    }
    #div_noticeWrite_section table tr td:first-child{
        padding: 10px 0;
        padding-left: 15px;
        width: 150px;
        background-color: rgb(224, 224, 224);
    }
    #div_noticeWrite_section td{
        border-top: 1px solid black;
    }
    #m_name, #title, #content{
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
		let title = $("#title").val();
		let content = $("#content").val();
		let m_idx = $("#m_idx").val();
		let m_name = $("#m_name").val();
		
		if(title == "" || content == ""){
			alert("모든 항목을 입력해주세요")
		}else{
			let formData = {
				title: title,
				content: content,
				m_name: m_name,
				m_idx: parseInt(m_idx)
			};
			
			$.ajax({
				type: "post",
				url: "insert_notice_write_process.do",
				data: formData,
				success: function(response){
					alert("저장되었습니다.")
					//글이 저장되면 공지사항 페이지로 이동
					location.href = "notice.do"
				},
				error: function(error){
					alert("실패했습니다.");
				}
				
			
			});
		};
	});	 
 });
 
 </script>
<body>
	<div id="div_noticeWrite_section">
			        <p>공지사항</p>
			        <table>
			          
			          <tr>
			            <td>작성자</td>
			            <td>
			              <input type="text" id="m_name" name="m_name" value="${member.m_name}"required>
			              <input type="hidden" id="m_idx" name="m_idx" value="${member.m_idx} }">
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