package com.omart.service.naver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omart.dao.MemberDao;

import lombok.Setter;

@Service("nCancel")
public class NaverCancelService implements NaverService {
	
	@Setter(onMethod_={ @Autowired })
	private MemberDao dao;
	
	public int naverUnlink(String access_token) {
		
		/* access token을 만료시켜 네이버 연결된 서비스에서 연결 해제하는 개념 */
		
		//회원탈퇴 API 요청 URL
		int unlink_result = 0;
	    String reqURL = "https://nid.naver.com/oauth2.0/token?grant_type=delete"
	    		+"&client_id=AdI9mtwo_qO9HcI4nYXD"
	    		+"&client_secret=nDB_gIvsk8"
	    		+"&access_token=" +access_token
	    		+"&service_provider=NAVER";
	    
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	            unlink_result = 1;
	        }
	        
	        //로그아웃 요청 결과 출력
	        System.out.println("response body : " + result);
	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
		
		return unlink_result;
	}

	//카카오 회원 탈퇴
	public int naverCancel(String access_token, int m_idx) {

		int return_value = 0;
		int unlink_result = naverUnlink(access_token);
	        
        if (unlink_result != 0) {
			int cancel_result = dao.cancel(m_idx);
			
			if (cancel_result != 0) {
				return_value = cancel_result;
			} else {
				return_value = 0;
			}
		}
		
		return return_value;
		
	}
	
}