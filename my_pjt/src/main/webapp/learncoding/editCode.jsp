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
    section{
        border: 1px solid gray;
        border-collapse: collapse;
        position: relative;
        top: 280px;
        width: 1270px;
        height: 530px;
        overflow: hidden;
    }
    #news_list{
        position: absolute;
        border: 1px solid gray;
        border-collapse: collapse;
        width: 300px;
        height: 530px;
        padding-top: 20px;
    }
    #news_list a{
        line-height: 50px;
        margin-left: 45px;
        font-size: 17px;
        
    }
    #div_content{
        position: absolute;
        border: 1px solid gray;
        border-collapse: collapse;
        left: 300px;
        width: 970px;
        height: 530px;
        overflow: scroll;
    }
    
</style>

<body>

    <header>
        <jsp:include page="../main/header2.jsp"></jsp:include>
    </header>
    <hr>
    <section id="section">
        <div id="news_list">
            <a href="qa.jsp">- Q&A</a><br>
            <a href="editCode.jsp">- Edit Code</a><br>
            <a href="preset.jsp">- Preset</a><br>
        </div>
        <div id="div_content">
            <jsp:include page="../board/editCode_board.jsp"></jsp:include>
        </div>
    </section>
    
    <footer>
        <jsp:include page="../main/footer.jsp"></jsp:include>
    </footer>

</body>
</html>