$(document).ready(function() {
	
	//---------------카테고리 메뉴---------------//
	$("#div_category_block").on("mouseover", function() {
		$("#div_category").css("display", "block");
	});

	$("#div_category").on("mouseout", function() {
		$(this).css("display", "none");
	});
	
	//---------------로그인 처리 메서드---------------//
	$("#login_btn").click(function() {	
    let memberId = $("#m_id").val();
    let memberPw = $("#m_pw").val();

    //ajax 통신
	$.ajax({
		type: "POST", // 또는 "GET", 서버에서 지원하는 방식에 따라 변경 가능
		url: "member/login.do", // 컨트롤러의 URL을 입력해주세요.
		data: {
		m_id: memberId,
		m_pw: memberPw
		},
		success: function(response) {
			//로그인 성공시
	        if (response === "success") {
	            location.href = "index.do";
	        }else{
				//로그인 실패시
				alert("아이디 또는 비밀번호가 일치하지 않습니다.\n다시 확인하신 후 입력해주세요.");
				$("#m_pw").val("");
				$("#m_pw").focus();
			}
		},
		error: function() {
			alert("서버와의 통신에 문제가 발생했습니다.");
			}
		}); //end of ajax
	}); //end of 로그인 처리 메서드
}); //end of JQuery