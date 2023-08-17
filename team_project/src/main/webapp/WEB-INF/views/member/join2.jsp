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

   
</style>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.js"></script>

<!--  <script>
        $(function () {
        	
        	var selNum;
        	
            $("#btn_get_aNum").click(function () {
            	var selNum = $("#selNum").val();
            	
                $.ajax({
                    type: "POST",
                    url: "join/sms", // 해당 URL은 실제 컨트롤러의 엔드포인트에 맞게 수정해야 합니다.
                    data: {
                        selNum: selNum // 실제 전화번호로 대체해야 합니다.
                    },
                    success: function (data) {
                        $("#selNum_check").text("SMS가 성공적으로 전송되었습니다.");
                        console.log("성공!");
                    },
                    error: function (error) {
                        $("#selNum_check").text("SMS 전송에 실패하였습니다.");
                        console.log("실패");
                    }
                });
                console.log("번호값: " + selNum);
            });
        });
</script> -->

<script>
$(document).ready(function() {
    var code2 = "";
    
    $("#phoneChk").click(function() {
        alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
        var phone = $("#phone").val();
        
        $.ajax({
            type: "GET",
            url: "selNumCheck?selNUm=" + selNum,
            cache: false,
            success: function(data) {
                if (data == "error") {
                    alert("휴대폰 번호가 올바르지 않습니다.");
                    $("#selNum").attr("autofocus", true);
                } else {
                    $("#aNum").attr("disabled", false); // aNum 활성화
                    $("#btn_check_aNum").css("display", "inline-block");
                    $("#selNUm").attr("readonly", true); // selNum 읽기 전용 처리
                    code2 = data;
                }
            }
        });
        
        return false;
    });

    $("#phoneChk2").click(function() {
        var enteredCode = $("aNum").val();
        if (enteredCode == code2) {
            alert("인증번호가 일치합니다.");
            $("#certifiedNum_check").text("인증번호가 일치합니다.");
    		$("#certifiedNum_check").css("color","green");
            $("#selNumDoubleChk").val("true");
            $("#aNum").attr("disabled", true); // aNUm 다시 비활성화
        } else {
            $("#selNumDoubleChk").val("false");
            $("#aNUm").focus();
        }
        return false;
    });
});


</script>
<body>
    <form>
        <div id="div_join">
        
	<table>
                    <tr class="mobileNo">
	<th>
		<label for="phone">휴대폰 번호</label>
	</th>
	<td>
		<p>
			<input id="phone" type="text" name="phone" title="전화번호 입력" required/>
			<button id="phoneChk" class="doubleChk">인증번호 보내기</button><br/>
			<input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled required/>
			<button id="phoneChk2" class="doubleChk">본인인증</button>
			<span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
			<input type="hidden" id="phoneDoubleChk"/>
		</p>
		<p class="tip">
			최초 가입 시에만 사용하고 있습니다. 따로 저장되지 않습니다.(번호만 입력해주세요.)
		</p>
	</td>
</tr>
                </table>
            </div>
    </form>
</body>
</html>