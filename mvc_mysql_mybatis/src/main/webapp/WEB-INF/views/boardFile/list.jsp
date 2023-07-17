<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>

<link rel="stylesheet" href="../resources/css/list_jsp.css" >

<style>
	#td_paging{
		height: 70px;
		font: 9px Arial, Sans-serif;
		text-align: center;
		border-color: white;
	}

</style>

</head>
<body>
    <header>
        <jsp:include page="../main/header.jsp"/>
    </header>

    <!-- 검색 폼 -->
    <form>
        <table id="tbl_search">
            <caption>글목록</caption>
            <tr>
                <td id="td_total">
                	총게시물: ${pageNav.totalRows}
                </td>
                <td id="td_search">
                    <select name="searchField">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="searchWord" id="searchWord">
                    <input type="submit" id="search_btn" value="검색">

                </td>
            </tr>
        </table>
    </form>


    <!-- 글목록 테이블 -->
    <table id="tbl_list">
        <tr>
            <th width="">번호</th>
            <th width="">제목</th>
            <th width="">작성자</th>
            <th width="">조회수</th>
            <th width="">등록일</th>
            <th width="">첨부</th>
        </tr>

        <!-- 글목록 내용-->
		<c:choose>
			<c:when test="${empty boardList}">
				<tr>
					<td colspan="6"> 등록된 게시물이 없습니다. </td>
				</tr>
			</c:when>
			<c:otherwise>
			
				<c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
					<tr>
						<td>${rowNum}</td>
						<td id="td_title">
							<a href="view.do?no=${boardList[rowNum-1].board_idx}">${boardList[rowNum-1].title}</a>
						</td>
						<td>${boardList[rowNum-1].member_name}</td>
						<td>${boardList[rowNum-1].read_count}</td>
						<td>
						  <fmt:formatDate value="${boardList[rowNum-1].post_date}" type="date" pattern="yyyy/MM/dd"/>
						</td>
						<td style="padding-left:20px">
							<c:if test="${!empty boardList[rowNum-1].originFile}">
								<a href="download.do?oName=${boardList[rowNum-1].originFile}&sName=${boardList[rowNum-1].saveFile}">
									<img src="../resources/img/download.png" width="15px" height="17px">
								</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				
			</c:otherwise>
		</c:choose>
		<tr>
			<td id="td_paging" colspan="6">
				<!-- 페이지 네비게이션 구현 -->
				<%@ include file="paging.jsp" %>
			</td>
		</tr>
    </table>
 	
	<!-- 목록 하단에 글등록 버튼 구현 -->
	<c:if test="${!empty member}">
		<div id="div_write">
			<a href="write.do"><button id="write_btn">글등록</button></a>
		</div>
	
	</c:if>

    <footer>
        <jsp:include page="../main/footer.jsp"/>
    </footer>
</body>
</html>