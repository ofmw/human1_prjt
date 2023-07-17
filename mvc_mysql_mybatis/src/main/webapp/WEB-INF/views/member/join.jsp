<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
		height: 90px;
		line-height: 30px;
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
    #id{
    	width: 66.6%;
    	padding-left: 5px;
    	margin-right: 5px;
    }
    #checkId_btn{
    	width: 29%;
    	height: 37px;
    	font-weight: bold;
    }
    #join_btn, #reset_btn{
        width: 49%;
        height: 40px;
        margin-top: 20px;
        font: bold 15px Arial, sans-serif;
       	cursor:pointer;/*마우스를 올려놓았을 때 커서가 손모양으로 변경됨*/
    }
    #join_btn{
        background-color: rgb(5, 198, 101);
        color: white;
    }
</style>
<script type="text/javascript" src="../resources/js/checkMember.js?v=1234"></script>
</head>
<body>

<header>
	<jsp:include page="../main/header.jsp" />
</header>

    <div id="container">
        <div id="logo">회원 가입</div>
        <form action="join_process.do" method="post" name="frm_join">
            <p >
                <label>아이디(이메일)<br>
                    <input type="text" name="member_id" id="id" placeholder="이메일로 아이디를 입력해주세요">
                    <input type="button" id="checkId_btn" value="중복검사" >
                    <input type="hidden" name="confirm_id">
                    </label></p>
            <p >
                <label>비밀번호<br>
                    <input type="password" name="member_pw" id="pswd"></label></p>
            <p >
                <label>비밀번호 재확인<br>
                    <input type="password" name="member_pw2" id="pswd2"></label></p>
            <p >
                <label>이름<br>
                    <input type="text" name="member_name" id="name"></label></p>
           <p >
                <label>성별<br>
                    <select name="gender" id="gender">
                        <option value="">성별</option>
                        <option value="1">남자</option>
                        <option value="2">여자</option>
                        <option value="3">선택안함</option>
                    </select>    
                </label></p>
           <p >
                <label>휴대전화<br>
                    <input type="text" name="selNum" id="selNum" placeholder="전화번호 입력">
                </label></p>
                <input type="reset" id="reset_btn" value="취소하기">
                <input type="button" id="join_btn" value="가입하기">
        </form>
    </div>
    
<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>   
    
</body>
</html>