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
<title>board_notice</title>
</head>
    <style>
        #div_b_content{
            overflow: scroll;
        }
        #div_b_content fieldset{
            margin : 50px;
            padding : 20px;
        }
        #div_b_content legend{
            font-weight: bold;
            font-size: 19px;
        }
        #div_ad_notice{
            width: 1000px;
            height: 200px;
            overflow: hidden;
        }
        #ta_ad{
            float: left;
            margin-top: 25px;
            margin-left: 50px;
            padding: 10px;
        }
        #smt_ad_notice{
            float: left;
            width: 82px;
            height: 157px;
            margin-top: 25px;
            margin-left: 10px;
            font-weight: bold;
        }
    </style>
    <link rel="stylesheet" href="../resources/css/board.css?v=12345" />
    <%
	    BoardDao dao = new BoardDao();
	    List<BoardVo> boardList = dao.selectNotice();
	    pageContext.setAttribute("boardList", boardList);
	    int totalCount = dao.countNotice();
	    dao.close();
    %>
    <c:set var="totalCount" value="<%= totalCount %>"></c:set>
<body>
    <div id="div_board">
        <div id="div_b_nav">
            <a href="notice.jsp">- Notice</a><br><br>
            <a href="itNews.jsp">- IT News</a>
        </div>
        <div id="div_b_content">
            <c:choose>
                <c:when test="${member.grade eq 9}">
                    <form action="../board2/wp_notice.jsp">
	                    <div id="div_ad_notice">
	                        <textarea id="ta_ad" name="content" rows="9" cols="105" style="resize: none;"></textarea>
	                        <input type="hidden" name="m_idx" value="${member.m_idx}"/>
	                        <input type="submit" id="smt_ad_notice" value="공지등록"/>
	                    </div>
                    </form>
                    <hr>
                    <c:choose>
                        <c:when test="${empty boardList}">
                                <fieldset>
                                    <legend>&nbsp;Notice&nbsp;</legend>
                                    <div>
                                        - 등록된 공지가 없습니다.
                                    </div>
                                </fieldset>                        </c:when>
                        <c:otherwise>
                            <c:forEach var="i" begin="0" end="${totalCount-1}">
                                <fieldset>
	                                <legend>&nbsp;${boardList[i].post_date}&nbsp;</legend>
	                                <div>
	                                    - ${boardList[i].content}
	                                </div>
                                </fieldset>
                            </c:forEach>

                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${empty boardList}">
                                <fieldset>
                                    <legend>&nbsp;Notice&nbsp;</legend>
                                    <div>
                                        - 등록된 공지가 없습니다.
                                    </div>
                                </fieldset>                        </c:when>
                        <c:otherwise>
                            <c:forEach var="i" begin="0" end="${totalCount-1}">
                                <fieldset>
                                    <legend>&nbsp;${boardList[i].post_date}&nbsp;</legend>
                                    <div>
                                        - ${boardList[i].content}
                                    </div>
                                </fieldset>
                            </c:forEach>

                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
    
</body>
</html>