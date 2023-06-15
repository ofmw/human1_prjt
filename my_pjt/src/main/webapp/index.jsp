<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<style>
    *{margin: 0; padding: 0;}
    header{
        
    }
    section{
        border: 1px solid gray;
        border-collapse: collapse;
        position: relative;
        top: 280px;
        width: 1270px;
        height: 530px;
        overflow: hidden;
    }
</style>

<body>

    <header>
        <jsp:include page="main/header.jsp"></jsp:include>
    </header>
    <hr>
    <section id="section">
        <jsp:include page="main/main.jsp"></jsp:include>
    </section>
    <footer>
        <jsp:include page="main/footer.jsp"></jsp:include>
    </footer>

</body>
</html>