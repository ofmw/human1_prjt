package com.human.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.human.vo.MemberVo;

@Repository
public class MemberDao{

	public static final String MAPPER = "com.human.MemberMapper";
	//MyBatis를 이용한 DB연결 및 작업은 SqlSession객체가 담당
	SqlSession sqlSession;
	
	//SqlSession객체는 root-context.xml에 빈으로 등록했으므로 생성자 방식으로 자동의존주입 받음
	@Autowired
	public MemberDao(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	public int checkId(String member_id) {
		return sqlSession.selectOne(MAPPER+".checkId", member_id);
	}
	
	//회원가입 처리
	public int join(MemberVo vo) {				
		return sqlSession.insert(MAPPER+".join", vo);
	}
	
	
	public MemberVo login(String member_id, String member_pw) {
		//SQL구문에 입력값이 2개이상인 경우 Map을 이용해서 입력할 수 있음
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		map.put("member_pw", member_pw);
		
		return sqlSession.selectOne(MAPPER+".login", map);
	}
	
	
	public MemberVo update(MemberVo vo) {
		int result = -1; //업데이트 실패
		result = sqlSession.update(MAPPER+".update", vo);
		MemberVo updatedVo = null;
		if(result == 1) {
			updatedVo = sqlSession.selectOne(MAPPER+".selectOne", vo.getMember_id());
		}
		
		return updatedVo;
	}
	
	public int cancel(int member_idx) {
		return sqlSession.update(MAPPER+".cancel", member_idx);
	}
	
	
	
	
	
	

}
