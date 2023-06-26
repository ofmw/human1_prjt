<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Preset</title>
</head>
<style>
    *{margin: 0; padding: 0; font-family: Consolas, monospace; color: black; text-decoration: none;}
    header,section,footer{
        position: absolute;
        left: 50%;
        margin-left: -625px;
    }
    section{
        top: 220px;
    }  
</style>

<body>
    <header>
        <jsp:include page="../main2/header2.jsp"></jsp:include>
    </header>
    <section>
        <jsp:include page="preset/board_preset.jsp"></jsp:include>
    </section>    
    <footer>
        <jsp:include page="../main2/footer.jsp"></jsp:include>
    </footer>
</body>
</html>