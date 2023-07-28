<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member</title>
<style>
    #div_left, #div_right{
        float: left;
        height: 100%;
    }
    #div_left{
        width: 300px;
    }
    #div_left *{
        margin-left: 15px;
        margin-top: 5px;
    }
    #div_left table{
        border-collapse: collapse;
        width: 250px;
    }
    #div_left td{
        border: 1px solid lightgray;
    }
    #div_left tr:nth-child(odd) td{
	    height: 27px;
	    font-size: 14px;
	    line-height: 14px;
	    font-weight: bold;
	    padding-left: 5px;
    }
    #div_left tr:nth-child(even) td{
        background-color: white;
        font-size: 13px;
        line-height: 25px;
        padding: 5px 0px;
    }
    #div_left input{
        float: left;
    }
    #div_left label{
        float: left;
        height: 20px;
        margin-top: -2px;
        user-select: none;
    }
    #div_right{
        position: relative;
        border: 1px solid lightgray;
        margin-top: 37px;
        background-color: white;
        overflow-y: scroll;
        width: 500px;
        height: 500px;
    }
    #div_right table{      
        position: absolute;
        border-collapse: collapse;
        width: 100%;
        table-layout: fixed;
    }   
    #div_right td{
        border: 1px solid lightgray;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        height: 20px;
        line-height: 20px;
        font-size: 12px;
        text-align: center;
    }
    #div_right tr:first-child td{
	    background-color: #f5f5f5;
	    padding: 0px 10px;
    }
    #div_right tr td:nth-child(1){
        background-color: #f5f5f5;
        width: 25px;
        padding: 0;
    }
    #div_right button, #div_right img{
        width: 15px;
        height: 15px;
    }
    #div_right button{
        margin-top: 5px;
    }
    #div_shadow{
        position: absolute;
        width: 100%;
        height: 100%;
        background-color: rgba(50, 50, 50, 0.3);
        display: none;
    }
    #div_member_edit{
        position: absolute;
        width: 500px;
        height: 400px;
        background-color: white;
        left: 50%;
        margin-left: -310px;
        top: 50%;
        margin-top: -300px;
    }
    #div_member_edit p{
        font-size: 13px;
        line-height: 35px;      
        background-color: rgb(240, 240, 240);
        padding-left: 15px;
        font-weight: bold;
        border-bottom: 1px solid lightgray;
        
    }
    #tbl_contents_edit{
        margin: 10px 0px;
    }    
    #tbl_contents_edit th, #tbl_contents_edit td{
/*         border: 1px solid lightgray; */
        height: 32px;
        white-space: nowrap;
        font-size: 12px;
    }
    #tbl_contents_edit th{
        width: 80px;
        padding-right: 10px;
        text-align: right;
    }
    #tbl_contents_edit td{
        width: 150px;
    }
    #tbl_contents_edit input[type="text"]{
        width: 150px;
        height: 25px;
        border: 1px solid lightgray;
        border-radius: 0px;
    }
    #tbl_contents_edit tr:nth-child(n+4):nth-child(-n+6) td:nth-child(3) input[type="text"]{
	   width: 220px;
	   margin-left: 2px;
    }
    #tbl_contents_edit tr th:nth-child(3) {
	   width: 60px;
    }
    #tbl_contents_edit tr:last-child td{
	   text-align: right;
	   padding-top: 6px;
    }
    #btn_edit, #btn_cancel{
       width: 80px;
       height: 27px;
       margin-left: 5px;
       font-size: 11px;
       font-weight: bold;
       border: 1px solid lightgray;
       border-radius: 3px;
       cursor: pointer;
    }
    #btn_edit{
       background-color: rgb(52, 152, 219);
       color: white;
    }
    #btn_edit:hover {
	   background-color: rgb(42, 142, 209);
    }
    #btn_cancel:hover {
	   background-color: rgb(230, 230, 230);
    }    
</style>
</head>
<body>
    <div id="div_left">
        <h3>회원관리</h3>
        <table>
            <tr>
                <td>상태</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" id="checkbox1_1"><label for="checkbox1_1">활성</label><br>
                    <input type="checkbox" id="checkbox1_2"><label for="checkbox1_2">휴면</label><br>
                    <input type="checkbox" id="checkbox1_3"><label for="checkbox1_3">탈퇴</label><br>
                </td>
            </tr>
            <tr>
                <td>등급</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" id="checkbox2_1"><label for="checkbox2_1">브론즈</label><br>
                    <input type="checkbox" id="checkbox2_2"><label for="checkbox2_2">실버</label><br>
                    <input type="checkbox" id="checkbox2_3"><label for="checkbox2_3">골드</label><br>
                </td>
            </tr>
            <tr>
                <td>성별</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" id="checkbox3_1"><label for="checkbox3_1">남자</label><br>
                    <input type="checkbox" id="checkbox3_2"><label for="checkbox3_2">여자</label><br>
                </td>
            </tr>
        </table>
    </div>
    <div id="div_right">
        <table id="tbl_contents">
            <tr>
                <td></td>
                <td>아이디</td>
                <td>등급</td>
                <td>이름</td>
                <td>생년월일</td>
                <td>성별</td>
                <td>전화번호</td>
                <td>가입일</td>
                <td>수정일</td>
                <td>전환일</td>
                <td>활성여부</td>
                <td>최근접속일</td>
                <td>플랫폼</td>
                
            </tr>
            <c:forEach items="${memberList}" var="member">
                <tr>
                    <td>
                        <button class="display">
                            <img alt="" src="">
                        </button>
                    </td>                    
	                <td>${member.m_id}</td>
                    <td>${member.grade}</td>
                    <td>${member.m_name}</td>
                    <td>${member.birth}</td>
                    <td>${member.gender}</td>
                    <td>${member.selNum}</td>
                    <td>${member.j_date}</td>
                    <td>${member.u_date}</td>
                    <td>${member.a_date}</td>
                    <td>${member.a_state}</td>
                    <td>${member.login_date}</td>
                    <td></td>
	            </tr>
            </c:forEach>            
        </table>
    </div>
    <div id="div_shadow">
	    <div id="div_member_edit">
	    <p>고객정보</p>
	       <form action="" name="frm_edit">
		       <table id="tbl_contents_edit">
		           <tr>
			           <th>이름</th>
			           <td><input type="text" /></td>
			           <th>아이디</th>
			           <td><input type="text" /></td>
		           </tr>
		           <tr>
			           <th>전화번호</th>
			           <td><input type="text" /></td>
			           <th>등급</th>
			           <td><input type="text" /></td>
		           </tr>
		           <tr>
			           <th>생년월일</th>
			           <td><input type="text" /></td>
			           <th>성별</th>
			           <td><input type="text" /></td>
		           </tr>
		           <tr>
			           <th>주소지1</th>
			           <td><input type="text" /></td>	           	
			           <td colspan="2"><input type="text"/></td>
		           </tr>
		           <tr>
			           <th>주소지2</th>
			           <td><input type="text" /></td>
			           <td colspan="2"><input type="text" /></td>
		           </tr>
		           <tr>
			           <th>주소지3</th>
			           <td><input type="text" /></td>
			           <td colspan="2"><input type="text" /></td>
		           </tr>
		           <tr>
			           <th>가입일</th>
			           <td><input type="text" /></td>
			           <th>수정일</th>
			           <td><input type="text" /></td>
		           </tr>
		           <tr>
			           <th>최근접속일</th>
			           <td><input type="text" /></td>
			           <th>플랫폼</th>
			           <td><input type="text" /></td>
		           </tr>
		           <tr>
			           <th>전환일</th>
			           <td><input type="text" /></td>
			           <th>활성여부</th>
			           <td><input type="text" /></td>
		           </tr>
		           <tr>                
		               <td colspan="2"></td>
		               <td colspan="2">
		                   <input id="btn_edit" type="button" value="수정" />
			               <input id="btn_cancel" type="button" value="취소"/>
		               </td>
	               </tr>
		       </table>
	       </form>
	    </div>
    </div>
</body>
</html>