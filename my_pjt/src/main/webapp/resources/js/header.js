 window.onload = function(){
        let div_nav = document.getElementById("div_nav");
        let div_bn = document.getElementById("div_bn");
        div_nav.addEventListener("mouseover", function(){
            this.classList.remove("default");
            this.classList.add("down");
        });
        div_bn.addEventListener("mouseout", function(){
            div_nav.classList.remove("down");
            div_nav.classList.add("up");
        });
        
        let btn_login = frm_login.btn_login;//로그인 버튼
        btn_login.addEventListener("click", checkInput);
}
    
function checkInput(){
    if(frm_login.m_id.value.length==0){
        alert("아이디가 입력되지 않았습니다.");
        frm_login.m_id.focus();
        return false;
    }else if(frm_login.m_pw.value.length==0){
        alert("비밀번호가 입력되지 않았습니다.");
        frm_login.m_pw.focus();
        return false;
    }else{
       document.frm_login.submit();
    }
    return true;
}