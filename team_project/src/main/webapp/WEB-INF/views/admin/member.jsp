<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    #div_right tr td:nth-child(3), #div_right tr td:nth-child(4), #div_right tr td:nth-child(6), #div_right tr td:last-child{
        width: 35px;
    }
    #div_right tr td:nth-child(5), #div_right tr td:nth-child(12){
        width: 45px;
    }
    #div_right button, #div_right img{
        width: 15px;
        height: 15px;
    }
    #div_right button{
        margin-top: 5px;
    }
    #div_shadow_info{
        position: absolute;
        width: 100%;
        height: 100%;
        background-color: rgba(50, 50, 50, 0.3);
        display: none;
    }
    #div_member_info{
        position: absolute;
        width: 500px;
        height: 400px;
        background-color: white;
        left: 50%;
        margin-left: -310px;
        top: 50%;
        margin-top: -300px;
    }
    #div_member_info p{
        font-size: 13px;
        line-height: 35px;      
        background-color: rgb(240, 240, 240);
        padding-left: 15px;
        font-weight: bold;
        border-bottom: 1px solid lightgray;
        
    }
    #tbl_contents_info{
        margin: 10px 0px;
    }    
    #tbl_contents_info th, #tbl_contents_info td{
/*         border: 1px solid lightgray; */
        height: 32px;
        white-space: nowrap;
        font-size: 12px;
    }
    #tbl_contents_info th{
        width: 80px;
        padding-right: 10px;
        text-align: right;
    }
    #tbl_contents_info td{
        width: 150px;
    }
    #tbl_contents_info input[type="text"]{
        width: 150px;
        height: 25px;
        border: 1px solid lightgray;
        border-radius: 0px;
        font-size: 12px;
        padding-left: 5px;      
        color: black;  
    }
    #tbl_contents_info tr:nth-child(n+4):nth-child(-n+6) td:nth-child(3) input[type="text"]{
	   width: 220px;
	   margin-left: 2px;
    }
    #tbl_contents_info tr th:nth-child(3) {
	   width: 60px;
    }
    #tbl_contents_info tr:last-child td{
	   text-align: right;
	   padding-top: 6px;
    }
    #btn_info, #btn_cancel{
       width: 80px;
       height: 27px;
       margin-left: 5px;
       font-size: 11px;
       font-weight: bold;
       border: 1px solid lightgray;
       border-radius: 3px;
       cursor: pointer;
    }
    #btn_info{
       background-color: rgb(52, 152, 219);
       color: white;
    }
    #btn_info:hover {
	   background-color: rgb(42, 142, 209);
    }
    #btn_cancel:hover {
	   background-color: rgb(230, 230, 230);
    }    
    #td_btns input[type="button"]{
       width: 80px;
       height: 27px;
       margin-left: 5px;
       font-size: 11px;
       font-weight: bold;
       border: 1px solid lightgray;
       border-radius: 3px;
       cursor: pointer;
       float: right;
       margin-right: 10px;
       margin-bottom: 5px;
    }
    #td_btns input:first-child {
       margin-left: 59px !important;
    }
    #td_btns{
        padding-left: 0 !important;
    }
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	let divShadowInfo = document.getElementById("div_shadow_info");
	let memberInfoBtns = document.querySelectorAll(".btn_memberInfo");
	
	memberInfoBtns.forEach(function(btn){
		btn.addEventListener("click", function(){
			divShadowInfo.style.display = "block";
			
			// 클릭된 버튼의 id를 가져옵니다.
            let memberId = $(this).attr("id");                    

            // 해당 id를 가진 상품 행(tr)을 선택합니다.
            let memberRow = $("#tbl_contents tr").filter(function() {
                return $(this).find("td:nth-child(2)").text() === memberId;
            });
            
            $("#name_info").val(memberRow.find("td:nth-child(4)").text().trim());
            $("#m_id_info").val(memberId);
            $("#selNum_info").val(memberRow.find("td:nth-child(7)").text().trim());
            $("#grade_info").val(memberRow.find("td:nth-child(3)").text().trim());
            $("#birth_info").val(memberRow.find("td:nth-child(5)").text().trim());                
            $("#gender_info").val(memberRow.find("td:nth-child(6)").text().trim());
            $("#j_date_info").val(memberRow.find("td:nth-child(9)").text().trim());
            $("#e_date_info").val(memberRow.find("td:nth-child(10)").text().trim());
            $("#platForm_info").val(memberRow.find("td:nth-child(13)").text().trim());
            $("#a_date_info").val(memberRow.find("td:nth-child(11)").text().trim());
            $("#a_state_info").val(memberRow.find("td:nth-child(12)").text().trim());
            $("#login_date_info").val(memberRow.find("td:nth-child(8)").text().trim());
            
        });
	});
	
	let cancelBtn = document.getElementById("btn_cancel");
	
	cancelBtn.addEventListener("click", function(){
		divShadowInfo.style.display = "none";
		frm_info.reset();
	});
	
	$("#btn_reset").click(function(){
        
        $("input[type='checkbox']").prop("checked", false);
        $("#tbl_contents tr").show();
        
    });
	
	let stateMap = {"1": "활성", "2": "휴면"};
	let gradeMap = {"1": "브론즈", "2": "실버", "3": "골드"};
	let genderMap = {"1": "남자", "2": "여자"};
    
    $("#btn_filter").click(function () {
        let selectedStates = [];
        let selectedGrades = [];
        let selectedGenders = [];

        $(".checkbox_state:checked").each(function () {
            let stateId = $(this).attr("id").replace("checkbox1_", "");
            selectedStates.push(stateMap[stateId]);
        });

        $(".checkbox_grade:checked").each(function () {
            let gradeId = $(this).attr("id").replace("checkbox2_", "");
            selectedGrades.push(gradeMap[gradeId]);
        });
        
        $(".checkbox_gender:checked").each(function () {
            let genderId = $(this).attr("id").replace("checkbox3_", "");
            selectedGenders.push(genderMap[genderId]);
        });
        
        applyFilter(selectedStates, selectedGrades, selectedGenders);
    });
	
    function applyFilter(selectedStates, selectedGrades, selectedGenders) {
        $("#tbl_contents tr:not(:first-child)").each(function () {
            let state = $(this).find("td:nth-child(12)").text();
            let grade = $(this).find("td:nth-child(3)").text();
            let gender = $(this).find("td:nth-child(6)").text();
            let showState = selectedStates.length === 0 || selectedStates.includes(state.trim());
            let showGrade = selectedGrades.length === 0 || selectedGrades.includes(grade.trim());
            let showGender = selectedGenders.length === 0 || selectedGenders.includes(gender.trim());
            if (showState && showGrade && showGender) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    }
    
});
</script>
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
                    <input type="checkbox" id="checkbox1_1" class="checkbox_state"><label for="checkbox1_1">활성</label><br>
                    <input type="checkbox" id="checkbox1_2" class="checkbox_state"><label for="checkbox1_2">휴면</label><br>
                </td>
            </tr>
            <tr>
                <td>등급</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" id="checkbox2_1" class="checkbox_grade"><label for="checkbox2_1">브론즈</label><br>
                    <input type="checkbox" id="checkbox2_2" class="checkbox_grade"><label for="checkbox2_2">실버</label><br>
                    <input type="checkbox" id="checkbox2_3" class="checkbox_grade"><label for="checkbox2_3">골드</label><br>
                </td>
            </tr>
            <tr>
                <td>성별</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" id="checkbox3_1" class="checkbox_gender"><label for="checkbox3_1">남자</label><br>
                    <input type="checkbox" id="checkbox3_2" class="checkbox_gender"><label for="checkbox3_2">여자</label><br>
                </td>
            </tr>
            <tr>
                <td id="td_btns">    
                    <input id="btn_reset" type="button" value="초기화"/>               
                   <input id="btn_filter" type="button" value="선택완료"/>                   
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
                <td>최근접속일</td>
                <td>가입일</td>
                <td>수정일</td>
                <td>전환일</td>
                <td>활성여부</td>                
                <td>플랫폼</td>                
            </tr>
            <c:forEach items="${memberList}" var="member">
                <tr>
                    <td>
                        <button class="btn_memberInfo" id="${member.m_id}">
                            <img alt="" src="">
                        </button>
                    </td>                    
	                <td>${member.m_id}</td>
                    <td>
                        <c:choose>
                            <c:when test="${member.grade eq 0}">
                                브론즈
                            </c:when>
                            <c:when test="${member.grade eq 1}">
                                실버
                            </c:when>
                            <c:when test="${member.grade eq 2}">
                                골드
                            </c:when>
                        </c:choose>                    
                    </td>
                    <td>${member.m_name}</td>
                    <td>${member.birth}</td>
                    <td>
                        <c:choose>
                            <c:when test="${member.gender eq 1 or member.gender eq 3}">
                                남자
                            </c:when>
                            <c:when test="${member.gender eq 2 or member.gender eq 4}">
                                여자
                            </c:when>
                        </c:choose> 
                    </td>
                    <td>${member.selNum}</td>
                    <td><fmt:formatDate value="${member.login_date}" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${member.j_date}" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${member.u_date}" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${member.a_date}" pattern="yyyy-MM-dd"/></td>
                    <td>
                    <c:choose>
                            <c:when test="${member.a_state eq 1}">
                                활성
                            </c:when>
                            <c:otherwise>
                                비활성
                            </c:otherwise>
                        </c:choose> 
                    </td>                    
                    <td>${member.platform}</td>
	            </tr>
            </c:forEach>            
        </table>
    </div>
    <div id="div_shadow_info">
	    <div id="div_member_info">
	    <p>고객정보</p>
	       <form action="" name="frm_info">
		       <table id="tbl_contents_info">
		           <tr>
			           <th>이름</th>
			           <td><input type="text" id="name_info" disabled/></td>
			           <th>아이디</th>
			           <td><input type="text" id="m_id_info" disabled/></td>
		           </tr>
		           <tr>
			           <th>전화번호</th>
			           <td><input type="text" id="selNum_info" disabled/></td>
			           <th>등급</th>
			           <td><input type="text" id="grade_info" disabled/></td>
		           </tr>
		           <tr>
			           <th>생년월일</th>
			           <td><input type="text" id="birth_info" disabled/></td>
			           <th>성별</th>
			           <td><input type="text" id="gender_info" disabled/></td>
		           </tr>
		           <tr>
			           <th>주소지1</th>
			           <td><input type="text" disabled/></td>	           	
			           <td colspan="2"><input type="text" disabled/></td>
		           </tr>
		           <tr>
			           <th>주소지2</th>
			           <td><input type="text" disabled/></td>
			           <td colspan="2"><input type="text" disabled/></td>
		           </tr>
		           <tr>
			           <th>주소지3</th>
			           <td><input type="text" disabled/></td>
			           <td colspan="2"><input type="text" disabled/></td>
		           </tr>
		           <tr>
			           <th>가입일</th>
			           <td><input type="text" id="j_date_info" disabled/></td>
			           <th>수정일</th>
			           <td><input type="text" id="e_date_info" disabled/></td>
		           </tr>
		           <tr>
			           <th>최근접속일</th>
			           <td><input type="text" id="login_date_info" disabled/></td>
			           <th>플랫폼</th>
			           <td><input type="text" id="platForm_info" disabled/></td>
		           </tr>
		           <tr>
			           <th>전환일</th>
			           <td><input type="text" id="a_date_info" disabled/></td>
			           <th>활성여부</th>
			           <td><input type="text" id="a_state_info" disabled/></td>
		           </tr>
		           <tr>                
		               <td colspan="2"></td>
		               <td colspan="2">
			               <input id="btn_cancel" type="button" value="확인"/>
		               </td>
	               </tr>
		       </table>
	       </form>
	    </div>
    </div>
</body>
</html>