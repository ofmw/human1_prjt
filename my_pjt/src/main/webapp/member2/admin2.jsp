<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="member" value="${sessionScope.member}"></c:set>
<c:choose>
    <c:when test="${empty member}">
        <c:redirect url="../index2.jsp"></c:redirect>
    </c:when>
</c:choose>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
</head>
<style>
    *{margin: 0; padding: 0; font-family: Consolas, monospace; color: black; text-decoration: none;}
    header,section,footer{
        position: absolute;
        left: 50%;
        margin-left: -625px;
    }
    section{
        top: 220px;
    }  
</style>
<body>
    <header>
        <jsp:include page="../main2/header2.jsp"></jsp:include>
    </header>
    <section>
        <jsp:include page="admin/admin_board.jsp"></jsp:include>
    </section>    
    <footer>
        <jsp:include page="../main2/footer.jsp"></jsp:include>
    </footer>
</body>
</html>