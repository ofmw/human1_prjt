<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    #tbl_side_menu tr:nth-child(3), #tbl_side_menu tr:nth-child(3) a{
        background-color: black;
        color: white;
    }
    /*--------------------------------*/
    /*---------- 테이블 세팅 ----------*/
    #div_eventWrite_section p{
        font-size: 28px;
        font-weight: bold;
        padding-bottom: 30px;
    }
    #div_eventWrite_section table tr td:first-child{
        padding: 10px 0;
        padding-left: 15px;
        width: 150px;
        background-color: rgb(224, 224, 224);
    }
    #div_eventWrite_section td{
        border-top: 1px solid black;
    }
    #title, #period, #content{
        margin: 10px 20px;
        font-size: 15px;
    }
    #title, #period{
        padding: 5px 0;
        width: 560px;
        font-size: 15px;
        border: none;
    }
    #period:focus,#title,#content{
        outline: none;
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
    #upload_name{
        margin: 10px 20px;
        padding-left: 3px;
        height: 30px;
        width: 250px;
    }
    #div_filebox label{
        padding: 5px 10px;
        background-color: rgb(127, 127, 127);
        font-size: 13px;
        color: white;
        border-radius: 3px;
    }
 
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script>
 $(function(){
	 
	 var fileTarget = $('#attachedFile');
	 let files;	
	 fileTarget.on('change', function(e){ // 값이 변경되면
     	var cur=$("#div_filebox input[type='file']").val();
		
		files = e.target.files;
	
 	 	$("#upload_name").val(cur);
	  }); 
	 
	$("#smt_save").click(function(){
		let title = $("#title").val();
		let period = $("#period").val();
		let content = $("#content").val();
		let attachedFile = $("#attachedFile")[0].files[0];
		let m_idx = $("#m_idx").val();
			
		if(title == "" || period == "" || content == "" || !attachedFile){
			alert("모든 항목을 입력해주세요")
		}else{
			
			let formData = new FormData();
	        formData.append("title", title);
	        formData.append("period", period);
	        formData.append("content", content);
	        formData.append("attachedFile", attachedFile);
	        formData.append("m_idx", parseInt(m_idx));
				
			$.ajax({
				type: "post",
				url: "insert_event_write_process.do",
				data: formData,
				contentType: false,
				processData: false,
				success: function(response){
					alert("저장되었습니다.")
					location.href = "event.do"
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
	<div id="div_eventWrite_section">
			        <p>이벤트</p>
			        
			        <table>
			          <tr>
			            <td>제목</td>
			            <td>
			              <input type="text" id="title" name="title" required placeholder="제목을 입력하세요.">
			              <input type="hidden" id="m_idx" name="m_idx" value="${member.m_idx}">
			            </td>
			          </tr>
			          <tr>
			            <td>기간</td>
			            <td>
			              <input type="text" id="period" name="period">
			            </td>
			          </tr>
			          <tr>
			            <td>본문</td>
			            <td>
			              <textarea id="content" name="content" required></textarea>
			            </td>
			          </tr>
			          <tr>
			            <td>첨부 파일</td>
			            <td>
			                <div id="div_filebox">
			                    <input id="upload_name" name="originFile" value="파일명" disabled> 
			                    <label for="attachedFile">파일찾기</label> 
			                    <input type="file" id="attachedFile" name="attachedFile" style="display: none;"> 
			                  </div>
			            </td>
			          </tr>
			          
			        </table>
		        <div id="div_sbm">
		            <input type="button" value="이전" id="btn_back" onclick="history.back()">
		            <input type="button" value="저장" id="smt_save">
		        </div>
     </div>
</body>