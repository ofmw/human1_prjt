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
	  
	  //SqlSession객체는 root-context.xml에 빈으로 등록했으므로
	  //생성자 방식으로 자동 의존주입 받음
	  @Autowired
	  public MemberDao(SqlSession sqlSession){
	    this.sqlSession = sqlSession;
	  }
	
	  public MemberVo login(String member_id) {
			//SQL구문에 입력값이 2개 이상인 경우 Map을 이용해서 입력할 수 있음
			Map<String, String> map = new HashMap<String, String>();
			map.put("m_id", member_id);

			return sqlSession.selectOne(MAPPER+".login", map);
		}
	  
	  public MemberVo klogin(String m_id) {
			//SQL구문에 입력값이 2개 이상인 경우 Map을 이용해서 입력할 수 있음
		  	System.out.println("멤버DAO: " +m_id);
			Map<String, String> map = new HashMap<String, String>();
			map.put("m_id", m_id);

			return sqlSession.selectOne(MAPPER+".klogin", map);
	  }
	  
	//회원가입 처리
		public int join(MemberVo vo) {	
			return sqlSession.insert(MAPPER+".join", vo);
		}
	  

	
}
