<%@page import="dao.MemberDao, vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%
String m_id = request.getParameter("m_id");
String m_pw = request.getParameter("m_pw");

	MemberDao dao = new MemberDao();
	
	MemberVo vo = dao.login(m_id, m_pw);
	
	if(vo != null){//로그인 성공시
		//세션객체에 회원정보 추가(로그인된 회원의 정보를 MemberVo객체로 저장)
		session.setAttribute("member", vo);
		response.sendRedirect("../index2.jsp");
	}else{//로그인 실패시
%>
    <script type="text/javascript">
        alert("아이디나 패스워드를 확인해주세요.")
    </script>
<%
		RequestDispatcher rd = request.getRequestDispatcher("../index2.jsp");
		rd.forward(request, response);
	}
%>
