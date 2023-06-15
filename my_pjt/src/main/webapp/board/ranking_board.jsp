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
        <caption>Ranking</caption>
        <tr id="first_tr">
        	<td>순위</td>
        	<td>이름</td>
        	<td>작성글수</td>
        	<td>작성댓글수</td>
        	<td>등급</td>
        </tr>
        <tr>
        	<td>1</td>
        	<td>홍길동</td>
        	<td>1개</td>
        	<td>0개</td>
        	<td>실버</td>
        </tr>
        <tr>
        	<td>2</td>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        </tr>
        <tr>
        	<td>3</td>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        </tr>
        <tr>
        	<td>4</td>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        </tr>
        <tr>
        	<td>5</td>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        </tr>
        <tr>
        	<td>6</td>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        </tr>
        <tr>
        	<td>7</td>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        </tr>
        <tr>
        	<td>8</td>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        </tr>
        <tr>
        	<td>9</td>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        </tr>
        <tr>
        	<td>10</td>
        	<td></td>
        	<td></td>
        	<td></td>
        	<td></td>
        </tr>
    </table>
</body>
</html>