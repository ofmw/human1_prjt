$(function() {

    let $shadow = $("#shadow");
    let $close_btn = $("#close_btn");
    let $login_btn2 = $("#login_btn2");

    $close_btn.on("click", function() {
        $shadow.css({
            'display': 'none',
            'z-index': '0'
        });
        $("body").css('overflow', 'visible');
    });

    function showShadow() {
        $shadow.css({
            'display': 'block',
            'z-index': '5000'
        });
        $("body").css('overflow', 'hidden');
    }

    $login_btn2.on("click", showShadow);
    
    /* 비밀번호 CapsLock 감지 */
    let checkCapsLock = document.getElementById('member_pw');
    checkCapsLock.addEventListener('keydown', function(e){
            if (e.getModifierState('CapsLock')) {
                $("#ccl_message").css('display', 'block');
            }else {
                $("#ccl_message").css('display', 'none');
        }
    });

    
    
    /* 네이버 로그인 */
    $("#sns_naver_btn").click(function(event){
        event.preventDefault();
        
        let windowWidth = 400;
        let windowHeight = 650;

        // 화면 중앙에 위치시키기 위해 창의 x, y 위치 계산
        let windowLeft = (window.screen.width - windowWidth) / 2;
        let windowTop = (window.screen.height - windowHeight) / 2;

        // 새 창을 띄우기 위한 윈도우 옵션들
        let windowFeatures = "width=" + windowWidth + ",height=" + windowHeight + ",left=" + windowLeft + ",top=" + windowTop;

        let url = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=AdI9mtwo_qO9HcI4nYXD&redirect_uri=http://localhost:9090/prjt/member/naver.do";
        window.open(url, "_blank", windowFeatures);
    });

    /* 카카오 로그인 */
    $("#sns_kakao_btn").click(function(event){
        event.preventDefault();
        
        let windowWidth = 400;
        let windowHeight = 650;

        // 화면 중앙에 위치시키기 위해 창의 x, y 위치 계산
        let windowLeft = (window.screen.width - windowWidth) / 2;
        let windowTop = (window.screen.height - windowHeight) / 2;

        // 새 창을 띄우기 위한 윈도우 옵션들
        let windowFeatures = "width=" + windowWidth + ",height=" + windowHeight + ",left=" + windowLeft + ",top=" + windowTop;

        let url = "https://kauth.kakao.com/oauth/authorize?client_id=96ad22b1dc5d2f8c1d217f6aa61146a0&redirect_uri=http://localhost:9090/prjt/kakao.do&response_type=code";
        //window.open(url, "_blank", windowFeatures);
        location.href = url;
    });
    
});