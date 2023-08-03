package com.omart.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.omart.service.admin.AdminService;
import com.omart.service.boardfile.BoardFileService;
import com.omart.service.product.ProductService;
import com.omart.vo.BoardFileVo;
import com.omart.vo.ProductVo;

import lombok.Setter;

@RestController
public class AjaxController {
	@Setter(onMethod_={ @Autowired })
	private AdminService cgCount, pdInsert;
	@Setter(onMethod_= {@Autowired})
	private ProductService pdList;
	@Setter(onMethod_={ @Autowired })
	BoardFileService bfInsert;
	
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
	
	@PostMapping("/boardFile/insert_inquiry_process.do")
	public void insert_inquiry_process(BoardFileVo boardFileVo) {
		String viewPage = "boardFile/list_inquiry";
		
		int result = bfInsert.insertInquiry(boardFileVo);
		
		if(result == 1) {
			viewPage = "redirect: list_faq_member.do";
		}
//		return viewPage;
	}
	
	@PostMapping("/boardFile/insert_notice_write_process.do")
	public void insert_notice_write_process(BoardFileVo boardFileVo) {
		String viewPage = "boardFile/list_notice";
		
		int result = bfInsert.insertNotice(boardFileVo);
		
		if(result == 1) {
			viewPage = "redirect: list_notice.do";
		}
//		return viewPage;
	}
	
	@PostMapping("/boardFile/insert_faq_write_process.do")
    public String insert_faq_write_process(BoardFileVo boardFileVo) {
        bfInsert.insertFaq(boardFileVo);
        return "boardFile/list_faq_write"; // 글 저장에 실패한 경우 다시 글 작성 페이지로 이동
    }

	@PostMapping("/boardFile/insert_event_write_process.do")
	public void insert_event_write_process(@RequestPart(value="attachedFile",required = false)  MultipartFile attachedFile, String title, 
			String period, String content,  HttpServletRequest request) {
		System.out.println("insert_event_write_process실행");
		System.out.println(attachedFile.getOriginalFilename());

		bfInsert.insertEvent(attachedFile, title, period, content, request);
		
	}
	
}
