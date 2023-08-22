<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>오!마트 - 결제완료</title>
<style>
    /* ---------------------전체 요소 공통--------------------- */
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');       
    *{margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}

    /* a태그 공통 */
    a{text-decoration: none; color: #222;}
    

    /* ---------------------섹션--------------------- */
    section{
        display: flex;
        flex-direction: column;
        width: 100%;
        min-width: 1240px;
        align-items: center;
    }
    #div_orderCompleted{
        display: flex;
        flex-direction: column;
        padding: 0 20px;
        margin-top: 20px;
        width: 1240px;
        align-items: center;
    }
    #orderCompleted_main {
        width: 900px;
        margin-top: 10px;
        /* border: 1px solid red; */
    }
    #orderCompleted_main h2{
        padding-left: 20px;
        padding-bottom: 20px;
        border-bottom: 3px solid black;
    }
    #tbl_orderCompleted{
        width: 100%;
        margin-bottom: 40px;
        border-collapse: collapse;
    }
    #tbl_orderCompleted tr:not(:last-child) th, #tbl_orderCompleted tr:not(:last-child) td{
        border-bottom: 1px solid lightgray;
        padding: 20px 0px;
    }
    #tbl_orderCompleted th{
        width: 150px;
    }
    #tbl_orderCompleted td{
        padding: 20px 10px;
        font-size: 14px;
    }
    #tbl_orderCompleted tr:last-child td{
        text-align: center;
        padding-top: 40px;
        border-top: 3px solid black;
    }
    #tbl_orderCompleted tr td:nth-child(4) {
	   text-align: right;
	   padding-right: 10px;
	   width: 120px;
    }
    #tbl_orderCompleted tr td:nth-child(3) {
        width: 60px;
        text-align: center;
    }    
    td p{
        line-height: 25px;
    }
    #shadow_gradeChange{
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.7);
        position: fixed;
        top: 0;
        left: 0;
        z-index: 5000;
    }    
    #div_gradeChange{
        width: 400px;
        height: 100px;
        position: absolute;
        border: 1px solid black;
        top: 50%;
        left: 50%;
        margin-top: -100px;
        margin-left: -200px;
        background-color: white;
        border-radius: 15px;
        text-align: center;        
    }
    #div_gradeChange h5{
        margin: 20px;
    }
    
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		
	    // 주문번호에서 날짜 추출
	    var dateString = $("#order_idx").text().replace("OMT","");
	    
	    // 문자열에서 연, 월, 일, 시, 분, 초 추출
	    var year = parseInt(dateString.substring(0, 2)) + 2000;
	    var month = parseInt(dateString.substring(2, 4));
	    var day = parseInt(dateString.substring(4, 6));
	    var hour = parseInt(dateString.substring(6, 8));
	    var minute = parseInt(dateString.substring(8, 10));
	    var second = parseInt(dateString.substring(10, 12));
	    
	    // 날짜 객체 생성
	    var date = new Date(year, month - 1, day, hour, minute, second);
	    
	    // 원하는 날짜 포맷
	    var dateFormat = "yyyy년 MM월 dd일 HH시 mm분";
	    
	    // 날짜 포맷 변환 함수
	    function formatDate(date, format) {
	        var yyyy = date.getFullYear();
	        var MM = String(date.getMonth() + 1).padStart(2, '0');
	        var dd = String(date.getDate()).padStart(2, '0');
	        var HH = String(date.getHours()).padStart(2, '0');
	        var mm = String(date.getMinutes()).padStart(2, '0');
	        
	        format = format.replace('yyyy', yyyy);
	        format = format.replace('MM', MM);
	        format = format.replace('dd', dd);
	        format = format.replace('HH', HH);
	        format = format.replace('mm', mm);
	        
	        return format;
	    }
        
        // 변환된 날짜
        var convertedDate = formatDate(date, dateFormat);
        
        $("#convertedDate").text(convertedDate);
        
        var bfGrade = $("#bfGrade").val();
        var afGrade = $("#afGrade").val();
        var shadow = $("#shadow_gradeChange");

        if (bfGrade === "") {
            shadow.hide();
        }
        
        $("#close_shadow").click(function(){
        	shadow.hide();
        });
        
	});
</script> 
</head>
<body>
	<!-- 헤더 -->
	<header><jsp:include page="../common/header2.jsp"></jsp:include></header>

    <section>
        <div id="div_orderCompleted">
            <div id="orderCompleted_main">
                <h2>결제완료</h2>
                <table id="tbl_orderCompleted">
                    <tr>
                        <th>주문일자</th>
                        <td colspan="3" id="convertedDate"></td>
                    </tr>
                    <tr>
                    	<th>주문번호</th>
                    	<td colspan="3" id="order_idx">${orderVo.order_idx}</td>
                    </tr>
                    <tr>
                    	<th>배송지정보</th>
                    	<td colspan="3">
                    	   <c:set var="phoneNumber" value="${orderVo.selnum}" />
                           <c:set var="formattedPhoneNumber" value="" />                                           
                           <c:forEach var="i" begin="0" end="${fn:length(phoneNumber) / 4 - 1}">
                               <c:set var="startIdx" value="${fn:length(phoneNumber) - (i + 1) * 4}" />
                               <c:set var="endIdx" value="${fn:length(phoneNumber) - i * 4}" />
                               <c:set var="chunk" value="${phoneNumber.substring(startIdx, endIdx)}" />
                               <c:choose>
                                   <c:when test="${fn:length(formattedPhoneNumber) eq 0}">
                                       <c:set var="formattedPhoneNumber" value="${chunk}" />
                                   </c:when>
                                   <c:otherwise>
                                       <c:set var="formattedPhoneNumber" value="${chunk}-${formattedPhoneNumber}" />
                                   </c:otherwise>
                               </c:choose>
                           </c:forEach>
                           <c:set var="formattedPhoneNumber" value="010-${formattedPhoneNumber}" />
                    	   <p>받는분 : ${orderVo.receiver}</p>
                    	   <p>연락처 : ${formattedPhoneNumber}</p>
                    	   <p>배송지 : ${orderVo.address}</p>
                    	   <c:if test="${orderVo.request ne ''}">
                    	       <p>요청사항 : ${orderVo.request}</p>
                    	   </c:if>
                    	</td>
                    </tr>
                    <tr>
                    	<th>결제정보</th>
                    	<td colspan="3">${orderVo.paymentInfo}</td>
                    </tr>
                    <c:forEach items="${orderList}" var="product">
                        <tr>
	                        <th></th>
	                        <td>${product.brand} ${product.p_name} ${product.standard}${product.unit}</td>
	                        <td>${product.amount}개</td>
	                        <td><fmt:formatNumber value="${product.price * product.amount}" pattern="#,###" />원</td>
	                    </tr>
                    </c:forEach>
                    <c:if test="${orderVo.used_point gt 0}">
                        <tr>
                        	<th></th>
                        	<td></td>                        	
                        	<td colspan="2" style="text-align: right; padding-right: 10px;">(포인트차감 : -<fmt:formatNumber value="${orderVo.used_point}" pattern="#,###" />원)</td>
                        </tr>
                    </c:if>
                    <tr>
                    	<th>최종결제금액</th>
                    	<td></td>
                    	<td></td>
                    	<td><fmt:formatNumber value="${orderVo.paid_price}" pattern="#,###" />원</td>
                    </tr>
                    <tr>
                    	<td colspan="4">
                    	   <a href="../index.do"><h3>메인으로 돌아가기</h3></a>
                    	</td>
                    </tr>
                    
                </table>
            </div>
        </div>        
    </section>

    <!-- 푸터 -->
<footer><jsp:include page="../common/footer.jsp"></jsp:include></footer>

<div id = shadow_gradeChange>
    <input type="hidden" value="${bfGrade}" id="bfGrade"/>
    <input type="hidden" value="${afGrade}" id="afGrade"/>
	<div id="div_gradeChange">
	    <h5>회원등급이 [${bfGrade}]에서 [${afGrade}]로 상승했습니다.</h5>
	    <input type="button" value="확인" id="close_shadow"/>
	</div>
</div>        

</body>
</html>