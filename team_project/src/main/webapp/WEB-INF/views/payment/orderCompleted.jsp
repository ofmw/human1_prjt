<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>오!마트 - 결제완료</title>
<style>
    /* ---------------------전체 요소 공통--------------------- */
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');       
    *{margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}

    /* a태그 공통 */
    a{text-decoration: none; color: #222;}
    

    /* ---------------------섹션--------------------- */
    section{
        display: flex;
        flex-direction: column;
        width: 100%;
        min-width: 1240px;
        align-items: center;
    }
</style>    
</head>
<body>
	<!-- 헤더 -->
	<header><jsp:include page="../common/header2.jsp"></jsp:include></header>

    <section>
        주문번호 : ${orderNum}
    </section>

    <!-- 푸터 -->
<footer><jsp:include page="../common/footer.jsp"></jsp:include></footer>
</body>
</html>