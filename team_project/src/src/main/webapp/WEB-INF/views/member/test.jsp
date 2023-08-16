<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 성공!</h1>

  <script>
    // 세션에 저장된 memberId를 가져옵니다.
    var memberId = sessionStorage.getItem("memberId");
    // 원하는 작업을 수행합니다. 예시로 로그인한 사용자의 아이디를 출력합니다.
    document.write("<p>로그인한 사용자의 아이디: " + memberId + "</p>");
  </script>
</body>
</html>