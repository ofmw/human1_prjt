package com.human.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.MemberDao;
import com.human.vo.MemberVo;

@Service("mCancel")
public class MemberCancelService implements MemberService {	
	
	private MemberDao dao;
	
	@Autowired
	public MemberCancelService(MemberDao dao) {
		this.dao = dao;
	}
	
	public int cancel(int member_idx) {
		
		return dao.cancel(member_idx);
	}
	
}
