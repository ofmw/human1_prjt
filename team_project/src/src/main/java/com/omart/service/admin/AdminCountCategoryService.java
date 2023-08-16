package com.omart.service.admin;

import org.springframework.stereotype.Service;

import com.omart.dao.AdminDao;

import lombok.RequiredArgsConstructor;

@Service("cgCount")
@RequiredArgsConstructor
public class AdminCountCategoryService implements AdminService {	
	
	private final AdminDao dao;
	
	public int countCategory(String category) {
		
		return dao.countCategory(category);
	}
	
}
