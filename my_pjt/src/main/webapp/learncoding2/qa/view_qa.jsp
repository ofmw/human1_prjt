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
        #div_b_content{
            overflow: scroll;
        }
        #div_b_content table {
            margin-left: 80px;
        }
        #div_b_content table:first-child {
	        margin-top: 50px;
        }
    </style>
    <link rel="stylesheet" href="../resources/css/board.css?v=12345" />
    
<body>
    <div id="div_board">
        <div id="div_b_nav">
            <a href="qa.jsp">- Q&A</a><br><br>
<!--             <a href="editCode.jsp">- Edit Code</a><br><br> -->
            <a href="preset.jsp">- Preset</a>
        </div>
        <div id="div_b_content">
            <jsp:include page="view.jsp"></jsp:include>
        </div>
    </div>
    
</body>
</html>