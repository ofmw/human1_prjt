<%@page import="dao.CommentDao"%>
<%@page import="dao.BoardFileDao"%>
<%@page import="dao.BoardDao"%>
<%@page import="vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
	int cntBoard = 0;//작성 게시글 카운트 qa
	int cntBoardFile = 0;//작성 게시글 카운트 ps
	int cntComment = 0;//작성 댓글 카운트 qa
	if(session.getAttribute("member") != null){
	    BoardDao bDao = new BoardDao();
	    BoardFileDao bfDao = new BoardFileDao();
	    CommentDao cDao = new CommentDao();
	    MemberVo mVo = (MemberVo)session.getAttribute("member");
	    cntBoard = bDao.countBoardM(mVo);
	    cntBoardFile = bfDao.countBoardM(mVo);
	    cntComment = cDao.countComment(mVo);
	    bDao.close();
	    bfDao.close();
	    cDao.close();
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<link rel="stylesheet" href="../resources/css/header2_jsp.css?v=12345" />
<style>
    #div_member{
        position:absolute;
        font-size: 13px;
        font-weight: bold;
        margin-top: 90px;
        margin-left: 20px;
    }
    #a_logout{
        position: absolute;
        margin-top: -32px;
        margin-left: 160px;
    }
</style>
<script type="text/javascript" src="../resources/js/header.js"></script>
<body>
    <div id="div_hd">
        <div id="div_lg">
            <div id="div_logo"><a href="../index2.jsp"><img src="../resources/img/logo.png" alt=""></a></div>
            <c:choose>
                <c:when test="${!empty member}">
                    <div id="div_member">
                        <a href="../member2/profile.jsp" id="a_info"><p>${member.m_name}님</p></a><a href="../member2/logout.jsp"><p id="a_logout">Logout</p></a><br>
                        <c:choose>
                            <c:when test="${member.grade ne 9 }">
                            <p>등급 
                            <c:choose>
                               <c:when test="${member.grade eq 9}">
                                   관리자
                               </c:when>
                               <c:when test="${member.grade eq 8}">
                                      챌린저
                               </c:when>
                               <c:when test="${member.grade eq 7}">
                                   그랜드마스터
                               </c:when>
                               <c:when test="${member.grade eq 6}">
                                   마스터
                               </c:when>
                               <c:when test="${member.grade eq 5}">
                                   다이아
                               </c:when>
                               <c:when test="${member.grade eq 4}">
                                   플래티넘
                               </c:when>
                               <c:when test="${member.grade eq 3}">
                                   골드
                               </c:when>
                               <c:when test="${member.grade eq 2}">
                                   실버
                               </c:when>
                               <c:when test="${member.grade eq 1}">
                                   브론즈
                               </c:when>
                               <c:when test="${member.grade eq 0}">
                                   아이언
                               </c:when>                               
                             </c:choose></p><br>
                             <a href="../member2/profile3.jsp"><p>작성한 글 <%= cntBoard + cntBoardFile %>개</p></a><br>
                             <a href="../member2/profile4.jsp"><p>작성한 댓글 <%= cntComment %>개</p></a>
                           </c:when>
                        </c:choose>
                    </div>
                </c:when>
                <c:otherwise>
                    <form action="../member2/login_process.jsp" name="frm_login">
                        <div id="div_login">
                            <table id="tbl_login">
                                <tr>
                                    <td>ID</td>
                                    <td><input type="text" name="m_id" tabindex="1"/></td>
                                    <td rowspan="2"><input type="button" value="Login" id="btn_login" name="btn_login" style="width: 50px; height: 60px;" tabindex="3"/></td>
                                </tr>
                                <tr>
                                    <td>PW</td>
                                    <td><input type="password" style="width: 140px; height: 20px; padding-left: 5px;" name="m_pw" tabindex="2"/></td>
                                </tr>
                            </table>
                            <div id="div_join">
                                <input type="button" value="회원가입" id="btn_join" onclick="location.href='../member2/join.jsp'"/>
                            </div>
                        </div>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
        <div id="div_bn">
            <div id="div_nav" class="default">
                <div class="div_sub">
                    <a href="../news2/notice.jsp"><h3>News</h3></a>
                    <a href="../news2/notice.jsp"><h4>Notice</h4></a>
                    <a href="../news2/itNews.jsp"><h4>IT News</h4></a>
                </div>
                <div class="div_sub">
                    <a href="../learncoding2/qa.jsp"><h3>LearnCoding</h3></a>
                    <a href="../learncoding2/qa.jsp"><h4>Q&A</h4></a>
<!--                     <a href="../learncoding2/editCode.jsp"><h4>Edit Code</h4></a> -->
                    <a href="../learncoding2/preset.jsp"><h4>Preset</h4></a>
                </div>
                <div class="div_sub">
                    <a href="../ranking2/ranking.jsp"><h3>Ranking</h3></a>
                </div>
            </div>
        
        </div>
    </div>
</body>
</html>