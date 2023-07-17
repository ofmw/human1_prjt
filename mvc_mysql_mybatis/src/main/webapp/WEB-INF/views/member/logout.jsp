<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//사용자에 대한 세션을 초기화하고 메인 페이지로 이동함
	session.invalidate();
	response.sendRedirect("../index.jsp");

%>    