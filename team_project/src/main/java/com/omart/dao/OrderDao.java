package com.omart.dao;


import java.util.ArrayList;
import java.util.Arrays;
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
		List<OrderVo> ph_info = sqlSession.selectList(MAPPER+".get_ph_info", m_idx); 
				
		
		for (OrderVo vo : ph_info) {
            
			String p_ids = vo.getProducts();
			String[] p_idArray = p_ids.split(",");
			int p_amount = p_idArray.length;
			vo.setP_amount(p_amount);
        }
		
		return ph_info; 
	}
	
	//주문/배송내역에 있는 상품 정보 조회
	public List<ProductVo> getP_info(List<OrderVo> ph_info) {
		
		List<ProductVo> p_info = new ArrayList<>();
		List<String[]> p_idList = new ArrayList<>();
		
		for (int i=0; i<ph_info.size(); i++) {
			
			String p_ids = ph_info.get(i).getProducts();
			System.out.println("추출한 p_id: " +p_ids);
			
			String[] p_idArray = p_ids.split(",");
			System.out.println("추출한 p_id를 담은 배열: " +Arrays.toString(p_idArray));
			
			String p_id = p_idArray[0];
			System.out.println("추출한 첫번째 주문의 첫번째 p_id: " +p_id);
			ProductVo first_pInfo = sqlSession.selectOne(MAPPER+".getP_info", p_id);
			
			p_idList.add(p_idArray);
			p_info.add(first_pInfo);
			System.out.println("조회한 첫번째 상품 정보:" +first_pInfo);
		}
		
		System.out.println("추출한 p_id 모음:" +p_idList.toString());
		System.out.println("첫번째 상품 정보 모음:" +p_info);
		
		for (String[] array : p_idList) {
            
            System.out.println(Arrays.toString(array));
        }
		
		return p_info;
	}
	
	//주문내역 상세보기에 있는 상품 정보 조회
	public List<ProductVo> getP_info2(String[] p_idArr) {
		
		List<ProductVo> p_info = new ArrayList<ProductVo>();
		System.out.println("getP_info2 배열: " +Arrays.toString(p_idArr));
		
		for (String p_id : p_idArr) {
			System.out.println("getP_info2 배열 p_id: " +p_id);
			ProductVo vo = sqlSession.selectOne(MAPPER+".getP_info2", p_id);
			p_info.add(vo);
			System.out.println("getP_info2 p_id: "+vo.getP_name());
			System.out.println("getP_info2 p_id: "+vo.getP_id());
		}
		
		return p_info;
	}
	
}
