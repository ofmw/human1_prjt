package com.omart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.omart.service.cart.CartService;
import com.omart.vo.AddressVo;
import com.omart.vo.CartVo;

import lombok.Setter;

@RestController
@RequestMapping("/cart")
public class AjaxCartController {
	
	@Setter(onMethod_={ @Autowired })
	private CartService cUpdate, cAddress;

	@PostMapping("/update_cart_amount.do")
	public List<CartVo> updateCartAmount(@RequestParam("m_idx") int m_idx,
									@RequestParam("p_id") String p_id,
									@RequestParam("amount") int amount) {
		
		CartVo newAmount = new CartVo();
		newAmount.setM_idx(m_idx);
		newAmount.setP_id(p_id);
		newAmount.setAmount(amount);
		
		cUpdate.cartUpdate_Amount(newAmount);
		System.out.println("업데이트 성공");
		List<CartVo> updatedCart = cUpdate.cartUpdate_List(newAmount);
		System.out.println("새 값 가져오기 성공!!!: " +updatedCart);
		
		return updatedCart;
	}
	
	@PostMapping("/remove_cart.do")
	public List<CartVo> removeCart(@RequestParam("m_idx") int m_idx,
									@RequestParam("p_id") String p_id) {
		
		CartVo target = new CartVo();
		target.setM_idx(m_idx);
		target.setP_id(p_id);
		System.out.println("컨트롤러@@@@@"+target.getM_idx());
		System.out.println("컨트롤러@@@@@"+target.getP_id());
		
		cUpdate.cartRemove(target);
		System.out.println("업데이트 성공");
		List<CartVo> updatedCart = cUpdate.cartUpdate_List(target);
		System.out.println("새 값 가져오기 성공!!!: " +updatedCart);
		
		return updatedCart;
	}
	
	@PostMapping("/remove_cart2.do")
	public List<CartVo> removeCart2(@RequestParam("m_idx[]") int [] m_idx,
									@RequestParam("p_id[]") String [] p_id) {
		
		List<CartVo> target = new ArrayList<>();
		// m_idx와 p_id 배열의 길이를 확인하여 두 배열이 같은 크기로 전달되었는지 확인합니다.
	    if (m_idx.length == p_id.length) {
	        // 배열의 길이만큼 순회하며 각 배열의 값을 CartVo 객체에 담아서 List에 추가합니다.
	        for (int i = 0; i < m_idx.length; i++) {
	            CartVo cartVo = new CartVo();
	            cartVo.setM_idx(m_idx[i]);
	            cartVo.setP_id(p_id[i]);
	            target.add(cartVo);
	        }
		
		cUpdate.cartRemove2(target);
		System.out.println("업데이트 성공");
		
		CartVo vo = new CartVo();
	
		vo.setM_idx(m_idx[0]);
		
		List<CartVo> updatedCart = cUpdate.cartUpdate_List(vo);
		System.out.println("새 값 가져오기 성공!!!: " +updatedCart);
		
		return updatedCart;
		
		} else {
		    // m_idx와 p_id 배열의 길이가 다르다면 오류 처리를 수행하거나 적절히 대응합니다.
		    System.out.println("m_idx와 p_id 배열의 길이가 다릅니다.");
		    return null; // 또는 적절한 오류 처리를 수행한 후 리턴합니다.
		}
	    
	}
	
	//기본 배송지 업데이트
	@PostMapping("/update_def_address.do")
	public List<AddressVo> updateDefAddress(@RequestParam("m_idx") int m_idx,
											@RequestParam("a_name") String a_name) {
		
		cAddress.updateDefAddress(m_idx, a_name);
		return cAddress.AddressList(m_idx);
	}
	
	@PostMapping("/set_cur_address.do")
	public String updateDefAddress(@RequestParam("a_name") String a_name, HttpSession session) {
		
		session.setAttribute("current_add", a_name);
		return "success";
	}
}
