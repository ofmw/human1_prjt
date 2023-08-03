package com.omart.service.cart;

import org.springframework.stereotype.Service;

import com.omart.dao.CartDao;
import com.omart.vo.CartVo;

import lombok.RequiredArgsConstructor;

@Service("cUpdate")
@RequiredArgsConstructor
public class CartUpdateAmountService implements CartService {	
	
	private final CartDao dao;
	
	//장바구니 해당 품목의 수량 변경
	public void CartUpdate_Amount(CartVo newAmount) {
		dao.CartUpdate_Amount(newAmount);
	}
	
	
}
