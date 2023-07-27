package com.omart.service.boardfile;

import org.springframework.stereotype.Service;

import com.omart.vo.BoardFileVo;

@Service
public interface BoardFileService {
	default int insertBoard(BoardFileVo boardFileVo) {return 0;}
}
