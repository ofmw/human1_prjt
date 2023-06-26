<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%
	String selNum = request.getParameter("selNum");
	
	MemberDao dao = new MemberDao();
	
	int result = dao.checkSelNum(selNum);
	
	request.setAttribute("selNum", selNum);
	RequestDispatcher rd = request.getRequestDispatcher("checkSelNum.jsp?result="+result);
	rd.forward(request, response);
%>
