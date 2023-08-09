package com.omart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.omart.service.cart.CartService;
import com.omart.service.member.MemberService;
import com.omart.vo.AddressVo;
import com.omart.vo.CartVo;
import com.omart.vo.MemberVo;

import lombok.Setter;

@Controller
@RequestMapping("**/payment")
public class paymentController {
	
	@Setter(onMethod_= {@Autowired})	
	private CartService cList, cAdd, cDel, cAddress;
	@Setter(onMethod_= {@Autowired})	
	private MemberService mBenefit;
	
	//결제 페이지
	@GetMapping("/payment.do")
	public String payment(@RequestParam("requestor") String requestor, Model model, HttpSession session) {
		System.out.println("요청자: "+requestor);
		MemberVo member = (MemberVo) session.getAttribute("member");
		if(member != null) {
			int m_idx = member.getM_idx();
			
			List<CartVo> CartList = cList.CartList(m_idx);
			List<AddressVo> AddressList = cAddress.AddressList(m_idx);
			member.setPoint(mBenefit.getPoint(m_idx));
			
			model.addAttribute("CartList", CartList);
			model.addAttribute("AddressList", AddressList);
			model.addAttribute("requestor", requestor);
			
		}
		
		return "payment/payment";
	}	
	
	@PostMapping("/orderCompleted.do")
	public String orderCompleted(@RequestParam String requestor, @RequestParam int m_idx, @RequestParam String orderNum, @RequestParam String name, @RequestParam int amount, @RequestParam int point, Model model) {
		System.out.println(requestor);
		if(requestor.equals("cart")) {
			List<CartVo> OrderDetails = cList.CartList(m_idx);
			model.addAttribute("OrderDetails", OrderDetails);
			cDel.deleteCartAll(m_idx);
		}
		model.addAttribute("orderNum", orderNum);
	    model.addAttribute("orderName", name);
	    model.addAttribute("orderAmount", amount);
	    model.addAttribute("orderPoint", point);
		
		return "payment/orderCompleted";
	}
		
}
