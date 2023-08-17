$(function() {

	/* ---------------------상품에 마우스 커서 호버 옵션박스------------------- */
	//*** 상품 이미지 마우스 커서 호버 이벤트 처리 ***//
	$(".w_img").hover(
	
		function() {
			$(this).find(".w_img_opt-box").stop().fadeIn(300);
		},
		function() {
			$(this).find(".w_img_opt-box").stop().fadeOut(300);
		}
		
	);
        
	/* ---------------------찜한 상품 삭제--------------------- */
	//*** 찜목록 상품 삭제 메서드 ***//
	function removeWish(p_idArray) {
        	
		$.ajax({
			type: "POST",
			url: "remove_wishList.do",
			data: {
				p_id: p_idArray,
			},
			success: function (response) { // 해당 상품 수량이 업데이트된 새로운 장바구니 객체 반환
				if (response === "success") { // 수량 업데이트가 성공한 경우
					alert('찜목록에서 상품이 삭제되었습니다.');
					//페이지 새로고침
					location.reload();
				} else {
					alert("찜목록 삭제에 실패했습니다.");
				}
			},
			error: function () {
				alert("오류가 발생하였습니다.");
			}
		}); // end of ajax
		
	}
        
        
	//*** 찜 버튼 클릭 이벤트 처리 ***//
	$(".w_btn").click(function() {
	
		let p_idArray = [$(this).siblings(".p_id").val()];

		// 상품 삭제 여부 결정
		let confirmed = confirm("해당 상품을 찜목록에서 삭제하시겠습니까?");

		// "확인" 을 눌렀을 경우
		if (confirmed) {

		removeWish(p_idArray);

		}

	});
  
	/* ---------------------찜한 상품 장바구니 추가--------------------- */
	//*** 장바구니에 선택한 상품 추가 ***//
	function addCart(p_idArray) {

		$.ajax({
			type: "POST",
			url: "addCart.do",
			data: {
				p_id: p_idArray,
			},
			success: function (response) { // 해당 상품 수량이 업데이트된 새로운 장바구니 객체 반환
				if (response === "success") { // 수량 업데이트가 성공한 경우
					alert('장바구니에 상품이 추가되었습니다.');
					//페이지 새로고침
					location.reload();
				} else {
					alert("장바구니 상품 추가에 실패했습니다.");
				}
			},
			error: function () {
				alert("오류가 발생하였습니다.");
			}
		}); // end of ajax
        	
	}
        
	//*** 장바구니 버튼 클릭 이벤트 처리 ***//
	$(".c_btn").click(function() {
	
		let p_idArray = [$(this).siblings(".p_id").val()];
        	addCart(p_idArray);
        	
	});
   	
});