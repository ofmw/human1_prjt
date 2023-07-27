package com.omart.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.omart.dao.MemberDao;
import com.omart.vo.MemberVo;

@Service("mJoin")
public class MemberJoinService implements MemberService {
	private MemberDao dao;
	
	@Autowired
	public MemberJoinService(MemberDao dao) {
		this.dao = dao;
	}

	public int join(MemberVo memberVo) {
		// 회원 비밀번호를 암호화하여 저장
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(memberVo.getM_pw());
		memberVo.setM_pw(encodedPassword);
		
		// 회원 정보를 데이터베이스에 저장
		return dao.join(memberVo);
	}
	
}