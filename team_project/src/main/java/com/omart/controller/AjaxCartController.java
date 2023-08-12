package com.omart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.omart.service.cart.CartService;
import com.omart.vo.AddressVo;
import com.omart.vo.CartVo;

import lombok.Setter;

@RestController
@RequestMapping("/cart")
public class AjaxCartController {
	
	@Setter(onMethod_={ @Autowired })
	private CartService cUpdate, cAddress;

	// 장바구니 품목 수량 변경
	@PostMapping("/update_cart_amount.do")
	public List<CartVo> updateCartAmount(@RequestParam("m_idx") int m_idx,
									@RequestParam("p_id") String p_id,
									@RequestParam("amount") int amount) {
		
		CartVo newAmount = new CartVo();
		newAmount.setM_idx(m_idx);
		newAmount.setP_id(p_id);
		newAmount.setAmount(amount);
		
		cUpdate.cartUpdate_Amount(newAmount);
		System.out.println("업데이트 성공");
		List<CartVo> updatedCart = cUpdate.cartUpdate_List(newAmount);
		System.out.println("새 값 가져오기 성공!!!: " +updatedCart);
		
		return updatedCart;
	}
	
	// 장바구니에서 품목 삭제
	@PostMapping("/remove_cart.do")
	public List<CartVo> removeCart(@RequestParam("m_idx[]") int [] m_idx,
									@RequestParam("p_id[]") String [] p_id) {
		
		// Mapper에 전달할 값을 담을 List 객체 생성
		List<CartVo> target = new ArrayList<>();
		// m_idx와 p_id 배열의 길이를 대조하여 데이터 누락 여부 체크
	    if (m_idx.length == p_id.length) {
	        // 배열의 길이만큼 순회하며 각 배열의 값을 CartVo 객체에 담아서 List에 추가
	        for (int i = 0; i < m_idx.length; i++) {
	        	CartVo cartVo = new CartVo();
	        	cartVo.setM_idx(m_idx[i]);
	        	cartVo.setP_id(p_id[i]);
	        	target.add(cartVo);
	        }
		
	    // 장바구니 테이블에서 해당 품목 삭제
		cUpdate.cartRemove(target);
		
		// 업데이트된 (품목 삭제 후) 품목을 담을 장바구니 객체 생성
		CartVo vo = new CartVo();
		vo.setM_idx(m_idx[0]);
		
		// 업데이트된 장바구니 품목 조회 후 저장
		List<CartVo> updatedCart = cUpdate.cartUpdate_List(vo);
		
		return updatedCart;
		
		} else {
		    // m_idx와 p_id 배열의 길이가 다를 경우
		    System.out.println("m_idx와 p_id 배열의 길이가 일치하지 않음");
		    return null;
		}
	    
	}
	
	//기본 배송지 업데이트
	@PostMapping("/update_def_address.do")
	public List<AddressVo> updateDefAddress(@RequestParam("m_idx") int m_idx,
											@RequestParam("a_name") String a_name) {
		
		// 기본 배송지 업데이트
		cAddress.updateDefAddress(m_idx, a_name);
		// 업데이트된 배송지 목록 조회 및 반환
		return cAddress.AddressList(m_idx);
	}
	
	//현재 주문 배송지로 설정
	@PostMapping("/set_cur_address.do")
	public String updateCurAddress(@RequestParam("a_name") String a_name, HttpSession session) {
		
		session.setAttribute("current_add", a_name);
		return "success";
	}
	
	//배송지 삭제
	@PostMapping("/delete_address.do")
	public String delete_address(@RequestParam("m_idx") int m_idx,
								 @RequestParam("a_name") String a_name,
								 HttpSession session) {
		int result = cAddress.deleteAddr(m_idx, a_name);
		
		if (result != 0) {
			System.out.println("m_idx가 " +m_idx+ " 인 회원의 배송지 [" +a_name+ "] 삭제 완료");
			return "success";
		} else {
			return "fail";
		}
	}
	
	//배송지 추가
	@PostMapping("/checkNewAddr.do")
	public int checkNewAddr(@RequestParam("m_idx") int m_idx,
						    @RequestParam("a_name") String a_name,
						    @RequestParam("receiver") String receiver,
						    @RequestParam("selnum") String selnum,
						    @RequestParam("postnum") String postnum,
						    @RequestParam("roadAddr") String roadAddr,
						    @RequestParam("jibunAddr") String jibunAddr,
						    @RequestParam("detail") String detail) {
		
		AddressVo vo = new AddressVo();
		vo.setM_idx(m_idx);
		vo.setA_name(a_name);
		vo.setReceiver(receiver);
		vo.setSelnum(selnum);
		vo.setPostnum(postnum);
		vo.setRoadAddr(roadAddr);
		vo.setJibunAddr(jibunAddr);
		vo.setDetail(detail);
		
		int result = cAddress.checkNewAddr(vo);
		
		int response = 0;
		
		if (result == 0) { // 중복되는 값이 없을 경우
			response = 0;
			// 등록된 배송지 개수 조회
			int addrCount = cAddress.checkAddrCount(m_idx);
			// 배송지 개수를 체크하여 0개일 경우 기본 배송지로 자동 등록
			if (addrCount == 0) {
				vo.setDef_add(1);
				cAddress.addNewAddr(vo); // 새로운 기본 배송지 등록
			} else {
				vo.setDef_add(0);
				cAddress.addNewAddr(vo); // 새로운 배송지 등록
			}
			
		} else if (result == 1) { // 주소별칭 중복
			response = 1;
		} else if (result == 2) { // 주소 중복
			response = 2;
		}
		
		return response;
	}
	
	
	//배송지 수정
	@PostMapping("/checkEditAddr.do")
	public int checkEditAddr(@RequestParam("m_idx") int m_idx,
							@RequestParam("original_a_name") String original_a_name,
						    @RequestParam("a_name") String a_name,
						    @RequestParam("receiver") String receiver,
						    @RequestParam("selnum") String selnum,
						    @RequestParam("postnum") String postnum,
						    @RequestParam("roadAddr") String roadAddr,
						    @RequestParam("jibunAddr") String jibunAddr,
						    @RequestParam("detail") String detail,
						    HttpSession session) {
		
		AddressVo vo = new AddressVo();
		vo.setM_idx(m_idx);
		vo.setOriginal_a_name(original_a_name);
		vo.setA_name(a_name);
		vo.setReceiver(receiver);
		vo.setSelnum(selnum);
		vo.setPostnum(postnum);
		vo.setRoadAddr(roadAddr);
		vo.setJibunAddr(jibunAddr);
		vo.setDetail(detail);
		
		int result = cAddress.checkEditAddr(vo);
		
		int response = 0;
		
		if (result == 0) { // 중복되는 값이 없을 경우
			response = 0;
			cAddress.editAddr(vo); // 새로운 배송지 등록
			session.removeAttribute("current_add");
			session.setAttribute("current_add", a_name);
		} else if (result == 1) { // 주소별칭 중복
			response = 1;
		} else if (result == 2) { // 주소 중복
			response = 2;
		}
		
		return response;
	}
	
	
}
