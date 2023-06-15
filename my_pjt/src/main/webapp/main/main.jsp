<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    #div_main{
        position: absolute;
        border: 1px solid gray;
        border-collapse: collapse;
        width: 1270px;
        height: 530px;
        overflow: hidden;    
        padding-left: 20px; 
    }
    #div_main div{
/*         border: 1px solid gray; */
        border-collapse: collapse;
        float: left;
        width: 400px;
        height: 530px;
        text-align: center;
    }
    #div_main #line{
        float: left;
        background-color: gray;
        width: 1px;
        height: 450px;
        margin-top: 60px;
        margin-left: 5px;
        margin-right: 5px;
    }
    #div_main #div_sub{
/*         border: 1px solid gray; */
        height: 130px;
        width: 390px;
        text-align: left;
    }
    #div_sub img{
        float: left;
        height: 100px;
        width: 150px;
        margin-top: -5px;
        margin-right: 10px; 
    }
    #div_sub a{
        float: left;
        font-size: 15px;
        margin-top: 20px;
        line-height: 30px;
    }
    #div_sub p{
        float: left;
        font-size: 13px;
        font-weight: normal;
        line-height: 30px;
    }
    #div_sub:first-of-type{
        margin-top: 10px;
    }
</style>
<body>
    <div id="div_main">
    	<div>
    	   <a href="news/itNews.jsp"><caption>IT News ></caption></a><br>
    	   <div id="div_sub">    	       
    	       <a href="">
	    	       <img alt="" src="resources/img/apple.jpg">
	    	       애플 '비전 프로' 생태계...
	    	       <p>애플이 혼합현실(MR) 헤드셋</p>
	    	       <p>'비전 프로' 앱 개발자...</p>
    	       </a>
    	   </div>
    	   <div id="div_sub">             
               <a href="">
                   <img alt="" src="resources/img/KT.jpg">
                   KT, 토종 ICT 혁신기업...
                   <p>KT가 유럽 최대 규모 스타트업</p>
                   <p>박람회에서 국내 대표 정보...</p>
               </a>
           </div>
           <div id="div_sub">              
               <a href="">
                   <img alt="" src="resources/img/meta.jpg">
                   메타휴먼 ‘한유아’, ‘다정...
                   <p>스마일게이트의 메타휴먼 한유아가</p>
                   <p>신간 ‘다정한 비인간: 메타...</p>
               </a>
           </div>
    	</div>
    	<div id="line"></div>
    	<div>
    	   <a href="news/notice.jsp"><caption>Notice > </caption></a>
    	   <div id="div_sub">             
               <a href="news/notice.jsp">
                   - RUNCODING 사이트가 개설되었습니다.<br>
                   <p>2023.06.12</p>
               </a>
           </div>
           <div id="div_sub">             
               <a href="">
                   
               </a>
           </div>
           <div id="div_sub">              
               <a href="">
                   
               </a>
           </div>
    	</div>
    	<div id="line"></div>
    	<div>
    	   <a href="learncoding/qa.jsp"><caption>LearnCoding > </caption></a>
    	</div>
    </div>
</body>
</html>