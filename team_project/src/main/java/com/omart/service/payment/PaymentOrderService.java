package com.omart.service.payment;

import org.springframework.stereotype.Service;

import com.omart.dao.OrderDao;
import com.omart.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Service("pmOrder")
@RequiredArgsConstructor
public class PaymentOrderService implements PaymentService {	
	
	private final OrderDao dao;
	
	//해당 회원의 장바구니 정보 가져오기
	public void createOrder(OrderVo orderVo) {		
		dao.createOrder(orderVo);
	}	
	
}
