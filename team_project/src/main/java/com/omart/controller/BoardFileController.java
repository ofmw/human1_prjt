package com.omart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	BoardFileService bfList, bfInsert;
	
	//FAQ 회원 페이지
	@GetMapping("/faq_member.do")
    public String list_faq_member(Model model) {
		model.addAttribute("status", "faq_member");
		
        List<BoardFileVo> faqList = bfList.getAllFaqes();
        
        model.addAttribute("faqList", faqList);
        
        return "boardFile/boardFile";
    }
	//FAQ 주문/결제/배송 페이지
	@GetMapping("/faq_order.do")
    public String list_faq_order(Model model) {
		model.addAttribute("status", "faq_order");
		
        List<BoardFileVo> faqList = bfList.getAllFaqes();
        
        model.addAttribute("faqList", faqList);
        
        return "boardFile/boardFile";
    }
	//FAQ 취소/환불 페이지
	@GetMapping("/faq_cancel.do")
    public String list_faq_cancel(Model model) {
		model.addAttribute("status", "faq_cancel");
		
        List<BoardFileVo> faqList = bfList.getAllFaqes();
        
        model.addAttribute("faqList", faqList);
        
        return "boardFile/boardFile";
    }
	//FAQ 반품/교환 페이지
	@GetMapping("/faq_return.do")
    public String list_faq_return(Model model) {
		model.addAttribute("status", "faq_return");
		
        List<BoardFileVo> faqList = bfList.getAllFaqes();
        
        model.addAttribute("faqList", faqList);
        
        return "boardFile/boardFile";
    }
	//FAQ 기타 페이지
	@GetMapping("/faq_other.do")
    public String list_faq_other(Model model) {
		model.addAttribute("status", "faq_other");
		
        List<BoardFileVo> faqList = bfList.getAllFaqes();
        
        model.addAttribute("faqList", faqList);
        
        return "boardFile/boardFile";
    }
	//FAQ 글 등록 페이지
	@GetMapping("/faq_write.do")
	public String faq_write(Model model) {
		model.addAttribute("status", "faq_write");
		
		return "boardFile/boardFile";
	}
	//공지사항 페이지
	@GetMapping("/notice.do")
	public String showNoticeList(Model model) {
		model.addAttribute("status", "notice");
		
		List<BoardFileVo> noticeList = bfList.getAllNotices();
		
		model.addAttribute("noticeList", noticeList);
		
		return "boardFile/boardFile";
	}
	//공지사항 등록
	@GetMapping("/notice_write.do")
	public String notice_write(Model model) {
		model.addAttribute("status", "notice_write");
		
		return "boardFile/boardFile";
	}
	//1:1문의등록
	@GetMapping("/inquiry.do")
	public String inquiry(Model model) {
		model.addAttribute("status", "inquiry");
		
		return "boardFile/boardFile";
	}
	//이벤트 페이지
	@GetMapping("/event.do")
	public String event(Model model) {
		model.addAttribute("status", "event");
		
		List<BoardFileVo> eventList = bfList.getAllEvents();
		
		model.addAttribute("eventList", eventList);
		
		return "boardFile/boardFile";	
	}
	//이벤트 글 등록
	@GetMapping("/event_write.do")
	public String event_write(Model model) {
		model.addAttribute("status", "event_write");
		
		return "boardFile/boardFile";
	}
	
}
