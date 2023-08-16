$(function() {
    /* ---------------------상품 수량 조절--------------------- */
    // + 버튼 클릭 이벤트 처리
    $(".plist_plus-btn").click(function() {
        // 현재 버튼이 속한 행에서 인접한 input 요소를 찾습니다.
        var inputElement = $(this).siblings(".plist_amount_value");
        // input 요소의 값을 가져와서 1을 더한 후 다시 설정합니다.
        var currentValue = parseInt(inputElement.val());
        if (currentValue < 20) {
        // 값이 20보다 작을 경우에만 1을 더해줍니다.
        inputElement.val(currentValue + 1);
        } else {
            // 값이 20이상이면 경고창을 띄웁니다.
            alert("최대 주문 수량은 20개 입니다.");
        }
    });

    // - 버튼 클릭 이벤트 처리
    $(".plist_minus-btn").click(function() {
        // 현재 버튼이 속한 행에서 인접한 input 요소를 찾습니다.
        var inputElement = $(this).siblings(".plist_amount_value");
        // input 요소의 값을 가져와서 1을 뺀 후 다시 설정합니다. 최소값은 0으로 제한합니다.
        var currentValue = parseInt(inputElement.val());
        inputElement.val(Math.max(currentValue - 1, 1));
    });

    /* ---------------------상품 선택 체크박스------------------- */
    // "전체 선택" 체크박스 클릭 이벤트 처리
    $("#sel_all").click(function() {
        // 전체 선택 체크박스의 상태를 가져옵니다.
        var isChecked = $(this).prop("checked");
        // class가 "sel_product"인 모든 체크박스를 선택 또는 해제합니다.
        $(".sel_product").prop("checked", isChecked);
    });

    // 개별 상품 체크박스 클릭 이벤트 처리 (옵션)
    $(".sel_product").click(function() {
        // 개별 상품 체크박스가 모두 선택되었는지 확인합니다.
        var allChecked = $(".sel_product:checked").length === $(".sel_product").length;
        // "전체 선택" 체크박스의 상태를 개별 상품 체크박스들과 동기화합니다.
        $("#sel_all").prop("checked", allChecked);
    });

    // 삭제 버튼 클릭 이벤트 처리
    $(".td_delete button").click(function() {
        // 해당 버튼이 속한 tr 요소를 찾아서 삭제합니다.
        $(this).closest("tr").remove();
    });

    // sel_delete 버튼 클릭 이벤트 처리 (sel_product 체크된 항목 삭제)
    $("#sel_delete").click(function() {
        // class가 sel_product인 체크박스 중 체크된 항목들을 선택합니다.
        var checkedProducts = $(".sel_product:checked");
        // 선택된 체크박스들이 속한 행을 모두 삭제합니다.
        checkedProducts.closest("tr").remove();
    });

    /* ---------------------주문정보 네비게이션--------------------- */
    $(window).scroll(function() {
        let ordernav = $("#cart_main_order-nav");

        if ($(window).scrollTop() >= 139) {
            ordernav.css({
                "position": "sticky",
                "top": "0",
            });

        } else {
            ordernav.css("position", "static");
        }
    });

    /* ---------------------버튼 색상 변경--------------------- */
    // 버튼에 마우스 커서가 올라갔을 때의 이벤트 처리
    $("button").mouseenter(function() {
        $(this).css({
            "background-color": "#222",
            "color": "white"
            });
    });

    // 버튼에서 마우스 커서가 벗어났을 때의 이벤트 처리
    $("button").mouseleave(function() {
        $(this).css({
            "background-color": "",
            "color": ""
        }); // 원래 배경색 및 폰트 색상으로 되돌리기
    });

    /* ---------------------빈 장바구니 표시--------------------- */
    // 테이블의 tr 요소 개수를 확인하는 함수
    function countVisibleRows() {
        return $('table tr:not(#tr_empty_cart)').length;
    }
    // tr_empty_cart를 보이도록 처리하는 함수
    function showEmptyCartRow() {
        $('#tr_empty_cart').show();
    }
    // tr_empty_cart를 숨기도록 처리하는 함수
    function hideEmptyCartRow() {
        $('#tr_empty_cart').hide();
    }
    // 페이지 로딩 시 tr_empty_cart를 체크하고 필요에 따라 보이기/숨기기 처리
    function checkEmptyCart() {
        var rowCount = countVisibleRows();
        if (rowCount === 0) {
            showEmptyCartRow();
        } else {
            hideEmptyCartRow();
        }
    }
    // 페이지 로딩 시 tr_empty_cart를 체크하고 초기 처리
    checkEmptyCart();
    // tr이 추가되거나 삭제될 때마다 tr_empty_cart를 체크하고 처리
    $('table').on('DOMSubtreeModified', function() {
        checkEmptyCart();
    });

});