package com.human.service.boardfile;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.human.common.PageNav;
import com.human.vo.BoardFileVo;

public interface BoardFileService {
	
	default List<BoardFileVo> SelectList(String searchField, String searchWord) {return null;}
	default PageNav setPageNav(PageNav pageNav, String pageNum, String pageBlock) {return null;}
	default int selectCount(String searchField, String searchWord) {return 0;}
	default int insertBoard(MultipartFile attachedFile, String member_name, String mamber_idx, String title, String content,
			HttpServletRequest request) {return 0;}
	default void updateReadCount(int board_idx) {}
	default BoardFileVo SelectView(int board_idx) {return null;}
	default int UpdateBoard(MultipartFile attachedFile, int board_idx, String title, String content,
			HttpServletRequest request) {return 0;}
	default void Download(String originFileName, String saveFileName, HttpServletRequest request, HttpServletResponse response) {}
	default int DeletePost(int board_idx, HttpServletRequest request) {return 0;}
	
}
