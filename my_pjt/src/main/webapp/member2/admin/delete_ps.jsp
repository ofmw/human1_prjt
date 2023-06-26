<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardFileVo, dao.BoardFileDao, util.JSFunction, vo.MemberVo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int b_idx = Integer.parseInt(request.getParameter("no"));

BoardFileDao dao = new BoardFileDao();
BoardFileVo vo = dao.viewPreset(b_idx);

//로그인된 회원의 member_idx 얻기
MemberVo mVo = (MemberVo)session.getAttribute("member");
int m_member_idx = mVo.getM_idx();

int result = 0;
if(m_member_idx == vo.getM_idx()){//작성자가 회원 본인인 것을 다시 확인
	
	result = dao.deletePreset(vo);
	dao.close();
	
    if(result == 1){//성공시 글목록 페이지로 이동
    	JSFunction.alertLocation("삭제되었습니다.", "../admin2.jsp", out);
    
    }else{//실패시 이전 페이지로 이동
    	JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
    }
	
}

%>
</body>
</html>