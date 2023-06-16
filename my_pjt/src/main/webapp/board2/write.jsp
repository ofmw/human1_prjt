<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>글 작성</title>
</head>
<script>
    function validateForm() {
        if (frm_write.title.value.length == 0) {
            alert("제목을 입력하세요.");
            frm_write.title.focus();
            return false;
        } else if (frm_write.content.value.length == 0) {
            alert("내용을 입력하세요.")
            frm_write.content.focus();
            return false;
        }
    }
</script>

<body>
        <form action="write_process.jsp" name="frm_write" method="post" onsubmit="return validateForm();">
            <table>
                <caption>글 작성</caption>
                <tr>
                    <th>작성자</th>
                    <td>
                        <input type="text" value="${member.m_name}" disabled>
                        <input type="hidden" name="m_name" value="${member.m_name}">
                        <input type="hidden" name="m_idx" value="${member.m_idx}">
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
                    <td colspan="2" id="td_btn">
                        <input type="submit" value="작성완료">
                        <input type="reset" value="초기화">
                        <input type="button" value="목록으로" onclick="location.href='list.jsp'">
                    </td>
                </tr>
            </table>
        </form>

</body>

</html>