<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_notice</title>
</head>
    <style>
        #div_b_content table {
            margin-left: 80px;
        }
        #div_b_content table:first-child {
            margin-top: 40px;
        }
        #div_b_content{
            overflow: scroll;
        }
    </style>
    <link rel="stylesheet" href="../resources/css/board.css?v=12345" />
<body>
    <div id="div_board">
        <div id="div_b_nav">
            <a href="notice.jsp">- Notice</a><br><br>
            <a href="itNews.jsp">- IT News</a>
        </div>
        <div id="div_b_content">
            <jsp:include page="write.jsp"></jsp:include>
        </div>
    </div>
    
</body>
</html>