<%@page import="vo.BoardFileVo"%>
<%@page import="dao.BoardFileDao"%>
<%@page import="vo.BoardVo"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<style>
/*         div{
            border: 1px solid gray; 
            border-collapse: collapse;
        } */
        #div_main{
            width: 1250px;
            height: 650px;
            box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }
        #div_main div{
            float: left;
            margin-left:3.5px;
            margin-right:3.5px;
        }
        .div_m_content{
            width: 400px;
            height: 650px;
        }
        .div_rowLine{
            width: 1px;
            height: 500px;
            background-color: gray;
            margin-top: 80px;
        }
        .div_m_content h3{
            margin: 30px;
        }
        .fld_notice{
            padding : 10px;
            border-radius: 7px;
            margin-bottom: 20px;
        }
        .fld_notice legend, #fld_qa legend, #fld_ps legend{
            font-weight: bold;
            font-size: 15px;
        }
        .fld_notice div, .fld_it div, .fld_it table{
            width: 360px;
            font-size: 12px;
            overflow: hidden;
            text-overflow: ellipsis;
            word-break: break-word;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            line-height: 20px;
        }
        #fld_qa, #fld_ps{
            width: 360px;
            padding : 10px;
            border: none;
        }
        #fld_qa{
            height: 255px;
            margin-left: 10px;
            margin-bottom: 15px;
        }
        #fld_ps{
            height: 150px;
            margin: 10px;
        }
        .div_hdn{
            position: relative;
            width: 360px;
            height: 10px;
        }
        .tbl{
            width: 350px;
            border-collapse: collapse;
        }
        .tbl tr, .tbl th, .tbl td{
	        border-bottom: 1px solid gray;
	        border-collapse: collapse;
	        height: 20px;
	        text-align: center;
	        font-size: 11px;
	    }
	    #div_title{
	        height: 20px;
	        width: 130px;
	        overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            text-align: center;
            line-height: 20px;
            padding-left: 5px;
	    }
        #div_c_count{
            height: 20px;
            width: 20px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            text-align: center;
            line-height: 20px;
        }
        .fld_it{
            height: 110px;
            margin-bottom: 5px;
            padding-left: 10px;
            border: none;
        }
        #div_it_content{
            width: 190px;
	        font-size: 12px;
	        overflow: hidden;
	        text-overflow: ellipsis;
	        word-break: break-word;
	        display: -webkit-box;
	        -webkit-line-clamp: 2;
	        -webkit-box-orient: vertical;
	        line-height: 20px;
	        padding-left: 10px;
	        
	    }
	    #div_it_title{
	        width: 180px;
	        font-size: 14px;
	        font-weight: bold;
            word-break: break-word;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
	        line-height: 20px;
	        padding-left: 10px;
	    }
        
</style>
    <%
        BoardDao nDao = new BoardDao();
        List<BoardVo> nList = nDao.selectNotice();
        pageContext.setAttribute("nList", nList);
        nDao.close();
        BoardDao qDao = new BoardDao();
        List<BoardVo> qList = qDao.selectMain();
        pageContext.setAttribute("qList", qList);
        qDao.close();
        BoardFileDao pDao = new BoardFileDao();
        List<BoardFileVo> pList = pDao.selectMain();
        pageContext.setAttribute("pList", pList);
        pDao.close();
        BoardFileDao iDao = new BoardFileDao();
        List<BoardFileVo> iList = iDao.selectMain2();
        pageContext.setAttribute("iList", iList);
        iDao.close();
%>
<body>
    <div id="div_main">
        <div class="div_m_content">
            <a href="news2/itNews.jsp">
            	<h3>IT News ></h3>
            </a>
            <div class="div_hdn" style="margin-bottom: 8.5px;"></div>
            <c:forEach var="i" begin="0" end="3">
                <fieldset class="fld_it">
                    <table>
                        <tr>
                        	<td rowspan="2">
                        	   <a href="news2/itNews3.jsp?no=${iList[i].b_idx}"><img src="uploads/${iList[i].saveFile}" width="150px" height="90px"/></a>
                        	</td>
                        	<td>
                               <a href="news2/itNews3.jsp?no=${iList[i].b_idx}"><div id="div_it_title">${iList[i].title}</div></a>
                        	</td>
                        </tr>
                        <tr>
                        	<td>
                               <a href="news2/itNews3.jsp?no=${iList[i].b_idx}"><div id="div_it_content">${iList[i].content}</div></a>
                        	</td>
                        </tr>
                    </table>
                </fieldset>
            </c:forEach>
        </div>
        <div class="div_rowLine"></div>
        <div class="div_m_content">
            <a href="news2/notice.jsp">
                <h3>Notice ></h3>
            </a>
            <div class="div_hdn"></div>
            <fieldset class="fld_notice">
               <legend>&nbsp;${nList[0].post_date}&nbsp;</legend>
               <div><a href="news2/notice.jsp">${nList[0].content}</a></div>
            </fieldset>
        </div>
        <div class="div_rowLine"></div>
        <div class="div_m_content">
            <a href="learncoding2/qa.jsp">
                <h3>LearnCoding ></h3>
            </a>
            <div class="div_hdn"></div>
            <fieldset id="fld_qa">
                <legend>&nbsp;Q&A&nbsp;</legend>
                <div>
                    <table class="tbl">
                        <tr>
                        	<th>번호</th>
                        	<th>제목</th>
                        	<th>작성자</th>
                        	<th>조회수</th>
                        	<th>등록일</th>
                        </tr>
                        <c:forEach var="i" begin="0" end="9">
	                        <tr>
	                            <td>${qList[i].b_idx}</td>
	                            <td>
	                               <a href="learncoding2/qa3.jsp?no=${qList[i].b_idx}">
		                               <div id="div_title">
	                                        ${qList[i].title}
		                               </div>
		                               <div id="div_c_count">
		                                   <c:choose>
		                                        <c:when test="${qList[i].c_count ne 0}">
		                                            <strong>[${qList[i].c_count}]</strong>
		                                        </c:when>
		                                   </c:choose>
		                               </div>
	                               </a>
	                            </td>
	                            <td>${qList[i].m_name}</td>
	                            <td>${qList[i].read_count}</td>
	                            <td>${qList[i].post_date}</td>
	                        </tr>
                        </c:forEach>
                    </table>
                </div>
            </fieldset>
            <fieldset id="fld_ps">
                <legend>&nbsp;Preset&nbsp;</legend>
                <div>
                    <table class="tbl">
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>조회수</th>
                            <th>등록일</th>
                        </tr>
                        <c:forEach var="i" begin="0" end="4">
                            <tr>
                                <td>${pList[i].b_idx}</td>
                                <td>
                                   <div id="div_title">
                                       <a href="learncoding2/preset3.jsp?no=${pList[i].b_idx}">${pList[i].title}</a>
                                   </div>
                                </td>
                                <td>${pList[i].m_name}</td>
                                <td>${pList[i].read_count}</td>
                                <td>${pList[i].post_date}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>            </fieldset>
        </div>
    </div>
    
</body>
</html>