package com.omart.service.cart;

import org.springframework.stereotype.Service;

import com.omart.dao.CartDao;
import com.omart.vo.CartVo;

import lombok.RequiredArgsConstructor;

@Service("cAdd")
@RequiredArgsConstructor
public class CartAddService implements CartService {	
	
	private final CartDao dao;
	
	//해당 회원의 장바구니 정보 가져오기
	public void addCart(CartVo cartVo) {		
		dao.addCart(cartVo);
	}	
	
}
