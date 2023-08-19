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
});