package com.omart.service.admin;

import org.springframework.stereotype.Service;

import com.omart.dao.AdminDao;
import com.omart.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Service("pdChange")
@RequiredArgsConstructor
public class AdminChangeProductStateService implements AdminService {	
	
	private final AdminDao dao;
	
	public int productStateTrue(String p_id) {
		
		return dao.stateChangeTrue(p_id);
	}
	
	public int productStateFalse(String p_id) {
		
		return dao.stateChangeFalse(p_id);
	}
	
}
