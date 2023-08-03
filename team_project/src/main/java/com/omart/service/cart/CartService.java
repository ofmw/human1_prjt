package com.omart.service.cart;

import java.util.List;

import com.omart.vo.CartVo;
import com.omart.vo.ProductVo;

public interface CartService {
	
	default List<CartVo> CartList(int m_idx) {return null;}
	default List<ProductVo> CartList_pInfo(List<CartVo> CartList) {return null;}
	default void CartUpdate_Amount(CartVo newAmount) {}
	default void addCart(CartVo cartVo) {}

}
