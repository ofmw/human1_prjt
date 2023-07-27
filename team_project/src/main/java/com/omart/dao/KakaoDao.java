package com.omart.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omart.vo.KakaoVo;

@Repository
public class KakaoDao {
	
	public static final String MAPPER = "com.omart.MemberMapper";
	//MyBatis를 이용한 DB 연결 및 작업은 SqlSession객체가 담당함
	SqlSession sqlSession;

	//SqlSession객체는 root-context.xml에 빈으로 등록했으므로
	//생성자 방식으로 자동 의존주입 받음
	@Autowired
	public KakaoDao(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	// 정보 확인
	public KakaoVo findkakao(HashMap<String, Object> userInfo) {
		System.out.println("RN:"+userInfo.get("nickname"));
		System.out.println("RE:"+userInfo.get("email"));
		KakaoVo vo = sqlSession.selectOne(MAPPER+".klogin", userInfo);
		vo.setPlatform("kakao");
		return vo;
	}
	
	// 정보 저장
	public void kakaoinsert(HashMap<String, Object> userInfo) {
		sqlSession.insert(MAPPER+".kjoin", userInfo);
	}



}