package com.omart.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omart.dao.MemberDao;
import com.omart.vo.MemberVo;

@Service("mLogin")
public class MemberLoginService implements MemberService {

	private MemberDao dao;
	
	@Autowired
	public MemberLoginService(MemberDao dao) {
		this.dao = dao;
	}
	
	public MemberVo login(String member_id, String member_pw) {
		return dao.login(member_id, member_pw);
	}
	
}