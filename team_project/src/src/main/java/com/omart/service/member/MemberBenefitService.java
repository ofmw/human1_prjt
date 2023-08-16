package com.omart.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omart.dao.MemberDao;
import com.omart.vo.MemberVo;

import lombok.Setter;

@Service("mBenefit")
public class MemberBenefitService implements MemberService {
	
	@Setter(onMethod_={ @Autowired })
	private MemberDao dao;
	
	public int getPoint(int m_idx){
		return dao.getPoint(m_idx);
	}
	
	public void setPoint(MemberVo memberVo){
		dao.setPoint(memberVo);
	}
	
}