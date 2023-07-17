package com.human.service.boardfile;



import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.BoardFileDao;

@Service("bfCount")
public class BoardFileCountService implements BoardFileService {	
	
	private BoardFileDao dao;
	
	@Autowired
	public BoardFileCountService(BoardFileDao dao) {
		this.dao = dao;
	}
	
	public int selectCount(String searchField, String searchWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(searchWord != null){
		    map.put("searchField", searchField);
		    map.put("searchWord", searchWord);
		}
		
		return dao.selectCount(map);
	}
	
}
