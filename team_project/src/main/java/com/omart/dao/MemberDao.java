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
import com.omart.vo.ProductVo;
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
	
	//가입회원 m_idx 조회
	public int checkM_idx(MemberVo vo) {
		return sqlSession.selectOne(MAPPER+".checkM_idx", vo);
	}
	
	public void insertWish(int m_idx) {
		sqlSession.insert(MAPPER+".insertWish", m_idx);
	}
	
	public List<String> getWishList(int m_idx){
		List<String> wishList = null;
				
		WishVo wVo = sqlSession.selectOne(MAPPER+".getWishList", m_idx);
		
		System.out.println("wVo: "+wVo);
		
		if(wVo.getW_list() != null) {
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
		
	//찜목록 조회
	public List<ProductVo> getP_info(List<String> wish) {
		
		return sqlSession.selectList(MAPPER+".getP_info", wish);
	}
	
	//찜목록 삭제
	public int removeWishList(int m_idx, String [] p_id) {
		
		System.out.println("회원번호: " +m_idx);
		System.out.println("삭제할 품목 번호: " +Arrays.toString(p_id));
		String modified = String.join(",", p_id);
		System.out.println("변환된 품목 번호: " +modified);
		
		int result = 0;
		
		for (int i=0; i<p_id.length; i++) {
			Map<String, Object> target = new HashMap<>();
			target.put("p_id", p_id[i]);
			target.put("m_idx", m_idx);
			
			System.out.println("삭제 시도 p_id: " +target.get("p_id"));
			
			
			result += sqlSession.update(MAPPER+".removeWishList", target);
			System.out.println("실행된 행 갯수 누적: " +result);
		}
		
		return result; 
	}
	
	public void recordLogin(int m_idx) {
		sqlSession.update(MAPPER+".recordLogin", m_idx);
	}
	
}
