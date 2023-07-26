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
    #phone_text{
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
  

   
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="resources/js/hmac-sha256.js"></script>
<script type="text/javascript" src="resources/js/enc-base64.js"></script>


<script>

	function smsConfirmNum(){
		const min = 10000;
		const max = 99999;
		return Math.floor(Math.random()*(max - min +1))+min;
	}
	
	$(function(){
		
		$("#btn_get_aNum").click(function(){
			let serviceId = "ncp:sms:kr:312456196439:team";
			let accessKey = "h4BjwmodGCWHpW6lxoPj";
			let secretKey = "zLhbW5OTd6ShI0Ls4t3jTFhZff2HcyiFifkymgql";
			let selNum = $("#selNum").val();
			let content = "[Omart] 인증번호 [" + smsConfirmNum() + "]를 입력해주세요"
			let auth_code = smsConfirmNum(); //인증코드
			let url = "https://sens.apigw.ntruss.com/sms/v2/services/" + serviceId + "/messages";
			let time = Date.now().toString();
			let signature = makeSignature(url, time, accessKey, secretKey); //시그너처
			
			let requestData = {
			          type: "SMS", // 메시지 유형 SMS
			          contentType: "COMM", 
			          countryCode: "82", // 국가 코드 (한국은 82)
			          from: "01092370589", // 발신자의 전화번호
			          content: content, // 전송할 메시지 내용
			          messages: [
			            {
			              to: selNum, // 수신자의 전화번호
			              content: content // 전송할 메시지 내용
			            }
			          ]
			        };

	        $.ajax({
		          type: "POST", // POST 방식으로 서버로 요청
		          url: "https://sens.apigw.ntruss.com/sms/v2/services/" + serviceId + "/messages", // Sens API의 메시지 전송 URL
		          dataType: "jsonp",
		          contentType: "application/json; charset=utf-8", // 요청 데이터의 컨텐츠 타입
		          headers: {
		        	"x-ncp-apigw-timestamp": time,
		            "x-ncp-iam-access-key": accessKey, // 액세스 키 헤더
		            "x-ncp-apigw-signature-v2": signature
		          },
		          data: JSON.stringify(requestData), // JSON 형태로 요청 데이터 변환
		          success: function(data) { // 서버로부터 성공적인 응답을 받았을 때 실행
		            $("#result").text("SMS가 성공적으로 전송되었습니다.");
		          },
		          error: function(error) { // AJAX 통신 중 에러가 발생했을 때 실행
		            $("#result").text("SMS 전송에 실패하였습니다.");
		          }
	        });//end of ajax
		});
	});
	
	//시그너처 생성구문
	function makeSignature(url_signature, time, accessKey, s_Key) {
		var space = " ";				// one space
		var newLine = "\n";				// new line
		var method = "POST";				// method
		var url = url_signature;	// url (include query string)
		var timestamp = time;			// current timestamp (epoch)
		var accessKey = accessKey;			// access key id (from portal or Sub Account)
		var secretKey = s_Key;			// secret key (from portal or Sub Account)

		var hmac = CryptoJS.algo.HMAC.create(CryptoJS.algo.SHA256, secretKey);
		hmac.update(method);
		hmac.update(space);
		hmac.update(url);
		hmac.update(newLine);
		hmac.update(timestamp);
		hmac.update(newLine);
		hmac.update(accessKey);

		var hash = hmac.finalize();

		return hash.toString(CryptoJS.enc.Base64);
	}
			 

</script>
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
<body>
    <form action="member/join_process.do" method="POST">
        <div id="div_join">
        <img src="/resources/img/로고_블랙.png" onclick="location.href='join.do'">
            <div  id="div_box">
                <h4>회원가입</h4>
            </div>
                <table id="tbl_join">
                    <tr>
                        <td><p id="phone_text">휴대전화 본인 인증</p>
                            <input type="checkbox">
                                <label for="All-check" id="lbl_all">본인 확인을 위한 약관 모두 동의</label>
                            <p id="lbl_allSee" class="close">보기</p>
                            <ul id="lbl_behind">
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
                        </td>
                    </tr>
                    <tr>
                        <td id="sel_aNum">
                            <p>휴대폰 번호</p>
                                    <input type="text" name="selNum" id="selNum">
                                    <button type="button" id="btn_get_aNum">인증번호 받기</button>
                        </td>
                    </tr>
                    <tr>
                        <td id="aNum_behind">
                            <input type="text" id="aNum">
                            <button onclick="location.href=''">인증하기</button></td>
                    </tr>
                    <tr>
                        <td id="aNum_behind">
                            <p>아이디</p>
                            <input type="text" name="m_id" id="m_id"><br>
                    
                            <p>비밀번호</p>
                                <input type="password" name="m_pw" id="m_pw"><br>
                        
                            <p>비밀번호 확인</p>
                            <input type="password" name="m_pwCheck" id="m_pwCheck"><br>
                        
                            <button type="submit" name="btn_join" id="btn_join">가입하기</button>
                        </td>
                    </tr>
                </table>
            </div>
    </form>
</body>
</html>