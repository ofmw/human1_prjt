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
    #tbl_qa{
        margin: 30px;
        width: 900px;
        border-collapse: collapse;
    }
    #tbl_qa *{
	   font-family: Consolas, monospace;
	   line-height: 30px;
	   text-align: center;
    }
    caption{
        font-size: 25px;
        font-weight: bold;
        margin-bottom: 10px;
    } 
    #tbl_qa td{
        height: 30px;
        border: 1px solid gray;
    }
    #div_search{
        position: relative;
/*         border: 1px solid gray; */
        height: 30px;
        width: 900px;
        margin-left: 30px;
        text-align: center;    
        line-height: 30px;
    }
    #div_search a{
        position: absolute;
        font-family: Consolas, monospace;
        font-size: 17px;
        margin-top: -25px;
        margin
        
    }
    #btn_write{
        position: absolute;
        margin-left: 875px;
        margin-top: -30px;
        height: 30px;
        font-family: Consolas, monospace;
        font-weight: bold;
    }
    
</style>
<body>
    <table id="tbl_qa">
        <caption>Edit Code</caption>
        <tr id="first_tr">
        	<td>번호</td>
        	<td>제목</td>
        	<td>작성자</td>
        	<td>조회수</td>
        	<td>등록일</td>
        </tr>
        <tr>
        	<td>1</td>
        	<td>코드 좀 수정해주세요</td>
        	<td>홍길동</td>
        	<td>1</td>
        	<td>23-06-13</td>
        </tr>
        <tr>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        </tr>
        <tr>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        </tr>
        <tr>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        </tr>
        <tr>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        </tr>
        <tr>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        </tr>
        <tr>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        </tr>
        <tr>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        </tr>
        <tr>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        </tr>
        <tr>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        </tr>
    </table>
    <div id="div_search">
        <a href="">1</a>&nbsp;&nbsp;&nbsp;
        <a href="">2</a>&nbsp;&nbsp;&nbsp;
        <a href="">3</a>&nbsp;&nbsp;&nbsp;
        <a href="">4</a>&nbsp;&nbsp;&nbsp;
        <a href="">5</a>&nbsp;&nbsp;&nbsp;
        <a href="">></a>&nbsp;&nbsp;&nbsp;
        <a href="">>></a>
    </div>
    <input type="button" value="글작성" id="btn_write"/>
</body>
</html>