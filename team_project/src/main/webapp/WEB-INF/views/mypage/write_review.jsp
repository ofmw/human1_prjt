<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리뷰 작성</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
	/* ---------------------전체 요소 공통--------------------- */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');       
    *{margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}

    /* 임시(삭제삭제) */
    body{
        width: 700px;
        height: 770px;
    }

    /* ---------------------배송지 변경 메인영역--------------------- */
    #ca_area{
        width: 100%;
        height: 100%;
        color: #222;
    }

    /* ---------------------배송지 변경 헤더--------------------- */
    #ca_header{
        border-bottom: 2px solid #222;
        padding: 10px 0;
        text-align: center;
        font-size: 22px;
        box-sizing: border-box;
    }
    
    /* ---------------------배송지 변경 섹션--------------------- */
    #ca_section{
        display: flex;
        flex-direction: column;
        align-items: center;

        width: 100%;
        height: 100%;
    }

   

    /* ---------------------리뷰 작성--------------------- */
    #ca_notice_area{
        width: 95%;
        display: flex;
        flex-direction: column;
        /* align-items: center; */
    }
   
    /* ---------------------안내문구--------------------- */
    #ca_m_notice{
        margin: 10px 0;
        padding: 0 10px;
        font-size: 12px;
        color: #777777;
    }
    #ca_m_notice ul{
        list-style: none;
    }

    /* ---------------------배송지 설정 버튼 박스--------------------- */
    #ca_m_btn_box{
        display: flex;
        flex-direction: row;
        justify-content: center;

        margin-top: 25px;
    }
    /* 버튼 공통 */
    #ca_m_btn_box button{
        height: 45px;
        margin: 0 5px;
        font-size: 16px;
        border-radius: 3px;
        line-height: 45px;
        cursor: pointer;
    }
    #ca_m_btn_box button:not(:last-child){
        width: 200px;
        border: 0;
        color: white;
    }
    /* 기본 배송지로 설정 버튼 */
    #btn_set_default{
        background-color: #e53838;
    }
    /* 현재 주문 배송지로 설정 버튼 */
    #btn_set_current{
        background-color: #00aeef;
    }
    /* 창 닫기 버튼 */
    #btn_close_window{
        width: 100px;
        background-color: #fcfcfc;
        border: 1px solid #dddddd;
    }
    #ca_product_tbl{
        border-collapse: collapse;
        width: 700px;
    }
    #ca_product_tbl td{
        border: 1px solid red;
        height: 100px;
    }
    #ca_product_tbl tr td:first-child {
	   width: 105px;
	}
	#ca_product_tbl tr:first-child td:last-child{
	   width: 150px;
	}
	#ca_product_tbl textarea {
	   height: 83%;
	   width: 98%;
	   padding: 5px;
	   resize: none;
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

</head>
<body>
	
<div id="ca_area">

	<div id="ca_header">
		상품 리뷰 작성
		<input type="hidden" id="m_idx" value="${m_idx}">
	</div>

	<div id="ca_section">
		<table id="ca_product_tbl">
	      <tr>
            <td></td>
            <td>${p.p_name}</td>
            <td></td>
          </tr>
		  <tr>
		  	<td></td>
		  	<td colspan="2"><textarea placeholder="상품 리뷰를 남겨주세요."></textarea></td>		  	
		  </tr>
		</table>
		<div id="ca_notice_area">	
			<div id="ca_m_notice">
				<ul>
					<li>·&nbsp;&nbsp;배송지는 최대 5개 까지 저장 가능합니다.</li>
					<li>·&nbsp;&nbsp;기본 배송지로 설정된 배송지는 주문시 기본값으로 적용됩니다.</li>
                    <li>·&nbsp;&nbsp;기본 배송지 및 현재 주문 배송지는 삭제할 수 없습니다.</li>
                    <li>·&nbsp;&nbsp;배송지는 마이페이지에서도 관리 가능합니다.</li>
					<li>·&nbsp;&nbsp;결제 전 배송지를 반드시 확인해주세요.</li>
				</ul>
			</div>
			
			<div id="ca_m_btn_box">
				
				<button type="button" id="btn_set_default">기본 배송지로 설정</button>
				<c:if test="${page eq '2'}">
					<button type="button" id="btn_set_current">현재 주문 배송지로 설정</button>
				</c:if>
				<button type="button" id="btn_close_window">닫기</button>
			</div>
			
					
		</div>
		
	</div>	
</div>
	
	
</body>
</html>