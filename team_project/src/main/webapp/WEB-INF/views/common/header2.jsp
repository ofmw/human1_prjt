<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>로그인 헤더</title>

<link href="resources/css/header.css" rel="stylesheet">
<link href="resources/css/login.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/js/login.js"></script>
<script>
$(document).ready(function() {
	
	//카테고리 메뉴
	$("#div_category_block").on("mouseover", function() {
        $("#div_category").css("display", "block");
    });

    $("#div_category").on("mouseout", function() {
        $(this).css("display", "none");
    });
	
  // 로그인 버튼을 클릭했을 때의 이벤트 처리
  $("#login_btn").click(function() {
    // 입력한 아이디와 비밀번호를 가져옵니다.
    var memberId = $("#member_id").val();
    var memberPw = $("#member_pw").val();

    // AJAX를 통해 서버로 로그인 요청을 보냅니다.
    $.ajax({
      type: "POST", // 또는 "GET", 서버에서 지원하는 방식에 따라 변경 가능
      url: "member/login.do", // 컨트롤러의 URL을 입력해주세요.
      data: {
        member_id: memberId,
        member_pw: memberPw
      },
      success: function(response) {
        // 서버에서 로그인 성공 여부에 따라 반환한 데이터를 처리합니다.
        // 여기서는 response가 "success"인 경우 로그인 성공으로 가정하고 알림창을 띄웁니다.
        if (response === "success") {
          alert("로그인 성공!");
          // 로그인 성공 후 추가적으로 수행해야 할 작업이 있다면 여기에 추가합니다.
        } else {
          // 로그인 실패로 가정하고 알림창을 띄웁니다.
          alert("로그인 실패!");
        }
      },
      error: function() {
        // AJAX 요청 실패 시 처리할 내용을 여기에 추가합니다.
        alert("서버와의 통신에 문제가 발생했습니다.");
      }
    });
  });
});
</script>

</head>
<body>

    <!-- 헤더 -->
    <div id="div_header">
        
        <!-- 헤더 윗부분 -->
        <div id="div_header_upper">
            <!-- 헤더 윗부분 내부요소 -->
            <div id="div_header_upper_elements">

                <!-- 사이트 로고 -->
                <div id="div_omart_logo">
                    <a href="#"><img id="omart_logo" src="resources/img/omart.png" alt="omart로고"></a>
                </div>
                <!-- 검색 -->
                <div id="input_search_area">
                    <input id="input_search" type="search">
                </div>
                <!-- ㅁㄴㅇㄹ -->
                <div id="div_persnal">
                    <div id="div_member_menu">
                    	<a href="">ㅇㅇㅇ님</a>
                        <a href="">고객센터</a>
                        <a href="">로그아웃</a>
                    </div>
                    
                    <div id="div_persnal_menu">
                        <a href="">ㅇ</a>
                        <a href="">ㅇ</a>
                        <a href="">ㅇ</a>
                        <a href="">ㅇ</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- 헤더 아랫부분 -->
        <div id="div_header_lower">
            <!-- 헤더 아랫부분 내부요소 -->
            <div id="div_header_lower_elements">

                <!-- 카테고리 -->
                <div>
                    <div id="div_category_block">
                        전체 카테고리
                    </div>
                    <div id="div_category">
                        전체 카테고리
                    </div>
                </div>
                
                <!-- 메뉴모음 -->
                <div id="div_quick_menu">
                    <a href="">베스트</a>
                    <a href="">할인</a>
                    <a href="">신상품</a>
                    <a href="">이벤트</a>
                </div>
            </div>
        </div>
    </div><!-- end of header -->
</body>
</html>