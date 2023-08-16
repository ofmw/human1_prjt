package com.omart.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omart.vo.MemberVo;

@Repository
public class KakaoDao {
	
	public static final String MAPPER = "com.omart.MemberMapper";
	//MyBatis를 이용한 DB 연결 및 작업은 SqlSession객체가 담당함
	private SqlSession sqlSession;

	//SqlSession객체는 root-context.xml에 빈으로 등록했으므로
	//생성자 방식으로 자동 의존주입 받음
	@Autowired
	public KakaoDao(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	//가입정보 확인
	public MemberVo findkakao(HashMap<String, Object> userInfo) {
		String email = (String) userInfo.get("email");
		System.out.println("사용자 이름 : "+userInfo.get("nickname"));
		System.out.println("사용자 이메일 : "+email);
		System.out.println("사용자 성별 : "+userInfo.get("gender"));
		MemberVo vo = sqlSession.selectOne(MAPPER+".klogin", email);
		return vo;
	}
	
	//새 가입정보 저장
	public void kakaoinsert(HashMap<String, Object> userInfo) {
		
		String gender = (String) userInfo.get("gender");
		if (gender.equals("male")) {
			userInfo.put("gender", 0);
		} else {
			userInfo.put("gender", 1);
		}
		sqlSession.insert(MAPPER+".kjoin", userInfo);
	}
	
}