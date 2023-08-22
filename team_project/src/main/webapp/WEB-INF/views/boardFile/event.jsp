<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자주 찾는 질문 - 회원</title>
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
    * {
        margin: 0;
        padding: 0;
        font-family: 'Noto Sans KR', sans-serif;
    }
    /*--------------사이드메뉴----------------*/
        #tbl_side_menu tr:nth-child(3), #tbl_side_menu tr:nth-child(3) a{
        background-color: black;
        color: white;
    }
    /*--------------------------------*/
    /*----------- 공지사항(제목) -----------*/
    #div_event_section {
        position: relative;
        width: 900px;
        margin-left: 80px; /* 왼쪽 여백 추가 */
        font-size: 0; /* 테이블에 inline-block 로 인한 셀 사이 간격 없애기*/
    }
    #div_event_section p:first-child {
        margin-bottom: 30px;
        width: 750px;
        float: left;
        font-size: 28px;
        font-weight: bold;
    }
    /*--------------------------------------*/
    /*----------- 이벤트내용 -----------*/
    #tbl_contents{
    	margin-right: 30px;
    	margin-bottom: 30px;
    	width: 270px;
    	height: 310px;
	    display: inline-block;
	    font-size: 17px;
	    font-weight: bold;
    }
    #tbl_contents img{
    	background-size: 250px 220px;
    	border-radius: 5px;
    }
    #tbl_contents span:nth-child(3){
    	padding-top: 5px;
        font-size: 15px;
        color: rgb(190, 190, 190);
    }   
    /*------------------------------------*/
    table{
        width: 100%;
        border-collapse: collapse;
    }
    a{
        text-decoration: none;
        color: black;
    }
    #btn_write{
    	width: 90px;
    	height: 30px;
    	font-size: 12px;
    	font-weight: bold;
    	border-radius: 3px;
    	cursor: pointer;
    	background-color: rgb(250,250,250);
        border: 1px solid rgb(190, 190, 190);
    	margin-top: 40px;
    	float: right;
    }
</style>

<body>
    <div id="div_event_section">
            	<p>이벤트</p><br>
                    <c:forEach items="${eventList}" var="event">
                        <table id="tbl_contents">
                        	<tr>
                        		<td>
                        			<img src="../resources/uploads/${event.saveFile}" alt="이벤트 배너 이미지" width="250" height="220"><br>
                        			<span>${event.period}</span><br><br>
                        			<span>${event.title}</span>
                        		</td>
                        	</tr>
                        </table>
                    </c:forEach>        
             <c:choose>
		        <c:when test="${sessionScope.member.grade eq 9}">
		            <a href="event_write.do"><button id="btn_write">글등록</button></a>
		        </c:when>
		   	</c:choose>
     </div>
</body>
</html>
