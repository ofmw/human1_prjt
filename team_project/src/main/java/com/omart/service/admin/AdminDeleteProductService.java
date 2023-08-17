package com.omart.service.admin;

import org.springframework.stereotype.Service;

import com.omart.dao.AdminDao;

import lombok.RequiredArgsConstructor;

@Service("pdDelete")
@RequiredArgsConstructor
public class AdminDeleteProductService implements AdminService {	
	
	private final AdminDao dao;
	
	public int deleteProduct(String p_id) {
		
		return dao.deleteProduct(p_id);
	}
	
}
