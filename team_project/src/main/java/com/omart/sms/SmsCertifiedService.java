package com.omart.sms;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class SmsCertifiedService {
	public void certifiedSelNum(String userSelNum, int randomNumber) {
		String api_key = "NCSRYBKCUWEGGA8P";
	    String api_secret = "FW7ISCVKKGAFN5SQ3ZSXOOPCK54G4V6U";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userSelNum);    // 수신전화번호
	    params.put("from", "01092370589");    // 발신전화번호
	    params.put("type", "SMS");
	    params.put("text", "[Omart] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	    
	}
}
