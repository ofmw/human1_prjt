<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복확인</title>

	<script type="text/javascript">
		function okId(id){
			   opener.document.frm.confirm_id.value=id;
			   self.close();
		}
	</script>

    <style type="text/css">
        #container-checkId{
            width: 430px;
            height: 160px;
            position: absolute;
            left: 50%;
            top: 50%;
            margin-left: -215px;
            margin-top: -80px;
            text-align: center;        
        }    
    </style>
    
</head>
<body>
    <div id="container-checkId">
        <h3>아이디 중복확인</h3>
        <form action="checkId_process.jsp" name="frm_checkId" method="post">
            아이디 <input type="text" name="m_id" value="${param.m_id}" autocomplete="off">
            <input type="submit" value="중복확인"><br>
            <label>
                <c:choose>
                    <c:when test="${param.result == 1}">
                        <script type="text/javascript">
	                        opener.document.frm.m_id.value="";
                        </script>
                        ${m_id}은(는) 이미 사용중인 아이디입니다.
                    </c:when>
                    <c:when test="${param.result == -1}">
                        <script type="text/javascript">
                            opener.document.frm.m_id.value="${m_id}";
                        </script>
                        ${m_id}은(는) 사용 가능한 아이디입니다.
                        <input type="button" id="ok_btn" value="사용" onclick="okId('${m_id}')">
                    </c:when>
                </c:choose>
            </label>
        
        </form>
    
    
    
    </div>



</body>
</html>