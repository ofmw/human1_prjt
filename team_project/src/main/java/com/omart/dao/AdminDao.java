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
	
	public List<MemberVo> memberList(){
		
		return sqlSession.selectList(MAPPER+".memberList");
	}
}
