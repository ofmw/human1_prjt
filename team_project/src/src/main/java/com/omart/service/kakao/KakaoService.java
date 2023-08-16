package com.omart.service.kakao;

import com.omart.vo.MemberVo;

public interface KakaoService {

	default String getKakaoAccessToken (String code) {return null;}			//엑세스 토큰 받아오는 메서드
	default MemberVo getKakaoUserInfo(String access_Token) {return null;}	//회원정보 토큰 받고 파싱하는 메서드
	default void kakaoLogout(String access_Token) {}						//카카오 로그아웃 메서드
	default int kakaoCancel(String access_token, int m_idx) {return 0;}
	
}