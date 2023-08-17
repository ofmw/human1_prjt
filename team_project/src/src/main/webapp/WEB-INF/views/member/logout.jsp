<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
		let referer = '<%= request.getParameter("referer")%>';
	    alert('로그아웃되었습니다.');
	    window.location.href = referer.replace(".jsp", ""); // 로그아웃 후 리다이렉트할 경로
	
</script>
</head>
<body>

</body>
</html>