package com.omart.service.boardfile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omart.dao.NoticeDao;
import com.omart.vo.BoardFileVo;

@Service("bfNotice")
public class BoardFileNoticeService implements BoardFileService{
	private NoticeDao dao;
	
	@Autowired
	public BoardFileNoticeService(NoticeDao dao) {
		this.dao = dao;
	}
	
	public int noticeBoard(BoardFileVo boardFileVo) {
		
		return dao.noticeBoard(boardFileVo);
	}
	
	public List<BoardFileVo> getAllNotices(){
		return dao.getAllNotices();
	}
	

}
