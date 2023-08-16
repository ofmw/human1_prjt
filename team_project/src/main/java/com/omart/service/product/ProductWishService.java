package com.omart.service.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omart.dao.ProductDao;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Service("pdWish")
@RequiredArgsConstructor
public class ProductWishService implements ProductService {	
	
	@Setter(onMethod_={ @Autowired })
	private ProductDao dao;
	
	//찜목록 추가
	public int addWishList(int m_idx, String p_id) {
		
		//테이블 update 결과 저장
		int result = dao.addWishList(m_idx, p_id);
		if (result != 0) { //업데이트에 성공했을 경우
			return 1;
		} else { //업데이트에 실패했을 경우
			return 0;
		}
	}
	
	//찜목록 삭제
	public int removeWishList(int m_idx, String p_id) {
		
		//테이블 update 결과 저장
		int result = dao.removeWishList(m_idx, p_id);
		if (result != 0) { //업데이트에 성공했을 경우
			return 1;
		} else { //업데이트에 실패했을 경우
			return 0;
		}
	}
}
