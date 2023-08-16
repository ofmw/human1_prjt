package com.omart.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omart.dao.MemberDao;
import com.omart.vo.MemberVo;
import com.omart.vo.PointVo;

import lombok.Setter;

@Service("mBenefit")
public class MemberBenefitService implements MemberService {
	
	@Setter(onMethod_={ @Autowired })
	private MemberDao dao;
	
	public int getPoint(int m_idx){
		return dao.getPoint(m_idx);
	}
	
	public void usePoint(MemberVo memberVo){
		dao.usePoint(memberVo);
	}
	
	public void addPoint(PointVo pointVo) {
		dao.addPoint(pointVo);
	}
	
}