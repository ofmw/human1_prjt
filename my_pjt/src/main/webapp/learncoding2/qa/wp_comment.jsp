<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.CommentVo, dao.CommentDao, util.JSFunction" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 댓글 등록에서 입력된 내용을 CommentVo객체에 일괄적으로 저장 -->
<jsp:useBean id="CommentVo" class="vo.CommentVo"></jsp:useBean>
<jsp:setProperty property="*" name="CommentVo"/>

<%
	//자바빈으로 페이지영역에 저장된 CommentVo 스크립트릿으로 가져오기
	CommentVo vo = (CommentVo)pageContext.getAttribute("CommentVo");
	
	//DAO객체를 통해 VO에 저장된 내용을 DB에 저장
	CommentDao dao = new CommentDao();
	int result = dao.insertComment(vo);
	if(result == 1){//댓글등록 성공시
	    dao.addScore(vo);
	    dao.close();		
		JSFunction.alertLocation("댓글이 등록되었습니다.","../qa3.jsp?no="+vo.getB_idx(),out);
	}else{//글등록 실패시
		dao.close();
		JSFunction.alertBack("댓글등록에 실패했습니다.", out);
	}
%>

</body>
</html>