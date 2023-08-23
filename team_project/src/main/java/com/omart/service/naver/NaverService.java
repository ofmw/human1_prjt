package com.omart.service.naver;

import com.omart.vo.MemberVo;

public interface NaverService {

	default String getNaverAccessToken (String code) {return null;}			//엑세스 토큰 받아오는 메서드
	default MemberVo getNaverUserInfo(String access_Token) {return null;}	//회원정보 토큰 받고 파싱하는 메서드
	default void naverLogout(String access_Token) {}						//카카오 로그아웃 메서드
	default int naverUnlink(String access_token) {return 0;}
	default int naverCancel(String access_token, int m_idx) {return 0;}
	
}