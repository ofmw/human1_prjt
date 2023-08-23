package com.omart.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omart.vo.MemberVo;

@Repository
public class NaverDao {
	
	public static final String MAPPER = "com.omart.MemberMapper";
	private SqlSession sqlSession;

	@Autowired
	public NaverDao(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	//새 가입정보 저장
	public void naverInsert(HashMap<String, Object> userInfo) {
		
		String gender = (String) userInfo.get("gender");
		if (gender.equals("M")) {
			userInfo.put("gender", 1);
		} else {
			userInfo.put("gender", 2);
		}
		sqlSession.insert(MAPPER+".njoin", userInfo);
	}
	
}