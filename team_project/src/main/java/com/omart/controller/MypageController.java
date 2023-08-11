package com.omart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.omart.service.member.MemberService;
import com.omart.service.product.ProductService;
import com.omart.vo.MemberVo;
import com.omart.vo.ProductVo;

import lombok.Setter;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Setter(onMethod_={ @Autowired })
	private MemberService mWish;
	@Setter(onMethod_= {@Autowired})
	private ProductService pdInfo;
	
	//마이페이지
	@GetMapping("/mypage.do")
	public String mypage(HttpSession session) {
		
		MemberVo member = (MemberVo) session.getAttribute("member");
		int m_idx = member.getM_idx();
		List<String> wishList = mWish.getWishList(m_idx);
		
		// 로그인 풀렸을 경우 대비 member 객체 체크
		if (member != null) {
			
			/* 찜목록 페이지에서 찜한 상품과 해당 상품 정보를 매칭시키기 위해
			   product 테이블에서 찜목록의 p_id 정보를 이용하여 상품 정보를 가져옴 */
			List<ProductVo> p_info = mWish.getP_info(wishList);
			
			// post_state가 1이 아닌 제품 제거
			p_info.removeIf(product -> product.getPost_state() != 1);
		    
			session.removeAttribute("wishList");
			session.removeAttribute("p_info");
			session.setAttribute("wishList", wishList);
			session.setAttribute("p_info", p_info);
			
		}
		
		return "mypage/mypage";
	}
	
	//마이페이지 - 주문/배송조회
	@GetMapping("/purchase_history.do")
	public String purchase_history() {
		return "mypage/purchase_history";
	}
	
	//마이페이지 - 주문상세조회
	@GetMapping("/order_detail.do")
	public String order_detail() {
		return "mypage/order_detail";
	}
	
	//마이페이지 - 1:1문의
	@GetMapping("/inquiry.do")
	public String list_inquiry() {
		return "mypage/inquiry";
	}
	
	//마이페이지 - 찜목록
	@GetMapping("/wish.do")
	public String wish(HttpSession session) {
		
		MemberVo member = (MemberVo) session.getAttribute("member");
		@SuppressWarnings("unchecked")
		List<String> wish = (List<String>) session.getAttribute("wishList");
		
		// 로그인 풀렸을 경우 대비 member 객체 체크
		if (member != null) {
			
			/* 찜목록 페이지에서 찜한 상품과 해당 상품 정보를 매칭시키기 위해
			   product 테이블에서 찜목록의 p_id 정보를 이용하여 상품 정보를 가져옴 */
			List<ProductVo> p_info = mWish.getP_info(wish);
			
			// post_state가 1이 아닌 제품 제거
			p_info.removeIf(product -> product.getPost_state() != 1);
			System.out.println(p_info);
		    
			session.setAttribute("p_info", p_info);
			
		}
		
		return "mypage/wish";
	}
	
	//마이페이지 -> 인덱스
	@GetMapping("/index.do")
	public String mypage_index() {
		return "redirect:/index.do";/* 뷰의 이름 */
	}
	
	//마이페이지 -> 공지사항
	@GetMapping("/list_notice.do")
	public String list_notice() {
		return "redirect:/boardFile/list_notice.do";
	}
	
	//마이페이지 찜목록 -> 해당 상품 페이지 (임시)
	@GetMapping("/product_view.do")
	public String productView(@RequestParam("p_id") String p_id, Model model) {
		ProductVo vo = pdInfo.getProduct(p_id);
		model.addAttribute("product",vo);		
		return "product/product_view";
	}
	
	//마이페이지 -> 로그아웃
//	@GetMapping("logout.do")
//	public String logout(HttpServletRequest request) {
//		
//		String viewPage = "redirect:/index.do";
//		HttpSession session = request.getSession();
//		session.invalidate();
//		
//		return viewPage;
//	}
}
