<%@page import="vo.BoardFileVo"%>
<%@page import="dao.BoardFileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardVo, util.JSFunction" %>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
/*  페이지 네비게이션 관련 변수 선언
1. 총 레코드 수 : totalRows
2. 페이지당 테이블에 출력할 레코드 수 : rows_per_page
3. 페이지 네비게이션에서 블록당 페이지 수 : pages_per_block
4. 페이지 네비게이션에서 현재 페이지 번호 : pageNum
5. 테이블에 표시할 시작번호 : startNum
6. 테이블에 표시할 끝 번호 : endNum
7. 페이지 네비게이션에서 전체 페이지번호 수 : totalPageNum
8. 페이지 네비게이션에서 현재 페이지 블록 : pageBlock
9. 페이지 네비게이션에서 마지막 페이지 블록 : lastPageBlock
*/
    BoardFileDao idao = new BoardFileDao();

    Map<String, Object> map = new HashMap<String, Object>();
    String searchField = request.getParameter("searchField");
    String searchWord = request.getParameter("searchWord");

    if(searchWord != null){
        map.put("searchField", searchField);
        map.put("searchWord", searchWord);
    }

    List<BoardFileVo> iList = idao.selectIT(map);
    pageContext.setAttribute("iList", iList);
    
    int totalRows = idao.countIT(map);
    idao.close();
    int rows_per_page = 5;
    int pages_per_block = 5;
    int pageNum = 0;
	    if(request.getParameter("pageNum")==null){
	    	pageNum = 1;
	    }else{
	    	pageNum = Integer.parseInt(request.getParameter("pageNum"));
	    }
    int startNum = (pageNum - 1) * rows_per_page + 1;
    int endNum = pageNum * rows_per_page;
    int totalPageNum = (int)Math.ceil((double)totalRows / rows_per_page);
    int pageBlock = 0;
	    if(request.getParameter("pageBlock")==null){
	    	pageBlock = 1;
	    }else{
	    	pageBlock = Integer.parseInt(request.getParameter("pageBlock"));
	    }
    int lastPageBlock = (int)Math.ceil((double)totalPageNum / pages_per_block);
%>

<!-- 변수들을 EL로 사용하기 위해 core라이브러리의 set태그를 이용하여 저장하기 -->
<c:set var="totalRows" value="<%= totalRows %>"/>
<c:set var="rows_per_page" value="<%= rows_per_page %>"/>
<c:set var="pages_per_block" value="<%= pages_per_block %>"/>
<c:set var="pageNum" value="<%= pageNum %>"/>
<c:set var="startNum" value="<%= startNum %>"/>
<c:set var="endNum" value="<%= endNum %>"/>
<c:set var="totalPageNum" value="<%= totalPageNum %>"/>
<c:set var="pageBlock" value="<%= pageBlock %>"/>
<c:set var="lastPageBlock" value="<%= lastPageBlock %>"/>
<c:set var="searchField" value="<%= searchField %>"/>
<c:set var="searchWord" value="<%= searchWord %>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Preset</title>
</head>

<style>
    *{margin: 0; padding: 0; font-family: Consolas, monospace; color: black; text-decoration: none;}
    .tbl{
        width: 800px;
        border-collapse: collapse;
    }
    .tbl td{
        border-bottom: 1px solid gray;
        height: 100px;
        text-align: center;
        font-size: 13px;
        padding: 5px;
    }
    caption{
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    #td_search{
        text-align: right;
        border-bottom: 1px solid gray;
        padding-bottom: 10px;
    }
    #btn_write{
        float: right;
        margin-right: 125px;
    }
    #tbl_list{
        margin-bottom: 50px;
    }
    #tbl_list img{
        margin-left: -20px;
    }
    #tbl_search{
        width: 800px;
        margin-bottom: 10px;
    }
    #tbl_search tr, tbl_search th, tbl_search td{
        border-collapse: collapse;
        height: 20px;
        text-align: center;
        font-size: 13px;
    }
    #div_write{
        float: left;
    }
    #td_paging{
        padding-top: 30px;
    }
    #td_thumbnail{
        width: 400px;
    }
    #div_title, #div_content{
        width: 400px;
    }
    #div_content{
	    font-size: 12px;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    word-break: break-word;
	    display: -webkit-box;
	    -webkit-line-clamp: 2;
	    -webkit-box-orient: vertical;
	    line-height: 20px;
    }
    #div_title{
        font-size: 14px;
        font-weight: bold;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        line-height: 30px;
    }
</style>
<body>

    <!-- 검색 폼 -->
    <form action=""><!-- 액션에 값이 비어있을 때에는 자신의 페이지로 이동한다. -->
        <table id="tbl_search">
            <caption>IT News</caption>
            <tr>
                <td id="td_search">
				    <c:if test="${member.grade eq 9}">
				        <div id="div_write">
				            <a href="itNews2.jsp"><button type="button" id="btn_write">글 작성</button></a>
				        </div>
				    </c:if>
                    <select name="searchField" id="">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="searchWord" id="searchWord">
                    <input type="submit" id="search_btn" value="검색">
                </td>
            </tr>
        </table>

    </form>

    <table id="tbl_list" class="tbl">
        <c:choose>
            <c:when test="${empty iList}">
                <tr>
                	<td colspan="6">등록된 게시물이 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
	            <c:forEach var="rowNum" begin="${startNum}" end="${endNum}">
	              <c:if test="${iList[rowNum-1].title ne null}">
	                <tr>
	                    <td style="width: 150px;">
	                        <a href="itNews3.jsp?no=${iList[rowNum-1].b_idx}">
	                            <img src="../uploads/${iList[rowNum-1].saveFile}" width="120px" height="70px">
	                        </a>
	                    </td>
	                    <td id="td_thumbnail" style="text-align: left">
	                        <div id="div_title">
	                            <a href="itNews3.jsp?no=${iList[rowNum-1].b_idx}">${iList[rowNum-1].title}</a>
	                        </div>
	                        <div id="div_content">
	                            <a href="itNews3.jsp?no=${iList[rowNum-1].b_idx}">${iList[rowNum-1].content}</a>
	                        </div>                        </td>
	                    <td>${iList[rowNum-1].m_name}</td>
	                    <td>${iList[rowNum-1].post_date}</td>
	                </tr>
	                </c:if>                
	            </c:forEach>
            </c:otherwise>
        </c:choose>
        <tr>
        	<td id="td_paging" colspan="6" style="height: 20px; border: none;">
        	       <!-- 페이지 네비게이션 구현 -->
        	       <%@ include file="paging.jsp" %>
        	</td>
        </tr>
    </table>
    
</body>
</html>