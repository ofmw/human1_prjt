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
    let addCart_btn = $(".btn_addCart"); //장바구니에 상품 추가
    
    /* 로그인 모달창 열기 메서드 */
    function showShadow() {
        shadow.css({
            'display': 'block',
            'z-index': '5000'
        });
        $("body").css('overflow', 'hidden');
    }
    
    /* 로그인 모달창 닫기 메서드 */
    close_btn.on("click", function() {
        shadow.css({
            'display': 'none',
            'z-index': '0'
        });
        $("body").css('overflow-y', 'visible');
    });
    
    /* 장바구니 추가 알림창 열기 메서드 */
    function showShadow_addCart() {
        shadow_addCart.css({
            'display': 'block',
            'z-index': '5000'
        });
        setTimeout(hideShadow_addCart, 500);
    }

    /* 장바구니 추가 알림창 닫기 메서드 */
    function hideShadow_addCart() {
        shadow_addCart.fadeOut(1200, function() {
            $(this).css({
                'display': 'none',
                'z-index': '0'
            });
        });
        $("body").css('overflow-y', 'visible');
    };

    login_btn2.on("click", showShadow);    
    need_login.on("click", function(event){
        event.preventDefault();
        showShadow();
    });
    
    addCart_btn.on("click", function(event){
        event.preventDefault();
        
        let m_idx = $("#m_idx").val();
        let p_id = $(this).attr("id");        

        $.ajax({
            type: "post",
            url: "cart/addCart.do",
            data: {"m_idx": m_idx, "p_id": p_id},
            success: function(data){
                // 성공 시 처리할 로직
                console.log("AJAX 요청 성공:", data);
            },
            error: function(error){
                // 오류 시 처리할 로직
                console.error("AJAX 오류 발생", error);
            },
            complete: function(){
                // 성공 또는 오류와 관계 없이 요청이 완료되면 실행되는 로직
                showShadow_addCart();
            }
        });     
        
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