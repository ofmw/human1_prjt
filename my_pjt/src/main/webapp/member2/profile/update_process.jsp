<%@page import="dao.MemberDao, vo.MemberVo, util.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<!-- 화면단에서 넘어온 값들을 일괄적으로 MemberVo에 저장하기 위해서 자바빈과 액션태그를 사용 -->
<jsp:useBean id="memberVo" class="vo.MemberVo"></jsp:useBean>
<jsp:setProperty name="memberVo" property="*"></jsp:setProperty>


<%
	//페이지영역에 저장된 자바빈 객체 가져오기
	MemberVo vo = (MemberVo)pageContext.getAttribute("memberVo");
	
	MemberDao dao = new MemberDao();
	
	MemberVo vo2 = dao.update(vo);
	
	if(vo2 != null){//회원정보 수정 성공시
		session.removeAttribute("member");
		session.setAttribute("member", vo2);
        JSFunction.alertLocation("회원정보 수정에 성공했습니다.", "../profile.jsp", out);
	}else{//회원정보 수정 실패시
		JSFunction.alertLocation("회원정보 수정에 실패했습니다.", "../profile.jsp", out);
	}
%>

