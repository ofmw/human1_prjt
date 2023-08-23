<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
		let platform = '<%= request.getParameter("platform")%>';
		
		if (platform === "omart") {
			alert('해당 이메일은 이미 오마트 계정으로 가입되어 있습니다.\n오마트 계정으로 로그인 해주세요.');
			location.href = "/prjt";
		} else if (platform === "naver") {
			alert('해당 이메일은 이미 네이버 계정으로 가입되어 있습니다.\n네이버 계정으로 로그인 해주세요.');	
			location.href = "/prjt";
		} else if (platform === "kakao") {
			alert('해당 이메일은 이미 카카오 계정으로 가입되어 있습니다.\n카카오 계정으로 로그인 해주세요.');
			location.href = "/prjt";
		}
		
</script>
</head>
<body>

</body>
</html>