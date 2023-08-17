<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        flex-direction: column;
    }
   
    /* ---------------------안내문구--------------------- */
    #ca_m_notice{
        margin: 20px 0;
        padding-left: 30px;
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

        margin-top: 50px;
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
    /* 리뷰작성 완료 버튼 */
    #btn_write_review{
        background-color: #e53838;
    }
    /* 현재 주문 배송지로 설정 버튼 */
    #btn_set_current{
        background-color: #00aeef;
    }
    /* 창 닫기 버튼 */
    #btn_close_window{
        width: 100px;
        background-color: #f2f2f2;
        border: 1px solid #dddddd;
    }
    table{
        width: 95%;
        border-top: 1px solid #222;
        border-bottom: 1px solid #222;
        margin-top: 50px;
        border-collapse: collapse;
    }
    #ca_product_tbl tr:first-child td{
        height: 100px;
        background-color: #f7f7f7;
    }
    .click{
        color: red !important;
    }
    #ca_m_notice ul{
        list-style-type: circle;
    	font-size: 13px;
    }
    #td_img{
        width: 100px;
    }
    #td_content{
        height: 150px;
        padding: 20px 20px;
        box-sizing: border-box;
        border-top: 1px solid #ddd;
        border-bottom: 1px solid #ddd;
    }
    #content{
        display: block;
        width: 100%;
        height: 100%;
        box-sizing: border-box;
        font-size: 18px;
        border: 0;
        outline: 0;
        resize: none;
    }
    #td_p-name{
        padding: 0 10px;
        border-left: 1px solid #ddd;
        border-right: 1px solid #ddd;
        text-align: center;
    }
    #td_p-info{
        width: 90px;
        padding: 0 20px;
        text-align: center;
        box-sizing: content-box;
    }
    #td_stars{
        height: 70px;
        font-size: 0;
        letter-spacing: 0;
        word-spacing: 0;
        text-align: center;
        user-select: none;
    }
    #td_stars div{
        width: 50px;
        height: 50px;
        line-height: 50px;
        display: inline-block;
        font-size: 40px;
        color: #eee;
        cursor: pointer;
    }

</style>
	
<script>
	$(function() {
		
		let close_btn = $("#btn_close_window");
		let write_review_btn = $("#btn_write_review");				
		let stars = $(".stars");
		let score = 0;
		let orderIdx = $("#order_idx").val();
		let pId = $("#p_id").val();
		
        stars.on("mouseenter", function(){

            let starIndex = $(this).index();

            for (i=0; i<=starIndex; i++) {
                stars.eq(i).css('color', 'red');
            }

        });

        stars.on("mouseleave", function(){
                $(".stars").css('color', '');
        });

        stars.click(function(){

            let starIndex = $(this).index();
            
            for (let i = 0; i < stars.length; i++) {
                if (i <= starIndex) {
                stars.eq(i).css('color', 'red').addClass("click");
                } else {
                stars.eq(i).css('color', '').removeClass("click");
                }
            }

        });
		
		write_review_btn.click(function(){
			
			let content = $("#content").val();
			
			if(score == 0){
				alert("별점을 선택해주세요.");
			}else{
				
				$.ajax({
					type: "post",
					url: "write_review_process.do",
					data: {
						order_idx: orderIdx,
						p_id: pId,
						content: content,
						stars: score
					},
					success: function(response){
						if(response == "success"){
							alert("리뷰작성이 완료되었습니다.");
	                        opener.document.location.reload();
	                        self.close();
						}else{
							alert("리뷰작성에 실패했습니다.");
						}
						
					},
					error: function(error){
						console.log("리뷰작성 ajax 통신 중 에러발생");
					}
				});				
				
			}
			
		});		

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
		<input type="hidden" id="order_idx" value="${param.order_idx}">
		<input type="hidden" id="p_id" value="${selected_product.p_id}">		
	</div>

	<div id="ca_section">
		<table id="ca_product_tbl">
	      <tr>
            <td id="td_img"><img src="#" alt="#"></td>
            <td id="td_p-name">상품이름ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</td>
            <td id="td_p-info">
                <fmt:formatNumber value="${selected_product.price}" pattern="#,###" />10,000 원<br>
                <fmt:formatNumber value="${selected_product.amount}" pattern="#,###" />39 개
            </td>
          </tr>
		  <tr>
		  	<td colspan="3" id="td_content"><textarea id="content" placeholder="상품 리뷰를 남겨주세요. (최대 100자)" maxlength="100"></textarea></td>		  	
		  </tr>
		  <tr>
		  	<td colspan="3" id="td_stars">
		  	   <div class="stars" id="star_1">★</div>
		  	   <div class="stars" id="star_2">★</div>
		  	   <div class="stars" id="star_3">★</div>
		  	   <div class="stars" id="star_4">★</div>
		  	   <div class="stars" id="star_5">★</div>
		  	</td>
		  </tr>
		</table>
		<div id="ca_notice_area">	
			<div id="ca_m_notice">
				<ul>
					<li>작성 완료하신 리뷰는 수정이 불가합니다.</li>
					<li>리뷰 작성시 50 포인트가 지급됩니다.</li>
                    <li>작성된 리뷰는 사이트 운영규칙에 따라 삭제조치될 수 있습니다.</li>
				</ul>
			</div>
			
			<div id="ca_m_btn_box">
				
				<button id="btn_write_review">리뷰작성</button>
				<button id="btn_close_window">닫기</button>
			</div>
			
					
		</div>
		
	</div>	
</div>
	
	
</body>
</html>