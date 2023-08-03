package com.omart.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.omart.vo.CartVo;
import com.omart.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CartDao{
	
	public static final String MAPPER = "com.omart.CartMapper";
	private final SqlSession sqlSession;
	
	//해당 회원의 장바구니 정보 가져오기
	public List<CartVo> CartList(int m_idx){

		List<CartVo> vo = sqlSession.selectList(MAPPER+".cartList", m_idx);
		if(vo != null) {
			System.out.println("꽉차있음@@@");
			System.out.println("장바구니 품목 갯수"+vo.size());
		}else {
			System.out.println("비어있음@@@@@@@@@@@");
		}
		return vo;
	}
	
	//해당 회원의 장바구니 상품의 상세 정보 가져오기
	public List<ProductVo> CartList_pInfo(List<CartVo> CartList) {
		return sqlSession.selectList(MAPPER+".CartList_pInfo", CartList);
	}
	
	//해당 회원의 장바구니 상품의 상세 정보 가져오기
	public void CartUpdate_Amount(CartVo newAmount) {
		sqlSession.update(MAPPER+".cartUpdate_Amount", newAmount);
	}
	
	public void addCart(CartVo cartVo) {
		System.out.println("cartVo:"+cartVo.getM_idx()+", "+cartVo.getP_id());
		sqlSession.insert(MAPPER+".addCart", cartVo);
	}
	
}
