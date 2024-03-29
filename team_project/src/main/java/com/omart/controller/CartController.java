package com.omart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.omart.service.cart.CartService;
import com.omart.vo.AddressVo;
import com.omart.vo.CartVo;
import com.omart.vo.MemberVo;

import lombok.Setter;

@Controller
@RequestMapping("**/cart")
public class CartController {
	
	@Setter(onMethod_= {@Autowired})	
	private CartService cList, cAdd, cAddress;
	
	//장바구니
	@GetMapping("/cart.do")
	public String cart(Model model, HttpSession session) {
		
		MemberVo member = (MemberVo) session.getAttribute("member");
		if(member != null) {
			int m_idx = member.getM_idx();
			
			List<CartVo> CartList = cList.CartList(m_idx);
			List<AddressVo> AddressList = cAddress.AddressList(m_idx);
			
			// post_state가 1이 아닌 제품 제거
			CartList.removeIf(product -> product.getPost_state() != 1);
			
			model.addAttribute("CartList", CartList);
			model.addAttribute("AddressList", AddressList);

		}

		return "cart/cart";
	}	
	
	@GetMapping("cart/cart.do")
	public String cart2() {
		return "/cart";
	}
	
	@GetMapping("/manage_address.do")
	public String change_address(@RequestParam("m_idx") String m_idx, @RequestParam("page") String page, Model model) {
		
		List<AddressVo> AddressList = cAddress.AddressList(Integer.parseInt(m_idx));
		
		model.addAttribute("m_idx", m_idx);
		model.addAttribute("page", page);
		model.addAttribute("AddressList", AddressList);
		
		return "redirect:/mypage/manage_address.do";
	}
	
	@GetMapping("/index.do")
	public String index() {
		System.out.println("CartController index() 실행");
		
		return "redirect:/index.do";/* 뷰의 이름 */
	}
	
	
}