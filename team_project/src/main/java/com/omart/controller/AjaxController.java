package com.omart.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.omart.service.admin.AdminService;
import com.omart.service.product.ProductService;
import com.omart.service.boardfile.BoardFileService;
import com.omart.vo.BoardFileVo;
import com.omart.vo.ProductVo;

import lombok.Setter;

@RestController
public class AjaxController {
	@Setter(onMethod_={ @Autowired })
	AdminService cgCount, pdInsert;
	@Setter(onMethod_= {@Autowired})
	ProductService pdList;
	@Setter(onMethod_={ @Autowired })
	BoardFileService bfInsert, bfNotice;
	
	@GetMapping("/admin/countCategory.do")
	@ResponseBody
	public int countCategory(@RequestParam("category") String category) {
		int count = cgCount.countCategory(category);
		return count;
	}
	
	@PostMapping("/admin/insertProduct.do")
	public void insertProduct(ProductVo productVo) {
		System.out.println("인서트프로덕트");
		
		pdInsert.insertProduct(productVo);
	}
	
	@PostMapping("/insert_inquiry_process.do")
	public void insert_inquiry_process(BoardFileVo boardFileVo) {
		System.out.println("인서트");
		String viewPage = "boardFile/list_inquiry";
		
		int result = bfInsert.insertBoard(boardFileVo);
		
		if(result == 1) {
			viewPage = "redirect: join.do";
		}
//		return viewPage;
	}
	
	@PostMapping("/insert_notice_write_process.do")
	public void insert_notice_write_process(BoardFileVo boardFileVo) {
		System.out.println("아아");
		String viewPage = "boardFile/list_notice";
		
		int result = bfNotice.noticeBoard(boardFileVo);
		
		if(result == 1) {
			viewPage = "redirect: list_notice.do";
		}
//		return viewPage;
	}
	
}
