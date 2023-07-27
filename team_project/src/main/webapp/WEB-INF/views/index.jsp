<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시홈페이지</title>

<!-- 임시 css -->
<style>
#asdf{
	width: 1200px;
	height: 1000px;
	border: 1px solid black;
	margin: 20px;
}
</style>

</head>
<body>

<!-- 헤더 -->
<header><jsp:include page="common/header1.jsp"></jsp:include></header>

<section>
	<div id="asdf">content
	<p>로그인한 회원 아이디: ${member.m_id}</p></div>
</section>

<!-- 푸터 -->
<footer><jsp:include page="common/footer.jsp"></jsp:include></footer>

</body>
</html>