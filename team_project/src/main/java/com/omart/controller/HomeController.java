package com.omart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.omart.service.product.ProductService;
import com.omart.vo.ProductVo;

import lombok.Setter;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Setter(onMethod_= {@Autowired})
	private ProductService pdList;
	
	//임시로 메인페이지에 상품 리스트 불러오는 메서드
	@GetMapping("/")
	public String home(Model model) {
		
		List<ProductVo> productList = pdList.ProductList();
		model.addAttribute("productList", productList);
		
		return "index";/* 뷰의 이름 */
	}
	
	@GetMapping("boardFile/list_inquiry")
	public String home2() {

		return "boardFile/list_inquiry";/* 뷰의 이름 */
	}

	@GetMapping("/index.do")
	public String index() {
		return "index";/* 뷰의 이름 */
	}
	
}
