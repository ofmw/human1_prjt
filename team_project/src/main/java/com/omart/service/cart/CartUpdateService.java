package com.omart.service.cart;

import java.util.List;

import org.springframework.stereotype.Service;

import com.omart.dao.CartDao;
import com.omart.vo.CartVo;

import lombok.RequiredArgsConstructor;

@Service("cUpdate")
@RequiredArgsConstructor
public class CartUpdateService implements CartService {	
	
	private final CartDao dao;
	
	//장바구니 해당 품목의 수량 변경
	public void cartUpdate_Amount(CartVo newAmount) {
		dao.cartUpdate_Amount(newAmount);
	}
	
	public List<CartVo> cartUpdate_List(CartVo newAmount) {
		System.out.println("서비스까지");
		return dao.cartUpdate_List(newAmount);
	}
	
	//장바구니 해당 품목 삭제
	public void cartRemove(CartVo target) {
		System.out.println("서비스@@@@@"+target.getM_idx());
		System.out.println("서비스@@@@@"+target.getP_id());
		dao.cartRemove(target);
	}
	
	//장바구니 선택된 품목 삭제
	public void cartRemove2(List<CartVo> target) {
//		System.out.println("서비스@@@@@"+target.get[0].getM_idx());
//		System.out.println("서비스@@@@@"+target.getP_id());
		dao.cartRemove2(target);
	}
	
	
}