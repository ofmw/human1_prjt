<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardVo, dao.BoardDao, util.JSFunction" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 글 등록에서 입력된 내용을 BoardVo객체에 일괄적으로 저장 -->
<jsp:useBean id="boardVo" class="vo.BoardVo"></jsp:useBean>
<jsp:setProperty property="*" name="boardVo"/>

<%
	//자바빈으로 페이지영역에 저장된 boardVo객체를 스크립트릿으로 가져오기
	BoardVo vo = (BoardVo)pageContext.getAttribute("boardVo");
	
	//DAO객체를 통해 VO에 저장된 내용을 DB에 저장
	BoardDao dao = new BoardDao();
	int result = dao.insertQA(vo);
	if(result == 1){//글등록 성공시
		dao.addScore(vo);
		dao.close();
		response.sendRedirect("../qa.jsp");
	}else{//글등록 실패시
        dao.close();
		JSFunction.alertBack("글등록에 실패했습니다.", out);
	}

%>

</body>
</html>