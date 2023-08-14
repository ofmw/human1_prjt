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
    /*전체 영역(공통)*/
    #div_notice_write {
        min-width: 1280px;
        position: relative;
        display: flex;
        justify-content: center;
    }
    /*사이드메뉴, 공지사항내용 엮은 영역(공통)*/
    #div_div_notice_write {
        position: relative;
        display: flex;
        margin-top: 100px;
        justify-content: flex-start; /* 화면 왼쪽에 위치하도록 수정 */
        width: 1200px; /* div_div_notice를 화면 가로 너비 100%로 설정 */
        max-width: 1200px; /* 최대 너비 설정 */
    }
    /*---------- 사이드메뉴 ----------(공통)*/
    #div_side_menu {
        position: relative;
        margin-top: 15px;
        width: 200px;
        height: 650px; /* 화면 세로 높이 전체로 설정 */
    }
    #div_side_menu p{
        padding: 6px 0;
        text-align: center;
        font-size: 20px;
        font-weight: bold;
        border-bottom: 3px solid black;
    }
    #div_side_menu td{
        padding: 12px 0;
        width: 200px;
        text-align: center;
        cursor: pointer;
    }
    #tbl_side_menu tr:nth-child(3), #tbl_side_menu tr:nth-child(3) a{
        background-color: black;
        color: white;
    }
    /*--------------------------------*/
    /*---------- 테이블 세팅 ----------*/
    #div_section {
        position: relative;
        width: 758px;
        margin-left: 130px; /* 왼쪽 여백 추가 */
    }
    #div_section p{
        font-size: 28px;
        font-weight: bold;
        padding-bottom: 30px;
    }
    #div_section table tr td:first-child{
        padding: 10px 0;
        padding-left: 15px;
        width: 150px;
        background-color: rgb(224, 224, 224);
    }
    #div_section td{
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
    /*---------------footer---------------(공통)*/
    #div_footer{
    	margin-top: 30px;
        padding-left: 10px;
	    padding-top: 10px;
	    border-top: 3px solid black;
	    font-size: 23px;
	    min-width: 1280px;
	    height: 80px;
    }
    #div_footer span{
        font-size: 17px;
        color: rgb(224, 224, 224);
    }
    /*------------------------------------*/
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
	     $(document).ready(function(){ 
	   		
	  
	 }); 
</script>
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
		let attachedFile = files[0];
			
		if(title == "" || period == "" || content == "" || attachedFile == ""){
			alert("모든 항목을 입력해주세요")
		}else{
			
			let formData = new FormData();
				formData.append("title", title);
				formData.append("period", period);
				formData.append("content", content);
				formData.append("attachedFile", attachedFile);
			
			$.ajax({
				type: "post",
				url: "insert_event_write_process.do",
				data: formData,
				contentType: false,
				processData: false,
				success: function(response){
					alert("저장되었습니다.")
					location.href = "list_event.do"
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
	<div id="div_notice_write">
		<div id="div_div_notice_write">
    		<div id="div_side_menu">
                <table id="tbl_side_menu">
                    <p>고객센터</p>
                    <tr>
                        <td><a href="list_faq_member.do">FAQ</a></td>
                    </tr>
                    <tr>
                        <td><a href="list_notice.do">공지사항</a></td>
                    </tr>
                    <tr>
                        <td><a href="list_event.do">이벤트</a></td>
                    </tr>
                    <tr>
                        <td><a href="list_faq_inquiry.do">1:1문의하기</a></td>
                    </tr>
                </table>
            </div>
    		<div id="div_section">
			        <p>이벤트</p>
			        
			        <table>
			          <tr>
			            <td>제목</td>
			            <td>
			              <input type="text" id="title" name="title" required placeholder="제목을 입력하세요.">
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
		            <input type="button" value="이전" id="btn_back">
		            <input type="button" value="저장" id="smt_save">
		        </div>
      		</div>
       </div>
    </div>
    <div id="div_footer">
        고객센터 이용안내 <span>운영시간09:00~21:00</span>
    </div>
</body>