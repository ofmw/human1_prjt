<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        frm_view.action = "delete_process.do?no=${boardFileVo.board_idx}"; // 전송 경로
        frm_view.submit(); // 폼값 전송
        
    }
    
}
</script>

<link rel="stylesheet" href="../resources/css/view_jsp.css">

</head>
<body>

<header>
	<jsp:include page="../main/header.jsp"/>
</header>

<form name="frm_view">
    <input type="hidden" name="board_idx" value="${boardFileVo.board_idx}" />  <!-- 공통 링크 -->

    <table>
    	<caption>글 내용</caption>
        <tr>
            <th>번호</th>
            <td>${boardFileVo.board_idx}</td>
            <th>작성자</th>
            <td>${boardFileVo.member_name}</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td>
                <fmt:formatDate value="${boardFileVo.post_date}" type="date" pattern="yyyy/MM/dd hh:mm:ss"/>
            </td>
            <th>조회수</th>
            <td>${boardFileVo.read_count}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="3">${boardFileVo.title}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="3" ><textarea disabled style="height: 150px; resize: none;">${boardFileVo.content}</textarea></td> 
        </tr>
        <tr>
            <th>첨부파일</th>
            <td colspan="3" >
                <a href="download.do?oName=${boardFileVo.originFile}&sName=${boardFileVo.saveFile}">
                	<img src="../resources/uploads/${boardFileVo.saveFile}" width="200px" height="150px"><br>
                	${boardFileVo.originFile}
                </a>
            </td> 
        </tr>
        <tr>
            <td colspan="4" id="td_btn">
	           <c:if test="${(!empty member) and (member.member_idx eq boardFileVo.member_idx)}" >
	            	<input type="button" onclick="location.href='edit.do?no=${boardFileVo.board_idx}'" value="수정하기">
	                <input type="button" onclick="deletePost();" value="삭제하기">
	            </c:if>
                
	            <input type="button" onclick="location.href='list.do';" value="목록보기">
            </td>
        </tr>
    </table>
</form>

<footer>
	<jsp:include page="../main/footer.jsp" />
</footer> 

</body>
</html>
