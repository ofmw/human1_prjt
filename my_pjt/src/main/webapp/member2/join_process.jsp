<%@page import="dao.MemberDao, vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<!-- 화면단에서 넘어온 값들을 일괄적으로 MemberVo에 저장하기 위해서 자바빈과 액션태그를 사용 -->
<jsp:useBean id="mVo" class="vo.MemberVo"></jsp:useBean>
<jsp:setProperty name="mVo" property="*"></jsp:setProperty>

<%
	//페이지영역에 저장된 자바빈 객체 가져오기
	MemberVo vo = (MemberVo)pageContext.getAttribute("mVo");
	
	MemberDao dao = new MemberDao();
	
	int result = dao.join(vo);
	
	if(result == 1){//회원가입 성공시
		response.sendRedirect("../index2.jsp?msg=ok");
	}else{//회원가입 실패시
		RequestDispatcher rd = request.getRequestDispatcher("join.jsp");
		rd.forward(request, response);
	}
%>
