<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view_prodile</title>
</head>

<style>
    fieldset{
        height: 450px;
        margin: 50px 300px;
        border-radius: 7px;
    }
    fieldset *{font-family: Consolas, monospace; color: black; text-decoration: none;}
    legend{
        text-align: center;
        font-weight: bold;
    }
    #tbl_info{
        position: absolute;
        top: 90px;
        left: 500px;
    }
    #tbl_info td{
        font-size: 13px;
        font-weight: bold;
        padding: 10px;
    }
    #tbl_info input[type="text"], #tbl_info input[type="password"]{
        height: 20px;
        padding-left: 5px;
        border: 1px solid rgb(200, 200, 200);
        background-color: rgb(225, 225, 225);
    }
    #tbl_info #btn_edit{
        height: 30px;
        margin-left: 100px;
        font-size: 13px;
        font-weight: bold;
        cursor: pointer;
        padding: 0px 10px;
    }
</style>
<body>
    <fieldset>
        <legend>&nbsp;회원정보&nbsp;</legend>
        <table id="tbl_info">
            <tr>
            	<td>아이디</td>
            	<td><input type="text" value="${member.m_id}" disabled/></td>
            </tr>
            <tr>
            	<td>비밀번호</td>
            	<td><input type="password" value="${member.m_pw}" disabled/></td>
            </tr>
            <tr>
            	<td>이름</td>
            	<td><input type="text" value="${member.m_name}" disabled/></td>
            </tr>
            <tr>
            	<td>성별</td>
            	<td>
                   <c:choose>
                       <c:when test="${member.gender eq 1}">
                            <input type="text" value="남자" disabled/>
                       </c:when>
                       <c:when test="${member.gender eq 2}">
                           <input type="text" value="여자" disabled/>
                       </c:when>
                       <c:otherwise>
                           <input type="text" value="관리자" disabled/>
                       </c:otherwise>                          
                   </c:choose>
                </td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><input type="text" value="${member.birth}" disabled/></td>
            </tr>            <tr>
            	<td>전화번호</td>
            	<td><input type="text" value="${member.selNum}" disabled/></td>
            </tr>
            <tr>
            	<td>등급</td>
            	<td>
	   	           <c:choose>
	                   <c:when test="${member.grade eq 9}">
                            <input type="text" value="관리자" disabled/>
	                   </c:when>
	                   <c:when test="${member.grade eq 8}">
	                       <input type="text" value="챌린저" disabled/>
	                   </c:when>
	                   <c:when test="${member.grade eq 7}">
                           <input type="text" value="그랜드마스터" disabled/>
	                   </c:when>
	                   <c:when test="${member.grade eq 6}">
                           <input type="text" value="마스터" disabled/>
	                   </c:when>
	                   <c:when test="${member.grade eq 5}">
                           <input type="text" value="다이아" disabled/>
	                   </c:when>
	                   <c:when test="${member.grade eq 4}">
                           <input type="text" value="플래티넘" disabled/>
	                   </c:when>
	                   <c:when test="${member.grade eq 3}">
                           <input type="text" value="골드" disabled/>
	                   </c:when>
	                   <c:when test="${member.grade eq 2}">
                           <input type="text" value="실버" disabled/>
	                   </c:when>
	                   <c:when test="${member.grade eq 1}">
                           <input type="text" value="브론즈" disabled/>
	                   </c:when>
	                   <c:when test="${member.grade eq 0}">
                           <input type="text" value="아이언" disabled/>
	                   </c:when>                               
	               </c:choose>
            	</td>
            </tr>
            <tr>
            	<td>가입일</td>
            	<td><input type="text" value="${member.join_date}" disabled/></td>
            </tr>
            <tr>
            	<td colspan="2"><a href="profile2.jsp"><input type="button" id="btn_edit" name="btn_edit" value="회원정보 수정"/></a></td>
            </tr>
        </table>
    </fieldset>
</body>
</html>