<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
</head>
	<script>
		function validateForm(){
			if(frm_write.title.value.length==0){
				alert("제목을 입력하세요");
				frm_write.title.focus();
				return false;
			}else if(frm_write.content.value.length==0){
				alert("내용을 입력하세요");
				frm_write.content.focus();
				return false;
			}
		}
	</script>

<link rel="stylesheet" href="../resources/css/write_jsp.css" >

<body>

    <header>
        <jsp:include page="../main/header.jsp"/>
    </header>

    <form name="frm_write" method="post" action="write_process.do" enctype="multipart/form-data" 
          onsubmit="return validateForm()">
        <table>
            <caption>글등록</caption>
            <tr>
                <th>작성자</th>
                <td>
                    <input type="text" value="${member.member_name}" disabled>
                    <input type="hidden" name="member_name" value="${member.member_name}">
                    <input type="hidden" name="member_idx" value="${member.member_idx}">
                </td>
            </tr>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="content" cols="30" rows="10" style="resize: none;"></textarea></td>
            </tr>
            <tr>
                <th>첨부파일</th>
                <td><input type="file" name="attachedFile"></td>
            </tr>
            <tr>
                <td colspan="2" id="td_btn">
                    <input type="submit" value="작성완료">
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