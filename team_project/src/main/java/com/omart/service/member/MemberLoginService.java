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
	
	@Setter(onMethod_={ @Autowired })
	private MemberDao dao;
	@Setter(onMethod_={ @Autowired })
	private BCryptPasswordEncoder cryptPasswordEncoder;
	
	@Autowired
	public MemberLoginService(MemberDao dao) {
		this.dao = dao;
	}
	
	public MemberVo login(String m_id, String m_pw) {		
		MemberVo vo = null;		
		MemberVo result = dao.login(m_id);
		
		if(result != null) {
			String encodePassword = result.getM_pw();
			cryptPasswordEncoder.matches(m_pw, encodePassword);
			if(cryptPasswordEncoder.matches(m_pw, encodePassword) == true) {
				vo = result;
			}
		}		

		return vo;
	}
	
	public void recordLogin(int m_idx) {
		dao.recordLogin(m_idx);
	}
	
}