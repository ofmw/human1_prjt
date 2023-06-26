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
        height: 500px;
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
        top: 50px;
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
        outline: none;
    }
    #tbl_info #smt_update, #tbl_info #btn_reset{
        height: 30px;
        font-size: 13px;
        font-weight: bold;
        cursor: pointer;
        padding: 0px 10px;
        float: right;
    }
    #tbl_info #smt_update{
        margin-left: 20px;
        margin-right: 35px;
    }
    #tbl_info select{
        height: 20px;
        width: 160px;
        border: 1px solid rgb(200, 200, 200);
        outline: none;
    }
    #btn_checkSelNum, #btn_cancel{
        height: 25px;
        padding: 0px 5px;
        font-size: 11px;
        font-weight: bold;
        border: none;
        cursor: pointer;
    }
    #td_cancel{
	   text-align: center;
    }
    #td_cancel input{
       margin-top: -10px;
       margin-left: 25px;
       text-decoration: underline;
       font-weight: normal;
    }
</style>
<script>
	function checkSelNum() {
		let url = "checkSelNum.jsp?selNum="+frm_update.selNum.value;
        window.open(url, "_blank", "toolbar=no, menuber=no, scrollbar=yes, resizable=no, width=500, height=180");  
    }
	function mCancel(){
		var confirmAns = confirm("정말 회원 탈퇴를 하시겠습니까??");
        if(confirmAns){
        	frm_update.method = "post";
        	frm_update.action = "cancel_process.jsp";
        	frm_update.submit();
        }
	}
</script>
<body>
    <fieldset>
        <legend>&nbsp;회원정보&nbsp;</legend>
        <form action="profile/update_process.jsp" name="frm_update">
	        <table id="tbl_info">
	            <tr>
	            	<td>아이디</td>
	            	<td>
	            	  <input type="text" value="${member.m_id}" disabled/>
	            	  <input type="hidden" name="m_id" value="${member.m_id}"/>
	            	</td>
	            </tr>
	            <tr>
	            	<td>비밀번호</td>
	            	<td>
	            	  <input type="password"  value="${member.m_pw}" style="background-color: white; cursor: pointer;"/>
	            	  <input type="hidden" name="m_pw" value="${member.m_pw}"/>
	            	</td>
	            </tr>
	            <tr>
	            	<td>이름</td>
	            	<td><input type="text" name="m_name" value="${member.m_name}" style="background-color: white; cursor: pointer;"/></td>
	            </tr>
	            <tr>
	            	<td>성별</td>
	            	<td>
	                   <c:choose>
	                       <c:when test="${member.gender eq 1}">
                                <select name="gender">
                                    <option value="1">남자</option>
                                    <option value="2">여자</option>
                                </select>
	                       </c:when>
	                       <c:when test="${member.gender eq 2}">
                                <select name="gender">
                                    <option value="1">남자</option>
                                    <option value="2" selected>여자</option>
                                </select>
	                       </c:when>
	                       <c:otherwise>
	                           <input type="text" value="관리자" disabled/>
	                       </c:otherwise>                          
	                   </c:choose>
	                </td>
	            </tr>
                <tr>
                    <td>생년월일</td>
                    <td>
                        <input type="text" name="birth" value="${member.birth}" style="background-color: white; cursor: pointer;">
                    </td>
                </tr>
                <tr>
	            	<td>전화번호</td>
	            	<td>
		            	<input type="text" name="confirm_selNum" value="${member.selNum}" disabled/>
		            	<input type="hidden" name="selNum" value="${member.selNum}">
		            	<input type="button" id="btn_checkSelNum" onclick="checkSelNum()" value="변경"/>
	            	</td>
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
	            	<td colspan="2">
		            	<input type="submit" id="smt_update" name="smt_update" value="수정완료"/>
	                    <input type="button" id="btn_reset" name="btn_reset" onclick="history.back()" value="취소하기"/>
	            	</td>
	            </tr>
	            <tr>
	            	<td colspan="2" id="td_cancel">
	            	  <input type="button" id="btn_cancel" onclick="mCancel()" value="탈퇴하기"/>
	            	</td>
	            </tr>
	        </table>
        </form>
    </fieldset>
</body>
</html>