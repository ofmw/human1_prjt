<%@page import="dao.MemberDao, vo.MemberVo, util.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	//페이지영역에 저장된 자바빈 객체 가져오기
	MemberVo vo = (MemberVo)session.getAttribute("member");
	
	MemberDao dao = new MemberDao();
	
	int result = dao.cancel(vo.getM_idx());
	
	if(result == 1){//회원탈퇴 성공시
	    session.invalidate();
	    JSFunction.alertLocation("회원탈퇴가 완료되었습니다.", "../index2.jsp", out);
	}else{//회원정보 수정 실패시
        JSFunction.alertLocation("회원탈퇴에 실패했습니다.", "../index2.jsp", out);
	}
%>
