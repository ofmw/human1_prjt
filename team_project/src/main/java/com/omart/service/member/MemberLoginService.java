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
	
	public MemberVo login(String member_id, String member_pw) {
		
		MemberVo vo = null;
		MemberVo result = dao.login(member_id);
		
		if(result != null) {
			
			String encodePassword = result.getM_pw();
			cryptPasswordEncoder.matches(member_pw, encodePassword);
			if(cryptPasswordEncoder.matches(member_pw, encodePassword) == true) {
				
			}
		}
		
		return vo;
	}
	
}