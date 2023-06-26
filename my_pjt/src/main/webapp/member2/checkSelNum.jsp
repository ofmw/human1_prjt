<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복확인</title>

	<script type="text/javascript">
		function okSelNum(selNum){
			   if(frm_checkSelNum.inputANum.value == "1234"){
	               alert("인증완료되었습니다.");
                   opener.document.frm_update.confirm_selNum.value=selNum;
	               opener.document.frm_update.selNum.value="${selNum}";
	               self.close();
			   }else{
				   alert("잘못된 인증번호입니다.");
			   }

		}
	</script>

    <style type="text/css">
        #container-checkSelNum{
            width: 430px;
            height: 160px;
            position: absolute;
            left: 50%;
            top: 50%;
            margin-left: -215px;
            margin-top: -80px;
            text-align: center;  
            font-family: Consolas, monospace;
        }
        form, form *{
            font-size: 12px;
        }
        #smt_aNum, #btn_ok{
            width: 100px;
        } 
    </style>
    
</head>
<body>
    <div id="container-checkSelNum">
        <h3>인증센터</h3>
        <form action="checkSelNum_process.jsp" name="frm_checkSelNum" method="post">
            전화번호 <input type="text" name="selNum" value="${param.selNum}" autocomplete="off">
	        <input type="submit" id="smt_aNum" value="인증번호 받기"><br><br>
	        <c:choose>
	            <c:when test="${param.result == 1}">
	                <script type="text/javascript">
	                 opener.document.frm_update.selNum.value="${member.selNum}";
	                </script>
	                이미 사용중인 전화번호입니다.
	            </c:when>
	            <c:when test="${param.result == -1}">
	                <script type="text/javascript">
	                    alert("인증번호 : 1234")
	                    inputANum.focus();
	                </script>
	                인증번호 <input type="text" name="inputANum"/>
	                <input type="button" id="btn_ok" value="인증완료" onclick="okSelNum('${selNum}')">
	            </c:when>
	        </c:choose>        
        </form>
    
    
    
    </div>



</body>
</html>