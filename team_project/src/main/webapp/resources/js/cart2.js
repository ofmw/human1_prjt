$(function() {
    
    let shadow_addCart = $("#shadow_addCart");
    
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
        shadow_addCart.fadeOut(500, function() {
            $(this).css({
                'display': 'none',
                'z-index': '0'
            });
        });
        $("body").css('overflow-y', 'visible');
    };
    
    //*** 장바구니 버튼 클릭 이벤트 처리 ***//
    $(".c_btn").click(function() {
        let p_idArray = [$(this).siblings(".p_id").val()];
        console.log(p_idArray);
        
        addCart(p_idArray);
    });
    
    /* ---------------------장바구니 상품 추가--------------------- */
    //*** 장바구니에 선택한 상품 추가 ***//
    function addCart(p_idArray) {
        
        let m_idx = parseInt($("#m_idx").val());
        
        if (isNaN(m_idx)) {
            alert("로그인 후 이용 가능합니다.");
            $("#shadow").show();
        } else {
        
            $.ajax({
                type: "POST",
                url: "../cart/addCart.do",
                data: {
                    p_id: p_idArray,
                },
                success: function (response) { // 해당 상품 수량이 업데이트된 새로운 장바구니 객체 반환
                   if (response === "success") { // 수량 업데이트가 성공한 경우
                       showShadow_addCart();
                        //페이지 새로고침
                    } else if (response === "max"){
                        alert("해당 상품이 장바구니 최대 상품 수량을 초과했습니다.\n(최대 20개)");
                    } else {
                        alert("장바구니 상품 추가에 실패했습니다.");
                    }
                },
                error: function () {
                    alert("오류가 발생하였습니다.");
                }
            }); // end of ajax
        }
            
    }
	
}); //end of JQuery