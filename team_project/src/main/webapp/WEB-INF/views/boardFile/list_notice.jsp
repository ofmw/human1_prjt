<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
        *{margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}
    div{
       	border: 1px solid red;
        }
    #div_notice{
    	position: absolute;
    	width: 100%;
    	height: 100%;
    	overflow: hidden;
    }
    
    #div_menu{
        float: left;
        width: 250px;
        height: 700px;
        padding-top: 100px;
    }
    #div_menu p{
        padding: 6px 0;
        text-align: center;
        font-size: 20px;
        font-weight: bold;
        border-bottom: 3px solid black;
    }
    #div_menu ul{
        list-style: none; /* 기본 불릿 스타일 제거 */
        display: flex;
        flex-direction: column; /*세로 방향으로 정렬*/
        text-align: center;
    }
    #div_menu li{
        padding: 12px 0;
        cursor: pointer;
    }
    #div_menu ul li:nth-child(2){
        background-color: black;
        color: white;
    }
    #div_cs_info{
        position: absolute;
        bottom: 0;
        left: 0;
        padding-left: 10px;
        padding-top: 10px;
        border-top: 3px solid black;
        font-size: 23px;
        width: 100%;
        height: 80px;
    }
    #div_cs_info span{
        font-size: 17px;
        color: rgb(224, 224, 224);
    }
    #div_section{
        margin-bottom: 50px;
        float: left;
        width: 1000px;
        height: 700px;
    }
    #div_section p{
        font-size: 28px;
        font-weight: bold;
        padding: 50px;
    }
    #div_section ul{
        list-style: none;
        margin-bottom: 50px;
    }
    #div_sectionMenu{
        font-size: 0;/* 자식객체에 inline-block 하면 여백 남는거 해결방법 */
        padding-left: 50px;
    }
    #div_sectionMenu li{
        float: left;
/*         margin-bottom: 20px; */
        padding: 10px 0;
        width: 400px;
        text-align: center;
        border: 1px solid black;
        border-left: none;
        font-size: 19px;
        cursor: pointer;
    }
    #div_sectionMenu ul li:nth-child(1){
        background-color: black;
        color: white;
    }
    #div_sectionContent{
        float: left;
        width: 1100px;
        height: 500px;
    }
    #div_sectionContent li{
        margin-top: 20px;
        padding: 0 10px;
        width: 738px;
        height: 50px;
        font-size: 18px;
        border-bottom: 1px solid rgb(224, 224, 224);
        line-height: 30px;
    }
    #div_sectionContent p{
        float: right;
        font-size: 13px;
        cursor: pointer;
    }
    #div_sectionContent div{
        padding: 20px;
        background-color: rgb(224, 224, 224);
    }
    #div_sectionContent ul li p:nth_child(1){
    	color: gray;
    }
    .close{
        display: none;
        position: relative;
        padding: 10px;
    }


</style>
<script>

    window.onload = function () {
        let faqSees = document.querySelectorAll(".faq_see")
        let contents = document.querySelectorAll(".close");


        for(let i=0; i<faqSees.length; i++){
            faqSees[i].addEventListener("click", function () {    
                
                if (!contents[i].classList.contains("close")) {
                    contents[i].classList.add("close");
                    return;
                }  
                
                // 모든 FAQ 닫기
                for(let j=0; j<contents.length; j++){
                    contents[j].classList.add("close");
                }
                                    
                contents[i].classList.remove("close");
                
            });
        };
    };
</script>
<body>
<div id="div_notice">
    <div id="div_menu">
        <p>고객센터</p>
        <ul>
            <li onclick="location.href='list_faq_member.html'">FAQ</li>
            <li onclick="location.href='list_notice.do'">공지사항</li>
            <li onclick="location.href='list_event.html'">이벤트</li>
            <li onclick="location.href='list_inquiry.do'">1:1문의하기</li>
        </ul>
    </div>

    <div id="div_section">
        <p>공지사항</p>
            <div id="div_sectionMenu">
                <ul>
                    <li onclick="location.href='list_notice.html'">공지사항</li>
                    <li onclick="location.href='list_notice_event.html'" style="border-right: none;">이벤트 당첨자 발표</li>
                </ul>
            </div>
            <div id="div_sectionContent">
                <c:forEach items="${noticeList}" var="notice">
                <ul>
                    <li>${notice.title}
                    	<p class="faq_see">보기</p>
                    	<p style="padding-right: 30px; color: rgb(224, 224, 224); cursor: default;">
                    		<fmt:formatDate value="${notice.post_date}" pattern="yyyy-MM-dd"/>
                    	</p>
                    </li>
                    <div class="close">
                        ${notice.content}
                    </div>
                </ul>
                </c:forEach>
            </div>
			<a href="list_notice_write.do"><button id="btn_write">글등록</button></a>
			<div  id="div_cs_info">
			<p>고객센터 이용안내 <span>운영시간09:00~21:00</span></p>
			</div>		
    </div>
</div>
    
</body>
</html>