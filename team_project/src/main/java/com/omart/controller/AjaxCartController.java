package com.omart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.omart.service.cart.CartService;
import com.omart.vo.CartVo;

import lombok.Setter;

@RestController
@RequestMapping("/cart")
public class AjaxCartController {
	
	@Setter(onMethod_={ @Autowired })
	private CartService cUpdate;

	@PostMapping("/update_cart_amount.do")
	public List<CartVo> updateCartAmount(@RequestParam("m_idx") int m_idx,
									@RequestParam("p_id") String p_id,
									@RequestParam("amount") int amount) {
		
		CartVo newAmount = new CartVo();
		newAmount.setM_idx(m_idx);
		newAmount.setP_id(p_id);
		newAmount.setAmount(amount);
		
		cUpdate.CartUpdate_Amount(newAmount);
		System.out.println("업데이트 성공");
		List<CartVo> updatedCart = cUpdate.CartUpdate_List(newAmount);
		System.out.println("새 값 가져오기 성공!!!: " +updatedCart);
		
		return updatedCart;
	}
}
