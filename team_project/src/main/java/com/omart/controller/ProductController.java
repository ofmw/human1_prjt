package com.omart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.omart.service.product.ProductService;
import com.omart.vo.ProductVo;

import lombok.Setter;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Setter(onMethod_= {@Autowired})
	private ProductService pdList, pdInfo;
		
	//상품페이지
	@GetMapping("/product_list.do")
	public String productList(Model model) {
		
		List<ProductVo> productList = pdList.productList();
		
		model.addAttribute("productList", productList);
		
		return "product/product_list";
	}
	
	@GetMapping("/product_view.do")
	public String productView(@RequestParam("p_id") String p_id, Model model) {
		ProductVo vo = pdInfo.getProduct(p_id);
		model.addAttribute("product",vo);		
		return "product/product_view";
	}

	
	//상품페이지 -> 로그아웃
//	@GetMapping("/logout.do")
//	public String logout(HttpServletRequest request) {
//		
//		String viewPage = "redirect:/index.do";
//		HttpSession session = request.getSession();
//		session.invalidate();
//		
//		return viewPage;
//	}
}
