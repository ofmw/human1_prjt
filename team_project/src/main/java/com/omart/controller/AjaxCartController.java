package com.omart.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.omart.service.cart.CartService;
import com.omart.vo.AddressVo;
import com.omart.vo.CartVo;
import com.omart.vo.MemberVo;

import lombok.Setter;

@RestController
@RequestMapping("/cart")
public class AjaxCartController {
	
	@Setter(onMethod_={ @Autowired })
	private CartService cUpdate, cAddress, cAdd;
	
	//찜목록 선택 상품 장바구니 추가
	@PostMapping("/addCart.do")
	public String addCart(@RequestParam("p_id[]") String [] p_id,
			 			  HttpSession session) {
		
		System.out.println(Arrays.toString(p_id));
		System.out.println("addCart.do 요청됨");
		
		MemberVo member = (MemberVo) session.getAttribute("member");
		int m_idx = member.getM_idx();
		
		int result = cAdd.addCart2(m_idx, p_id);
		
		if (result != 0) {
			return "success";
		} else if (result == 0) {
			return "max";
		} else {
			return "fail";
		}
		
	}

	// 장바구니 품목 수량 변경
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
	
	// 장바구니에서 품목 삭제
	@PostMapping("/remove_cart.do")
	public List<CartVo> removeCart(@RequestParam("m_idx[]") int [] m_idx,
									@RequestParam("p_id[]") String [] p_id) {
		
		// Mapper에 전달할 값을 담을 List 객체 생성
		List<CartVo> target = new ArrayList<>();
		// m_idx와 p_id 배열의 길이를 대조하여 데이터 누락 여부 체크
	    if (m_idx.length == p_id.length) {
	        // 배열의 길이만큼 순회하며 각 배열의 값을 CartVo 객체에 담아서 List에 추가
	        for (int i = 0; i < m_idx.length; i++) {
	        	CartVo cartVo = new CartVo();
	        	cartVo.setM_idx(m_idx[i]);
	        	cartVo.setP_id(p_id[i]);
	        	target.add(cartVo);
	        }
		
	    // 장바구니 테이블에서 해당 품목 삭제
		cUpdate.cartRemove(target);
		
		// 업데이트된 (품목 삭제 후) 품목을 담을 장바구니 객체 생성
		CartVo vo = new CartVo();
		vo.setM_idx(m_idx[0]);
		
		// 업데이트된 장바구니 품목 조회 후 저장
		List<CartVo> updatedCart = cUpdate.cartUpdate_List(vo);
		
		return updatedCart;
		
		} else {
		    // m_idx와 p_id 배열의 길이가 다를 경우
		    System.out.println("m_idx와 p_id 배열의 길이가 일치하지 않음");
		    return null;
		}
	    
	}
	
}
