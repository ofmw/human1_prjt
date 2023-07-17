<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style>
	a{
		margin-right:15px;
		color: black;
		font: bold 15px Arial, Sans-serif;
		text-decoration: none;
	}

</style>

</head>
<body>

<!-- 세션객체에 member속성이 없다면 일반용으로 출력되도록 하고
     member속성이 있다면 회원용(홈, 로그아웃, 회원정보수정)으로 출력되도록 구현하기
     - core라이브러리의 choose,when,otherwise태그를 사용함 -->

<c:choose>
	<c:when test="${!empty member}">
		<!-- 회원용 -->
		<a href="../boardFile/list.do">파일 게시판</a>&nbsp;&nbsp;<a href="../board/list.do">기본 게시판</a>&nbsp;&nbsp;
		${member.member_name}님&nbsp;&nbsp;<a href="../index.do">홈</a>
		<a href="../member/logout.do">로그아웃</a><a href="../member/update.do">회원정보수정</a>
	</c:when>
	<c:otherwise>
		<!-- 일반용 -->
		<a href="../boardFile/list.do">파일 게시판</a>&nbsp;&nbsp;<a href="../board/list.do">기본 게시판</a>&nbsp;&nbsp;
		<a href="../index.do">홈</a><a href="../member/login.do">로그인</a><a href="../member/join.do">회원가입</a>
	</c:otherwise>
</c:choose>






</body>
</html>