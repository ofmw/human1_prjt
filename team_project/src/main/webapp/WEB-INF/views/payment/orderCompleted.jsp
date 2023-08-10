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
        border: 1px solid red;
    }
    #tbl_orderCompleted{
        width: 860px;
        margin: 20px;
        border-collapse: collapse;
    }
    #tbl_orderCompleted th, #tbl_orderCompleted td{
        border: 1px solid blue;
    }
    #tbl_orderCompleted th{
        width: 150px;
    }
    #tbl_orderCompleted td{
        padding: 0px 10px;
        font-size: 14px;
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
</style>    
</head>
<body>
	<!-- 헤더 -->
	<header><jsp:include page="../common/header2.jsp"></jsp:include></header>

    <section>
        <div id="div_orderCompleted">
            <div id="orderCompleted_main">
                <h2>주문완료</h2>
                <table id="tbl_orderCompleted">
                    <tr>
                    	<th>주문번호</th>
                    	<td colspan="3">${orderVo.order_idx}</td>
                    </tr>
                    <tr>
                    	<th>배송지정보</th>
                    	<td colspan="3"></td>
                    </tr>
                    <tr>
                    	<th>결제정보</th>
                    	<td colspan="3"></td>
                    </tr>
                    <c:forEach items="${orderList}" var="product">
                        <tr>
	                        <th></th>
	                        <td>${product.brand} ${product.p_name} ${product.standard}${product.unit}</td>
	                        <td>${product.amount}개</td>
	                        <td><fmt:formatNumber value="${product.price * product.amount}" pattern="#,###" />원</td>
	                    </tr>
                    </c:forEach>
                    
                </table>
            </div>
        </div>
    </section>

    <!-- 푸터 -->
<footer><jsp:include page="../common/footer.jsp"></jsp:include></footer>
</body>
</html>