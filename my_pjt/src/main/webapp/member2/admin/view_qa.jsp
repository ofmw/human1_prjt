<%@page import="vo.CommentVo"%>
<%@page import="java.util.List"%>
<%@page import="dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.BoardDao, vo.BoardVo, util.JSFunction"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%

int b_idx = Integer.parseInt(request.getParameter("no"));  // 일련번호 받기 

BoardDao dao = new BoardDao(); // DAO 생성 
dao.readCount_qa(b_idx); // 조회수 증가
BoardVo vo = dao.selectView(b_idx); // 게시물 가져오기 
dao.close();
pageContext.setAttribute("boardVo", vo);

CommentDao cDao = new CommentDao();
int cRows = cDao.selectCount(b_idx);

List<CommentVo> commentList = cDao.selectList(b_idx);
pageContext.setAttribute("commentList", commentList);
cDao.close();
%>
<c:set var="cRows" value="<%= cRows %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용</title>
<script>
function deletePost() {
	
    var confirmAns = confirm("정말로 삭제하겠습니까?");
    
    if (confirmAns) {
    	
        frm_view.method = "post";
        frm_view.action = "admin/delete_qa.jsp?no=${boardVo.b_idx}";
        frm_view.submit();  
    }    
}

function writeComment() {
	var txtarea = document.getElementsByName("content")[0];
	if(txtarea.value.length != 0){
		var confirmAns = confirm("댓글을 등록하시겠습니까?");
		if(confirmAns){
	        frm_view.method = "post";
	        frm_view.action = "admin/wp_comment.jsp?no=${boardVo.b_idx}";
	        frm_view.submit();
		}
	}else{
		alert("댓글내용을 입력해주세요.")
	}

}
</script>

</head>
<style>
    *{margin: 0; padding: 0; font-family: Consolas, monospace; color: black; text-decoration: none;}
    .tbl {
        width: 800px;
        margin-top: 50px;
        margin-bottom: 50px;
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
    .tbl th:first-child{
        width: 150px;
    }
    #td_content{
        height: 300px;
        text-align: left;
        overflow: scroll;
    }
    #btn_comment{
        float: left;
        height: 72px;
        margin-left: 8px;
    }
</style>
<body>

<form name="frm_view">
    <input type="hidden" name="b_idx" value="${boardVo.b_idx}" />  <!-- 공통 링크 -->

    <table class="tbl">
    	<caption>Q&A 내용</caption>
    	<tr>
            <td colspan="4" id="td_btn" style="text-align: right; border: none;">
               <c:if test="${(!empty member) and (member.m_idx eq boardVo.m_idx)}" >
                    <input type="button" onclick="location.href='admin4_qa.jsp?no=${boardVo.b_idx}'" value="수정하기">
                </c:if>
                <input type="button" onclick="deletePost()" value="삭제하기">
                <input type="button" onclick="location.href='admin2.jsp';" value="목록보기">
            </td>
        </tr>
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
                <div id="td_content" style="padding: 5px;">
                    <%= vo.getContent().replace("\r\n", "<br/>") %>
                </div>
            </td> 
        </tr>
        <c:choose>
            <c:when test="${!empty member}">
	            <tr>
		            <th>댓글</th>
		            <td colspan="3">
		                <textarea name="content" rows="4" cols="74" style="margin: 0; padding: 5px; resize: none; float: left;"></textarea>
		                <input type="hidden" name="m_idx" value="${member.m_idx}"/>
		                <input type="hidden" name="m_name" value="${member.m_name}"/>
		                <input type="button" id="btn_comment" onclick="writeComment()" value="댓글등록"/>
		            </td>
		        </tr>
            </c:when>
            <c:otherwise>
                <tr>
                    <th>댓글</th>
                    <td colspan="3" style="height: 80px;">
                        로그인 후에 사용할 수 있습니다.
                    </td>
                </tr>
            </c:otherwise>
        </c:choose>
        <c:forEach var="rowNum" begin="1" end="${cRows}">
	        <tr>
	            <th>${commentList[rowNum-1].m_name}<br>
	               <p style="font-size: 11px; font-weight: normal; margin-top: 5px;">
		               <fmt:formatDate value="${commentList[rowNum-1].post_date}" pattern="yyyy-MM-dd"/><br>
	                   <fmt:formatDate value="${commentList[rowNum-1].post_date}" pattern="HH:mm:ss"/>
                   </p>
                </th>
	            <td colspan="3" style="height: 80px;">
                    <input type="text" value="${commentList[rowNum-1].content}" style="border: none; padding: 5px;" disabled/>
	            </td>
	        </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>
