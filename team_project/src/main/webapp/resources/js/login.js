$(function() {

    //---------------일반 로그인 처리 메서드---------------//
	$("#login_btn").click(function() {
	    let memberId = $("#m_id").val();
	    let memberPw = $("#m_pw").val();
    
	    /* 아이디, 비밀번호 공란 체크 메서드 */
	    if(memberId == "") {
	    	alert("아이디를 입력해주세요");
	    	$("#m_id").focus();
	    	return false;
	    	
	    }else if(memberPw == "") {
	    	alert("비밀번호를 입력해주세요");
	    	$("#m_pw").focus();
	    	return false;
	    	
	    }else {
    
    	/* ajax 통신 */
		$.ajax({
			type: "POST", // 또는 "GET", 서버에서 지원하는 방식에 따라 변경 가능
			url: "login.do",
			data: {
			m_id: memberId,
			m_pw: memberPw
			},
			success: function(response) {
				//로그인 성공시
		        if (response === "success") {
		            location.reload();
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
			
    	} //end of 아이디, 비밀번호 공란 체크
    	
    }); //end of 로그인 처리 메서드

    
    
    //---------------네이버 로그인 처리 메서드---------------//
    $("#sns_naver_btn").click(function(event){
        event.preventDefault();
        
        let windowWidth = 400;
        let windowHeight = 650;

        // 화면 중앙에 위치시키기 위해 창의 x, y 위치 계산
        let windowLeft = (window.screen.width - windowWidth) / 2;
        let windowTop = (window.screen.height - windowHeight) / 2;

        // 새 창을 띄우기 위한 윈도우 옵션들
        let windowFeatures = "width=" + windowWidth + ",height=" + windowHeight + ",left=" + windowLeft + ",top=" + windowTop;

        let url = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=AdI9mtwo_qO9HcI4nYXD&redirect_uri=http://localhost:9090/prjt/member/nlogin.do";
        window.open(url, "_blank", windowFeatures);
    });

    //---------------카카오 로그인 처리 메서드---------------//
    $("#sns_kakao_btn").click(function(event){
        event.preventDefault();
        
        let windowWidth = 400;
        let windowHeight = 650;

        // 화면 중앙에 위치시키기 위해 창의 x, y 위치 계산
        let windowLeft = (window.screen.width - windowWidth) / 2;
        let windowTop = (window.screen.height - windowHeight) / 2;

        // 새 창을 띄우기 위한 윈도우 옵션들
        let windowFeatures = "width=" + windowWidth + ",height=" + windowHeight + ",left=" + windowLeft + ",top=" + windowTop;

        let url = "https://kauth.kakao.com/oauth/authorize?client_id=96ad22b1dc5d2f8c1d217f6aa61146a0&redirect_uri=http://localhost:9090/prjt/kakaologin.do&response_type=code";
        //window.open(url, "_blank", windowFeatures);
        location.href = url;
    });
    
});