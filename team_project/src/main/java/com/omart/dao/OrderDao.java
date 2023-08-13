package com.omart.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.omart.vo.OrderVo;
import com.omart.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class OrderDao{
	
	public static final String MAPPER = "com.omart.OrderMapper";
	private final SqlSession sqlSession;
	
	public void createOrder(OrderVo orderVo) {
		System.out.println("DAO 주문번호 확인:"+orderVo.getOrder_idx());
		sqlSession.insert(MAPPER+".createOrder", orderVo);
	}
	
	public OrderVo selectOrder(String OrderNum) {
		return sqlSession.selectOne(MAPPER+".selectOrder", OrderNum);
	}
	
	public List<OrderVo> get_ph_info(int m_idx) {
		return sqlSession.selectList(MAPPER+".get_ph_info", m_idx);
	}
	
	//찜목록에 있는 상품 정보 조회
	public List<ProductVo> getP_info(List<OrderVo> ph_info) {
		
		ph_info.get(0).getp
		
		return sqlSession.selectList(MAPPER+".getP_info", wish);
	}
	
}
