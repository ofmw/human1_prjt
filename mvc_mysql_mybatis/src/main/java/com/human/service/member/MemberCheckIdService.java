package com.human.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.MemberDao;
import com.human.vo.MemberVo;

@Service("mCheckId")
public class MemberCheckIdService implements MemberService {	
	
	private MemberDao dao;
	
	@Autowired
	public MemberCheckIdService(MemberDao dao) {
		this.dao = dao;
	}
	
	public int checkId(String member_id) {
		
		return dao.checkId(member_id);
	}
	
}
