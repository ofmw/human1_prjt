package com.omart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omart.service.cart.CartService;
import com.omart.vo.CartVo;
import com.omart.vo.MemberVo;
import com.omart.vo.ProductVo;

import lombok.Setter;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Setter(onMethod_= {@Autowired})	
	private CartService cList;
	
	//장바구니
	@GetMapping("/cart.do")
	public String cart(Model model, HttpSession session) {
		
		MemberVo member = (MemberVo) session.getAttribute("member");
		if(member != null) {
			int m_idx = member.getM_idx();
			
			List<CartVo> CartList = cList.CartList(m_idx);
			
			model.addAttribute("CartList", CartList);
			
//			if(CartList != null) {
//				
//				List<ProductVo> CartList_pInfo = cList.CartList_pInfo(CartList);
//				model.addAttribute("CartList", CartList);
//				model.addAttribute("CartList", CartList_pInfo);
//			}

		}

		return "cart/cart";
	}
	
	@GetMapping("cart/cart.do")
	public String cart2() {
		return "/cart";
	}
	
	@GetMapping("/index.do")
	public String index() {
		
		return "redirect:/index.do";/* 뷰의 이름 */
	}
}