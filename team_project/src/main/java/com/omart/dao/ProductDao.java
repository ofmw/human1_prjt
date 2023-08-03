package com.omart.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.omart.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ProductDao{
	
	public static final String MAPPER = "com.omart.ProductMapper";
	
	private final SqlSession sqlSession;
	
	public List<ProductVo> productList(){
		return sqlSession.selectList(MAPPER+".productList");
	}
	
	public List<ProductVo> bestList(){
		return sqlSession.selectList(MAPPER+".bestList");
	}
	
}
