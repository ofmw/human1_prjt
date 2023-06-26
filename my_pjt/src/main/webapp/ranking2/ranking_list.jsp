<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.MemberVo, dao.MemberDao, util.JSFunction" %>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
//Dao객체를 생성
    MemberDao dao = new MemberDao();

//사용자가 입력한 검색 조건을 Map에 저장
    Map<String, Object> map = new HashMap<String, Object>();
    String searchField = request.getParameter("searchField");
    String searchWord = request.getParameter("searchWord");

    if(searchWord != null){
        map.put("searchField", searchField);
        map.put("searchWord", searchWord);
    }

    List<MemberVo> memberList = dao.rankingList(map);//회원 목록
    pageContext.setAttribute("memberList", memberList);
    
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
    
    int totalRows = dao.rankingCount(map);//총 레코드 수
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
    
    MemberVo mVo = new MemberVo();
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
<title>회원관리</title>
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
        margin-bottom: 20px;
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
</style>
<body>
    <!-- 검색 폼 -->
    <form action=""><!-- 액션에 값이 비어있을 때에는 자신의 페이지로 이동한다. -->
        <table id="tbl_search" class="tbl">
            <caption>Ranking</caption>
<%--             <tr>
                <td id="td_total">
                    <c:set var="total" value="<%= totalRows %>"></c:set>
                    총 회원수 : ${total}명
                </td>
                <td id="td_search">
                    <select name="searchField" id="">
                        <option value="m_name">이름</option>
                    </select>
                    <input type="text" name="searchWord" id="searchWord">
                    <input type="submit" id="search_btn" value="검색">
                </td>
            </tr> --%>
        </table>

     </form>

    <!-- 글 목록 테이블 -->
    <table id="tbl_list" class="tbl">
        <tr>
            <th width="">순위</th>
            <th width="">아이디</th>
            <th width="">이름</th>
            <th width="">등급</th>
            <th width="">점수</th>
        </tr>

    <!-- 글목록 내용 -->
        <c:choose>
            <c:when test="${empty memberList}">
                <tr>
                	<td colspan="11">등록된 회원이 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="rowNum" begin="${startNum}" end="${totalRows}">
                    <tr>
                        <td>${rowNum}</td>
                        <td>${memberList[rowNum-1].m_id}</td>
                        <td id="td_name">
                            <a href="">${memberList[rowNum-1].m_name}</a>
                        </td>
                        <td>
                            <c:choose>
	                           <c:when test="${memberList[rowNum-1].grade eq 9}">
	                               관리자
	                           </c:when>
	                           <c:when test="${memberList[rowNum-1].grade eq 8}">
	                               챌린저
	                           </c:when>
	                           <c:when test="${memberList[rowNum-1].grade eq 7}">
	                               그랜드마스터
	                           </c:when>
	                           <c:when test="${memberList[rowNum-1].grade eq 6}">
	                               마스터
	                           </c:when>
	                           <c:when test="${memberList[rowNum-1].grade eq 5}">
	                               다이아
	                           </c:when>
	                           <c:when test="${memberList[rowNum-1].grade eq 4}">
	                               플래티넘
	                           </c:when>
	                           <c:when test="${memberList[rowNum-1].grade eq 3}">
	                               골드
	                           </c:when>
	                           <c:when test="${memberList[rowNum-1].grade eq 2}">
	                               실버
	                           </c:when>
	                           <c:when test="${memberList[rowNum-1].grade eq 1}">
	                               브론즈
	                           </c:when>
	                           <c:when test="${memberList[rowNum-1].grade eq 0}">
	                               아이언
	                           </c:when>  
                            </c:choose>
                        </td>  
                        <td>${memberList[rowNum-1].score}</td>
                    </tr>
                
                </c:forEach>

            </c:otherwise>
        </c:choose>
<%--         <tr>
        	<td id="td_paging" colspan="11">
        	       <!-- 페이지 네비게이션 구현 -->
        	       <%@ include file="paging_member.jsp" %>
        	</td>
        </tr> --%>
    </table>

</body>
</html>