package com.human.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.human.common.PageNav;
import com.human.service.boardfile.BoardFileService;
import com.human.vo.BoardFileVo;

@Controller
@RequestMapping("/boardFile")
public class BoardFileController {
	//서비스 클래스로 사용할 클래스들을 멤버변수로 정의하고 의존자동주입 받도록 정의
	BoardFileService bfList, bfPage, bfCount, bfInsert, bfUpdateCount, bfView, bfUpdate, bfDownload, bfDelete;
	PageNav pageNav;
	
	@Autowired
	public void setBfList(@Qualifier("bfList") BoardFileService bfList) {
		this.bfList = bfList;
	}
	
	@Autowired
	public void setBfPage(@Qualifier("bfPage") BoardFileService bfPage, PageNav pageNav) {
		this.bfPage = bfPage;
		this.pageNav = pageNav;
	}
	
	@Autowired
	public void setBfCount(@Qualifier("bfCount") BoardFileService bfCount) {
		this.bfCount = bfCount;
	}
	
	@Autowired
	public void setBfInsert(@Qualifier("bfInsert") BoardFileService bfInsert) {
		this.bfInsert = bfInsert;
	}
	
	@Autowired
	public void setBfUpdateCount(@Qualifier("bfUpdateCount") BoardFileService bfUpdateCount) {
		this.bfUpdateCount = bfUpdateCount;
	}
	
	@Autowired
	public void setBfView(@Qualifier("bfView") BoardFileService bfView) {
		this.bfView = bfView;
	}
	
	@Autowired
	public void setBfUpdate(@Qualifier("bfUpdate") BoardFileService bfUpdate) {
		this.bfUpdate = bfUpdate;
	}
	
	@Autowired
	public void setBfDownload(@Qualifier("bfDownload") BoardFileService bfDownload) {
		this.bfDownload = bfDownload;
	}
	
	@Autowired
	public void setBfDelete(@Qualifier("bfDelete") BoardFileService bfDelete) {
		this.bfDelete = bfDelete;
	}
	
	//요청을 처리할 메소드들 정의
	
	@GetMapping("/list.do")
	public String list(String searchField, String searchWord, String pageNum, String pageBlock, Model model) {
		
		//게시판 목록을 가져오는 요청에 대한 처리를 위해 BoardFileListService 클래스 정의
		List<BoardFileVo> boardList = bfList.SelectList(searchField, searchWord);
		model.addAttribute("boardList", boardList);
		
		//페이지 네비게이션을 위해 BoardFilePageService클래스 정의
		
		//총 레코드 수를 가져오기 위해 BoardFileCountService클래스 정의
		int totRows = bfCount.selectCount(searchField, searchWord);
		pageNav.setTotalRows(totRows);
		pageNav = bfPage.setPageNav(pageNav, pageNum, pageBlock);
		
		model.addAttribute("pageNav", pageNav);
		
		return "boardFile/list";
	}
	
	//글등록 화면요청 처리
	@GetMapping("/write.do")
	public String write() {		
		return "boardFile/write";
	}
	
	//글등록 요청 처리
	@PostMapping("/write_process.do")
	public String write_process(@RequestParam("attachedFile") MultipartFile attachedFile, String member_name, String member_idx,
								String title, String content, HttpServletRequest request) {
		String viewPage = "boardFile/write"; //글등록 실패시 보여지는 페이지
		
		//첨부파일과 글내용 저장을 위해 BoardFileInsertService 정의
		int result = bfInsert.insertBoard(attachedFile, member_name, member_idx, title, content, request);
		
		if(result == 1) {
			viewPage = "redirect:list.do";
		}
		
		return viewPage;
	}
	
	//글내용 보기 화면요청 처리
	@GetMapping("/view.do")
	public String view(@RequestParam("no") int board_idx, Model model) {
		
		//조회수 증가를 위해 BoardFileUpdateCountService 정의
		bfUpdateCount.updateReadCount(board_idx);
		
		//게시물을 가져오기 위해 BoardFileViewService 정의
		BoardFileVo vo = bfView.SelectView(board_idx);
		
		model.addAttribute("boardFileVo", vo);
		
		return "boardFile/view";
	}
	
	@GetMapping("/edit.do")
	public String edit(@RequestParam("no") int board_idx, Model model) {
		
		//게시물을 가져오기 위해 BoardFileViewService 정의
		BoardFileVo vo = bfView.SelectView(board_idx);		
		model.addAttribute("boardFileVo", vo);
		
		return "boardFile/edit";
	}
	
	//글수정 요청 처리
	@PostMapping("/edit_process.do")
	public String edit_process(@RequestParam("attachedFile") MultipartFile attachedFile, int board_idx,
								String title, String content, HttpServletRequest request) {
		
		String viewPage = "boardFile/edit"; //글수정 실패시 보여지는 페이지
		
		//첨부파일과 글내용 저장을 위해 BoardFileEditService 정의
		int result = bfUpdate.UpdateBoard(attachedFile, board_idx, title, content, request);
		
		if(result == 1) {
			viewPage = "redirect:view.do?no="+board_idx;
		}
		
		return viewPage;
	}
	
	//다운로드 요청 처리
	@GetMapping("/download.do")
	public void download(String oName, String sName, HttpServletRequest request, HttpServletResponse response) {
		
		//request객체는 파일의 실제 저장경로를 알아내는데 필요하고, response객체는 파일을 출력하는데 필요함
		
		//파일 다운로드 요청처리를 위해 BoardFileDownloadService 정의
		bfDownload.Download(oName, sName, request, response);
		
	}
	
	//삭제요청 처리
	@PostMapping("/delete_process.do")
	public String delete_process(@RequestParam("no") int board_idx, HttpServletRequest request) {
		
		int result = bfDelete.DeletePost(board_idx, request);
		
		String viewPage = "boardFile/view";
		
		if(result == 1) {
			viewPage = "redirect:list.do";
		}
		
		return viewPage;
	}

}
