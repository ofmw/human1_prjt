<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	* {margin:0; padding:0;}
	header { position:fixed;
			 top: 0px;
			 text-align:center;
			 width: 100%;
			 height: 50px;
			 line-height: 50px;
			 background-color: lightgray;
	}
	section#content { position:absolute;
					  top: 50px;
					  width: 100%;			 
	}
	footer { position:fixed;
			 bottom:0px;
			 text-align:center;
			 width: 100%;
			 height: 90px;
			 line-height: 30px;
			 background-color:lightgray;	
	}
	.logo{
            width: 90px;
            height: 24px;
            margin: 30px auto;
            font: bold 25px Arial, Sans-serif;
        	text-align: center;
    }
    fieldset, input{
        border-width: 1px;
        border-style: solid;
        border-color: lightgray;
        border-radius: 4px;
    }
    fieldset{
        width: 400px;
        height: 230px;
        margin: 0 auto;
        text-align: center;
        padding-top: 20px;
    }
    legend{
        font-size: 20px;
        text-align: left;
    }
    input{
        width: 360px;
        height: 54px;
        margin: 3px 0;
        padding-left: 20px;
        font-size: 16px;
    }
    input:focus{ 
       outline: 1px solid rgb(26, 247, 26);
    }
    input[type="button"]{
        width: 380px;
        margin-top: 10px;
        font: bold 20px Arial, sans-serif;
        background-color: rgb(3, 202, 50);
        color: white;
        cursor:pointer;/*마우스를 올려놓았을 때 커서가 손모양으로 변경됨*/
    }
    #msg{
    	width: 400px;
    	margin: 20px auto;
    	text-align: center;
    	font-size: 13px;
    } 		

</style>

<script type="text/javascript" src="../resources/js/checkLogin.js"></script>

</head>
<body>
<header>
	<jsp:include page="../main/header.jsp"/>
</header>

<section id="content">

    <div class="logo">로그인</div>
    <form name="frm_login" action="login_process.do" method="post" >
        <fieldset>
            <legend>ID 로그인</legend>
            <input type="text" name="member_id" placeholder="아이디">
            <input type="password" name="member_pw" placeholder="비밀번호"><br>
            <input type="button" name="submit_btn" value="로 그 인">
        </fieldset>
    </form>

<!-- 회원가입 후 로그인 페이지로 이동하는 경우 msg: ok이고 
	 로그인 후 로그인 페이지로 이동하는 경우 msg: fail이므로
	 msg에 따라 다른 메시지가 하단에 출력되도록 구현하기
	 - core라이브러리의 choose,when태그 사용함 
 -->
<c:choose>
	<c:when test="${msg eq 'ok'}">
		<div id="msg">회원가입이 정상적으로 이루어졌습니다</div>
	</c:when>
	<c:when test="${msg eq 'fail'}">
		<div id="msg">회원정보가 없거나 아이디나 비밀번호가 일치하지 않습니다</div>
	</c:when>
</c:choose> 
    

</section>

<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>
</body>
</html>