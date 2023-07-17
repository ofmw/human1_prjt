package com.human.service.boardfile;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.BoardFileDao;

@Service("bfUpdateCount")
public class BoardFileUpdateCountService implements BoardFileService {	
	
	private BoardFileDao dao;
	
	@Autowired
	public BoardFileUpdateCountService(BoardFileDao dao) {
		this.dao = dao;
	}
	
	public void updateReadCount(int board_idx) {
		
		dao.updateReadCount(board_idx);
	}
	
}
