package com.omart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.omart.service.cart.CartService;
import com.omart.service.member.MemberService;
import com.omart.service.payment.PaymentService;
import com.omart.service.product.ProductService;
import com.omart.vo.AddressVo;
import com.omart.vo.CartVo;
import com.omart.vo.MemberVo;
import com.omart.vo.OrderVo;
import com.omart.vo.PointVo;
import com.omart.vo.ProductVo;

import lombok.Setter;

@Controller
@RequestMapping("**/payment")
public class paymentController {
	
	@Setter(onMethod_= {@Autowired})	
	private CartService cList, cAdd, cDel, cAddress;
	@Setter(onMethod_= {@Autowired})	
	private MemberService mBenefit, mOdrList, mInfo;
	@Setter(onMethod_= {@Autowired})	
	private PaymentService pmOrder;
	@Setter(onMethod_= {@Autowired})	
	private ProductService pdInfo, pdSet;
	
	//결제 페이지
	@GetMapping("/payment.do")
	public String payment(@RequestParam("requestor") String requestor, Model model, HttpSession session) {
		System.out.println("요청자: "+requestor);
		MemberVo member = (MemberVo) session.getAttribute("member");
		if(member != null) {
			int m_idx = member.getM_idx();
			
			List<CartVo> CartList = cList.CartList(m_idx);
			List<AddressVo> AddressList = cAddress.AddressList(m_idx);
			member.setPoint(mBenefit.getPoint(m_idx));
			
			model.addAttribute("CartList", CartList);
			model.addAttribute("AddressList", AddressList);
			model.addAttribute("requestor", requestor);
			
			System.out.println("테스트입니다:"+CartList.get(0).getP_name());
			
		}
		
		return "payment/payment";
	}	
	
	@GetMapping("/buyThis.do")
	public String buyThis(@RequestParam("requestor") String requestor, @RequestParam String p_id, @RequestParam int amount,
			Model model, HttpServletRequest request) {
		System.out.println("요청자: "+requestor);
		System.out.println("갯수 체크 : "+amount);
		HttpSession session = request.getSession();
		MemberVo member = (MemberVo) session.getAttribute("member");
		int m_idx = member.getM_idx();
		
		List<CartVo> CartList = new ArrayList<CartVo>();
		List<AddressVo> AddressList = new ArrayList<AddressVo>();
		member.setPoint(mBenefit.getPoint(m_idx));
		
				
		if(member != null) {
			AddressList = cAddress.AddressList(m_idx);
			
			ProductVo pVo = pdInfo.getProduct(p_id);
			
			CartVo cVo = new CartVo();
			cVo.setM_idx(m_idx);
			cVo.setP_id(p_id);
			cVo.setAmount(amount);
			cVo.setP_name(pVo.getP_name());
			cVo.setBrand(pVo.getBrand());
			cVo.setCost(pVo.getCost());
			cVo.setPrice(pVo.getPrice());
			cVo.setStandard(pVo.getStandard());
			cVo.setUnit(pVo.getUnit());
			cVo.setStock(pVo.getStock());
			cVo.setDiscount(pVo.getDiscount());
			cVo.setPost_state(pVo.getPost_state());
			cVo.setSaveFile1(pVo.getSaveFile1());
			
			System.out.println(cVo.getP_name());
			
			CartList.add(cVo);
			
			session.setAttribute("CartList", CartList);
			
			model.addAttribute("AddressList", AddressList);
			model.addAttribute("requestor", requestor);		
		}
		
						
		
		return "payment/payment";
	}	
	
	@PostMapping("/orderProcess.do")
	public String orderProcess(@RequestParam String requestor, @RequestParam String orderNum, 
			@RequestParam String name, @RequestParam int point, @RequestParam String receiver, @RequestParam String selnum, 
			@RequestParam String address, @RequestParam int paid_price, @RequestParam String requestMessage, 
			@RequestParam int shFee, @RequestParam String paymentInfo, Model model, HttpServletRequest request) {
		
		System.out.println(requestor);
		HttpSession session = request.getSession();
		MemberVo member = (MemberVo) session.getAttribute("member");
		int m_idx = member.getM_idx();
		
		List<CartVo> OrderDetails = new ArrayList<CartVo>();
		
		if(requestor.equals("cart")) {
			OrderDetails = cList.CartList(m_idx);
			cDel.deleteCartAll(m_idx);
			
		}else {
			OrderDetails = (List<CartVo>)session.getAttribute("CartList");	
		}
		
		model.addAttribute("OrderDetails", OrderDetails);
		
		List<String> productIds = new ArrayList<String>();
		List<String> productAmounts = new ArrayList<String>();
		List<String> productsPrice = new ArrayList<String>();
		for(CartVo product : OrderDetails) {
			
			String p_id = product.getP_id();
			int amount = product.getAmount();
			
			productIds.add(p_id);
			productAmounts.add(Integer.toString(amount));
			
			int price = product.getPrice();
			int discount = product.getDiscount();
			productsPrice.add(Integer.toString(price*(100-discount)/100));	
		}
		String products = String.join(",", productIds);
		String amounts = String.join(",", productAmounts);
		String prdcsPrice = String.join(",", productsPrice);
		
		System.out.println("테스트한다: "+prdcsPrice);
		
		OrderVo orderVo = new OrderVo();
		orderVo.setProducts(products);
		orderVo.setAmounts(amounts);
		orderVo.setProducts_price(prdcsPrice);
		orderVo.setOrder_idx(orderNum);
		orderVo.setM_idx(m_idx);		
		orderVo.setReceiver(receiver);
		orderVo.setSelnum(selnum);
		orderVo.setAddress(address);
		orderVo.setPaid_price(paid_price);
		orderVo.setRequest(requestMessage);
		orderVo.setPaymentInfo(paymentInfo);
		orderVo.setUsed_point(point);		
		orderVo.setS_fee(shFee);
		
		pmOrder.createOrder(orderVo);
		
		for(CartVo product : OrderDetails) {
			String p_id = product.getP_id();
			int amount = product.getAmount();
			ProductVo pVo = new ProductVo();
			pVo.setP_id(p_id);
			pVo.setSalesAmount(amount);
			pdInfo.updateTotalSales(pVo);
		}
		
		MemberVo mVo = new MemberVo();
		
		mVo.setM_idx(m_idx);
		mVo.setPoint(point);
		
		mBenefit.usePoint(mVo);
		
		int savePoint = 0;
		double savePointPercent = 0.0;
		
		switch (member.getGrade()) {
		case 0: savePointPercent = 0.01; break;
		case 1: savePointPercent = 0.03; break;
		case 2: savePointPercent = 0.05; break;
		}
		
		savePoint = (int)(paid_price * savePointPercent);
		
		PointVo pointVo = new PointVo();
		pointVo.setM_idx(m_idx);
		pointVo.setSavePoint(savePoint);
		
		mBenefit.addPoint(pointVo);
		
		model.addAttribute("orderNum", orderNum);
	    model.addAttribute("orderName", name);
	    model.addAttribute("orderPoint", point);
		
		return "redirect:/payment/orderCompleted.do";
	}
	@GetMapping("/orderCompleted.do")
	public String orderCompleted(@RequestParam String orderNum, @RequestParam String orderName, HttpServletRequest request, Model model) {
				
		OrderVo orderVo = pmOrder.selectOrder(orderNum);
		
		String[] pIds = orderVo.getProducts().split(",");
		String[] pAmounts = orderVo.getAmounts().split(",");
		String[] prdtsPrice = orderVo.getProducts_price().split(",");
		
		List<CartVo> orderList = new ArrayList<CartVo>();
		for(int i = 0; i < pIds.length; i++) {
			CartVo cartVo = new CartVo();
			cartVo.setP_id(pIds[i]);
			cartVo.setAmount(Integer.parseInt(pAmounts[i]));
			cartVo.setPrice(Integer.parseInt(prdtsPrice[i]));
			ProductVo productVo = pdInfo.getProduct(pIds[i]);
			String brand = productVo.getBrand();
			String p_name = productVo.getP_name();
			int standard = productVo.getStandard();
			String unit = productVo.getUnit();
			cartVo.setBrand(brand);
			cartVo.setP_name(p_name);
			cartVo.setStandard(standard);
			cartVo.setUnit(unit);
			
			orderList.add(cartVo);
		}
		
		HttpSession session = request.getSession();
		MemberVo member = (MemberVo)session.getAttribute("member");
		int m_idx = member.getM_idx();	
		int grade = member.getGrade();
		
		int total_paid =  mOdrList.checkTotalPaid(m_idx);
		
		System.out.println("total_paid check : " + total_paid);
		
		String strGrade = null;
		
		if(grade == 0) {
			strGrade = "브론즈";
		}else if(grade == 1) {
			strGrade = "실버";
		}
		
		if(total_paid > 500000 && grade == 0) {
			mBenefit.gradeUp(m_idx);
			model.addAttribute("bfGrade", strGrade);
			model.addAttribute("afGrade", "실버");
		}else if(total_paid > 1000000 && grade <= 1) {
			mBenefit.gradeUp(m_idx);
			model.addAttribute("bfGrade", strGrade);
			model.addAttribute("afGrade", "골드");
		}
		
	    model.addAttribute("orderName", orderName);
	    model.addAttribute("orderVo", orderVo);
	    model.addAttribute("orderList", orderList);

		return "payment/orderCompleted";
	}
		
}
