package com.omart.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omart.dao.MemberDao;
import com.omart.vo.MemberVo;

@Service("kLogin")
public class KakaoLoginService implements MemberService {

	private MemberDao dao;
	
	@Autowired
	public KakaoLoginService(MemberDao dao) {
		this.dao = dao;
	}
	
	public MemberVo klogin(String m_id) {
		System.out.println("서비스클래스: " +m_id);
		return dao.klogin(m_id);
	}
	
}