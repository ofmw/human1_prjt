<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>

<script>
    function validateForm(){
        if(frm_edit.title.value.length==0){
            alert("제목을 입력하세요");
            frm_edit.title.focus();
            return false;
        }else if(frm_edit.content.value.length==0){
            alert("내용을 입력하세요");
            frm_edit.content.focus();
            return false;
        }
    }
</script>

<link rel="stylesheet" href="../resources/css/edit_jsp.css" >

<style>
	#attachedFile{
		border-color: whilte;
	}
	#file_msg{
		font: 11px Arial, Sans-serif;
		color: gray;
		padding: 5px;
	}
	
</style>

</head>
<body>

    <header>
        <jsp:include page="../main/header.jsp"/>
    </header>

	<form name="frm_edit" method="post" action="edit_process.do" enctype="multipart/form-data"
		  onsubmit="return validateForm();">
	    <table>
	        <caption>글수정</caption>
	        <tr>
	            <th>작성자</th>
	            <td>
	                <input type="text" id="writer" value="${member.member_name}" disabled>
	                <input type="hidden" name="member_name" value="${boardFileVo.member_name}">
	                <input type="hidden" name="member_idx" value="${boardFileVo.member_idx}">
	                <input type="hidden" name="board_idx" value="${boardFileVo.board_idx}">
	            </td>
	        </tr>
	        <tr>
	            <th>제목</th>
	            <td>
	                <input type="text" class="editable" name="title" value="${boardFileVo.title}">
	            </td>
	        </tr>
	        <tr>
	            <th>내용</th>
	            <td>
	                <textarea name="content" class="editable" cols="30" rows="10">${boardFileVo.content}</textarea>
	            </td>
	        </tr>
	        <tr>
	            <th>첨부파일</th>
	            <td colspan="3">
	                <input type="file" id="attachedFile" name="attachedFile"><br>
	                <span id="file_msg">새로운 파일을 선택하면 이전 파일이 교체됩니다</span>
	            </td>
	        </tr>
	        <tr>
	            <td id="td_btn" colspan="2">
	                <input type="submit" value="수정하기">
	                <input type="reset" value="다시입력">
	                <input type="button" value="목록보기" onclick="location.href='list.jsp'">
	            </td>
	        </tr>
	    </table>
	
	
	</form>

   <footer>
        <jsp:include page="../main/footer.jsp"/>
   </footer>

</body>
</html>