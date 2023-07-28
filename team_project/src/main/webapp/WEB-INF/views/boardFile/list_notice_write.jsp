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
    #div_menu{
        position: relative;
        float: left;
        width: 200px;
        top: 100px;
    }
    #div_menu p{
        padding: 6px 0;
        text-align: center;
        font-size: 20px;
        font-weight: bold;
        border-bottom: 3px solid black;
    }
    #div_menu ul{
        list-style: none; /* 기본 불릿 스타일 제거 */
        display: flex;
        flex-direction: column; /*세로 방향으로 정렬*/
        text-align: center;
    }
    #div_menu li{
        padding: 12px 0;
        cursor: pointer;
    }
    #div_menu ul li:nth-child(4){
        background-color: black;
        color: white;
    }
    form {
        position: relative;
        float: left;
        top: 80px;
        left: 50%;
        transform: translateX(-70%); /* 중앙 정렬을 위한 설정 */
        width: 758px;
    }
    form p{
        font-size: 28px;
        font-weight: bold;
        padding-bottom: 30px;
    }
    #td_title{
        padding: 10px 0;
        padding-left: 15px;
        width: 150px;
        background-color: rgb(224, 224, 224);
    }
    form td{
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
    #content{
        width: 560px;
        height: 300px;
        resize: none;
    }
    #upload_name{
        margin: 10px 20px;
        padding-left: 3px;
        height: 30px;
    }
    #div_filebox label{
        padding: 5px 10px;
        background-color: rgb(127, 127, 127);
        font-size: 13px;
        color: white;
        border-radius: 3px;
    }
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
    #cs_info{
        padding-left: 10px;
        padding-top: 10px;
        border-top: 3px solid black;
        position:absolute;
        bottom: 0;
        font-size: 23px;
        width: 100%;
        height: 80px;
    }
    #cs_info span{
        font-size: 17px;
        color: rgb(224, 224, 224);
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
		let m_name = $("#m_name").val();
		let title = $("#title").val();
		let content = $("#content").val();
		let m_idx = $("#m_idx").val();
	
		if(category == "" || m_name == "" || title == "" || content == ""){
			alert("모든 항목을 입력해주세요")
		}else{
			let formData = {
				m_name: m_name,
				title: title,
				content: content,
				m_idx: parseInt(m_idx)
			};
			
			$.ajax({
				type: "post",
				url: "insert_inquiry_process.do",
				data: formData,
				success: function(response){
					alert("저장되었습니다.")
					//글이 저장되면 공지사항 페이지로 이동
					location.href = "list_notice.jsp"
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
    <div id="div_menu">
        <p>고객센터</p>
        <ul>
            <li onclick="location.href='list_faq_member.html'">FAQ</li>
            <li onclick="location.href='list_notice.do'">공지사항</li>
            <li onclick="location.href='list_event.html'">이벤트</li>
            <li onclick="location.href='list_inquiry.do'">1:1문의하기</li>
        </ul>
    </div>
    <form>
        <p>공지사항</p>
        <table>
          
          <tr>
            <td id="td_title">작성자</td>
            <td>
              <input type="text" id="m_name" name="m_name" required>
              <input type="hidden" id="m_idx" name="m_idx" value="1">
            </td>
          </tr>
          <tr>
            <td id="td_title">제목</td>
            <td>
              <input type="text" id="title" name="title" required placeholder="제목을 입력하세요.">
            </td>
          </tr>
          <tr>
            <td id="td_title">본문</td>
            <td>
              <textarea id="content" name="content" required></textarea>
            </td>
          </tr>
          
        </table>
        <div id="div_sbm">
            <input type="button" value="이전" id="btn_back">
            <input type="button" value="저장" id="smt_save">
        </div>
      </form>
      <p id="cs_info">고객센터 이용안내 <span>운영시간09:00~21:00</span></p>
    
</body>