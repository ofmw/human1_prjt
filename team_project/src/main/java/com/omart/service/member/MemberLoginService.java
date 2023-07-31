package com.omart.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.omart.dao.MemberDao;
import com.omart.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Service("mLogin")
@RequiredArgsConstructor
public class MemberLoginService implements MemberService {
	
	private MemberDao dao;
	
	@Setter(onMethod_={ @Autowired })
	private BCryptPasswordEncoder cryptPasswordEncoder;
	
	@Autowired
	public MemberLoginService(MemberDao dao) {
		this.dao = dao;
	}
	
	public MemberVo login(String m_id, String m_pw) {
		MemberVo vo = null;
		String encodePassword = dao.login(m_id).getM_pw();
		cryptPasswordEncoder.matches(m_pw, encodePassword);
		if(cryptPasswordEncoder.matches(m_pw, encodePassword) == true) {
			vo = dao.login(m_id);
		}
		return vo; 
	}
	
}