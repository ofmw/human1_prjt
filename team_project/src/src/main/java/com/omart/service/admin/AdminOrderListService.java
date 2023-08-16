package com.omart.service.admin;

import java.util.List;

import org.springframework.stereotype.Service;

import com.omart.dao.AdminDao;
import com.omart.service.product.ProductService;
import com.omart.vo.MemberVo;
import com.omart.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Service("odrList")
@RequiredArgsConstructor
public class AdminOrderListService implements AdminService {	
	
	private final AdminDao dao;
	
	public List<OrderVo> orderList() {
		return dao.orderList();
	}
	
}
