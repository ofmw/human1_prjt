<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.BoardFileDao, vo.BoardFileVo, util.JSFunction"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

int b_idx = Integer.parseInt(request.getParameter("no"));  // 일련번호 받기 

BoardFileDao dao = new BoardFileDao(); // DAO 생성 
dao.updateReadCount(b_idx); // 조회수 증가 
BoardFileVo vo = dao.viewPreset(b_idx); // 게시물 가져오기 
dao.close();
pageContext.setAttribute("boardFileVo", vo);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용</title>
<script>
function deletePost() {
	
    var confirmAns = confirm("정말로 삭제하겠습니까?");
    
    if (confirmAns) {
    	
        frm_view.method = "post"; // 전송 방식 
        frm_view.action = "admin/delete_ps.jsp?no=${boardFileVo.b_idx}"; // 전송 경로
        frm_view.submit(); // 폼값 전송
        
    }
    
}
</script>

</head>
<style>
    *{margin: 0; padding: 0; font-family: Consolas, monospace; color: black; text-decoration: none;}
    .tbl {
        width: 800px;
        margin-top: 50px;
    }
    .tbl tr, .tbl th, .tbl td{
        border: 1px solid gray;
        border-collapse: collapse;
        height: 20px;
        text-align: center;
        font-size: 13px;
    }
    caption{
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 10px;
    }
    .tbl input[type=text] {
        width: 100%;
        height: 20px;
    }
    #td_content{
        height: 250px;
        text-align: left;
        overflow: scroll;
        padding: 5px;
    }
</style>
<body>

<form name="frm_view">
    <input type="hidden" name="b_idx" value="${boardFileVo.b_idx}" />  <!-- 공통 링크 -->

    <table class="tbl">
    	<caption>글 내용</caption>
        <tr>
            <td colspan="4" id="td_btn" style="text-align: right; border: none;">
               <c:if test="${(!empty member) and (member.m_idx eq boardFileVo.m_idx)}" >
                    <input type="button" onclick="location.href='admin4_ps.jsp?no=${boardFileVo.b_idx}'" value="수정하기">
                </c:if>  
                <input type="button" onclick="deletePost();" value="삭제하기">
                <input type="button" onclick="location.href='admin2.jsp';" value="목록보기">
            </td>
        </tr>
        <tr>
            <th>글 번호</th>
            <td>${boardFileVo.b_idx}</td>
            <th>작성자</th>
            <td>${boardFileVo.m_name}</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td>${boardFileVo.post_date}</td>
            <th>조회수</th>
            <td>${boardFileVo.read_count}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="3">${boardFileVo.title}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="3" id="td_content">
                <%= vo.getContent().replace("\r\n", "<br/>") %>
            </td> 
        </tr>
        <tr>
            <th>첨부파일</th>
            <td colspan="3" style="padding: 5px;">
                <a href="preset/download.jsp?oName=${boardFileVo.originFile}&sName=${boardFileVo.saveFile}" style="float: left;">
                    <img src="../uploads/${boardFileVo.saveFile}" width="50px" height="30px">
                    ${boardFileVo.originFile}
                </a>
            </td> 
        </tr>
    </table>
</form>

</body>
</html>
