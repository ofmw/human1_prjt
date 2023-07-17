<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<style>
    *{margin: 0; padding: 0;}
    body{background-color: #f9f4f4;}
    header{
		position:fixed;
		top: 0px;
		text-align: center;
		width: 100%;
		height: 50px;
		line-height: 50px;
		background-color: lightgray;
	}
	footer{
		position:fixed;
		bottom: 0px;
		text-align: center;
		width: 100%;
		height: 50px;
		line-height: 15px;
		background-color: lightgray;	
	}
    #container{
        width: 350px;
        margin: 0 auto;
        background-color: #f9f4f4;
    }
    #logo{
        width: 100%;
        height: 50px;
        margin-top: 70px;
        margin-bottom: 10px;
        font: bold 25px Arial, Sans-serif;
        text-align: center;
    }
    p{
        margin-bottom: 10px;
    }
    label{
        font-size: 12px;
        font-weight:700;
        font-family: Arial, Helvetica, sans-serif;
    }
    #pswd2{
        margin-bottom: 20px;
    }
    select{
        height: 38px;
        margin-top: 5px;
        padding-left: 5px;
        border-color: rgb(199, 198, 198);
        border-style: solid;
        border-width: 1px;
    }
    #gender{
        width: 100%;
    }
    input{
        width: 97%;
        height: 35px;
        padding-left: 10px;
        margin-top: 5px;
        border-color: rgb(199, 198, 198);
        border-style: solid;
        border-width: 1px;
        outline-color: rgb(5, 198, 101);
        outline-width: 1px;
    }
    #update_btn, #cancel_btn{
        width: 49%;
        height: 40px;
        margin-top: 20px;
        font: bold 15px Arial, sans-serif;
        cursor:pointer;/*마우스를 올려놓았을 때 커서가 손모양으로 변경됨*/
    }
    #update_btn{
        background-color: rgb(5, 198, 101);
        color: white;
    }
    #cancel{
    	width:100%;
    	text-align: center;
    	margin-top: 30px;
    	font: 10px Arial, Sans-serif;
    }
    a{
    	text-decoration: none;
    	color: lightgray;
    	margin-left: 15px;
    }
</style>
</head>
<body>

<header>
	<jsp:include page="../main/header.jsp" />
</header>

    <div id="container">
        <div id="logo">회원정보 수정</div>
        <form action="update_process.do" method="post" name="frm_update">
            <p >
                <label>아이디(이메일)<br>
                    <input type="text" id="id" value="${member.member_id}" disabled>
                    <input type="hidden" name="member_id" value="${member.member_id}">
                    </label></p>
            <p >
                <label>비밀번호<br>
                    <input type="password" name="member_pw" id="pswd" value="${member.member_pw}"></label></p>
            <p >
                <label>비밀번호 재확인<br>
                    <input type="password" name="member_pw2" id="pswd2" value="${member.member_pw}"></label></p>
            <p >
                <label>이름<br>
                    <input type="text" name="member_name" id="name" value="${member.member_name}"></label></p>
           <p >
                <label>성별<br>
                    <select name="gender" id="gender">
                        <option value="">성별</option>
                        <c:choose>
                        	<c:when test="${member.gender eq 1}">
                        		<option value="1" selected>남자</option>
                        		<option value="2">여자</option>
                        		<option value="3">선택안함</option>
                        	</c:when>
                        	<c:when test="${member.gender eq 2}">
                        		<option value="1">남자</option>
                        		<option value="2" selected>여자</option>
                        		<option value="3">선택안함</option>
                        	</c:when>
                        	<c:otherwise>
                        		<option value="1">남자</option>
                        		<option value="2">여자</option>
                        		<option value="3" selected>선택안함</option>
                        	</c:otherwise>                        
                        </c:choose>
                   </select>    
                </label></p>
           <p >
                <label>휴대전화<br>
                    <input type="text" name="selNum" id="selNum" value="${member.selNum}">
                </label></p>
                <input type="button" id="cancel_btn" value="취소하기" onclick="history.back()">
                <input type="submit" id="update_btn" value="수정하기">
        </form>
    </div>
    
    <div id="cancel">
    	<a href="#">장기회원 이벤트</a>&nbsp;|&nbsp;<a href="#">회원포인트 조회</a>&nbsp;|&nbsp;<a href="cancel.do">회원탈퇴</a>
    </div>
    
<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>   
    
</body>
</html>