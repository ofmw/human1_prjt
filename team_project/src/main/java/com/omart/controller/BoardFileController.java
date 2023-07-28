package com.omart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omart.service.boardfile.BoardFileService;
import com.omart.vo.BoardFileVo;

import lombok.Setter;

@Controller
@RequestMapping("/boardFile")
public class BoardFileController {
	@Setter(onMethod_={ @Autowired })
	BoardFileService bfInsert, bfNotice;
	//1:1문의등록
	@GetMapping("/list_inquiry.do")
	public String list_inquiry() {
		return "boardFile/list_inquiry";
	}
	//공지사항 등록
	@GetMapping("/list_notice_write.do")
	public String list_notice_write(Model model) {
		List<BoardFileVo> noticeList = bfNotice.getAllNotices();
		model.addAttribute("noticeList", noticeList);
		return "list_notice.do";
	}
	
	@GetMapping("/list_notice.do")
	public String showNoticeList(Model model) {
		List<BoardFileVo> noticeList = bfNotice.getAllNotices();
		model.addAttribute("noticeList", noticeList);
		return "boardFile/list_notice";
	}
}
