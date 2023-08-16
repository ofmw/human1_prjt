<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Temp</title>

<!-- 임시 css -->
<style>
    section{
    height: 500px;
    }
</style>

</head>
<body>

<!-- 헤더 -->
<header><jsp:include page="common/header1.jsp"></jsp:include></header>	

<section>
    <a href="admin/member.do">관리자페이지</a>
</section>

<!-- 푸터 -->
<footer><jsp:include page="common/footer.jsp"></jsp:include></footer>

</body>
</html>