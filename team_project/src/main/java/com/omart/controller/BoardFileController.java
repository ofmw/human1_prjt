package com.omart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omart.service.boardfile.BoardFileService;
import com.omart.vo.BoardFileVo;

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
	
	
	
}
