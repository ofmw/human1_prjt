$(function() {
	
	//---------------카테고리 메뉴---------------//
	$("#div_category_block").on("mouseover", function() {
		$("#div_category").css("display", "block");
	});

	$("#div_category").on("mouseleave", function() {
		$(this).css("display", "none");
	});
	
	//---------------로그인 모달창---------------//
	let shadow = $("#shadow");
	let shadow_addCart = $("#shadow_addCart");
    let close_btn = $("#close_btn");
    let login_btn2 = $("#login_btn2");
    let need_login = $(".need_login"); //로그인이 필요한 서비스
    let addWish_btn = $(".btn_addWish"); //찜목록 상품 추가
    
    /* 로그인 모달창 열기 메서드 */
    function showShadow() {
    	shadow.css('z-index', '5000');
        shadow.fadeIn(100);
        $("body").css('overflow', 'hidden');
    }
    
    /* 로그인 모달창 닫기 메서드 */
    close_btn.on("click", function() {
    	shadow.css('z-index', '5000');
        shadow.fadeOut(100);
        $("body").css('overflow-y', 'visible');
    });
    
    /* 로그인 모달창 닫기 메서드 (ESC 입력) */
    $(document).keydown(function(event) {
	    if (event.keyCode === 27) { // ESC 키의 keyCode는 27입니다.
	        if ($('#shadow').css('visibility') === 'visible') {
	            $('#shadow').fadeOut(100);
	        }
	    }
	});
    
    login_btn2.on("click", showShadow);    
    need_login.on("click", function(event){
        event.preventDefault();
        showShadow();
    });
    
    addWish_btn.on("click", function(){
        let m_idx = $("#m_idx").val();
        let p_id = $("#p_id").val();
        
        $.ajax({
            type: "post",
            url: "/addWish.do",
            data: {m_idx: m_idx, p_id: p_id},
            success: function(response){
                console.log("AJAX 요청 성공:", response);
            },
            error: function(error){
                // 오류 시 처리할 로직
                console.error("AJAX 오류 발생", error);               
            }
        }); <!-- end of ajax -->
        
    });
    
    /* 비밀번호 입력 CapsLock 감지 */
    let checkCapsLock = document.getElementById('m_pw');
    checkCapsLock.addEventListener('keydown', function(e){
            if (e.getModifierState('CapsLock')) {
                $("#ccl_message").css('display', 'block');
            }else {
                $("#ccl_message").css('display', 'none');
        }
    });
	
	
}); //end of JQuery