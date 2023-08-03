package com.omart.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.omart.vo.MemberVo;
import com.omart.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AdminDao{
	
	public static final String MAPPER = "com.omart.AdminMapper";
	
	private final SqlSession sqlSession;
	
	public int countCategory(@Param("category") String category) {
		return sqlSession.selectOne(MAPPER+".countCategory", category);
	};
	
	public int insertProduct(ProductVo productVo) {
		
		return sqlSession.insert(MAPPER+".insertProduct", productVo);
	};
	
	public int editProduct(ProductVo productVo) {
		return sqlSession.update(MAPPER+".editProduct", productVo);
	}
	
	public int stateChangeTrue(String p_id) {
		return sqlSession.update(MAPPER+".stateChangeTrue", p_id);
	};
	
	public int stateChangeFalse(String p_id) {
		return sqlSession.update(MAPPER+".stateChangeFalse", p_id);
	};
	
	public int deleteProduct(String p_id) {
		return sqlSession.update(MAPPER+".deleteProduct", p_id);
	}
	
	public List<MemberVo> memberList(){
		
		return sqlSession.selectList(MAPPER+".memberList");
	};
	
	public List<MemberVo> adminList(){
		
		return sqlSession.selectList(MAPPER+".adminList");
	};
	
	public int createAccount(MemberVo memberVo) {
		System.out.println("dao에 넘어온 m_id: " + memberVo.getM_id());
		return sqlSession.insert(MAPPER+".createAccount", memberVo);
	};
	
	public int checkAccount(String m_id) {
		return sqlSession.selectOne(MAPPER+".checkAccount", m_id);
	};
	
	public int getAccount(String m_id) {
		return sqlSession.selectOne(MAPPER+".getAccount", m_id);
	};	
	
}
