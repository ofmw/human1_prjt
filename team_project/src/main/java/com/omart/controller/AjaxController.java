package com.omart.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.omart.service.admin.AdminService;
import com.omart.service.boardfile.BoardFileService;
import com.omart.service.member.MemberService;
import com.omart.service.product.ProductService;
import com.omart.vo.BoardFileVo;
import com.omart.vo.MemberVo;
import com.omart.vo.ProductVo;

import lombok.Setter;

@RestController
public class AjaxController {
	@Setter(onMethod_={ @Autowired })
	private AdminService cgCount, pdInsert, pdEdit, pdChange, pdDelete, acCreate, acCheck, odChange;
	@Setter(onMethod_= {@Autowired})
	private ProductService pdList;	
	@Setter(onMethod_={ @Autowired })
	private BoardFileService bfInsert, bfList, bfState;
	@Setter(onMethod_= {@Autowired})
	private MemberService mLogin;

	
	@GetMapping("/admin/countCategory.do")
	@ResponseBody
	public int countCategory(@RequestParam("category") String category) {
		int count = cgCount.countCategory(category);
		return count;
	}
	
	@PostMapping("/admin/insertProduct.do")
	public void insertProduct(ProductVo productVo, @RequestParam("thumbnail") MultipartFile thumbnail, HttpServletRequest request) {		
		pdInsert.insertProduct(productVo, thumbnail, request);
	}
	
	@PostMapping("/admin/editProduct.do")
	public void editProduct(ProductVo productVo, @RequestParam("thumbnail") MultipartFile thumbnail, HttpServletRequest request) {
		System.out.println("컨트롤러 fileCheck: "+thumbnail);
		pdEdit.editProduct(productVo, thumbnail, request);
	}
	
	@PostMapping("/admin/productStateTrue.do")
	public void productStateTrue(@RequestParam("checkedProducts[]") String[] checkedProducts) {
		for(String p_id : checkedProducts) {
			pdChange.productStateTrue(p_id);
		}
	}
	
	@PostMapping("/admin/productStateFalse.do")
	public void productStateFalse(@RequestParam("checkedProducts[]") String[] checkedProducts) {
		for(String p_id : checkedProducts) {
			pdChange.productStateFalse(p_id);
		}
	}
	
	@PostMapping("/admin/deleteProduct.do")
	public void deleteProduct(@RequestParam("checkedProducts[]") String[] checkedProducts) {
		for(String p_id : checkedProducts) {
			pdDelete.deleteProduct(p_id);
		}
	}
	
	@PostMapping("/admin/changeOrderState.do")
	public void changeOrderState(@RequestParam("checkedOrders[]") String[] checkedOrders) {
		for(String order_idx : checkedOrders) {
			odChange.changeOrderState(order_idx);
		}
	}
	
	@PostMapping("/admin/sessionInfo.do")
	public ResponseEntity<Map<String, Object>> getSessionInfo(HttpSession session) {
        long startTime = (long) session.getAttribute("startTime"); // 세션의 시작 시간 가져오기
        int maxInactiveInterval = session.getMaxInactiveInterval(); // 세션의 최대 유지 시간(초) 가져오기
        long expirationTime = startTime + (maxInactiveInterval * 1000); // 세션 만료 시간 계산
        long currentTime = System.currentTimeMillis();
        long remainingTime = expirationTime - currentTime;

        Map<String, Object> response = new HashMap<>();
        response.put("remainingTime", remainingTime);

        return ResponseEntity.ok(response);
    }
	
	@PostMapping("/admin/extendSession.do")
	public ResponseEntity<String> extendSession(HttpSession session) {
		System.out.println("세션연장 메소드");
        try {
            // 세션 연장을 위해 현재 세션의 유효 시간을 1시간으로 설정
            session.setMaxInactiveInterval(3600);
            return ResponseEntity.ok("세션이 연장되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("세션 연장에 실패하였습니다.");
        }
    }
	
	@PostMapping("/boardFile/insert_inquiry_process.do")
	public void insert_inquiry_process(BoardFileVo boardFileVo) {
		String viewPage = "boardFile/list_inquiry";
		
		int result = bfInsert.insertInquiry(boardFileVo);
		
		if(result == 1) {
			viewPage = "redirect: list_inquiry.do";
		}
//		return viewPage;
	}
	
	@PostMapping("/admin/insert_inquiry_answer_process.do")
	public void insert_inquiry_answer_process(BoardFileVo boardFileVo) {
		String viewPage = "admin/inquiry";
		
		int result = bfInsert.insertInquiryAnswer(boardFileVo);
		
		if(result == 1) {
			viewPage = "redirect:inquiry.do";
		}
		
     //	return viewPage;
	}
	
	@PostMapping("/admin/insert_qna_answer_process.do")
	public void insert_qna_answer_process(BoardFileVo boardFileVo) {
		String viewPage = "admin/inquiry";
		
		int result = bfInsert.insertQnaAnswer(boardFileVo);
		
		if(result == 1) {
			viewPage = "redirect:inquiry.do";
		}
     //	return viewPage;
	}
	
	@PostMapping("/admin/changeInquiryState")
    @ResponseBody
    public Map<String, Object> changeInquiryState(@RequestParam("b_idx") int b_idx) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            bfState.changeInquiryState(b_idx);  // 상태 변경 메서드 호출
            response.put("success", true);
        } catch (Exception e) {
            response.put("success", false);
            response.put("error", e.getMessage());
        }
        
        return response;
    }

	@PostMapping("/admin/changeQnaState")
    @ResponseBody
    public Map<String, Object> changeQnaState(@RequestParam("b_idx") int b_idx) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            bfState.changeQnaState(b_idx);  // 상태 변경 메서드 호출
            response.put("success", true);
        } catch (Exception e) {
            response.put("success", false);
            response.put("error", e.getMessage());
        }
        
        return response;
    }
	
	
	@PostMapping("/admin/createAccount.do")
	public void createAccount(MemberVo memberVo) {
		System.out.println("controller에 넘어온 m_id: " + memberVo.getM_id());
		
		acCreate.createAccount(memberVo);
	}
	
	@PostMapping("/admin/checkAccount.do")
	public int checkAccount(String m_id) {
		
		return acCheck.checkAccount(m_id);
	}
	
	@PostMapping("/admin/getAccount.do")
	public int getAccount(String m_id) {
		
		return acCheck.getAccount(m_id);
	}
	
	@PostMapping("/admin/checkPassword.do")
	public MemberVo checkPassword(@RequestParam("m_id") String m_id, @RequestParam("m_pw") String m_pw) {
		System.out.println("체크패스워드.두 진입확인");
		return mLogin.login(m_id, m_pw);
	}

	//FAQ 글 등록
	@PostMapping("/boardFile/insert_faq_write.do")
    public String insert_faq_write(BoardFileVo boardFileVo) {
		
		bfInsert.insertFaq(boardFileVo);
			
		return "redirect:/boardFile/faq";
    }
	
	//공지사항 글 등록
	@PostMapping("/boardFile/insert_notice_write_process.do")
	public String insert_notice_write_process(BoardFileVo boardFileVo) {
		
		bfInsert.insertNotice(boardFileVo);

		return "redirect:/boardFile/notice";
	}
	
	//이벤트 글 등록
	@PostMapping("/boardFile/insert_event_write_process.do")
	public void insert_event_write_process(@RequestPart(value="attachedFile",required = false)  MultipartFile attachedFile, String title, 
			String period, String content, @RequestParam("m_idx") int m_idx,  HttpServletRequest request) {
		System.out.println(m_idx);
		System.out.println(attachedFile.getOriginalFilename());

		bfInsert.insertEvent(attachedFile, title, period, content, m_idx, request);
		
	}
	
}
