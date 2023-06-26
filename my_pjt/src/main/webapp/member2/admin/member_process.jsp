<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.MemberVo, dao.MemberDao, util.JSFunction" %>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    
    String[] strList = request.getParameterValues("checked");
    int[] idxList = new int[strList.length];
    
    for(int i=0; i<strList.length; i++){
    	idxList[i] = Integer.parseInt(strList[i]);
    }
    
    String admin_req = request.getParameter("admin_req");
    
    MemberDao dao = new MemberDao();
    
    switch(admin_req){
    case "gradeUp" : dao.gradeUp(idxList); JSFunction.alertLocation("수정되었습니다.", "../admin.jsp", out); break;
    case "gradeDown" : dao.gradeDown(idxList); JSFunction.alertLocation("수정되었습니다.", "../admin.jsp", out); break;
    case "cancel" : dao.cancel(idxList); JSFunction.alertLocation("수정되었습니다.", "../admin.jsp", out); break;
    case "restoration" : dao.restoration(idxList); JSFunction.alertLocation("수정되었습니다.", "../admin.jsp", out); break;

    }


%>