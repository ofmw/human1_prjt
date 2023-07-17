<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>

<style>
	*{margin:0; padding:0;}
	header{
		position:fixed;
		top: 0px;
		text-align: center;
		width: 100%;
		height: 50px;
		line-height: 50px;
		background-color: lightgray;
	}

	#content{
		width:800px;
		height:500px;
		background-image: url("resources/img/mountain.jpg");
		background-size: 800px 500px;
		background-repeat: no-repeat;
		
		position:absolute;
		left: 50%;
		top: 50%;
		margin-left: -400px;
		margin-top: -270px;
	}
	
	footer{
		position:fixed;
		bottom: 0px;
		text-align: center;
		width: 100%;
		height: 90px;
		line-height: 30px;
		background-color: lightgray;	
	}
	

</style>

</head>
<body>

<header>
	<jsp:include page="main/header2.jsp" />
</header>

<section id="content">

</section>

<footer>
	<jsp:include page="main/footer.jsp" />
</footer>

</body>
</html>