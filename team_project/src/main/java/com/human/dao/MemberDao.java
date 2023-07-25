package com.human.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.human.vo.MemberVo;

@Repository
public class MemberDao{
	
	  public static final String MAPPER = "com.human.MemberMapper";
	  //MyBatis를 이용한 DB 연결 및 작업은 SqlSession객체가 담당함
	  SqlSession sqlSession;
	  
	  //SqlSession객체는 root-context.xml에 빈으로 등록했으므로
	  //생성자 방식으로 자동 의존주입 받음
	  @Autowired
	  public MemberDao(SqlSession sqlSession){
	    this.sqlSession = sqlSession;
	  }
	
	//회원가입 처리
	public int join(MemberVo vo) {	
		return sqlSession.insert(MAPPER+".join", vo);
	}

	
}
