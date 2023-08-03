package com.omart.service.cart;

import java.util.List;

import com.omart.vo.CartVo;
import com.omart.vo.ProductVo;

public interface CartService {
	
	default List<CartVo> CartList(int m_idx) {return null;}
	default List<ProductVo> cartList_pInfo(List<CartVo> CartList) {return null;}
	default void cartUpdate_Amount(CartVo newAmount) {}
	default void cartRemove(CartVo target) {}
	default void cartRemove2(List<CartVo> target) {}
	default List<CartVo> cartUpdate_List(CartVo newAmount) {return null;}

}
