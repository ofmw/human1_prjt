package com.omart.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.omart.dao.MemberDao;
import com.omart.vo.MemberVo;

import lombok.Setter;

@Service("mJoin")
public class MemberJoinService implements MemberService {
	
	@Setter(onMethod_={ @Autowired })
	private MemberDao dao;
	@Setter(onMethod_={ @Autowired })
	private BCryptPasswordEncoder cryptPasswordEncoder;

	public int join(MemberVo memberVo) {
		
		//회원가입시 비밀번호를 스프링 보안을 이용해서 암호화시키는 테스트
		String rawPassword = memberVo.getM_pw();
		
		//원 비밀번호를 암호화시키는 메소드: encode(rawPassWord)
		String encodePassword = cryptPasswordEncoder.encode(rawPassword);
		System.out.println("암호화된 비밀번호: "+encodePassword);
		memberVo.setM_pw(encodePassword);
		//원 비밀번호와 암호화된 비밀번호가 일치하는지 여부를 판단하는 메소드: matches(rawPassword, encodePassword)
		System.out.println("원비밀번호와 암호화된 비밀번호 일치여부: "+ cryptPasswordEncoder.matches(rawPassword, encodePassword));
		
		return dao.join(memberVo);
	}
	
	public int checkM_idx(MemberVo vo) {
		return dao.checkM_idx(vo);
	}
	
	public boolean checkDuplicateId(String m_id) {
		return dao.isDuplicateById(m_id);
	}
	
	public boolean checkDuplicateSelNum(String selNum) {
		return dao.isDuplicateBySelNum(selNum);
	}

}