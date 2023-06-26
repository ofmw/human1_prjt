<%@page import="vo.BoardVo"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

int b_idx = Integer.parseInt(request.getParameter("no"));  // 일련번호 받기 

BoardDao dao = new BoardDao(); // DAO 생성
BoardVo vo = dao.selectView(b_idx); // 게시물 가져오기
dao.close();
pageContext.setAttribute("boardVo", vo);

%>    
    
    
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>글 수정</title>
</head>

<script>
    function validateForm() {
        if (frm_edit.title.value.length == 0) {
            alert("제목을 입력하세요.");
            frm_edit.title.focus();
            return false;
        } else if (frm_edit.content.value.length == 0) {
            alert("내용을 입력하세요.")
            frm_edit.content.focus();
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
        <form name="frm_edit" method="post" action="qa/ep_qa.jsp" onsubmit="return validateForm();">
            <table class="tbl">
                <caption>글 수정</caption>
                <tr>
                    <th>작성자</th>
                    <td>
                        <input type="text" id="writer" value="${member.m_name}" disabled>
                        <input type="hidden" name="m_name" value="${boardVo.m_name}">
                        <input type="hidden" name="m_idx" value="${boardVo.m_idx}">
                        <input type="hidden" name="b_idx" value="${boardVo.b_idx}">
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" class="editable" name="title" value="${boardVo.title}"></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea name="content" class="editable" cols="30" rows="10"
                            style="resize: none;">${boardVo.content}</textarea></td>
                </tr>
                <tr>
                    <td colspan="2" id="td_btn">
                        <input type="submit" value="수정완료">
                        <input type="reset" value="초기화">
                        <input type="button" value="목록으로" onclick="history.go(-2);">
                    </td>
                </tr>
            </table>
        </form>

</body>

</html>