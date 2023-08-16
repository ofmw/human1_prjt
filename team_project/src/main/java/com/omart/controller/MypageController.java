package com.omart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omart.service.boardfile.BoardFileListService;
import com.omart.service.member.MemberService;
import com.omart.service.product.ProductService;
import com.omart.vo.AddressVo;
import com.omart.vo.BoardFileVo;
import com.omart.vo.CartVo;
import com.omart.vo.MemberVo;
import com.omart.vo.OrderVo;
import com.omart.vo.ProductVo;

import lombok.Setter;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Setter(onMethod_={ @Autowired })
	private MemberService mPh, mAddress, mWish, mBenefit, mOdrList, mUpdate;

	@Setter(onMethod_= {@Autowired})
	private ProductService pdInfo, pdCheck;
	@Setter(onMethod_= {@Autowired})
	private BoardFileListService bfList;
	@Setter(onMethod_= {@Autowired})
	private PasswordEncoder passwordEncoder;
	
	// 마이페이지
	@GetMapping("/mypage.do")
	public String mypage(HttpSession session) {
		
		// 세션에서 회원의 맴버객체를 가져옴
		MemberVo member = (MemberVo) session.getAttribute("member");
		
		// 로그인 풀렸을 경우 대비 member 객체 체크
		if (member != null) {
			
			// 세션에서 가져온 맴버객체에서 회원 고유번호 추출
			int m_idx = member.getM_idx();
			
			// 회원 고유번호로 wish, order, point 테이블에서 정보 가져옴
			// wishList: 찜목록 정보 / orderList: 주문내역 정보 / point: 포인트 정보
			List<String> wishList = mWish.getWishList(m_idx);
			List<OrderVo> orderList = mOdrList.orderList(m_idx);
			int point = mBenefit.getPoint(m_idx);
			
			// 세션에 회원의 포인트 정보 저장
			session.setAttribute("point", point);
			
			// 찜목록에 찜한 상품이 있는지 체크
			if(wishList != null)	{ // 찜한 상품이 있을 경우
				/* 찜목록 페이지에서 찜한 상품과 해당 상품 정보를 매칭시키기 위해
				   product 테이블에서 찜목록의 p_id 정보를 이용하여 상품 정보를 가져옴 */			
				List<ProductVo> p_info = mWish.getP_info(wishList);
				
				// post_state가 1이 아닌 제품 제거
				p_info.removeIf(product -> product.getPost_state() != 1);
			    
				// 세션에 기존에 저장된 찜목록과 상품 정보를 삭제 후 업데이트된 정보로 다시 저장
				session.removeAttribute("wishList");
				session.removeAttribute("p_info");
				session.setAttribute("wishList", wishList);
				session.setAttribute("p_info", p_info);
			}
			
			// 주문내역이 있는지 체크
			if(orderList != null) { // 주문내역이 있을 경우
				
				// 세션에 기존에 저장된 주문내역 정보 삭제 후 업데이트된 정보로 다시 저장
				session.removeAttribute("orderList");
				session.setAttribute("orderList", orderList);
			}
			
		}
		
		// mypage.jsp로 이동
		return "mypage/mypage";
	}
	
	//마이페이지 - 회원정보변경
	@GetMapping("/member_modifiy.do")
	public String member_modifiy() {
		return "mypage/member_modifiy";
	}
	
	//마이페이지 - 주문/배송조회
	@GetMapping("/purchase_history.do")
	public String purchase_history(HttpSession session) {
		
		// 세션에서 회원의 맴버객체를 가져옴
		MemberVo vo = (MemberVo) session.getAttribute("member");
		// 세션에서 가져온 맴버객체에서 회원 고유번호 추출
		int m_idx = vo.getM_idx();
		
		// 회원 고유번호로 주문/배송조회 내역 가져오기
		List<OrderVo> phInfo = mPh.get_ph_info(m_idx);
		
		if (phInfo != null) {
			
			// 가져온 주문/배송조회 각 내역의 첫번째 상품 정보 가져오기 (상품 이름 띄우기용)
			List<ProductVo> phfInfo = mPh.get_p_info(phInfo);
			
			if (phfInfo != null) {
				session.setAttribute("phfInfo", phfInfo);
			}
		}
		
		session.setAttribute("phInfo", phInfo);
		
		return "mypage/purchase_history";
	}
	
	//마이페이지 - 주문상세조회
	@GetMapping("/order_detail.do")
	public String order_detail(@RequestParam("order_idx") String order_idx, HttpSession session) {
		
		// 현재 세션에서 주문내역 정보 가져옴
		@SuppressWarnings("unchecked")
		List<OrderVo> ph_info = (ArrayList<OrderVo>)session.getAttribute("phInfo");  
		
		// 가져온 주문내역 정보에서 정보 추출
		for (OrderVo vo : ph_info) {
            
			if(vo.getOrder_idx().equals(order_idx)) {
				
				// 주문내역의 각 정보 저장
				String p_id = vo.getProducts();
				String amounts = vo.getAmounts();
				String p_price = vo.getProducts_price();
				
				// 저장한 정보에서 하나씩 분리하여 배열에 저장
				
				String[] p_idArr = p_id.split(",");							//p_id
				
				//추출하여 분리 저장한 p_id로 product 테이블에서 상품 정보 검색
				List<ProductVo> p_info = mPh.get_p_info2(p_idArr);
				
				String[] String_amountsArr= amounts.split(",");				//amounts (String형)
				String[] String_p_priceArr = p_price.split(",");			//products_price (String형)
				
				int[] amountsArr = new int[String_amountsArr.length];		//int형의 amounts 생성
				int[] p_priceArr = new int[String_p_priceArr.length];		//int형의 products_price 생성
				
				for (int i = 0; i < String_amountsArr.length; i++) {		//String형 amounts의 요소들을 int형으로 변환하여 저장
					ProductVo pVo = p_info.get(i);
					pVo.setOrder_idx(order_idx);
									
		            amountsArr[i] = Integer.parseInt(String_amountsArr[i]);
					p_priceArr[i] = Integer.parseInt(String_p_priceArr[i]);
	            	
					pVo.setStock(amountsArr[i]);
					pVo.setPrice(p_priceArr[i]);
					
					pVo.setReview_state(pdCheck.checkReview(pVo));
					
		        }
				
				session.setAttribute("p_info", p_info);
			}
        }
		
		
		return "mypage/order_detail";
	}
	
	//마이페이지 - 1:1문의
	@GetMapping("/inquiry.do")
	public String inquiry(HttpSession session, Model model) {
	    MemberVo loggedInUser = (MemberVo) session.getAttribute("member");
	    
	    if (loggedInUser != null) {
	        String loggedInUserId = loggedInUser.getM_id(); // 로그인한 사용자 아이디 가져오기
	        
	        List<BoardFileVo> inquiryList = bfList.getInquiryByUser(loggedInUserId); // 로그인한 사용자의 1:1 문의 내역 가져오기
	        
	        // inquiryList를 JSP로 전달
	        model.addAttribute("inquiryList", inquiryList);
	        
	        return "mypage/inquiry";
	    }
		return "mypage/inquiry";
	}
	
	//마이페이지 1:1문의상세내역
	@GetMapping("/inquiry_content.do")
	public String inquiry_content(@RequestParam("b_idx") int b_idx, Model model) {
		
		List<BoardFileVo> inquiryContent = bfList.getInquiryByBIdx(b_idx);
		
		System.out.println("컨트롤러b_idx값 :" + bfList.getInquiryByBIdx(b_idx));

		model.addAttribute("inquiryContent", inquiryContent);
		
		return "mypage/inquiry_content";
	}
	   


	
	//마이페이지 - 찜목록
	@GetMapping("/wish.do")
	public String wish(HttpSession session) {
		
		MemberVo member = (MemberVo) session.getAttribute("member");
		
		// 로그인 풀렸을 경우 대비 member 객체 체크
		if (member != null) {
			
			@SuppressWarnings("unchecked")
			List<String> wish = (List<String>) session.getAttribute("wishList");
//			System.out.println(wish);
			
			List<ProductVo> p_info = new ArrayList<ProductVo>();
			
			// 만약 wish가 null 이면 (테이블에 행이 없어서 로그인시 가져온 정보가 없음)
			if ((wish != null) && (wish.get(0) != null)) {
				p_info = mWish.getP_info(wish);
				p_info.removeIf(product -> product.getPost_state() != 1);
				System.out.println(p_info);
			}
			
			/* 찜목록 페이지에서 찜한 상품과 해당 상품 정보를 매칭시키기 위해
			   product 테이블에서 찜목록의 p_id 정보를 이용하여 상품 정보를 가져옴 */
			
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
	
	@GetMapping("/manage_address.do")
	public String change_address(@RequestParam("m_idx") String m_idx, @RequestParam("page") String page, Model model) {
		
		List<AddressVo> AddressList = mAddress.AddressList(Integer.parseInt(m_idx));
		
		model.addAttribute("m_idx", m_idx);
		model.addAttribute("page", page);
		model.addAttribute("AddressList", AddressList);
		
		return "mypage/manage_address";
	}
	
	//배송지 수정 페이지 이동
	@GetMapping("/editAddr.do")
	public String eidtAddr(@RequestParam("m_idx")String m_idx,
						   @RequestParam("a_name")String a_name,
						   Model model) {
		
		AddressVo vo = mAddress.getAddrInfo(Integer.parseInt(m_idx), a_name);
		if (vo != null) {
			System.out.println("수정할 배송지 정보 가져오기 성공");
			model.addAttribute("addrInfo", vo);
		} else {
			System.out.println("수정할 배송지 정보 가져오기 실패");
		}
		
		return "mypage/editAddress";
	}
	
	@GetMapping("/addNewAddr.do")
	public String addNewAddr(@RequestParam("m_idx") String m_idx, Model model) {
		
		model.addAttribute("m_idx", m_idx);
		return "mypage/addAddress";
	}
		
	@PostMapping("/check_password")
	@ResponseBody
	public String checkPassword(@RequestParam String password, HttpSession session) {
		MemberVo vo = (MemberVo) session.getAttribute("member");
		
		if (vo != null) {
			String storedPassword = vo.getM_pw();
			System.out.println("암호화: " + storedPassword);
		if(passwordEncoder.matches(password, storedPassword)) {
			return "match";
		} else {
			return "mismatch";
		}
	}else {
		return "mismatch";
	}
	}
	
	//회원정보 수정페이지 
	@PostMapping("/update_process.do")
	@ResponseBody
	public String updateProcess(MemberVo memberVo, HttpServletRequest request) {
		
		MemberVo vo = mUpdate.update(memberVo);
		
		if(vo != null) {
			HttpSession session = request.getSession();
			session.removeAttribute("member");
			session.setAttribute("member", vo);
			return "success";
		} else
		return "fail";
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
	
	@GetMapping("/cancel.do")
	public String cancel() {
		return "mypage/cancel";
	}
	
	@GetMapping("/write_review.do")
	public String write_review(@RequestParam String order_idx, @RequestParam String pId, HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();		
		MemberVo mVo = (MemberVo) session.getAttribute("member");
		int m_idx =  mVo.getM_idx();
		
		System.out.println("param-check : "+order_idx+", "+pId+", "+m_idx);
		
		// 현재 세션에서 주문내역 정보 가져옴
		@SuppressWarnings("unchecked")
		List<OrderVo> orderList = (ArrayList<OrderVo>)session.getAttribute("phInfo");
		OrderVo selected_order = new OrderVo();
		
		for(OrderVo order : orderList) {
			if(order.getOrder_idx().equals(order_idx)) {
				selected_order = order;
			}
		}
		
		CartVo cVo = new CartVo();
		ProductVo pVo = pdInfo.getProduct(pId);
		
		// 주문내역의 각 정보 저장
		String p_ids = selected_order.getProducts();
		String amounts = selected_order.getAmounts();
		String p_price = selected_order.getProducts_price();
		
		// 저장한 정보에서 하나씩 분리하여 배열에 저장
		
		String[] p_idArr = p_ids.split(",");
		String[] amountsArr = amounts.split(",");
		String[] p_priceArr = p_price.split(",");
		
		for(int i=0; i<p_idArr.length; i++) {
			if(p_idArr[i].equals(pId)) {
				cVo.setP_id(p_idArr[i]);
				cVo.setAmount(Integer.parseInt(amountsArr[i]));
				cVo.setPrice(Integer.parseInt(p_priceArr[i]));
				cVo.setP_name(pVo.getP_name());
			}
		}
		
		model.addAttribute("selected_product", cVo);
		model.addAttribute("p_info", pVo);
				
		return "mypage/write_review";
	}

	
}
