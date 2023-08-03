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
    html{
    
    	width: 1280px;
    }
    /*전체 영역*/
    #div_notice {
    	height: auto;
        min-width: 1280px;
        position: relative;
        display: flex;
        justify-content: center;
    }
    /*사이드메뉴, 공지사항내용 엮은 영역*/
    #div_div_notice {
        position: relative;
        display: flex;
        margin-top: 100px;
        justify-content: flex-start; /* 화면 왼쪽에 위치하도록 수정 */
        width: 1300px; /* div_div_notice를 화면 가로 너비 100%로 설정 */
        max-width: 1200px; /* 최대 너비 설정 */
    }
    /*---------- 사이드메뉴 ----------*/
    #div_side_menu {
        position: relative;
        margin-top: 15px;
        width: 200px;
        height: 650px; /* 화면 세로 높이 전체로 설정 */
    }
    #div_side_menu p{
        padding: 6px 0;
        text-align: center;
        font-size: 20px;
        font-weight: bold;
        border-bottom: 3px solid black;
    }
    #div_side_menu td{
        padding: 12px 0;
        width: 200px;
        text-align: center;
        cursor: pointer;
    }
    #tbl_side_menu tr:nth-child(3), #tbl_side_menu tr:nth-child(3) a{
        background-color: black;
        color: white;
    }
    /*--------------------------------*/
    /*----------- 공지사항(제목) -----------*/
    #div_section {
        position: relative;
        width: 900px;
        margin-left: 80px; /* 왼쪽 여백 추가 */
        font-size: 0; /* 테이블에 inline-block 로 인한 셀 사이 간격 없애기*/
    }
    #div_section p:first-child {
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
    	background-size: 220px 200px;
    	border-radius: 5px;
    }
    #tbl_contents span:nth-child(3){
    	padding-top: 5px;
        font-size: 15px;
        color: rgb(190, 190, 190);
    }   
    /*------------------------------------*/
    /*---------------footer---------------*/
    #div_footer{
    	margin-top: 30px;
        padding-left: 10px;
	    padding-top: 10px;
	    border-top: 3px solid black;
	    font-size: 23px;
	    min-width: 1270px;
	    height: 80px;
    }
    #div_footer span{
        font-size: 17px;
        color: rgb(224, 224, 224);
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
    .close {
        display: none;
        position: relative;
        padding: 10px;
        white-space: normal;
    }
    #btn_write{
    	margin-top: 40px;
    	float: right;
    }

    /* PC, 테블릿 가로 (해상도 768px ~ 1023px) */
    @media all and (min-width: 768px) and (max-width: 1023px) {
        #div_side_menu {
            min-width: 150px;
        }

        #div_section {
            min-width: 500px;
        }
    }
</style>

<body>
    <div id="div_notice">
        <div id="div_div_notice">
            <div id="div_side_menu">
                <table id="tbl_side_menu">
                    <p>고객센터</p>
                    <tr>
                        <td><a href="list_faq_member.do">FAQ</a></td>
                    </tr>
                    <tr>
                        <td><a href="list_notice.do">공지사항</a></td>
                    </tr>
                    <tr>
                        <td><a href="list_event.do">이벤트</a></td>
                    </tr>
                    <tr>
                        <td><a href="list_inquiry.do">1:1문의하기</a></td>
                    </tr>
                </table>
            </div>
            <div id="div_section">
            	<p>이벤트</p><br>
                    <c:forEach items="${eventList}" var="event">
                        <table id="tbl_contents">
                        	<tr>
                        		<td>
                        			<img src="../resources/uploads/${event.saveFile}" alt="이벤트 배너 이미지" width="100%" height="200"><br>
                        			<span>${event.period}</span><br><br>
                        			<span>${event.title}</span>
                        		</td>
                        	</tr>
                        </table>
                    </c:forEach>        
                <a href="list_event_write.do"><button id="btn_write">글등록</button></a>
            </div>
        </div>
    </div>
    <div id="div_footer">
        고객센터 이용안내 <span>운영시간09:00~21:00</span>
    </div>
</body>
</html>
