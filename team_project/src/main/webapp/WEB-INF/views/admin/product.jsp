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
        background-color: white;
        overflow-y: scroll;
        width: 500px;
        height: 500px;
        margin-top: 37px;
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
    #div_right tr td:nth-child(1), #div_right tr td:nth-child(2){
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
    #div_product_add{
        position: absolute;
        width: 500px;
        height: 320px;
        background-color: white;
        left: 50%;
        margin-left: -310px;
        top: 50%;
        margin-top: -260px;
    }
    #div_product_add p{
        font-size: 13px;
        line-height: 35px;      
        background-color: rgb(240, 240, 240);
        padding-left: 15px;
        font-weight: bold;
        border-bottom: 1px solid lightgray;
        
    }
    #tbl_product_add{
        margin: 10px 0px;
    }    
    #tbl_product_add th, #tbl_product_add td{
/*         border: 1px solid lightgray; */
        height: 35px;
        white-space: nowrap;
        font-size: 12px;
    }
    #tbl_product_add th{
        width: 70px;
        padding-right: 10px;
        text-align: right;
    }
    #tbl_product_add td{
        width: 150px;
    }
    #tbl_product_add input[type="text"], #tbl_product_add input[type="file"], #tbl_product_add input[type="number"]{
        width: 150px;
        height: 25px;
        border-radius: 0px;
        font-size: 11px;
    }    
    #tbl_product_add input[type="text"], #tbl_product_add input[type="number"]{
        border: 1px solid lightgray;
        padding-left: 5px;
        outline: none;
    }
    #tbl_product_add input[type="number"]::-webkit-outer-spin-button,
    #tbl_product_add input[type="number"]::-webkit-inner-spin-button{
        height: 30px;
        opacity: 1;
    }
    #tbl_product_add tr:last-child td:nth-child(3){
	    text-align: right;
    }
    #tbl_product_add tr:nth-child(6) td{
        border: none;
    }
    #tbl_product_add select{
        width: 157px;
        height: 27px;
        border-radius: 0px;
        font-size: 11px;
        border: 1px solid lightgray;
        outline: none;
    }
    #btn_add, #btn_cancel{
       width: 80px;
       height: 27px;
       margin-left: 5px;
       font-size: 11px;
       font-weight: bold;
       border: 1px solid lightgray;
       border-radius: 3px;
       cursor: pointer;
    }
    #btn_add{
       background-color: rgb(52, 152, 219);
       color: white;
    }
    #btn_add:hover {
	   background-color: rgb(42, 142, 209);
    }
    #btn_cancel:hover {
	   background-color: rgb(230, 230, 230);
    }   
    #div_productBtns{
        position: absolute;
        width: 500px;
        height: 37px;
        margin-left: 300px;        
    }
    #tbl_product_add tr:nth-child(6) td:last-child *{
        float: left;
    }
    #tbl_product_add tr:nth-child(6) td:last-child input[type="radio"]{
        margin-top: 3px;
        margin-left: 10px;
    }
    #tbl_product_add tr:nth-child(6) td:last-child label{
        margin-left: 5px;
        margin-right: 10px;
    }
    #div_productBtns input{
        font-size: 13px;
        font-weight: bold;
        width: 70px;
        height: 25px;
        margin-top: 5px;
        margin-right: 5px;        
    }
</style>
</head>
<body>
    <div id="div_left">
        <h3>제품관리</h3>
        <table>
            <tr>
                <td>분류</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" id="checkbox1_1"><label for="checkbox1_1">육류</label><br>
                    <input type="checkbox" id="checkbox1_2"><label for="checkbox1_2">가공</label><br>
                    <input type="checkbox" id="checkbox1_3"><label for="checkbox1_3">수산</label><br>
                    <input type="checkbox" id="checkbox1_3"><label for="checkbox1_3">야채</label><br>
                </td>
            </tr>
            <tr>
                <td>브랜드</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" id="checkbox2_1"><label for="checkbox2_1">농협</label><br>
                    <input type="checkbox" id="checkbox2_2"><label for="checkbox2_2">목우촌</label><br>
                    <input type="checkbox" id="checkbox2_3"><label for="checkbox2_3">하림</label><br>
                </td>
            </tr>
            <tr>
                <td>게시상태</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" id="checkbox3_1"><label for="checkbox3_1">판매중</label><br>
                    <input type="checkbox" id="checkbox3_2"><label for="checkbox3_2">판매중단</label><br>
                </td>
            </tr>
            <tr>
                <td>재고</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" id="checkbox4_1"><label for="checkbox4_1">있음</label><br>
                    <input type="checkbox" id="checkbox4_2"><label for="checkbox4_2">없음</label><br>
                </td>
            </tr>
        </table>
    </div>
    <div id="div_productBtns">
        <input type="button" value="상품등록" id="btn_addProduct">
        <input type="button" value="판매등록">
        <input type="button" value="판매중단">
        <input type="button" value="선택삭제">
        <input type="button" value="일괄삭제">
    </div>
    <div id="div_right">        
        <table id="tbl_member">
            <tr>
                <td><input type="checkbox"></td>
                <td></td>
                <td>코드</td>
                <td>제품명</td>
                <td>브랜드</td>
                <td>구매가</td>
                <td>판매가</td>
                <td>규격</td>
                <td>단위</td>
                <td>재고</td>
                <td>할인율</td>
                <td>판매여부</td>

                
            </tr>
            <c:forEach begin="1" end="50" var="i">
                <tr>
                    <td><input type="checkbox"></td>                    
                    <td>
                        <button class="display">
                            <img alt="" src="">
                        </button>
                    </td>
	                <td>값1</td>
	                <td>값1</td>
	                <td>값1</td>
	                <td>값1</td>
	                <td>값1</td>
	                <td>값1</td>
	                <td>값1</td>
	                <td>값1</td>
	                <td>값1</td>
	                <td>값1</td>

	            </tr>
            </c:forEach>            
        </table>
    </div>
    <div id="div_shadow">
	    <div id="div_product_add">
	    <p>상품등록</p>
	       <form action="" name="frm_edit">
		       <table id="tbl_product_add">
		           <tr>
			           <th>상품명</th>
			           <td><input type="text" /></td>
			           <th>분류</th>
			           <td>
				           <select>
				                <option value="">육류</option>
				                <option value="">가공</option>
				                <option value="">수산</option>
				                <option value="">야채</option>
				           </select>
			           </td>
		           </tr>
		           <tr>
			           <th>브랜드</th>
			           <td><input type="text" /></td>
			           <th>규격</th>
			           <td><input type="text" /></td>
		           </tr>
		           <tr>
			           <th>판매금액</th>
			           <td><input type="text" /></td>
			           <th>단위</th>
			           <td><input type="text" /></td>
		           </tr>
		           <tr>
			           <th>구매금액</th>
                       <td><input type="text" /></td>
                       <th>재고</th>
                       <td><input type="text" /></td>
		           </tr>
		           <tr>
			           <th>할인율</th>
                       <td><input type="number" min="0" max="90"/></td>
                       <th>상품코드</th>
                       <td><input type="text" /></td>
		           </tr>		           
		           <tr>
			           <th>썸네일</th>
			           <td><input type="file" /></td>
			           <th>게시상태</th>
                       <td>
                           <input type="radio" name="option" id="option1"/><label for="option1">판매중</label>
                           <input type="radio" name="option" id="option2"/><label for="option2">판매중단</label>
                       </td>
		           </tr>
		           <tr>                
		               <th>상품정보</th>
                       <td><input type="file" /></td>
		               <td colspan="2">
		                   <input id="btn_add" type="button" value="등록" />
			               <input id="btn_cancel" type="button" value="취소"/>
		               </td>
	               </tr>
		       </table>
	       </form>
	    </div>
    </div>
</body>
</html>