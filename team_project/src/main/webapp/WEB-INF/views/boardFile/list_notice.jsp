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
<<<<<<< HEAD
        *{margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}
    div{
       	
        }
    #div_notice{
    	position: absolute;
    	width: 100%;
    	height: 100%;
    	overflow: hidden;
=======
    * {
        margin: 0;
        padding: 0;
        font-family: 'Noto Sans KR', sans-serif;
>>>>>>> branch 'jaehyeok' of https://github.com/ofmw/human1_prjt.git
    }
    /*전체 영역*/
    #div_notice {
    	height: auto;
        min-width: 1280px;
        position: relative;
        display: flex;
        justify-content: center;
    }
<<<<<<< HEAD
    #div_menu{
    	width: 200px;
   		margin-top: 100px;
    	position: absolute;

=======
    /*사이드메뉴, 공지사항내용 엮은 영역*/
    #div_div_notice {
        position: relative;
        display: flex;
        margin-top: 100px;
        justify-content: flex-start; /* 화면 왼쪽에 위치하도록 수정 */
        width: 1200px; /* div_div_notice를 화면 가로 너비 100%로 설정 */
        max-width: 1200px; /* 최대 너비 설정 */
>>>>>>> branch 'jaehyeok' of https://github.com/ofmw/human1_prjt.git
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
    #tbl_side_menu tr:nth-child(2), #tbl_side_menu tr:nth-child(2) a{
        background-color: black;
        color: white;
    }
    /*--------------------------------*/
    /*----------- 공지사항(제목) -----------*/
    #div_section {
        position: relative;
        width: 750px;
        margin-left: 130px; /* 왼쪽 여백 추가 */
    }
<<<<<<< HEAD
    #div_cs_info span{
        font-size: 17px;
        color: rgb(224, 224, 224);
    }

    #div_faq{
    	margin-left: 40px;

        margin-bottom: 50px;
        float: left;
        width: 693px;
    }
    #div_section p{
=======
    #div_section P:first-child {
        margin-bottom: 20px;
        float: left;
>>>>>>> branch 'jaehyeok' of https://github.com/ofmw/human1_prjt.git
        font-size: 28px;
        font-weight: bold;
<<<<<<< HEAD
        padding: 50px;
=======
>>>>>>> branch 'jaehyeok' of https://github.com/ofmw/human1_prjt.git
    }
<<<<<<< HEAD
    #div_section ul{
        list-style: none;
        height: 50px;
=======
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
>>>>>>> branch 'jaehyeok' of https://github.com/ofmw/human1_prjt.git
    }
<<<<<<< HEAD
    #div_sectionMenu{
        font-size: 0;/* 자식객체에 inline-block 하면 여백 남는거 해결방법 */
        padding-left: 50px;
    }

    #div_faqMenu li{
        float: left;
	    margin-bottom: 20px;
	    padding: 10px 0;
	    width: 344.5px;
	    text-align: center;
	    border: 1px solid black;
	    border-left: none;
	    font-size: 19px;
	    cursor: pointer;
    }
    #div_sectionMenu ul li:nth-child(1){
=======
    #tbl_contents_menu td:nth-child(1), #tbl_contents_menu td:nth-child(1) a{
>>>>>>> branch 'jaehyeok' of https://github.com/ofmw/human1_prjt.git
        background-color: black;
        color: white;
    }
<<<<<<< HEAD

    #div_faqContent{
    	
=======
    #tbl_contents_menu td:nth-child(2){
        border-right: none;
>>>>>>> branch 'jaehyeok' of https://github.com/ofmw/human1_prjt.git
    }
<<<<<<< HEAD
    #div_faqContent li{
        margin-top: 30px;
=======
    #tbl_contents tr:nth-child(1) td{
>>>>>>> branch 'jaehyeok' of https://github.com/ofmw/human1_prjt.git
        padding: 0 10px;
        padding-top: 30px;
        width: 673px;
        height: 50px;
        font-size: 18px;
        border-bottom: 1px solid rgb(224, 224, 224);
        line-height: 30px;
    }
<<<<<<< HEAD
    #div_sectionContent p{
        float: right;
        font-size: 13px;
        cursor: pointer;
    }

    #div_faqContent div{
    	width: 653px;
=======
    #tbl_contents tr:nth-child(2) td{
    	float: left;
        width: 710px;
>>>>>>> branch 'jaehyeok' of https://github.com/ofmw/human1_prjt.git
        padding: 20px;
        background-color: rgb(224, 224, 224);
    }
<<<<<<< HEAD
    #div_sectionContent ul li p:nth_child(1){
    	color: gray;
=======
    #tbl_contents span{
        float: right;
        cursor: pointer;
        font-size: 13px;
>>>>>>> branch 'jaehyeok' of https://github.com/ofmw/human1_prjt.git
    }
    #tbl_contents p{
    	float: right;
        padding-right: 30px; 
        color: rgb(224, 224, 224); 
        cursor: default;
        font-size: 13px;
    }
    /*------------------------------------*/
    /*---------------footer---------------*/
    #div_footer{
    	margin-top: 30px;
        padding-left: 10px;
	    padding-top: 10px;
	    border-top: 3px solid black;
	    font-size: 23px;
	    min-width: 1260px;
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
<<<<<<< HEAD

<div id="divdiv">
<div id="divdivdiv">
    <div id="div_menu">
        <p>고객센터</p>
        <ul>
            <li onclick="location.href='list_faq_member.html'">FAQ</li>
            <li onclick="location.href='list_notice.do'">공지사항</li>
            <li onclick="location.href='list_event.html'">이벤트</li>
            <li onclick="location.href='list_inquiry.do'">1:1문의하기</li>
        </ul>
    </div>
	<div id="div_div_faqContent">
    <div id="div_faq">
        <p>공지사항</p>
            <div id="div_sectionMenu">
                <ul>
                    <li onclick="location.href='list_notice.html'">공지사항</li>
                    <li onclick="location.href='list_notice_event.html'" style="border-right: none;">이벤트 당첨자 발표</li>
                </ul>
            </div>
            
            <div id="div_faqContent">
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
			
		</div>
	</div>
	</div>
			<div  id="div_cs_info">
			<p>고객센터 이용안내 <span>운영시간09:00~21:00</span></p>
			</div>		
    
</div>
    
=======
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
                <a href="list_notice_write.do"><button id="btn_write">글등록</button></a>
            </div>
        </div>
    </div>
    <div id="div_footer">
        고객센터 이용안내 <span>운영시간09:00~21:00</span>
    </div>
>>>>>>> branch 'jaehyeok' of https://github.com/ofmw/human1_prjt.git
</body>
</html>
