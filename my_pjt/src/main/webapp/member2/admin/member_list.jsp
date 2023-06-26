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

    List<MemberVo> memberList = dao.selectList(map);//회원 목록
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
    
    int totalRows = dao.selectCount(map);//총 레코드 수
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
        width: 850px;
        z-index: 1;
    }
    .tbl tr, .tbl th, .tbl td{
        border: 1px solid gray;
        border-collapse: collapse;
        height: 20px;
        text-align: center;
        font-size: 12px;
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
    #tbl_search{
        width: 850px;
    }
    #tbl_search tr, tbl_search th, tbl_search td{
/*         border: 1px solid gray; */
        border-collapse: collapse;
        height: 20px;
        text-align: center;
        font-size: 13px;
    }
    input[type="checkbox"]{
        margin-top: 2px;
    }
    #div_ctrl{
        z-index: 10;
        position: fixed;
        width: 170px;
        height: 140px;
        left: 100%;
        top: 100%;
        margin-left: -200px;
        margin-top: -240px;
        box-shadow: 2px 2px 6px 4px rgba(0, 0, 0, 0.5);
        border-radius: 5px;
        text-align: center;
    }
    #ctrl_name{
        width: 160px;
        margin-left: 5px;
        height: 25px;
        line-height: 25px;
        cursor: default;
        font-weight: bold;
        color: rgba(0,0,0,0.47);
    }
    #ctrl_fn{
        width: 160px;
        margin-top: 15px;
        margin-left: 5px;
    }
    #ctrl_fn input{
        margin-bottom: 8px;
        font-size: 12px;
        font-weight: bold;
    }
    .btn_wide{
        width: 100px;
    }
    .btn_thin{
        width: 46px;
    }
</style>
<body>
    <!-- 검색 폼 -->
    <form action=""><!-- 액션에 값이 비어있을 때에는 자신의 페이지로 이동한다. -->
        <table id="tbl_search">
            <caption>회원관리</caption>
            <tr>
                <td id="td_total">
                    <c:set var="total" value="<%= totalRows %>"></c:set>
                    총 회원수 : ${total}명
                </td>
                <td id="td_search">
                    <select name="searchField" id="">
                        <option value="grade">등급</option>
                        <option value="cancel_or_not">탈퇴여부</option>
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
            <th width="">선택</th>
            <th width="">번호</th>
            <th width="">아이디</th>
            <th width="">이름</th>
            <th width="">성별</th>
            <th width="">생년월일</th>
            <th width="">전화번호</th>
            <th width="">점수</th>
            <th width="">등급</th>
            <th width="">가입일</th>
            <th width="">업데이트일</th>
            <th width="">탈퇴</th>
            <th width="">탈퇴일</th>
        </tr>

    <!-- 글목록 내용 -->
        <c:choose>
            <c:when test="${empty memberList}">
                <tr>
                	<td colspan="11">등록된 회원이 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
             <form action="admin/member_process.jsp" name="frm_list" method="post">
                <input type="hidden" name="admin_req">
                <c:forEach var="rowNum" begin="${startNum}" end="${totalRows}">
                    <c:if test="${memberList[rowNum-1].grade ne 9}">
                   
	                    <tr>
	                        <td><input type="checkbox" name="checked" value="${memberList[rowNum-1].m_idx}"/></td>
	                        <td>${memberList[rowNum-1].m_idx}</td>
	                        <td>${memberList[rowNum-1].m_id}</td>
	                        <td id="td_name">
	                            <a href="">${memberList[rowNum-1].m_name}</a>
	                        </td>
	                        <td>
	                            <c:choose>
	                                <c:when test="${memberList[rowNum-1].gender eq 1}">
	                                    남
	                                </c:when>
	                                <c:otherwise>여</c:otherwise>
	                            </c:choose>
	                        </td>
	                        <td>${memberList[rowNum-1].birth}</td>
	                        <td>${memberList[rowNum-1].selNum}</td>
                            <td>${memberList[rowNum-1].score}</td>
	                        <td>${memberList[rowNum-1].grade}</td>
	                        <td>${memberList[rowNum-1].join_date}</td>
	                        <td>${memberList[rowNum-1].update_date}</td>
	                        <td>
	                           <c:choose>
	                               <c:when test="${memberList[rowNum-1].cancel_or_not eq 1}">X</c:when>
	                               <c:otherwise>O</c:otherwise>
	                           </c:choose>
	                           
	                        </td>
	                        <td>${memberList[rowNum-1].cancel_date}</td>                        
	                    </tr>
                    </c:if>

                
                </c:forEach>
                </form>
            </c:otherwise>
        </c:choose>
<%--         <tr>
        	<td id="td_paging" colspan="11">
        	       <!-- 페이지 네비게이션 구현 -->
        	       <%@ include file="paging_member.jsp" %>
        	</td>
        </tr> --%>
    </table>
    <div id="div_ctrl">
        <div id="ctrl_name">admin remote<br><hr></div>
        <div id="ctrl_fn">
            <input type="button" class="btn_thin" value="등급 ↑" onclick="gradeUp()"/>
            <input type="button" class="btn_thin" value="등급 ↓" onclick="gradeDown()"/><br>
            <input type="button" class="btn_wide" value="탈퇴처리" onclick="cancel()"/><br>
            <input type="button" class="btn_wide" value="탈퇴취소" onclick="restoration()"/><br>
        </div>
    </div>
</body>
<script>
	function gradeUp(){
	    var checkboxes = document.querySelectorAll('input[name="checked"]:checked');
	    if (checkboxes.length == 0) {
	        alert("회원을 선택해주세요.");
	        return;
	    }	    
        frm_list.admin_req.value = 'gradeUp';
        document.frm_list.submit();	
	}
    function gradeDown(){
        var checkboxes = document.querySelectorAll('input[name="checked"]:checked');
        if (checkboxes.length == 0) {
            alert("회원을 선택해주세요.");
            return;
        }       
        frm_list.admin_req.value = 'gradeDown';
        document.frm_list.submit(); 
    }
    function cancel(){
        var checkboxes = document.querySelectorAll('input[name="checked"]:checked');
        if (checkboxes.length == 0) {
            alert("회원을 선택해주세요.");
            return;
        }       
        frm_list.admin_req.value = 'cancel';
        document.frm_list.submit(); 
    }
    function restoration(){
        var checkboxes = document.querySelectorAll('input[name="checked"]:checked');
        if (checkboxes.length == 0) {
            alert("회원을 선택해주세요.");
            return;
        }       
        frm_list.admin_req.value = 'restoration';
        document.frm_list.submit(); 
    }
</script>
</html>