package com.omart.service.kakao;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.omart.dao.KakaoDao;
import com.omart.dao.MemberDao;
import com.omart.vo.MemberVo;

import lombok.Setter;

@Service("kToken")
public class KakaoTokenService implements KakaoService {
	
	@Setter(onMethod_={ @Autowired })
	private KakaoDao kd;
	@Setter(onMethod_={ @Autowired })
	private MemberDao dao;
	
	//엑세스 토큰 얻어오는 메서드
	public String getKakaoAccessToken (String code) {
		
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token"; //카카오 로그인 엑세스 토큰 요청 URL

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setRequestProperty("charset", "utf-8");
            conn.setDoOutput(true);

            //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=96ad22b1dc5d2f8c1d217f6aa61146a0"); //TODO REST_API_KEY 입력
            sb.append("&redirect_uri=http://localhost:9090/prjt/kakaologin.do"); //TODO 인가코드 받은 redirect_uri 입력
            sb.append("&code=" + code); //인가 코드
            bw.write(sb.toString());
            bw.flush();

            //응답 코드 (통신 성공 여부. 200이면 성공)
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode(엑세스 토큰 요청) : " + responseCode);

            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            //Json 객체에 응답 객체 담기
            JsonElement element = parser.parse(result);
            
            //엑서스 토큰, 리프레쉬 토큰 추출
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return access_Token;
    }
	
	//인가 코드(엑세스 토큰)로 회원정보 토큰 얻기 및 파싱하여 데이터 추출하는 메서드
	public MemberVo getKakaoUserInfo(String access_Token) {

		//요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		//회원정보 토큰 요청 API URL
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			//요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			
			//응답 코드 (통신 성공 여부)
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode(회원정보 토큰 요청) : " + responseCode);

			//요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			//Gson 라이브러리에 포함된 클래스로 Json파싱 객체 생성
			JsonParser parser = new JsonParser();
			//Json 객체에 응답 객체 담기
			JsonElement element = parser.parse(result);
			
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			String gender = kakao_account.getAsJsonObject().get("gender").getAsString();
			String birthday = kakao_account.getAsJsonObject().get("birthday").getAsString();

			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			userInfo.put("gender", gender);
			userInfo.put("birthday", birthday);

		} catch (IOException e) {
			e.printStackTrace();
		}
		//member_kakao 테이블에서 기존 가입 정보 조회
		MemberVo result = kd.findkakao(userInfo);
		//테이블 조회 결과 (정보 없을경우 null)
		System.out.println("오마트 회원가입 정보 조회 결과(카카오): " + result);
		
		if(result==null) {
			//result가 null이면 회원가입 진행
			System.out.println("━━━━━━━━━━━━━━━━━<카카오 회원가입 요청>━━━━━━━━━━━━━━━━━");
			kd.kakaoinsert(userInfo);
			//회원가입 후 테이블 조회 재실행
			System.out.println("----------카카오 회원가입 완료 후 테이블 재조회----------");
			MemberVo vo = kd.findkakao(userInfo);
			return vo;
		}else {
			return result;
			//이미 가입되어 있으므로 MemberVo 객체 리턴
		}
	}
	
	
	//카카오 로그아웃
	public void kakaoLogout(String access_Token) {
		//로그아웃 API 요청 URL
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
//	        int responseCode = conn.getResponseCode();
//	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        //로그아웃 요청 ID 출력
	        System.out.println(result);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
}