<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지네비게이션</title>
</head>
<body>

    <!-- 검색어가 있는 경우와 없는 경우를 구분해서 페이징 처리함 -->
    <c:choose>
    	<c:when test="${!empty searchWord}"><!-- 검색어가 있는 경우 -->
    		    	<c:if test="${pageNav.pageNum > pageNav.pages_per_block}">
    		<a href="list.do?pageNum=1&pageBlock=1&searchField=${searchField}&searchWord=${searchWord}">&lt;&lt;</a>&nbsp;
    		<a href="list.do?pageNum=${(pageNav.pageBlock - 2)*pageNav.pages_per_block + 1}&pageBlock=${pageNav.pageBlock-1}&searchField=${searchField}&searchWord=${searchWord}">
    			&lt;이전페이지
    		</a>   	
    	</c:if>
    	
    	<c:forEach var="i" begin="${(pageNav.pageBlock-1)*pageNav.pages_per_block + 1}" end="${pageNav.pageBlock*pageNav.pages_per_block}">
    		<c:if test="${i le pageNav.totalPageNum}">
    			<c:choose>
    				<c:when test = "${pageNav.pageNum eq i}">
    					<a href="list.do?pageNum=${i}&pageBlock=${pageNav.pageBlock}&searchField=${searchField}&searchWord=${searchWord}">
    						<span style="color:red">${i}&nbsp;</span>
    					</a>
    				</c:when>
    				<c:otherwise>
    					<a href="list.do?pageNum=${i}&pageBlock=${pageNav.pageBlock}&searchField=${searchField}&searchWord=${searchWord}">${i}&nbsp;</a>
    				</c:otherwise>
   			</c:choose>
    		</c:if>
    	</c:forEach>
    
    	<c:if test="${((pageNav.rows_per_page*pageNav.pages_per_block) lt pageNav.totalRows) and (pageNav.pageBlock ne pageNav.lastPageBlock) }">
    		<a href="list.do?pageNum=${pageNav.pageBlock*pageNav.pages_per_block+1}&pageBlock=${pageNav.pageBlock+1}&searchField=${searchField}&searchWord=${searchWord}">다음페이지&gt;</a>&nbsp;
    		<a href="list.do?pageNum=${pageNav.totalPageNum}&pageBlock=${pageNav.lastPageBlock}&searchField=${searchField}&searchWord=${searchWord}">&gt;&gt;</a>
    	</c:if>
    	</c:when>
    	
    	<c:otherwise><!-- 검색어가 없는 경우 -->
    		<c:if test="${pageNav.pageNum > pageNav.pages_per_block}">
    		<a href="list.do?pageNum=1&pageBlock=1">&lt;&lt;</a>&nbsp;
    		<a href="list.do?pageNum=${(pageNav.pageBlock - 2)*pageNav.pages_per_block + 1}&pageBlock=${pageNav.pageBlock-1}">
    			&lt;이전페이지
    		</a>   	
    	</c:if>
    	
    	<c:forEach var="i" begin="${(pageNav.pageBlock-1)*pageNav.pages_per_block + 1}" end="${pageNav.pageBlock*pageNav.pages_per_block}">
    		<c:if test="${i le pageNav.totalPageNum}">
    			<c:choose>
    				<c:when test = "${pageNav.pageNum eq i}">
    					<a href="list.do?pageNum=${i}&pageBlock=${pageNav.pageBlock}">
    						<span style="color:red">${i}&nbsp;</span>
    					</a>
    				</c:when>
    				<c:otherwise>
    					<a href="list.do?pageNum=${i}&pageBlock=${pageNav.pageBlock}">${i}&nbsp;</a>
    				</c:otherwise>
   			</c:choose>
    		</c:if>
    	</c:forEach>
    
    	<c:if test="${((pageNav.rows_per_page*pageNav.pages_per_block) lt pageNav.totalRows) and (pageNav.pageBlock ne pageNav.lastPageBlock) }">
    		<a href="list.do?pageNum=${pageNav.pageBlock*pageNav.pages_per_block+1}&pageBlock=${pageNav.pageBlock+1}">다음페이지&gt;</a>&nbsp;
    		<a href="list.do?pageNum=${pageNav.totalPageNum}&pageBlock=${pageNav.lastPageBlock}">&gt;&gt;</a>
    	</c:if>
    	</c:otherwise>
    </c:choose>



</body>
</html>