package com.omart.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.omart.vo.AddressVo;
import com.omart.vo.CartVo;

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
	
	//해당 회원의 장바구니 상품의 수량 변경하기
	public void cartUpdate_Amount(CartVo newAmount) {
		sqlSession.update(MAPPER+".cartUpdate_Amount", newAmount);
	}
	
	//해당 회원의 장바구니 상품의 수량 변경하기
	public void cartRemove(CartVo target) {
		System.out.println("@@@@@"+target.getM_idx());
		System.out.println("@@@@@"+target.getP_id());
		sqlSession.delete(MAPPER+".cartRemove", target);
	}
	
	//해당 회원의 장바구니 상품의 수량 변경하기
	public void cartRemove2(List<CartVo> target) {
//		System.out.println("@@@@@"+target.getM_idx());
//		System.out.println("@@@@@"+target.getP_id());
		sqlSession.delete(MAPPER+".cartRemove2", target);
	}
	
	//해당 회원의 장바구니 상품의 상세 정보 가져오기
	public List<CartVo> cartUpdate_List(CartVo newAmount) {
		
		System.out.println("━━━━━━━━━━━━━━━━━<장바구니 조회 요청>━━━━━━━━━━━━━━━━━");
		System.out.println("요청 메서드: CartDao.cartUpdate_List");
		
		return sqlSession.selectList(MAPPER+".cartList", newAmount);
	}
	
	//해당 회원의 장바구니에 상품 추가
	public void addCart(CartVo cartVo) {
		System.out.println("cartVo:"+cartVo.getM_idx()+", "+cartVo.getP_id());
		sqlSession.insert(MAPPER+".addCart", cartVo);
	}
	
	//해당 회원의 배송지 정보 가져오기
	public List<AddressVo> AddressList(int m_idx){

		System.out.println("━━━━━━━━━━━━━━━━━<회원 배송지 조회 요청>━━━━━━━━━━━━━━━━━");
		System.out.println("요청 메서드: CartDao.AddressList");
		
		List<AddressVo> vo = sqlSession.selectList(MAPPER+".addressList", m_idx);
		if(vo != null) {
			System.out.println("꽉차있음@@@");
			System.out.println("배송지 개수"+vo.size());
		}else {
			System.out.println("비어있음@@@@@@@@@@@");
		}
		return vo;
	}
	
	public void updateDefAddress(int m_idx, String a_name) {
		
		Map<String, Object> newDefAdd = new HashMap<>();
		newDefAdd.put("m_idx", m_idx);
		newDefAdd.put("a_name", a_name);
		
		sqlSession.update(MAPPER+".updateDefAddress", newDefAdd);
	}
	
	public int checkAname(AddressVo vo) {
		return sqlSession.selectOne(MAPPER+".checkAname", vo);
	}
	
	public int checkAddr(AddressVo vo) {
		return sqlSession.selectOne(MAPPER+".checkAname", vo);
	}
	
	
	
	
	
	
	
	
}
