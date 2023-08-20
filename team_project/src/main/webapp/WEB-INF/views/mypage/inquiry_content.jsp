<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의내역</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
	/* ---------------------전체 요소 공통--------------------- */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');       
    *{margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}

    /* 임시(삭제삭제) */
    body{
        width: 700px;
        height: 500px;
    }

    /* ---------------------1:1문의내역 헤더--------------------- */
    #in_header{
        padding: 10px 0;
        text-align: center;
        font-size: 22px;
        box-sizing: border-box;
    }
    
    /* ---------------------1:1문의내역 섹션--------------------- */
    #in_section{
        display: flex;
        flex-direction: column;
        align-items: center;

        width: 100%;
        height: 100%;
    }

    /* ---------------------1:1문의 폼 위치--------------------- */
    #in_management_area{
        width: 95%;
        display: flex;
        flex-direction: column;
        /* align-items: center; */
    }

    /* ---------------------1:1문의내역 테이블--------------------- */
    #in_m_table{
    	width: 100%;
        border-spacing: 0;
        border-collapse: collapse;
        font-size: 12px;
        color: #666;
        text-align: center;
        border-top: 1px solid #222;
        border-bottom: 1px solid #222;
    }
    #in_m_table {
        border-bottom: 1px solid #e5e5e5;
        font-size: 13px;
        color: #222;
    }
    #in_m_table tr th{
    	width: 120px;
        height: 40px;
        background-color: #f2f2f2;
    }
    #in_m_table tr td{
    	width: 217.5px;
    }
    #in_m_table tr:not(:last-child){
        border-bottom: 1px solid #e5e5e5;
    }
    
    /* ---------------------1:1문의내역 안내문구--------------------- */
    #in_m_notice{
        margin: 10px 0;
        padding: 0 10px;
        font-size: 12px;
        color: #777777;
    }
    #in_m_notice ul{
        list-style: none;
    }

    /* ---------------------1:1문의내역 버튼 박스--------------------- */
    #in_m_btn_box{
        display: flex;
        flex-direction: row;
        justify-content: center;
        margin-top: 25px;
    }
    /* 버튼 공통 */
    #in_m_btn_box button{
        height: 45px;
        margin: 0 5px;
        font-size: 16px;
        border-radius: 3px;
        line-height: 45px;
        cursor: pointer;
    }
    #btn_close_window{
    	display: flex;
        flex-direction: row;
        justify-content: center;
        margin-top: 25px;
        width: 100px;
        background-color: #fcfcfc;
        border: 1px solid #dddddd;
    }
    #content, #ans_content{
    	padding: 5px;
    	width: 545px;
    	height: 200px;
    	resize: none;
    	border: none;
    	outline: none;
    }
    #td_content, #td_ans_content{
    	height: 200px;
    }
</style>
	
<script>
	$(function() {
		
		let close_btn = $("#btn_close_window");
		
		close_btn.click(function() {
			opener.document.location.reload();
			self.close();
	    });
	});
</script>
<script>
    // 답변 내용의 textarea 엘리먼트
    var ansContentTextarea = document.getElementById('ans_content');

    // 답변 내용이 변경될 때 호출되는 함수
    ansContentTextarea.addEventListener('input', function () {
        // textarea의 내용을 읽어옴
        var content = ansContentTextarea.value;
        // 내용에서 줄바꿈을 <br> 태그로 변환
        var contentWithBr = content.replace(/\n/g, "<br>");
        // 변환한 내용을 해당 엘리먼트에 표시
        ansContentTextarea.innerHTML = contentWithBr;
    });
</script>

</head>
<body>
	
<div id="in_area">

	<div id="in_header">
		문의 내역
		<input type="hidden" id="m_idx" value="${m_idx}">
	</div>

	<div id="in_section">
	
		<div id="in_management_area">
			<div id="in_m_table_box">
				<table id="in_m_table">
					<c:forEach items="${inquiryContent}" var="inquiry">
					<tr>
						<th>문의목록</th>
						<td>
							<c:choose>
							<c:when test="${inquiry.category eq '0'}">
						        상품문의
						    </c:when>
		                	<c:when test="${inquiry.category eq '2'}">
						        회원정보
						    </c:when>
						    <c:when test="${inquiry.category eq '3'}">
						        주문/결제/배송
						    </c:when>
						    <c:when test="${inquiry.category eq '4'}">
						        취소/환불
						    </c:when>
						    <c:otherwise>
						        ${inquiry.category}
						    </c:otherwise>
		                </c:choose>
						</td>
						<th>작성일</th>
						<td><fmt:formatDate value="${inquiry.post_date}" pattern="yyyy-MM-dd"/></td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${inquiry.title}</td>
						<th>아이디</th>
						<td>${inquiry.m_id}</td>
					</tr>
					<tr>
						<th>문의내용</th>
						<td colspan="3" id="td_content">
							<textarea id="content" readonly>${inquiry.content}</textarea>
						</td>
					</tr>
					<tr>
					    <th>답변내용</th>
					    <td colspan="3" id="td_ans_content">
					        <textarea id="ans_content" readonly>${inquiry.ans_content}</textarea>
					    </td>
					</tr>
					</c:forEach>
					
					
				</table>
			</div>
			
			<div id="in_m_notice">
				<ul>
					<li>·&nbsp;&nbsp;자주묻는 질문(FAQ)에는 다양한 질문에 대한 답변이 수록되어 있습니다.</li>
					<li>·&nbsp;&nbsp;평일 9시~17시까지 등록된 내용에 대해 최대한 당일 내 답변을 하고 있으며, 업무시간 이외와 휴일(토,일요일 포함)에 등록된 내용은 사정상 답변이 늦어질 수 있습니다.</li>
				</ul>
			</div>
			
			<div id="in_m_btn_box">
				<button type="button" id="btn_close_window">닫기</button>
			</div>
			
					
		</div>
		
	</div>	
</div>
	
	
</body>
</html>