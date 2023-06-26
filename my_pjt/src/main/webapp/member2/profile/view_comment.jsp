<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
    <style>
        #div_b_content table {
            margin-left: 80px;
        }
        #div_b_content table:first-child {
	        margin-top: 40px;
        }
    </style>
    <link rel="stylesheet" href="../resources/css/board.css?v=12345" />
    
<body>
<c:set var="status" value="list"></c:set>
    <div id="div_board">
        <div id="div_b_nav">
            <a href="profile.jsp">- Profile</a><br><br>
            <a href="profile3.jsp">- 작성한 글</a><br><br>
            <a href="profile4.jsp">- 작성한 댓글</a><br><br>
        </div>
        <div id="div_b_content">
            <jsp:include page="comment.jsp"></jsp:include>
        </div>
    </div>
    
</body>
</html>