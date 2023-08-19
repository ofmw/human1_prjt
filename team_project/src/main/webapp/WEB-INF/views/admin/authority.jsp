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
    #tbl_left{
        border-collapse: collapse;
        width: 250px;
    }
    #tbl_left td{
        border: 1px solid lightgray;
    }
    #tbl_left tr:nth-child(1) td{
	    height: 27px;
	    font-size: 13px;
	    line-height: 14px;
	    font-weight: bold;
	    padding-left: 10px;
    }
    #tbl_left tr:nth-child(even) td{
        background-color: white;
        font-size: 13px;
        line-height: 25px;
        padding: 5px 0px;
    }
    #tbl_left input{
        float: left;
    }
    #tbl_left label{
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
    #div_right tr td:nth-child(2){
        width: 40px;
    }
    #div_right button, #div_right img{
        width: 15px;
        height: 15px;
    }
    #div_right button{
        margin-top: 5px;
    }
    #div_authority_input{
        float: left;
        width: 300px;
        height: 300px;
        background-color: white;
        margin-top: 37px;
        border: 1px solid lightgray;
    }
    #div_authority_input p{
        font-size: 13px;
        line-height: 25px;      
        background-color: #f5f5f5;
        padding-left: 15px;
        font-weight: bold;
        border-bottom: 1px solid lightgray;
        
    }
    #tbl_authority_input{
        margin: 5px 15px;
        border: 1px solid lightgray;
        width: 250px;
    }    
    #tbl_authority_input th, #tbl_authority_input td{
        height: 25px;
        white-space: nowrap;
        font-size: 12px;
    }
    #tbl_authority_input th{
        width: 60px;
        padding-right: 5px;
        text-align: right;
    }
    #tbl_authority_input tr:first-child th{
        text-align: left;
        padding-left: 8px;
        height: 30px;
        border-bottom: 1px solid lightgray;
        padding-bottom: 5px;
        font-size: 13px;
        line-height: 35px;    
        padding-right: 10px;    
    }
    #tbl_authority_input tr:first-child input[type="button"]{
        float: right;
    }
    #tbl_authority_input td{
        width: 150px;
    }
    #tbl_authority_input input[type="text"], #tbl_authority_input input[type="password"]{
        width: 140px;
        height: 25px;
        border: 1px solid lightgray;
        border-radius: 0px;
        font-size: 11px;
        padding-left: 5px;      
        color: black;  
        outline: none;
    }
    #tbl_authority_input select{
        width: 147px;
        height: 28px;
        border: 1px solid lightgray;
        border-radius: 0px;
        font-size: 11px;
        padding-left: 5px;
        line-height: 25px;
        outline: none;
    }
    #tbl_authority_input tr:nth-child(n+4):nth-child(-n+6) td:nth-child(3) input[type="text"]{
	   width: 220px;
	   margin-left: 2px;
    }
    #tbl_authority_input tr th:nth-child(3) {
	   width: 60px;
    }
    #tbl_authority_input tr:last-child td{
	   text-align: right;
	   padding-bottom: 5px;
	   padding-right: 10px;
    }
    #btn_input, #btn_edit, #btn_create, #td_btns input[type="button"]{
       width: 80px;
       height: 27px;
       margin-left: 5px;
       font-size: 11px;
       font-weight: bold;
       border: 1px solid lightgray;
       border-radius: 3px;
       cursor: pointer;
    }
    #btn_input{
       background-color: rgb(52, 152, 219);
       color: white;
    }
    #btn_input:hover {
	   background-color: rgb(42, 142, 209);
    }
    #btn_edit:hover, #btn_create:hover {
	   background-color: rgb(230, 230, 230);
    }
    #td_btns input{
        float: right;
        margin-right: 10px;
        margin-bottom: 5px;
    }
    #td_btns input:first-child {
	   margin-left: 59px !important;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	let tblAuthInput = document.getElementById("tbl_authority_input");
	let memberInfoBtns = document.querySelectorAll(".btn_memberInfo");
	let gradeMap = {"7": "CS", "8": "SALES", "9": "SUPER"};
	
	memberInfoBtns.forEach(function(btn){
		btn.addEventListener("click", function(){
			
			// 클릭된 버튼의 id를 가져옵니다.
            let memberId = $(this).attr("id");

            // 해당 id를 가진 상품 행(tr)을 선택합니다.
            let memberRow = $("#tbl_contents tr").filter(function() {
                return $(this).find("td:nth-child(3)").text() === memberId;
            });
            
            let selectedGrade = memberRow.find("td:nth-child(2)").text().trim();
            
            $("#mId_input").val(memberId);
            $("#j_date_input").val(memberRow.find("td:nth-child(4)").text().trim());
            $("#e_date_input").val(memberRow.find("td:nth-child(10)").text().trim());
            let selectedKey = Object.entries(gradeMap).find(([key, value]) => value === selectedGrade);
            $("#grade_input").val(selectedKey[0]);
            $("#mPw_input").val("");
            
        });
	});
	
	let cancelBtn = document.getElementById("btn_edit");
	
	cancelBtn.addEventListener("click", function(){
		divShadowInfo.style.display = "none";
		frm_input.reset();
	});
	
	$("#btn_reset").click(function(){
        
        $("input[type='checkbox']").prop("checked", false);
        $("#tbl_contents tr").show();
        
    });	
    
    $("#btn_filter").click(function () {
        let selectedGrades = [];
       
        $(".checkbox_grade:checked").each(function () {
            let gradeId = $(this).attr("id").replace("checkbox1_", "");
            selectedGrades.push(gradeMap[gradeId]);
        });
        
        applyFilter(selectedGrades);
    });
	
    function applyFilter(selectedGrades) {
        $("#tbl_contents tr:not(:first-child)").each(function () {
            let grade = $(this).find("td:nth-child(2)").text();
            let showGrade = selectedGrades.length === 0 || selectedGrades.includes(grade.trim());
            if (showGrade) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    }
    
    $("#slt_authority").change(function(){
    	let selectedValue = $(this).val();
    	$("#grade_input").val(selectedValue);
    });
    
    $("#btn_create").click(function(){
    	    	
    	if($("#mId_input").val() === "" || $("#mPw_input").val() === ""){
    		alert("아이디와 패스워드를 입력해주세요.");
    	}else{
    		
    		let formData = {
    				m_id: $("#mId_input").val(),
    				m_pw: $("#mPw_input").val(),
    				grade: parseInt($("#grade_input").val()),
    				m_name: $("#mName_input").val()
    		};
    		
    		$.ajax({              
                type: "post",
                url: "checkAccount.do",
                data: {m_id: $("#mId_input").val()},
                success: function(response){
                    if(response !== 0){
                    	alert("이미 사용중인 계정입니다.");
                    }else{
                    	$.ajax({               
                            type: "post",
                            url: "createAccount.do",
                            data: formData,
                            success: function(response){
                                alert("관리자계정이 성공적으로 등록되었습니다.")
                                location.reload();
                            },
                            error: function(error){
                                console.error("AJAX 오류 발생", error);
                                alert("관리자계정 등록 중 오류가 발생했습니다.");
                            }                   
                        }); //end of ajax
                    }
                },
                error: function(error){
                    console.error("AJAX 오류 발생", error);
                    alert("관리자계정 중복확인 중 오류가 발생했습니다.");
                }                   
            }); //end of ajax
    		
    	}
    	
    });
    
    $("#btn_edit").click(function(){
    	
    	$.ajax({
    		type: "post",
    		url: "getAccount.do",
    		data: {m_id: $("#mId_input").val()},
    		success: function(response){
    			if(response === 0){
    				alert("존재하지 않는 관리자계정입니다. 아이디를 확인해주세요.");
    			}else{
    				if($("#mPw_input").val() === ""){
    		            alert("권한만 변경되도록 컨트롤러 메소드 실행");
    		        }else{
    		        	$.ajax({
    		        		type: "post",
    		        		url: "checkPassword.do",
    		        		data: {m_id: $("#mId_input").val(), m_pw: $("#mPw_input").val()},
    		        		success: function(response){
    		        			if(response === ""){
    		        				let confirmResult = confirm("비밀번호를 변경하시겠습니까?");
    		        				if(confirmResult){
    		        					alert("권한과 비밀번호 모두 변경되는 컨트롤러 메소드 실행")
    		        					
    		        				}else{
    		        					alert("테스트: false");
    		        				}
    		        			}else{
    		        				alert("비밀번호가 일치합니다");
    		        			}
    		        		},
    		        		error: function(error){
    		        			console.error("AJAX 오류 발생", error);
                                alert("비밀번호 확인 중 오류가 발생했습니다.");
    		        		}    		        		
    		        	}); //end of ajax
    		        }
    			}
    		},
    		error: function(error){
    			console.error("AJAX 오류 발생", error);
                alert("관리자계정 등록확인 중 오류가 발생했습니다.");
    		}
    		
    	}); //end of ajax
    	
    });    
    
    
});
</script>
</head>
<body>
    <div id="div_left">
        <h3>권한관리</h3>
        <table id="tbl_authority_input">
            <tr>
                <th colspan="2">Manager 계정 관리
                    <input type="button" value="계정생성" id="btn_create"/>
                </th>
            </tr>
           <tr>
               <th>권한</th>
               <td>
                   <select id="slt_authority">
                       <option value="7">CS</option>
                       <option value="8">SALES</option>
                   </select>
               </td>
           </tr>
           <tr>
               <th>아이디</th>
               <td><input type="text" id="mId_input" /></td>

           </tr>
           <tr>
               <th>비밀번호</th>
               <td><input type="password" id="mPw_input" /></td>
           </tr>
           <tr style="display: none;">
               <th>이름</th>
               <td><input type="text" id="mName_input"  value="관리자"/></td>
           </tr>
           <tr>
               <th>등록일</th>
               <td><input type="text" id="j_date_input" disabled/></td>
           </tr>
           <tr>
               <th>최근접속일</th>
               <td><input type="text" disabled/></td>

           </tr>
           <tr>
               <th>수정일</th>
               <td><input type="text" id="a_date_input" disabled/></td>
           </tr>           
           <tr style="display: none;">
               <th>등급</th>
               <td><input type="text" id="grade_input" value="7"/></td>
           </tr>
           <tr>                
               <td colspan="2">
                   <input id="btn_edit" type="button" value="수정"/>
               </td>
           </tr>           
       </table>
        <table id="tbl_left">
            <tr>
                <td>Authority</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" id="checkbox1_7" class="checkbox_grade"><label for="checkbox1_7">CS</label><br>
                    <input type="checkbox" id="checkbox1_8" class="checkbox_grade"><label for="checkbox1_8">SALES</label><br>
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
                <td>권한</td>
                <td>아이디</td>                
                <td>등록일</td>
                <td>최근접속일</td>                
                <td>수정일</td>
            </tr>
            <c:forEach items="${memberList}" var="member">
                <tr>
                    <td>
                        <c:if test="${member.grade ne 9}">
                            <button class="btn_memberInfo" id="${member.m_id}">
                                <img alt="" src="">
                            </button>
                        </c:if>                        
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${member.grade eq 9}">
                                SUPER
                            </c:when>
                            <c:when test="${member.grade eq 8}">
                                SALES
                            </c:when>
                            <c:when test="${member.grade eq 7}">
                                CS
                            </c:when>
                        </c:choose>                    
                    </td>                    
	                <td>${member.m_id}</td>                    
                    <td><fmt:formatDate value="${member.j_date}" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${member.login_date}" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${member.u_date}" pattern="yyyy-MM-dd"/></td>
	            </tr>
            </c:forEach>            
        </table>
    </div>    
</body>
</html>