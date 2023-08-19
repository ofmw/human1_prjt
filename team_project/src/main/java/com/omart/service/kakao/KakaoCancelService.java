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

	//카카오 회원 탈퇴
	public int kakaoCancel(String access_Token, int m_idx) {

		/* 카카오 연결된 계정에서 해당 사이트 해제하는 개념 */
		
		//회원탈퇴 API URL
		String reqURL = "https://kapi.kakao.com/v1/user/unlink";
		int return_value = 0;
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");

			//요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			
			//요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			
			if (result != null) {
				int cancel_result = dao.cancel(m_idx);
				
				if (cancel_result != 0) {
					return_value = cancel_result;
				} else {
					return_value = 0;
				}
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return return_value;
		
	}
	
}