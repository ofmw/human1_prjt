package com.omart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {
		
	//상품페이지
	@GetMapping("/product_list.do")
	public String mypage() {
		return "product/product_list";
	}
}
