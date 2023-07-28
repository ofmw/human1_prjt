<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
</head>
<body>

<header><jsp:include page="/WEB-INF/views/common/header1.jsp"/></header>

<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<footer><jsp:include page="/WEB-INF/views/common/footer.jsp"/></footer>

</body>
</html>
