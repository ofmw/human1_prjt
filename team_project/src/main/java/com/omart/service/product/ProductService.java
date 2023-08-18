package com.omart.service.product;

import java.util.List;

import com.omart.vo.ProductVo;
import com.omart.vo.WishVo;

public interface ProductService {
	
	default List<ProductVo> productList() {return null;}
	default List<ProductVo> bestList() {return null;}
	default List<ProductVo> saleList() {return null;}
	default List<ProductVo> newList() {return null;}
	default ProductVo getProduct(String p_id) {return null;}
	default int addWishList(int m_idx, String p_id) {return 0;}
	default int removeWishList(int m_idx, String p_id) {return 0;}
	default void updateTotalSales(ProductVo pVo) {}
	default int checkReview(ProductVo pVo) {return 0;}
	default double getStarsAvg(String p_id) {return 0.0;}
	default int getReviews(String p_id) {return 0;}
	default void setStock(ProductVo pVo) {}
	
}
