<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardVo, dao.BoardDao, util.JSFunction" %>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
//Dao객체를 생성
    BoardDao dao = new BoardDao();

//사용자가 입력한 검색 조건을 Map에 저장
    Map<String, Object> map = new HashMap<String, Object>();
    String searchField = request.getParameter("searchField");
    String searchWord = request.getParameter("searchWord");

    if(searchWord != null){
        map.put("searchField", searchField);
        map.put("searchWord", searchWord);
    }

    List<BoardVo> boardList = dao.selectAll(map);//게시물 목록
    pageContext.setAttribute("boardList", boardList);
    
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
    
    int totalRows = dao.countAll(map);//총 레코드 수
    dao.close();
    int rows_per_page = 0;
	    if(request.getParameter("rows_per_page")==null){
	    	rows_per_page = 15;
	    }else{
	    	rows_per_page = Integer.parseInt(request.getParameter("rows_per_page"));
	    }
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
<title>게시판관리</title>
</head>
<style>
    *{margin: 0; padding: 0; font-family: Consolas, monospace; color: black; text-decoration: none;}
    .tbl{
        width: 800px;
    }
    .tbl tr, .tbl th, .tbl td{
        border: 1px solid gray;
        border-collapse: collapse;
        height: 20px;
        text-align: center;
        font-size: 13px;
    }
    caption{
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 10px;
    }
    #td_total{
        text-align: left;
    }
    #td_search{
        text-align: right;
    }
    #btn_write{
        float: right;
        margin-right: 125px;
    }
    #tbl_search{
        width: 800px;
    }
    #tbl_search tr, tbl_search th, tbl_search td{
/*         border: 1px solid gray; */
        border-collapse: collapse;
        height: 20px;
        text-align: center;
        font-size: 13px;
    }
</style>
<body>
    <!-- 검색 폼 -->
    <form action=""><!-- 액션에 값이 비어있을 때에는 자신의 페이지로 이동한다. -->
        <table id="tbl_search">
            <caption>게시판 관리</caption>
            <tr>
                <td id="td_total">
                    <c:set var="total" value="<%= totalRows %>"></c:set>
                    총 게시물 : ${total}개
                </td>
                <td id="td_search">
                    <select name="searchField" id="">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                        <option value="writer">작성자</option>
                    </select>
                    <input type="text" name="searchWord" id="searchWord">
                    <input type="submit" id="search_btn" value="검색">
                </td>
            </tr>
        </table>

     </form>

    <!-- 글 목록 테이블 -->
    <table id="tbl_list" class="tbl">
        <tr>
            <th width="">게시판</th>
            <th width="">글 번호</th>
            <th width="">제목</th>
            <th width="">작성자</th>
            <th width="">조회수</th>
            <th width="">등록일</th>
        </tr>

    <!-- 글목록 내용 -->
        <c:choose>
            <c:when test="${empty boardList}">
                <tr>
                	<td colspan="5">등록된 게시물이 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="rowNum" begin="${startNum}" end="${endNum}">
                    <tr>
                        <td>
                            <c:choose>
                                <c:when test="${boardList[rowNum-1].table_name eq 'rc_b_qa'}">
                                    QA
                                </c:when>
                                <c:when test="${boardList[rowNum-1].table_name eq 'rc_b_ps'}">
                                    Preset
                                </c:when>
                            </c:choose>
                        </td>
                        <td>${boardList[rowNum-1].b_idx}</td>
                        <c:choose>
                            <c:when test="${boardList[rowNum-1].table_name eq 'rc_b_qa'}">
		                        <td id="td_title">
		                            <a href="admin3_qa.jsp?no=${boardList[rowNum-1].b_idx}">${boardList[rowNum-1].title}</a>
		                        </td>
                            </c:when>
                            <c:otherwise>
                                <td id="td_title">
                                    <a href="admin3_ps.jsp?no=${boardList[rowNum-1].b_idx}">${boardList[rowNum-1].title}</a>
                                </td>
                            </c:otherwise>
                        </c:choose>
                        <td>${boardList[rowNum-1].m_name}</td>
                        <td>${boardList[rowNum-1].read_count}</td>
                        <td>${boardList[rowNum-1].post_date}</td>
                    </tr>
                
                </c:forEach>

            </c:otherwise>
        </c:choose>
        <tr>
        	<td id="td_paging" colspan="6">
        	       <!-- 페이지 네비게이션 구현 -->
        	       <%@ include file="paging_board.jsp" %>
        	</td>
        </tr>
    </table>
</body>
</html>