package com.omart.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.omart.service.cart.CartService;
import com.omart.service.member.MemberService;
import com.omart.vo.AddressVo;
import com.omart.vo.BoardFileVo;
import com.omart.vo.MemberVo;
import com.omart.vo.ProductVo;

import lombok.Setter;

@RestController
@RequestMapping("/mypage")
public class AjaxMypageController {
	
	@Setter(onMethod_={ @Autowired })
	private MemberService mWish, mAddress, mReview;
	@Setter(onMethod_={ @Autowired })
	private CartService cAdd;
	
	//찜목록 선택 상품 삭제
	@PostMapping("/remove_wishList.do")
	public String remove_wishList(@RequestParam("p_id[]") String [] p_id,
								  HttpSession session) {
		
		MemberVo member = (MemberVo) session.getAttribute("member");
		int m_idx = member.getM_idx();
		
		//찜목록에 해당 p_id를 삭제하고 테이블 업데이트 결과 반환
		int result = mWish.removeWishList(m_idx, p_id);
		if (result != 0) { //업데이트에 성공했을 경우
			
			List<String> wishList = mWish.getWishList(m_idx);
			List<ProductVo> p_info = mWish.getP_info(wishList);
			
			//기존의 찜목록 객체 삭제 및 저장
			session.removeAttribute("wishList");
			session.removeAttribute("p_info");
			session.setAttribute("wishList", wishList);
			session.setAttribute("p_info", p_info);
		}
		
		return "success";
	}
	
	//기본 배송지 업데이트
	@PostMapping("/update_def_address.do")
	public List<AddressVo> updateDefAddress(@RequestParam("m_idx") int m_idx,
											@RequestParam("a_name") String a_name) {
		
		// 기본 배송지 업데이트
		mAddress.updateDefAddress(m_idx, a_name);
		// 업데이트된 배송지 목록 조회 및 반환
		return mAddress.AddressList(m_idx);
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
		int result = mAddress.deleteAddr(m_idx, a_name);
		
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
		vo.setOriginal_a_name(a_name);
		vo.setReceiver(receiver);
		vo.setSelnum(selnum);
		vo.setPostnum(postnum);
		vo.setRoadAddr(roadAddr);
		vo.setJibunAddr(jibunAddr);
		vo.setDetail(detail);
		
		int result = mAddress.checkNewAddr(vo);
		
		int response = 0;
		
		if (result == 0) { // 중복되는 값이 없을 경우
			response = 0;
			// 등록된 배송지 개수 조회
			int addrCount = mAddress.checkAddrCount(m_idx);
			// 배송지 개수를 체크하여 0개일 경우 기본 배송지로 자동 등록
			if (addrCount == 0) {
				vo.setDef_add(1);
				mAddress.addNewAddr(vo); // 새로운 기본 배송지 등록
			} else {
				vo.setDef_add(0);
				mAddress.addNewAddr(vo); // 새로운 배송지 등록
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
		
		int result = mAddress.checkEditAddr(vo);
		
		int response = 0;
		
		if (result == 0) { // 중복되는 값이 없을 경우
			response = 0;
			mAddress.editAddr(vo); // 새로운 배송지 등록
			session.removeAttribute("current_add");
			session.setAttribute("current_add", a_name);
		} else if (result == 1) { // 주소별칭 중복
			response = 1;
		} else if (result == 2) { // 주소 중복
			response = 2;
		}
		
		return response;
	}
	
	@PostMapping("/write_review_process.do")
	public String write_review_process(@RequestParam String order_idx, @RequestParam String p_id, 
			@RequestParam String content, @RequestParam int stars) {
		
		System.out.println("param-check : "+order_idx+", "+p_id+", "+content+", "+stars);
		
		BoardFileVo bfVo = new BoardFileVo();
		bfVo.setOrder_idx(order_idx);
		bfVo.setP_id(p_id);
		bfVo.setContent(content);
		bfVo.setStars(stars);
		
		mReview.write_review_process(bfVo);
		
		return "success";
	}
	
}
