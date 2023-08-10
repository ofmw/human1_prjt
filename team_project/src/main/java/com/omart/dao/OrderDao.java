package com.omart.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.omart.vo.OrderVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class OrderDao{
	
	public static final String MAPPER = "com.omart.OrderMapper";
	private final SqlSession sqlSession;
	
	public void createOrder(OrderVo orderVo) {
		sqlSession.insert(MAPPER+".createOrder", orderVo);
	}
	
}
