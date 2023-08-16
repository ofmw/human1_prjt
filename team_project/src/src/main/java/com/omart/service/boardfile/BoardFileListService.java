package com.omart.service.boardfile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omart.dao.BoardFileDao;
import com.omart.vo.BoardFileVo;

@Service("bfList")
public class BoardFileListService implements BoardFileService{
	
private BoardFileDao dao;
	
	@Autowired
	public BoardFileListService(BoardFileDao dao) {
		this.dao = dao;
	}
	
	public List<BoardFileVo> getAllNotices(){
		return dao.getAllNotices();
	}
	
	public List<BoardFileVo> getAllFaqes(){
		return dao.getAllFaqes();
	}
	
	public List<BoardFileVo> getAllEvents(){
		return dao.getAllEvents();
	}

	public List<BoardFileVo> getAllInquiries(){
		return dao.getAllInquiries();
	}
	
	public List<BoardFileVo> getAllQnas(){
		return dao.getAllQnas();
	}
	

}
