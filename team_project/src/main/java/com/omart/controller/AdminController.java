package com.omart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omart.service.admin.AdminService;
import com.omart.service.product.ProductService;
import com.omart.vo.MemberVo;
import com.omart.vo.ProductVo;

import lombok.Setter;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Setter(onMethod_= {@Autowired})
	private ProductService pdList;
	@Setter(onMethod_= {@Autowired})	
	private AdminService mList;
	
	@GetMapping("/member.do")
	public String member(Model model) {
		model.addAttribute("status", "member");
		
		List<MemberVo> memberList = mList.MemberList();
		
		model.addAttribute("memberList", memberList);
		
		System.out.println(memberList.get(0).getPlatform());
		
		return "admin/admin";
	}	
	@GetMapping("/product.do")
	public String product(Model model) {
		model.addAttribute("status", "product");
		
		List<ProductVo> productList = pdList.ProductList();
		model.addAttribute("productList", productList);
		return "admin/admin";
	}		
		
}
