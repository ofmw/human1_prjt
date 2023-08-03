package com.omart.service.cart;

import java.util.List;

import org.springframework.stereotype.Service;

import com.omart.dao.CartDao;
import com.omart.vo.CartVo;
import com.omart.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("cList")
@RequiredArgsConstructor
public class CartListService implements CartService {	
	
	private final CartDao dao;
	
	//해당 회원의 장바구니 정보 가져오기
	public List<CartVo> CartList(int m_idx) {
		
		return dao.CartList(m_idx);
	}
	
	//해당 회원의 장바구니 상품의 상세 정보 가져오기
	public List<ProductVo> CartList_pInfo(List<CartVo> CartList) {
		
		return dao.CartList_pInfo(CartList);
	}
	
}
