package com.omart.service.payment;

import com.omart.vo.OrderVo;

public interface PaymentService {
	
	default void createOrder(OrderVo orderVo) {}
	
}
