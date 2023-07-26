package com.omart.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omart.service.boardfile.BoardFileService;

import lombok.Setter;

@Controller
@RequestMapping("/boardFile")
public class BoardFileController {
	@Setter(onMethod_={ @Autowired })
	BoardFileService bfInsert;
	//1:1문의등록
	@GetMapping("/list_inquiry.do")
	public String list_inquiry() {
		return "boardFile/list_inquiry";
	}
	
	@PostMapping("/list_inquiry_process.do")
	public String list_inquiry_process(int b_idx, int m_idx, int category, String title, String content, HttpServletRequest request) {
		String viewPage = "boardFile/list_inquiry";
		
		int result = bfInsert.insertBoard(b_idx, m_idx, category, title, content, request);
		
		if(result == 1) {
			viewPage = "redirectjoin.do";
		}
		return viewPage;
	}
	
}
