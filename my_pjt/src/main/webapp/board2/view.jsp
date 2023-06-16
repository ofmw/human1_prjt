<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.BoardDao, vo.BoardVo, util.JSFunction"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

int b_idx = Integer.parseInt(request.getParameter("no"));  // 일련번호 받기 

BoardDao dao = new BoardDao(); // DAO 생성 
dao.readCount_qa(b_idx); // 조회수 증가
BoardVo vo = dao.selectView(b_idx); // 게시물 가져오기 
dao.close();
pageContext.setAttribute("boardVo", vo);

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
        frm_view.action = "../board2/delete_qa.jsp?no=${boardVo.b_idx}"; // 전송 경로
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
        height: 400px;
        text-align: left;
        overflow: scroll;
    }
</style>
<body>

<form name="frm_view">
    <input type="hidden" name="b_idx" value="${boardVo.b_idx}" />  <!-- 공통 링크 -->

    <table class="tbl">
    	<caption>Q&A 내용</caption>
        <tr>
            <th>글 번호</th>
            <td>${boardVo.b_idx}</td>
            <th>작성자</th>
            <td>${boardVo.m_name}</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td>${boardVo.post_date}</td>
            <th>조회수</th>
            <td>${boardVo.read_count}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="3">${boardVo.title}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="3">
                <div id="td_content">
                    <%= vo.getContent().replace("\r\n", "<br/>") %>
                </div>
            </td> 
        </tr>
        <tr>
            <td colspan="4" id="td_btn">
	           <c:if test="${(!empty member) and (member.m_idx eq boardVo.m_idx)}" >
	            	<input type="button" onclick="location.href='../learncoding2/qa4.jsp?no=${boardVo.b_idx}'" value="수정하기">
	                <input type="button" onclick="deletePost();" value="삭제하기">
	            </c:if>
                
	            <input type="button" onclick="location.href='qa.jsp';" value="목록보기">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
