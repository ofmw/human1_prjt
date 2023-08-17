package com.omart.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omart.dao.MemberDao;

import lombok.Setter;

@Service("mCancel")
public class MemberCancelService implements MemberService {
	
	@Setter(onMethod_={ @Autowired })
	private MemberDao dao;

	//회원탈퇴
	public int cancel(int m_idx) {
		System.out.println("서비스에 제공된 m_idx: " +m_idx);
		return dao.cancel(m_idx);
	}
	
}