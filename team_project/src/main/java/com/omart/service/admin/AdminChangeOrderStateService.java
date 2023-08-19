package com.omart.service.admin;

import org.springframework.stereotype.Service;

import com.omart.dao.AdminDao;

import lombok.RequiredArgsConstructor;

@Service("odChange")
@RequiredArgsConstructor
public class AdminChangeOrderStateService implements AdminService {	
	
	private final AdminDao dao;
	
	public void changeOrderState(String order_idx) {
		dao.changeOrderState(order_idx);
	}
	
}
