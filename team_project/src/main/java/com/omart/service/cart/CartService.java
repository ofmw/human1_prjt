package com.omart.service.cart;

import java.util.List;

import com.omart.vo.AddressVo;
import com.omart.vo.CartVo;
import com.omart.vo.ProductVo;

public interface CartService {
	
	default List<CartVo> CartList(int m_idx) {return null;}
	default List<ProductVo> cartList_pInfo(List<CartVo> CartList) {return null;}
	default void cartUpdate_Amount(CartVo newAmount) {}
	default void cartRemove(List<CartVo> target) {}
	default List<CartVo> cartUpdate_List(CartVo newAmount) {return null;}
	default void addCart(CartVo cartVo) {}
	default List<AddressVo> AddressList(int m_idx) {return null;}
	default List<AddressVo> updateDefAddress(int m_idx, String a_name) {return null;}
	default int checkNewAddr(AddressVo newAddr) {return 0;}
	default int checkAddrCount(int m_idx) {return 0;}
	default void addNewAddr(AddressVo newAddr) {}
	default int deleteAddr(int m_idx, String a_name) {return 0;}
	default AddressVo getAddrInfo(int m_idx, String a_name) {return null;}
	default int checkEditAddr(AddressVo vo) {return 0;}
	default void editAddr(AddressVo vo) {}
	default void deleteCartAll(int m_idx) {}
	default int addCart2(int m_idx, String [] p_id) {return 0;}

}
