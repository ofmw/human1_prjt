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
			
			/*** 
			 * 회원 고유번호로 wish, order, point 테이블에서 정보 가져옴
			 * wishList: 찜목록 정보 / orderList: 주문내역 정보 / point: 포인트 정보
			 * 
			 * orderList에는 MemberDao의 orderList() 메서드에서 주문한 품목 개수인
			 * p_amount를 추가하여 반환함.
			 ***/
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
		
		/***
		 * mypage() 에서 세션에 저장한 주문내역 객체(orderList)를 가져와서
		 * 각 주문내역에 포함된 p_id로 product 테이블에서 상품 정보를 조회하여
		 * ProductVo 형의 List에 담아 반환하여 세션에 저장 후 페이지에서
		 * 주문내역과 상품 정보를 매칭시킴
		 ***/
		
		// 세션에서 주문내역 객체를 가져옴
		@SuppressWarnings("unchecked")
		List<OrderVo> orderList = (ArrayList<OrderVo>)session.getAttribute("orderList");
		
		// 주문내역이 있는지 체크
		if (orderList != null) {
			
			/***
			 * 주문내역이 있을 경우 주문/배송조회 페이지의 주문내역 테이블의
			 * '구매상품' 컬럼의 정보를 표시하기 위해 각 주문내역의 첫번째 상품 정보 가져오기
			 ***/
			List<ProductVo> phfInfo = mPh.get_p_info(orderList);
			
			// 첫번째 상품 정보가 있는지 체크
			if (phfInfo != null) {
				
				//세션에 첫번째 상품 정보 저장
				session.setAttribute("phfInfo", phfInfo);
			}
		}
		
		session.setAttribute("orderList", orderList);
		
		return "mypage/purchase_history";
	}
	
	
	//마이페이지 - 주문상세조회
	@GetMapping("/order_detail.do")
	public String order_detail(@RequestParam("order_idx") String order_idx, HttpSession session) {
		
		// 현재 세션에서 주문내역 객체를 가져옴
		@SuppressWarnings("unchecked")
		List<OrderVo> ph_info = (ArrayList<OrderVo>)session.getAttribute("orderList");  
		
		// 가져온 주문내역 객체에 담겨있는 OrderVo에서 정보 추출
		for (OrderVo vo : ph_info) {
            
			// 각 주문내역에서 추출한 주문번호(order_idx)와 파라미터로 넘어온 order_idx를 매칭
			if(vo.getOrder_idx().equals(order_idx)) {
				
				/***
				 * 매칭된(주문내역중 파라미터로 넘어온 order_idx와 같은 order_idx인)
				 * OrderVo에서 주문 상세내역에 표시할 정보들을 분리하여
				 * ProductVo형의 List에 담아 세션에 저장
				 * 
				 * OrderVo에 저장된 p_id, amounts, p_pirce는
				 * ','를 구분자로 order_list 테이블의 각 이름의 컬럼에
				 * text형으로 하나의 row에 한 문장으로 한꺼번에 저장이 되고
				 * OrverVo에 String형의 문장으로 저장이 되기 때문에
				 * 페이지에서 구분하여 정보를 표시하기 위해 다시 구분자를 기준으로
				 * 분리를 해주어야 함
				 ***/
				
				/***
				 * 페이지에 표시하기 위한 정보들을 추출
				 * 각각 상품 코드, 수량, 가격(결제가격)
				 ***/
				String p_id = vo.getProducts();
				String amounts = vo.getAmounts();
				String p_price = vo.getProducts_price();
				
				// 추출한 정보에서 구분자를 기준으로 하나씩 분리하여 배열에 저장
				String[] p_idArr = p_id.split(",");						// p_id (String형의 배열)
				String[] String_amountsArr= amounts.split(",");			// amounts (String형의 배열)
				String[] String_p_priceArr = p_price.split(",");		// products_price (String형의 배열)
				
				// 추출하여 분리 저장한 p_id로 product 테이블에서 헤당 상품 정보 검색
				List<ProductVo> p_info = mPh.get_p_info2(p_idArr);
				
				/***
				 * 페이지에서 int형으로 활용되는 amounts, p_price를 String 형에서
				 * int형으로 변환하기 위해 각 기존 배열의 길이의 int형 배열 정의
				 ***/
				int[] amountsArr = new int[String_amountsArr.length];	// int형의 amounts 생성
				int[] p_priceArr = new int[String_p_priceArr.length];	// int형의 products_price 생성
				
				/***
				 * p_id가 담긴 배열의 길이를 기준으로 p_info의 각 인덱스의
				 * ProductVo 객체에 위에서 추출하여 저장한 정보들을 인덱스 순서대로
				 * 기존의 ProductVo에 들어있던 product 테이블의 상품 정보를
				 * 구매 당시의 상품 정보로 새로 대입
				 * 
				 * ph_info의 OrderVo에 들어있는 amounts는 각 상품들의 구매 수량
				 * p_price는 구매(결제) 금액이고
				 * 주문 상세정보(order_detail) 페이지에 표시되는 각 상품들의 정보는
				 * 구매 당시의 정보를 기준으로 표시되어야 하기 때문에
				 * ProductVo를 활용하여 세션에 저장하기 위해
				 * 원래 ProductVo의 stock은 상품의 재고량 이지만
				 * 주문 상세정보 페이지 기준으로 구매 수량(amounts)로 저장하고
				 * price는 판매 가격이지만 구매 금액(p_price)로 저장함
				 ***/
				for (int i = 0; i < p_idArr.length; i++) {
					
					// ProductVo형의 List인 p_info에서 인덱스 순서의 ProductVo 추출
					ProductVo pVo = p_info.get(i);
					// 추출한 ProductVo에 주문번호 저장 (파라미터로 받은 order_idx)
					pVo.setOrder_idx(order_idx);
					
					// String형의 배열에서 해당 인덱스의 값을 int형으로 변환하여 int형 배열에 저장
		            amountsArr[i] = Integer.parseInt(String_amountsArr[i]);
					p_priceArr[i] = Integer.parseInt(String_p_priceArr[i]);
	            	
					// 추출한 ProductVo에 int형으로 변환한 각 정보들을 저장
					pVo.setStock(amountsArr[i]);
					pVo.setPrice(p_priceArr[i]);
					
					// 해당 인덱스의 ProductVo에 저장된 p_id의 상품의 리뷰 작성 여부 가져오기
					pVo.setReview_state(pdCheck.checkReview(pVo));
					
		        }
				// 세션에 p_info 저장
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
		
		// 세션에서 회원의 맴버객체를 가져옴
		MemberVo member = (MemberVo) session.getAttribute("member");
		
		// 로그인이 해제됐을 경우 대비 맴버객체 체크
		if (member != null) {
			
			// 로그인 당시 세션에 저장됐던 wish(찜목록) 객체를 가져옴
			@SuppressWarnings("unchecked")
			List<String> wish = (List<String>) session.getAttribute("wishList");
			
			// 찜목록의 각 상품들의 정보들을 담을 객체 생성
			List<ProductVo> p_info = new ArrayList<ProductVo>();
			

			/***
			 * 로그인한 회원의 찜목록이 찜목록(wish) 테이블에 생성되지 않았거나
			 * 찜목록 테이블의 w_list 컬럼에 값이 있는지(찜한 상품이 있는지) 체크
			 ***/
			if ((wish != null) && (wish.get(0) != null)) {
				
				/***
				 * 찜한 상품이 있을 경우 wish 객체에 담겨있는 p_id들을 활용하여
				 * product 테이블의 해당 p_id의 상품들의 정보를 p_info에 저장
				 ***/
				p_info = mWish.getP_info(wish);
				
				/*** 
				 * 찜한 상품의 정보가 담긴 p_info에서 상품 등록상태(post_state)가
				 * 1이 아닌 (0은 판매 등록되지 않은 상품) 상품들의 정보를 제거
				 ***/
				p_info.removeIf(product -> product.getPost_state() != 1);
			}
			
			/***
			 * 찜목록 페이지에서 찜한 상품과 해당 상품 정보를 매칭시키기 위해
			 * p_info를 세션에 저장 
			 ***/
			session.setAttribute("p_info", p_info);
			
		}
		
		return "mypage/wish";
	}
	
	
	//마이페이지 -> 인덱스
	@GetMapping("/index.do")
	public String mypage_index() {
		System.out.println("MypageController index() 실행");
		
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
	
	
	//마이페이지 - 배송지 관리
	@GetMapping("/manage_address.do")
	public String change_address(@RequestParam("m_idx") String m_idx, @RequestParam("page") String page, Model model) {
		
		// 파라미터로 넘어온 m_idx로 address 테이블에서 해당 회원의 배송지 목록을 가져옴
		List<AddressVo> AddressList = mAddress.AddressList(Integer.parseInt(m_idx));
		
		/***
		 * 자식창으로 열리는 배송지 관리 페이지의 model 객체로 각 정보 저장
		 * 
		 * m_idx는 배송지 추가, 삭제 및 수정시 각 테이블 sql 코드의 조건절 변수로 사용
		 * page는 배송지 관리 페이지가 열린 부모창을 판별하기 위해 파라미터로 넘어온 page를 저장
		 * AddressList는 위에서 가져온 배송지 목록 객체
		 * 
		 * 배송지 관리 페이지는 마이페이지와 장바구니(cart)페이지에서 요청되며
		 * 각 페이지에 따라 파라미터로 넘어오는 page의 값은 1, 2 이고
		 * page가 2이면 (장바구니 페이지에서 요청했을 경우) 주문결제에 필요한 현재 선택된 배송지와
		 * 관련된 div와 버튼이 표시되고
		 * page가 1이면 (마이페이지에서 요청했을 경우) 위에서 표시되는 요소들을 제외한
		 * 기본적인 정보가 표시됨
		 */
		model.addAttribute("m_idx", m_idx);
		model.addAttribute("page", page);
		model.addAttribute("AddressList", AddressList);
		
		return "mypage/manage_address";
	}
	
	
	//배송지 관리 - 배송지 수정
	@GetMapping("/editAddr.do")
	public String eidtAddr(@RequestParam("m_idx")String m_idx,
						   @RequestParam("a_name")String a_name,
						   Model model) {
		
		/***
		 * 배송지 관리 페이지의 m_idx와 a_name(주소별칭)을 파라미터로 받아서
		 * 수정하려는 배송지에 대한 정보들을 address 테이블에서 m_idx와 a_name으로 조회하여
		 * AddressVo 객체에 저장함 
		 * 
		 * address 테이블에서 m_idx는 중복되지만 a_name은 중복되지 않는 주소별칭이므로
		 * a_name을 이용하여 m_idx에 해당하는 회원의 특정 배송지의 정보를 조회함
		 ***/
		AddressVo vo = mAddress.getAddrInfo(Integer.parseInt(m_idx), a_name);
		
		// 배송지 정보가 성공적으로 반환됐는지 체크
		if (vo != null) {
			// model 객체로 배송지 수정 페이지에 배송지 정보를 저장
			model.addAttribute("addrInfo", vo);
			System.out.println("수정할 배송지 정보 가져오기 성공");
		} else {
			System.out.println("수정할 배송지 정보 가져오기 실패");
		}
		
		return "mypage/editAddress";
	}
	
	
	//배송지 관리 - 배송지 추가
	@GetMapping("/addNewAddr.do")
	public String addNewAddr(@RequestParam("m_idx") String m_idx, Model model) {
		
		/***
		 * 파라미터로 넘어온 m_idx를 배송지 추가 페이지에 model 객체로 저장
		 * 
		 * 배송지는 최대 5개까지 등록 가능하고 배송지 관리 페이지에서 스크립트로
		 * 5개 미만일때만 해당 주소로 배송지 추가 페이지 요청을 보내도록 처리함
		 ***/
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
	
	
	//마이페이지 - 회원탈퇴
	@GetMapping("/cancel.do")
	public String cancel() {
		return "mypage/cancel";
	}
	
	
	//마이페이지(주문 상세조회) - 리뷰 작성
	@GetMapping("/write_review.do")
	public String write_review(@RequestParam String order_idx, @RequestParam String pId, HttpServletRequest request, Model model) {
		
		// 요청으로 넘어오는 세션의 세션객체를 변수에 저장
		HttpSession session = request.getSession();
		// 해당 세션에서 맴버객체를 가져옴
		MemberVo mVo = (MemberVo) session.getAttribute("member");
		// 맴버객체에서 로그인한 회원의 m_idx를 추출
		int m_idx =  mVo.getM_idx();
		
		System.out.println("param-check : "+order_idx+", "+pId+", "+m_idx);
		
		// 현재 세션에서 주문내역 객체를 가져옴
		@SuppressWarnings("unchecked")
		List<OrderVo> orderList = (ArrayList<OrderVo>)session.getAttribute("orderList");
		// 리뷰를 작성할 상품의 p_id를 담을 OrderVo 객체를 생성
		OrderVo selected_order = new OrderVo();
		
		// 가져온 주문내역 객체에 담겨있는 OrderVo에서 정보 추출
		for(OrderVo order : orderList) {
			
			// 각 주문내역에서 추출한 주문번호(order_idx)와 파라미터로 넘어온 order_idx를 매칭
			if(order.getOrder_idx().equals(order_idx)) {
				
				// 위에서 생성한 OrderVo에 해당 order_idx를 저장
				selected_order = order;
			}
		}
		
		// 장바구니 객체 생성
		CartVo cVo = new CartVo();
		// 파라미터로 넘어온 p_id로 product 테이블에서 해당 상품의 정보를 조회하여 저장
		ProductVo pVo = pdInfo.getProduct(pId);
		
		// order_detail() 메서드와 같은 방식으로 각 정보를 추출하여 저장
		String p_ids = selected_order.getProducts();
		String amounts = selected_order.getAmounts();
		String p_price = selected_order.getProducts_price();
		
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
