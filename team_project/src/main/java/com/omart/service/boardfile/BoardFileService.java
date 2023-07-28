package com.omart.service.boardfile;

import java.util.List;

import org.springframework.stereotype.Service;

import com.omart.vo.BoardFileVo;

@Service
public interface BoardFileService {
	default int insertBoard(BoardFileVo boardFileVo) {return 0;}
	default int noticeBoard(BoardFileVo boardFileVo) {return 0;}
	default List<BoardFileVo> getAllNotices() {return null;}
}
