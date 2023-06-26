<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.BoardFileDao, vo.BoardFileVo, util.JSFunction"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

int b_idx = Integer.parseInt(request.getParameter("no"));  // 일련번호 받기 

BoardFileDao dao = new BoardFileDao(); // DAO 생성 
dao.updateReadCount(b_idx); // 조회수 증가 
BoardFileVo vo = dao.viewIT(b_idx); // 게시물 가져오기
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
        frm_view.action = "itNews/delete_process.jsp?no=${boardFileVo.b_idx}"; // 전송 경로
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
        height: 40px;
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
        text-align: left;
        padding: 5px;
        font-size: 17px;
        line-height: 30px;
    }
</style>
<body>

<form name="frm_view">
    <input type="hidden" name="b_idx" value="${boardFileVo.b_idx}" />  <!-- 공통 링크 -->

    <table class="tbl" style="margin-bottom: 50px;">
    	<caption>${boardFileVo.title}</caption>
    	<tr>
            <td colspan="4" style="text-align: right; border: none;">
               <c:if test="${(!empty member) and (member.grade eq 9)}" >
                    <input type="button" onclick="location.href='itNews4.jsp?no=${boardFileVo.b_idx}'" value="수정하기">
                    <input type="button" onclick="deletePost();" value="삭제하기">
                </c:if>                
                <input type="button" onclick="location.href='itNews.jsp';" value="목록보기">
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">${boardFileVo.post_date}&nbsp;&nbsp;${boardFileVo.m_name}</td>
        </tr>
        <tr>
        	<td>
        	   <img src="../uploads/${boardFileVo.saveFile}" width="800px" height="450px">
        	</td>
        </tr>
        <tr>
            <td id="td_content">
                <%= vo.getContent().replace("\r\n", "<br/>") %>
            </td> 
        </tr>
        <tr>
            <td colspan="4" style="text-align: right; border: none;">
               <c:if test="${(!empty member) and (member.grade eq 9)}" >
                    <input type="button" onclick="location.href='itNews4.jsp?no=${boardFileVo.b_idx}'" value="수정하기">
                    <input type="button" onclick="deletePost();" value="삭제하기">
                </c:if>                
                <input type="button" onclick="location.href='itNews.jsp';" value="목록보기">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
