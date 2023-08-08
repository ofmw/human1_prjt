package com.omart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omart.service.cart.CartService;
import com.omart.vo.AddressVo;
import com.omart.vo.CartVo;
import com.omart.vo.MemberVo;

import lombok.Setter;

@Controller
@RequestMapping("**/payment")
public class paymentController {
	
	@Setter(onMethod_= {@Autowired})	
	private CartService cList, cAdd, cAddress;
	
	//결제 페이지
	@GetMapping("/payment.do")
	public String payment(Model model, HttpSession session) {
		
		MemberVo member = (MemberVo) session.getAttribute("member");
		if(member != null) {
			int m_idx = member.getM_idx();
			
			List<CartVo> CartList = cList.CartList(m_idx);
			List<AddressVo> AddressList = cAddress.AddressList(m_idx);
			
			model.addAttribute("CartList", CartList);
			model.addAttribute("AddressList", AddressList);

		}
		
		return "payment/payment";
	}
		
}
