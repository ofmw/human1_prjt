<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.CommentVo, dao.CommentDao, util.JSFunction, vo.MemberVo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Timestamp post_date = Timestamp.valueOf(request.getParameter("post_date"));
int b_idx = Integer.parseInt(request.getParameter("no"));

CommentDao dao = new CommentDao();

//로그인된 회원의 member_idx 얻기
MemberVo mVo = (MemberVo)session.getAttribute("member");
int m_idx = mVo.getM_idx();

int result = 0;
	
result = dao.deleteComment(m_idx, post_date);
dao.close();

if(result == 1){//성공시 글목록 페이지로 이동
	JSFunction.alertLocation("댓글이 삭제되었습니다.", "../qa3.jsp?no="+b_idx, out);

}else{//실패시 이전 페이지로 이동
	JSFunction.alertBack("댓글 삭제에 실패했습니다.", out);
}
	

%>
</body>
</html>