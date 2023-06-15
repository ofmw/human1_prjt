window.onload = function(){
    let pwC = document.getElementById("pwCheck");
    let hmc = document.getElementById("hdn_msg_pwC")
    pwC.onblur = function(){
        if (frm.pwCheck.value == frm.m_pw.value || frm.pwCheck.value.length == 0) {
            pwC.style.outlineColor="rgb(15, 150, 200)";
            hmc.style.display = "none";
            return false;
        }else if(frm.pwCheck.value != frm.m_pw.value){
            pwC.style.outlineColor="red";
            hmc.style.display = "block";
        }
    }
}
function addCheck() {
    let pwC = document.getElementById("pwCheck");
    if (frm.m_id.value.length == 0) {
        alert("아이디가 입력되지 않았습니다.")
        frm.m_id.focus();
        return false;
    } else if (frm.m_pw.value.length == 0) {
        alert("비밀번호가 입력되지 않았습니다.")
        frm.m_pw.focus();
        return false;
    } else if (frm.pwCheck.value.length == 0) {
        alert("비밀번호 재확인이 입력되지 않았습니다.")
        frm.pwCheck.focus();
        return false;
    }  else if (frm.pwCheck.value != frm.m_pw.value) {
        alert("비밀번호 재확인이 일치하지 않습니다.")
        frm.pwCheck.focus();
        return false;
    } else if (frm.m_name.value.length == 0) {
        alert("이름이 입력되지 않았습니다.")
        frm.m_name.focus();
        return false;
    } else if (frm.birth.value.length == 0) {
        alert("생년월일이 제대로 입력되지 않았습니다.")
        frm.birth.focus();
        return false;
    } else if (frm.gender.value == 0) {
        alert("성별이 선택되지 않았습니다.")
        frm.gender.focus();
        return false;
    } else if (frm.inputNum.value.length == 0) {
        alert("전화번호가 입력되지 않았습니다.")
        frm.inputNum.focus();
        return false;
    } else if (frm.inputANum.value.length == 0) {
        alert("전화번호 인증이 완료되지 않았습니다.")
        frm.inputANum.focus();
        return false;
    }else if (frm.inputANum.value != "1234") {
        alert("잘못된 인증번호입니다.")
        frm.inputANum.focus();
        return false;
    }else{
        alert("회원가입이 완료되었습니다.")
        document.frm.submit();
        return true;
    }  
}
function getANum(){
    if(frm.inputNum.value.length == 0){
        alert("전화번호가 입력되지 않았습니다.")
        frm.inputNum.focus();
    }else{
        alert("인증번호 : 1234");
        frm.inputANum.disabled = false;
        frm.inputANum.style.backgroundColor="white";
        frm.inputANum.focus();
    }
}