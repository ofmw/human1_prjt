package com.omart.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.omart.dao.MemberDao;
import com.omart.dao.OrderDao;
import com.omart.vo.OrderVo;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Service("mPh")
@RequiredArgsConstructor
public class MemberPhService implements MemberService {
	
	@Setter(onMethod_={ @Autowired })
	private OrderDao dao;
	@Setter(onMethod_={ @Autowired })
	private BCryptPasswordEncoder cryptPasswordEncoder;
	
	@Autowired
	public MemberPhService(OrderDao dao) {
		this.dao = dao;
	}
	
	public List<OrderVo> get_ph_info(int m_idx) {
		return dao.get_ph_info(m_idx);
	}
	
}