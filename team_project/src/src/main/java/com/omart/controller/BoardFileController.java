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
	BoardFileService bfList, bfInsert;
	
	//FAQ 회원 페이지
	@GetMapping("/list_faq_member.do")
    public String list_faq_member(Model model) {
        List<BoardFileVo> faqList = bfList.getAllFaqes();
        model.addAttribute("faqList", faqList);
        return "boardFile/list_faq_member";
    }
	//FAQ 주문/결제/배송 페이지
	@GetMapping("/list_faq_order.do")
    public String list_faq_order(Model model) {
        List<BoardFileVo> faqList = bfList.getAllFaqes();
        model.addAttribute("faqList", faqList);
        return "boardFile/list_faq_order";
    }
	//FAQ 취소/환불 페이지
	@GetMapping("/list_faq_cancel.do")
    public String list_faq_cancel(Model model) {
        List<BoardFileVo> faqList = bfList.getAllFaqes();
        model.addAttribute("faqList", faqList);
        return "boardFile/list_faq_cancel";
    }
	//FAQ 반품/교환 페이지
	@GetMapping("/list_faq_return.do")
    public String list_faq_return(Model model) {
        List<BoardFileVo> faqList = bfList.getAllFaqes();
        model.addAttribute("faqList", faqList);
        return "boardFile/list_faq_return";
    }
	//FAQ 기타 페이지
	@GetMapping("/list_faq_other.do")
    public String list_faq_other(Model model) {
        List<BoardFileVo> faqList = bfList.getAllFaqes();
        model.addAttribute("faqList", faqList);
        return "boardFile/list_faq_other";
    }
	//FAQ 글 등록
	@GetMapping("/list_faq_write.do")
	public String list_faq_write() {
		return "boardFile/list_faq_write";
	}
	//공지사항 페이지
	@GetMapping("/list_notice.do")
	public String showNoticeList(Model model) {
		List<BoardFileVo> noticeList = bfList.getAllNotices();
		model.addAttribute("noticeList", noticeList);
		return "boardFile/list_notice";
	}
	//공지사항 등록
	@GetMapping("/list_notice_write.do")
	public String list_notice_write() {
		return "boardFile/list_notice_write";
	}
	//1:1문의등록
	@GetMapping("/list_inquiry.do")
	public String list_inquiry() {
		return "boardFile/list_inquiry";
	}
	//이벤트 페이지
	@GetMapping("/list_event.do")
	public String list_event(Model model) {
		List<BoardFileVo> eventList = bfList.getAllEvents();
		model.addAttribute("eventList", eventList);
		return "boardFile/list_event";	
	}
	//이벤트 글 등록
	@GetMapping("/list_event_write.do")
	public String list_event_write() {
		return "boardFile/list_event_write";
	}
	
}
