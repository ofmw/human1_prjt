package com.omart.service.cart;

import java.util.List;

import com.omart.vo.AddressVo;
import com.omart.vo.CartVo;
import com.omart.vo.ProductVo;

public interface CartService {
	
	default List<CartVo> CartList(int m_idx) {return null;}
	default List<ProductVo> cartList_pInfo(List<CartVo> CartList) {return null;}
	default void cartUpdate_Amount(CartVo newAmount) {}
	default void cartRemove(CartVo target) {}
	default void cartRemove2(List<CartVo> target) {}
	default List<CartVo> cartUpdate_List(CartVo newAmount) {return null;}
	default void addCart(CartVo cartVo) {}
	default List<AddressVo> AddressList(int m_idx) {return null;}
	default List<AddressVo> updateDefAddress(int m_idx, String a_name) {return null;}

}
