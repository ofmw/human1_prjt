package com.omart.service.kakao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omart.dao.MemberDao;

import lombok.Setter;

@Service("kCancel")
public class KakaoCancelService implements KakaoService {
	
	@Setter(onMethod_={ @Autowired })
	private MemberDao dao;
	
	//카카오 연결계정 해제
	public int kakaoUnlink(String access_token) {
		
		//회원탈퇴 API URL
		String reqURL = "https://kapi.kakao.com/v1/user/unlink";
		int unlink_result = 0;
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");

			//요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_token);
			
			//요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
				unlink_result = 1;
			}
			System.out.println("response body : " + result);

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return unlink_result;
	}

	//카카오 회원 탈퇴
	public int kakaoCancel(String access_token, int m_idx) {

		int return_value = 0;
		int unlink_result = kakaoUnlink(access_token);
		
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