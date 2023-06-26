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
<style>
    *{margin: 0; padding: 0; font-family: Consolas, monospace; color: black; text-decoration: none;}
    .tbl {
        width: 800px;
    }
    .tbl tr, .tbl th, .tbl td{
        border: 1px solid gray;
        border-collapse: collapse;
        height: 20px;
        text-align: center;
        font-size: 13px;
        overflow: hidden;
    }
    caption{
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 10px;
    }
    .tbl input[type=text] {
        width: 100%;
        height: 20px;
        padding-left: 5px;
        border: none;
        outline: none;
    }
    .tbl textarea {
        width: 100%;
        height: 400px;
        padding: 5px;
        border: none;     
        outline: none;
    }
</style>
<body>
        <form action="preset/write_process.jsp" name="frm_write" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
            <table class="tbl">
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
                    <th>첨부파일</th>
                    <td><input type="file" name="attachedFile"></td>
                </tr>
                <tr>
                    <td colspan="2" id="td_btn">
                        <input type="submit" value="작성완료">
                        <input type="reset" value="초기화">
                        <input type="button" value="목록으로" onclick="location.href='preset.jsp'">
                    </td>
                </tr>
            </table>
        </form>
</body>

</html>