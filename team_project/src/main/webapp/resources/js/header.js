$(function() {
	
	//---------------카테고리 메뉴---------------//
	$("#div_category_block").on("mouseover", function() {
		$("#div_category").css("display", "block");
	});

	$("#div_category").on("mouseout", function() {
		$(this).css("display", "none");
	});
	
	//---------------로그인 모달창---------------//
	let $shadow = $("#shadow");
    let $close_btn = $("#close_btn");
    let $login_btn2 = $("#login_btn2");
    let $open_login = $("#open_login");	//마이페이지 버튼 임시
    
    /* 로그인 모달창 열기 메서드 */
    function showShadow() {
        $shadow.css({
            'display': 'block',
            'z-index': '5000'
        });
        $("body").css('overflow', 'hidden');
    }
    
    /* 로그인 모달창 닫기 메서드 */
    $close_btn.on("click", function() {
        $shadow.css({
            'display': 'none',
            'z-index': '0'
        });
        $("body").css('overflow', 'visible');
    });

    $login_btn2.on("click", showShadow);
    $open_login.on("click", showShadow); //마이페이지 버튼 임시
    
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