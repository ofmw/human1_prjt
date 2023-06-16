<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%
	//checkId.jsp에서 전달된 값을 받고 DAO클래스를 이용해서 아이디 중복검사를 수행함
	String m_id = request.getParameter("m_id");
	
	MemberDao dao = new MemberDao();
	
	int result = dao.checkId(m_id);
	
	request.setAttribute("m_id", m_id);
	RequestDispatcher rd = request.getRequestDispatcher("checkId.jsp?result="+result);
	rd.forward(request, response);
%>
