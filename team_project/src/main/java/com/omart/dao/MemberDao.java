package com.omart.dao;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omart.vo.MemberVo;
import com.omart.vo.WishVo;

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
		
		return sqlSession.selectOne(MAPPER+".login", map);
	}
	  
	//회원가입 처리
	public int join(MemberVo vo) {	
		return sqlSession.insert(MAPPER+".join", vo);
	}	
	
	public void insertWish(int m_idx) {
		sqlSession.insert(MAPPER+".insertWish", m_idx);
	}
	
	public List<String> getWishList(int m_idx){
		List<String> wishList = null;
				
		WishVo wVo = sqlSession.selectOne(MAPPER+".getWishList", m_idx);
		
		System.out.println("wVo: "+wVo);
		
		if(wVo != null) {			
			wishList = new ArrayList<String>();
			wishList = Arrays.asList(wVo.getW_list().split(","));
		}
		
		return wishList;
	}
	
	//포인트 조회
	public int getPoint(int m_idx) {
		int point = 0;
		
		if(sqlSession.selectOne(MAPPER+".getPoint", m_idx) != null) {
			point = sqlSession.selectOne(MAPPER+".getPoint", m_idx);
		}
		
		return point;
	}
	
	//포인트 사용
		public void setPoint(MemberVo mVo) {			
			sqlSession.update(MAPPER+".setPoint", mVo);
		}
	
}
