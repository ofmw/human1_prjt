package com.omart.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.omart.service.admin.AdminService;
import com.omart.service.boardfile.BoardFileService;
import com.omart.service.product.ProductService;
import com.omart.vo.BoardFileVo;
import com.omart.vo.ProductVo;

import lombok.Setter;

@RestController
public class AjaxController {
	@Setter(onMethod_={ @Autowired })
	private AdminService cgCount, pdInsert, pdEdit, pdChange, pdDelete;
	@Setter(onMethod_= {@Autowired})
	private ProductService pdList;
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
	
	@PostMapping("/admin/editProduct.do")
	public void editProduct(ProductVo productVo) {
		System.out.println("에딧프로덕트");
		
		pdEdit.editProduct(productVo);
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
		System.out.println("인서트");
		String viewPage = "boardFile/list_inquiry";
		
		int result = bfInsert.insertBoard(boardFileVo);
		
		if(result == 1) {
			viewPage = "redirect: join.do";
		}
//		return viewPage;
	}
		
	@PostMapping("/boardFile/insert_notice_write_process.do")
	public void insert_notice_write_process(BoardFileVo boardFileVo) {
		String viewPage = "boardFile/list_notice";
		
		int result = bfNotice.noticeBoard(boardFileVo);
		
		if(result == 1) {
			viewPage = "redirect: list_notice.do";
		}
//		return viewPage;
	}
	
}
