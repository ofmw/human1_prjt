package com.omart.service.cart;

import java.util.List;

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
	
	public List<CartVo> CartUpdate_List(CartVo newAmount) {
		System.out.println("서비스까지");
		return dao.CartUpdate_List(newAmount);
	}
	
	
}
