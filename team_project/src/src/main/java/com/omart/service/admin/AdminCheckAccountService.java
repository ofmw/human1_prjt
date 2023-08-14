package com.omart.service.admin;

import org.springframework.stereotype.Service;

import com.omart.dao.AdminDao;
import com.omart.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Service("acCheck")
@RequiredArgsConstructor
public class AdminCheckAccountService implements AdminService {	
	
	private final AdminDao dao;
	
	public int checkAccount(String m_id) {
		
		return dao.checkAccount(m_id);
	}
	
	public int getAccount(String m_id) {
		
		return dao.getAccount(m_id);
	}	
	
}
