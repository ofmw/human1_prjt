<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    *{margin: 0; padding: 0;}
       
    #btn_write{
        position: absolute;
        margin-left: 800px;
        height: 30px;
        font-family: Consolas, monospace;
        font-weight: bold;
        margin-top: -30px;
    }
    
    #div_view{        
/*         border: 1px solid gray; */
        height: 400px;
        width: 800px;
        padding: 20px;
        margin-left: 50px;
    }
    
    #div_member{
        text-align: right;
        font-family: Consolas, monospace;
        font-size: 12px;
        font-weight: bold;
    }
    #div_view_content{
        font-family: Consolas, monospace;
        font-size: 12px;
        padding-top: 30px;
    }
    #div_comment{
        position: absolute;
        font-family: Consolas, monospace;
        font-size: 12px;
/*         border: 1px solid gray; */
        top: 100%;
        margin-top: -100px;        
    }
    #div_comment input[type="text"]{
        height: 20px;
        width: 500px;
    }
</style>
<body>
    <div id="div_view">
        <h3>코드 좀 알려주세요</h3>
        <div id="div_member">작성자 : 홍길동&nbsp;&nbsp;&nbsp;작성일 : 23-06-12</div>
        <div id="div_view_content">
        업다운 애니메이션 코드를 모르겠어요 알려주세요
        </div>
        <div id="div_comment">
            댓글 <input type="text" /> <input type="button" value="등록"/>
        </div>
    </div>
    
    <input type="button" value="글목록" id="btn_write"/>
</body>
</html>