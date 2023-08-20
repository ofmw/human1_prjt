$(function() {

	/* ---------------------배송지 변경--------------------- */
	// 기존에 열려있는 자식 창에 대한 변수 초기화
	let childWindow = null;
	
	//*** 배송지 변경 자식창 열기 ***//
	function openManageAddress() {
		
		// 기존에 자식창이 열려있는지에 대한 여부
		if (childWindow) { // 이미 자식창이 열려있으면
	        childWindow.close(); // 자식창을 닫음
	    }
		
		// 자식창에 로그인한 회원이 m_idx 파라미터 값 넘겨줌
		let url = "manage_address.do?m_idx=" + $("#session_m_idx").val() + "&page=1";
		// 자식창을 열고 그 여부를 변수에 저장
		childWindow = window.open(url, '배송지 설정', 'menubar=no,width=700,height=750');
		//childWindow = window.open(url, '_blank', 'menubar=no,width=715,height=830');
	}
	
	//*** 배송지 변경 자식창 열기 이벤트 처리 ***//
	$("#manage_address").on("click", function(){
		openManageAddress();
	});
	
	/* ---------------------회원 탈퇴--------------------- */
	//*** 회원탈퇴 버튼 클릭 이벤트 처리 ***//
	$("#cancel").on("click", function(){
		
		let platform = $("#session_platform").val();
		
		if (platform === "omart") {
			location.href = "omartCancel.do";
		} else if (platform === "kakao") {
			location.href = "kakaoCancel.do";
		}
		
	});

});