package com.omart.service.admin;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.omart.dao.AdminDao;
import com.omart.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Service("acCreate")
@RequiredArgsConstructor
public class AdminCreateAccountService implements AdminService {	
	
	private final AdminDao dao;
	private final BCryptPasswordEncoder cryptPasswordEncoder;
	
	public int createAccount(MemberVo memberVo) {
		
		String rawPassword = memberVo.getM_pw();
		
		//원 비밀번호를 암호화시키는 메소드: encode(rawPassWord)
		String encodePassword = cryptPasswordEncoder.encode(rawPassword);
		System.out.println("암호화된 비밀번호: "+encodePassword);
		memberVo.setM_pw(encodePassword);
		//원 비밀번호와 암호화된 비밀번호가 일치하는지 여부를 판단하는 메소드: matches(rawPassword, encodePassword)
		System.out.println("원비밀번호와 암호화된 비밀번호 일치여부: "+ cryptPasswordEncoder.matches(rawPassword, encodePassword));
		
		return dao.createAccount(memberVo);
	}
	
}
