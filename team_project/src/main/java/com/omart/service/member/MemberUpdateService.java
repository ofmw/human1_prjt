package com.omart.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omart.dao.MemberDao;
import com.omart.vo.MemberVo;

@Service("mUpdate")
public class MemberUpdateService implements MemberService {
	private MemberDao dao;
	
	@Autowired
	public MemberUpdateService(MemberDao dao) {
		this.dao = dao;
	}

	public MemberVo update(MemberVo memberVo) {
		
		return dao.update(memberVo);
	}
	
}