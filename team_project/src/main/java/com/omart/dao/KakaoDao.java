package com.omart.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omart.vo.MemberVo;

@Repository
public class KakaoDao {
	
	public static final String MAPPER = "com.omart.MemberMapper";
	private SqlSession sqlSession;

	@Autowired
	public KakaoDao(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	//새 가입정보 저장
	public void kakaoinsert(HashMap<String, Object> userInfo) {
		
		String gender = (String) userInfo.get("gender");
		if (gender.equals("male")) {
			userInfo.put("gender", 1);
		} else {
			userInfo.put("gender", 2);
		}
		sqlSession.insert(MAPPER+".kjoin", userInfo);
	}
	
}