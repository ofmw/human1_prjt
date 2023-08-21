<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
        *{margin: 0; padding: 0; font-family: 'Noto Sans KR', sans-serif;}
    #div_join{
        position: absolute;
        top: 100px;
        left: 50%;
        width: 400px;
        margin-left: -200px;
    }
    #m_name, #m_id, #m_pw, #m_pwCheck, fieldset, #selNum, #btn_get_aNum, #aNum, button{
        border: 1px solid rgb(224, 224, 224);
    }
    img{
        position: absolute;
        left: 50%;
        margin-left: -75px;
        margin-bottom: 10px;
        cursor: pointer;
    }
    p{
        font-size: 14px;
        user-select: none;
    }
    td{
        padding-left: 32px;
        padding-right: 32px;
    }
    #div_box{
        position: absolute;
        top: 120px;
        left: 50%;
        margin-left: -200px;
        width: 420px;
        padding: 10px 10px 10px 10px;
        border-bottom: 3px solid black;
        user-select: none;
    }
    #tbl_join{
        top: 180px;
        position: absolute;
        width: 400px;
        padding-bottom: 60px;
     
    }
    #tbl_join ul{
        padding-bottom: 20px;
    }
    #tbl_join li{ 
        margin-left: 10px;
        list-style-type: none;
    }
    #tbl_join li a{
        float: right;
        font-size: 14px;
    } 
    #selNum_text{
        margin-bottom: 20px;
        user-select: none;
    }
    #lbl_all{
        color: black;
        font-weight: bold;
        user-select: none;
    }
    #lbl_allSee{
        float: right;
        cursor: pointer;
    }     
    input{
        margin-top: 10px;
        margin-bottom: 10px;
        padding: 5px;
    }
    #tbl_join label{
        font-size: 14px;
        color: gray;
        user-select: none;
    }
    #m_name, #m_id, #m_pw, #m_pwCheck{
        width: 365.79px;
        height: 24.79px;
    }
    fieldset{
        margin: 10px 0px;
        display: flex;
        justify-content: flex-start;
        align-items: center;
        padding: 0;
        width: 375.79px;
        height: 34.78px;
        border-radius: 2px;
    }
    fieldset input{
        outline: none;
        font-size: 17px;
        letter-spacing: 2px;
    }
    #birth, #gender, #fld_block{
        font-size: 13px;
        border: none;
    } 
    #birth{
        padding-left: 20px;
        padding-right: 30px;
        width: 90px;
    }
    #gender{
        width: 13px;
        padding-left: 30px;
        padding-right: 3px;
        margin-right: 0px;
    }
    #fld_block{
        width: 170px;
        padding-left: 0px;
    }
    #selNum{
        float: left;
        width: 285px;
        height: 24.79px;
    }
    #btn_get_aNum{
        float: left;
        margin: 10px 0px;
        margin-left: 7px;
        font-size: 10px;
        background-color: white;
        border-radius: 4px;
        color: rgb(64, 64, 64);
        width: 73px;
        height: 37px;
    }
    #aNum{
        width: 285px;
        height: 24.79px;
    }
    button{
    	margin-top: 5px;
        margin-bottom: 8px;
        width: 378.01px;
        height: 37px;
        background-color: black;
        color: white;
        font-size: 16px;
        font-weight: bold;
        border-radius: 4px;
        cursor: pointer;
    }
    #aNum_behind, #lbl_behind{
        display: ;
    }
  	.check{
  		font-size: 8px;
  	}
  	p{
  		padding-top: 5px;
  	}
  	.hidden_row{
  		display: none;
  	}

   
</style>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.js"></script>


<script>
    window.onload = function(){
        let lbl_allSee = document.getElementById("lbl_allSee");
        let lbl_behind = document.getElementById("lbl_behind");
        lbl_allSee.addEventListener("click", function(){
            if(lbl_allSee.classList.contains('close')){
                lbl_behind.style.display = "block";
                lbl_allSee.classList.remove("close");
                lbl_allSee.classList.add("open");
            }else if(lbl_allSee.classList.contains('open')){
                lbl_behind.style.display = "none";
                lbl_allSee.classList.remove("open");
                lbl_allSee.classList.add("close");
            };            
        });
    }
</script>
<script>
    $(document).ready(function () {
        var namePattern = /^[가-힣]{2,6}$/;
        var birthPattern = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;
        var genderPattern = /^[1-4]$/;
        var selNumPattern = /^(010|011)[0-9]{7,8}$/;
        var passwordPattern = /^(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[a-z\d@$!%*?&]{8,12}$/;
		var idPattern = /^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$/;
        
		$('#btn_join').click(function() {
	        var fields = [
	            { input: $('#m_name'), error: $('#name_check'), message: '이름을 입력해주세요.', pattern: namePattern, error_message: '이름을 올바르게 입력해주세요.' },
	            { input: $('#birth'), error: $('#birth_check'), message: '생년월일을 입력해주세요.', pattern: birthPattern, error_message: '생년월일을 올바르게 입력해주세요.' },
	            { input: $('#gender'), error: $('#gender_check'), message: '성별을 입력해주세요.', pattern: genderPattern, error_message: '성별을 올바르게 입력해주세요.' },
	            { input: $('#selNum'), error: $('#selNum_check'), message: '휴대폰 번호를 입력해주세요.', pattern: selNumPattern, error_message: '휴대폰 번호를 올바르게 입력해주세요.' },
	            { input: $('#m_id'), error: $('#id_check'), message: '아이디를 입력해주세요.', pattern: idPattern, error_message: '이메일 형식으로 입력해주세요.' },
	            { input: $('#m_pw'), error: $('#pw_check'), message: '비밀번호를 입력해주세요.', pattern: passwordPattern, error_message: '비밀번호를 올바르게 입력해주세요.' },
	        ];
	        
	        var isValid = true;
	        
	        for (var i = 0; i < fields.length; i++) {
	            var field = fields[i];
	            
	            if (field.input.val().length === 0) {
	                alertAndFocus(field.input, field.error, field.message);
	                isValid = false;
	                break;
	            } else if (!field.pattern.test(field.input.val())) {
	                alertAndFocus(field.input, field.error, field.error_message);
	                isValid = false;
	                break;
	            } else {
	                field.error.text(''); // 에러 메시지 초기화
	            }
	        }
	        
	     	// 비밀번호 일치 여부 확인
	        var passwordInput = $('#m_pw');
	        var passwordConfirmInput = $('#m_pwCheck');
	        var passwordConfirmCheck = $('#pw_check2');
	        
	        if (passwordPattern.test(passwordInput.val()) && passwordInput.val() !== passwordConfirmInput.val()) {
	            alertAndFocus(passwordConfirmInput, passwordConfirmCheck, '비밀번호가 일치하지 않습니다.');
	            isValid = false;
	        } else {
	        	passwordConfirmCheck.text('');
	        }
			
	        /* if (isValid) {
	        	   // 휴대전화 중복 여부 확인 AJAX 요청
	               $.ajax({
	                   type: 'POST',
	                   url: 'checkSelNum',  // 실제 서버의 URL을 입력
	                   data: { selNum: selNum },
	                   success: function(response) {
	                       if (response === 'duplicate') {
	                           alert('이미 가입된 전화번호입니다.');
	                           isValid = false;
	                       } else {
	                           // 서버에서 가입 가능한 상태임을 확인하면 여기에서는 아무 작업이 필요 없음
	                           alert('회원 가입이 완료되었습니다.');
	                       }
	                   }
	               });
	        } */
	        
	        if (isValid) {
	        	var formData = {
	        			m_name: $('#m_name').val(),
	        			birth: $('#birth').val(),
	        			gender: $('#gender').val(),
	        			selNum: $('#selNum').val(),
	        			m_id: $('#m_id').val(),
	        			m_pw: $('#m_pw').val()
	        	};
	        	$.ajax({
	        	    type: 'POST',
	        	    url: 'checkSelNum', // 중복 여부 확인 엔드포인트 URL
	        	    data: { selNum: formData.selNum }, // 휴대폰 번호 전송
	        	    success: function(response) {
	        	        if (response === 'duplicate') {
	        	            alert('이미 가입된 전화번호입니다.');
	        	        } else {
	        	            // 중복이 아니라면 실제 회원 가입 처리
	        	            $.ajax({
	        	                type: 'POST',
	        	                url: 'join_process.do', // 회원 가입 처리 엔드포인트 URL
	        	                data: formData,
	        	                success: function(response) {
	        	                    if (response === 'success') {
	        	                        alert('회원 가입이 완료되었습니다.');
	        	                        location.href = '../index.do';
	        	                    } else {
	        	                        alert('회원 가입에 실패했습니다.');
	        	                    }
	        	                }
	        	            });
	        	        }
	        	    }
	        	});
	        	
	        	return false;
	        	
	        }
	      
	        return isValid;
	    });

	    function alertAndFocus(inputElement, errorElement, errorMessage) {
	        alert(errorMessage);
	        errorElement.text(errorMessage);
	        inputElement.focus();
	    }

        $('#m_name').blur(function(){
            var nameInput = $(this);
            var nameCheck = $('#name_check');
            
            if (namePattern.test(nameInput.val())) {
                nameCheck.text('');
            } else {
                nameCheck.text('이름을 확인해주세요');
                nameCheck.css('color', 'red');
            }
        });
        
        $('#birth, #gender').blur(function(){
        	var birthInput = $('#birth');
            var genderInput = $('#gender');
            var birthCheck = $('#birth_check');

            var birthValue = birthInput.val();
            var genderValue = genderInput.val();

            var isValidBirth = birthPattern.test(birthValue);
            var isValidGender = genderPattern.test(genderValue);

            if (isValidBirth && isValidGender) {
                birthCheck.text('');
            } else {
                birthCheck.text('올바른 생년월일(YYMMDD)과 성별(1~4)을 입력해주세요');
                birthCheck.css('color', 'red');
            }
        });
        
        $('#selNum').blur(function(){
            var selNumInput = $(this);
            var selNumCheck = $('#selNum_check');
            var btnGetANum = $('#btn_get_aNum');
            
            if(selNumPattern.test(selNumInput.val())) {
                selNumCheck.text('');
                btnGetANum.prop('disabled', false); // 유효성 검사 통과 시 버튼 활성화
                btnGetANum.css('cursor', 'pointer');
            } else {
                selNumCheck.text('올바른 핸드폰 번호 형식이 아닙니다.');
                selNumCheck.css('color', 'red');
                btnGetANum.prop('disabled', true); // 유효성 검사 실패 시 버튼 비활성화
                btnGetANum.css('cursor', 'default');
            }
            
        });
        
        $('#btn_get_aNum').click(function(){
        	var selNum = $('#selNum');
        	
        	if(selNum.val() === ""){
        		alert("휴대폰 번호를 입력해주세요.");
        	} else {
        		alert("인증번호가 발송되었습니다. 인증번호를 확인해주세요.");
        	}
        });
        
        
        $('#m_id').on('input', function(){
            var idInput = $(this);
            var idCheck = $('#id_check');
            
            if(idPattern.test(idInput.val())) {
                idCheck.text('');
            } else {
                idCheck.text('이메일 형식으로 입력해주세요.');
                idCheck.css('color', 'red');
            }
        });
        
        $('#m_id').blur(function() {
            var idInput = $(this);
            var idCheck = $('#id_check');
            
            if (!idPattern.test(idInput.val())) {
                idCheck.text('이메일 형식으로 입력해주세요.');
                idCheck.css('color', 'red');
                return; // 유효성 검사 통과하지 않으면 중복 여부 체크를 하지 않음
            }
            
            var m_id = idInput.val();
            // AJAX를 사용하여 서버에 아이디 중복 여부 확인 요청을 보냄
            $.ajax({
                type: 'POST',
                url: 'checkId',  // 실제 서버의 URL을 입력
                data: { m_id: m_id },
                success: function(response) {
                    if (response === 'duplicate') {
                        idCheck.text('이미 사용 중인 아이디입니다.');
                        idCheck.css('color', 'red');
                    } else {
                        idCheck.text('사용 가능한 아이디입니다.');
                        idCheck.css('color', 'green');
                    }
                }
            });
        });
        
        $('#m_pw').blur(function(){
            var passwordInput = $(this);
            var passwordCheck = $('#pw_check');
            
            if (passwordPattern.test(passwordInput.val())) {
                passwordCheck.text('');
            } else {
                passwordCheck.text('8~12자리의 영소문자, 숫자 및 특수문자(@$!%*?&)를 포함해야 합니다.');
                passwordCheck.css('color', 'red');
            }
        });

        $('#m_pwCheck').blur(function(){
            var passwordInput = $('#m_pw');
            var passwordConfirmInput = $(this);
            var passwordConfirmCheck = $('#pw_check2');
            
            if (passwordInput.val() === passwordConfirmInput.val()) {
                passwordConfirmCheck.text('비밀번호가 일치합니다.');
            } else {
                passwordConfirmCheck.text('비밀번호가 일치하지 않습니다.');
                passwordConfirmCheck.css('color', 'red');
            }
        });
    });
   

</script>
<script>
$(document).ready(function() {
    var code2 = "";
    
    $("#btn_get_aNum").click(function() {
        var selNum = $("#selNum").val();
        
        $.ajax({
            type: "GET",
            url: "selNumCheck?selNum=" + selNum,
            cache: false,
            success: function(data) {
                if (data == "error") {
                    $("#selNum").attr("autofocus", true);
                } else {
                    $("#aNum").attr("disabled", false); // aNum 활성화
                    $("#btn_check_aNum").css("display", "inline-block");
                    $("#selNum").attr("readonly", true); // selNum 읽기 전용 처리
                    code2 = data;
                }
            }
        });
        
        return false;
    });

    $("#btn_check_aNum").click(function() {
        var enteredCode = $("#aNum").val();
        if (enteredCode === ""){
        	$("#certifiedNum_check").text("인증번호를 입력해주세요.")
        	$("#certifiedNum_check").css("color", "red");
        	return false;
        }
        if (enteredCode == code2) {
            $("#certifiedNum_check").text("인증번호가 일치합니다.");
    		$("#certifiedNum_check").css("color","green");
            $("#selNumDoubleChk").val("true");
            $("#aNum").attr("disabled", true); // aNUm 다시 비활성화
            $(".hidden_row").css("display", "table-row");
        } else {
            $("#selNumDoubleChk").val("false");
            $("#aNum").focus();
            $("#selNumDoubleChk").text("인증번호가 일치하지 않습니다.");
            $("#selNumDoubleChk").css("color", "red");
        }
        return false;
    });
});

</script>
<body>
    <form action="join_process.do" method="POST">
        <div id="div_join">
        <img src="../resources/img/로고_블랙.png" onclick="location.href='../index.do'">
            <div  id="div_box">
                <h4>회원가입</h4>
            </div>
                <table id="tbl_join">
                    <tr>
                        <td><p id="selNum_text">휴대전화 본인 인증</p>
                            <input type="checkbox">
                                <label for="All-check" id="lbl_all">본인 확인을 위한 약관 모두 동의</label>
                            <p id="lbl_allSee" class="close">보기</p>
                            <ul id="lbl_behind" style="display: none;">
                                <li>
                                    <input type="checkbox">
                                    <label>개인정보 수집 및 이용 동의</label>
                                    <a href="">보기</a>
                                </li>
                                <li>
                                    <input type="checkbox">
                                    <label>고유식별 정보 처리 동의</label>
                                    <a href="">보기</a>
                                </li>
                                <li>
                                    <input type="checkbox">
                                    <label>통신사 이용 약관</label>
                                    <a href="">보기</a>
                                </li>
                                <li>
                                    <input type="checkbox">
                                    <label>서비스 이용 약관</label>
                                    <a href="">보기</a>
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>이름</p>
                            <input type="text" name="m_name" id="m_name">
                            <div class="check" id="name_check"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>생년월일 및 성별</p>
                                <fieldset>
                                    <input type="text" name="birth" id="birth" placeholder="●●●●●●" maxlength="6">
                                    <p>-</p>
                                    <input type="text" name="gender" id="gender" placeholder="●" maxlength="1">
                                    <input type="text" id="fld_block" value="●●●●●●" disabled style="background-color: white;">
                                </fieldset>
                                <div class="check" id="birth_check"></div>
                        </td>
                    </tr>
                    <tr>
                        <td id="sel_aNum">
                            <p>휴대폰 번호</p>
                                    <input type="text" name="selNum" id="selNum" required/>
                                    <button type="button" id="btn_get_aNum" class="btn_get_aNum">인증번호 받기</button>
                                    <div class="check" id="selNum_check"></div>
                        </td>
                    </tr>
                    <tr>
                        <td id="aNum_behind">
                            <input type="text" id="aNum" disabled required/>
                            <button id="btn_check_aNum">인증하기</button>
                            <input type="hidden" id="selNumDoubleChk"/>
                            <div class="check" class="certifiedNum_check"></div>
                        </td>
                    </tr>
                    <tr class="hidden_row">
                        <td id="aNum_behind">
                            <p>아이디</p>
                            	<input type="text" name="m_id" id="m_id"><br>
                            	<div class="check" id="id_check"></div>
                    
                            <p>비밀번호</p>
                                <input type="password" name="m_pw" id="m_pw"><br>
                                <div class="check" id="pw_check"></div>
                        
                            <p>비밀번호 확인</p>
                           		<input type="password" name="m_pwCheck" id="m_pwCheck"><br>
                            	<div class="check" id="pw_check2"></div>
                        
                            <button type="submit" name="btn_join" id="btn_join">가입하기</button>
                        </td>
                     </tr>
                </table>
            </div>
    </form>
</body>
</html>