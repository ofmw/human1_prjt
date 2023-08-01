package com.omart.dao;


import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omart.vo.MemberVo;

@Repository
public class MemberDao{
	
	public static final String MAPPER = "com.omart.MemberMapper";
	//MyBatis를 이용한 DB 연결 및 작업은 SqlSession객체가 담당함
	private SqlSession sqlSession;
	  
	@Autowired
	public MemberDao(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	public MemberVo login(String member_id) {
	
		//SQL구문에 입력값이 2개 이상인 경우 Map을 이용해서 입력할 수 있음
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", member_id);
		
		MemberVo vo = sqlSession.selectOne(MAPPER+".login", map); 

		return sqlSession.selectOne(MAPPER+".login", map);
	}
	  
	//회원가입 처리
	public int join(MemberVo vo) {	
		return sqlSession.insert(MAPPER+".join", vo);
	}
	
}
