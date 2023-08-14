package com.omart.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.omart.vo.ProductVo;
import com.omart.vo.WishVo;

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
	
	public List<ProductVo> saleList(){
		return sqlSession.selectList(MAPPER+".saleList");
	}
	
	public List<ProductVo> newList(){
		return sqlSession.selectList(MAPPER+".newList");
	}
	
	public ProductVo getProduct(String p_id) {
		return sqlSession.selectOne(MAPPER+".getProduct", p_id);
	}
	
	//찜목록 추가
	public int addWishList(int m_idx, String p_id) {
		
		System.out.println("addWishList 메서드 실행");
		Map<String, Object> target = new HashMap<>();
		target.put("m_idx", m_idx);
		target.put("p_id", p_id);
		
		return sqlSession.update(MAPPER+".addWishList", target);
	}
	
	//찜목록 삭제
	public int removeWishList(int m_idx, String p_id) {
		
		Map<String, Object> target = new HashMap<>();
		target.put("m_idx", m_idx);
		target.put("p_id", p_id);
		
		return sqlSession.update(MAPPER+".removeWishList", target);
	}
	
	public void updateTotalSales(ProductVo pVo) {
		sqlSession.update(MAPPER+".updateTotalSales", pVo);
	}
	
	public int checkReview(ProductVo pVo) {
		return sqlSession.selectOne(MAPPER+".checkReview", pVo);
	}
	
}
