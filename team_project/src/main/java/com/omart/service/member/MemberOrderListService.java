package com.omart.service.member;

import java.util.List;

import org.springframework.stereotype.Service;

import com.omart.dao.MemberDao;
import com.omart.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Service("mOdrList")
@RequiredArgsConstructor
public class MemberOrderListService implements MemberService {	
	
	private final MemberDao dao;
	
	public List<OrderVo> orderList(int m_idx) {
		return dao.orderList(m_idx);
	}
	
}
