package com.omart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.omart.service.admin.AdminService;
import com.omart.vo.ProductVo;

import lombok.Setter;

@RestController
public class AjaxController {
	@Setter(onMethod_={ @Autowired })
	AdminService cgCount, pdInsert;
	
	@GetMapping("/admin/countCategory.do")
	@ResponseBody
	public int countCategory(@RequestParam("category") String category) {
		int count = cgCount.countCategory(category);
		return count;
	}
	
	@PostMapping("/admin/insertProduct.do")
	public void insertProduct(ProductVo productVo) {
		System.out.println("인서트프로덕트");
//		
//		ProductVo productVo = new ProductVo();
//		productVo.setP_id(vo.getP_id());
//		productVo.setP_name(vo.getP_name());
//		productVo.setBrand(vo.getBrand());
//		productVo.setCost(Integer.parseInt(vo.getCost()));
//		
//		
		pdInsert.insertProduct(productVo);
	}
	
	
}
