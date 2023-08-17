<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

    * {
        margin: 0;
        padding: 0;
        font-family: 'Noto Sans KR', sans-serif;
    }
    /*---------------사이드메뉴 색상------------------*/
    #tbl_side_menu tr:nth-child(2), #tbl_side_menu tr:nth-child(2) a{
        background-color: black;
        color: white;
    }
    /*------------------------------------------------*/
    /*----------- 공지사항(제목) -----------*/
    #div_notice_section P:first-child {
        margin-bottom: 20px;
        float: left;
        font-size: 28px;
        font-weight: bold;
    }

    /*--------------------------------------*/
    /*----------- 공지사항내용 -----------*/
    #tbl_contents_menu td{
        padding: 10px 0;
        width: 50%;
        text-align: center;
        border: 1px solid black;
        border-left: none;
        font-size: 19px;
        cursor: pointer;
    }

    #tbl_contents_menu td:nth-child(1), #tbl_contents_menu td:nth-child(1) a{
        background-color: black;
        color: white;
    }

    #tbl_contents_menu td:nth-child(2){
        border-right: none;
    }

    #tbl_contents tr:nth-child(1) td{
        padding: 0 10px;
        padding-top: 30px;
        width: 673px;
        height: 50px;
        font-size: 18px;
        border-bottom: 1px solid rgb(224, 224, 224);
        line-height: 30px;
    }

    #tbl_contents tr:nth-child(2) td{
    	float: left;
        width: 710px;
        padding: 20px;
        background-color: rgb(224, 224, 224);
    }

    #tbl_contents span{
        float: right;
        cursor: pointer;
        font-size: 13px;
    }
    #tbl_contents p{
    	float: right;
        padding-right: 30px; 
        color: rgb(224, 224, 224); 
        cursor: default;
        font-size: 13px;
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
<script>
    
    window.onload = function () {
        let faqSees = document.querySelectorAll(".faq_see")
        let contents = document.querySelectorAll(".close");

        for (let i = 0; i < faqSees.length; i++) {
            faqSees[i].addEventListener("click", function () {

                if (!contents[i].classList.contains("close")) {
                    contents[i].classList.add("close");
                    return;
                }

                // 모든 FAQ 닫기
                for (let j = 0; j < contents.length; j++) {
                    contents[j].classList.add("close");
                }

                contents[i].classList.remove("close");

            });
        };
    };
</script>

<body>

    <div id="div_notice_section">
            	<p>공지사항</p>
                <table id="tbl_contents_menu">
                    <tr>
                        <td><a href="list_faq_notice.do">공지사항</a></td>
                        <td><a href="list_faq_notice_event.html">이벤트 당첨자 발표</a></td>
                    </tr>
                    <c:forEach items="${noticeList}" var="notice">
                        <table id="tbl_contents">
                            <tr>
                                <td>${notice.title}
									<span class="faq_see">보기</span>
                                    <p>
                                        <fmt:formatDate value="${notice.post_date}" pattern="yyyy-MM-dd"/>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td class="close">
                                    ${notice.content}
                                </td>
                            </tr>
                        </table>
                    </c:forEach>        
                </table>
           <a href="notice_write.do"><button id="btn_write">글등록</button></a>
     </div>
     
</body>
</html>
