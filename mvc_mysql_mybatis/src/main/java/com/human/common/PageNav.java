package com.human.common;

import org.springframework.stereotype.Component;

@Component
public class PageNav {
	
	/*페이지 네비게이션 관련 변수 선언
	1. 총 레코드 수: totalRows
	2. 페이지당 테이블에 출력할 레코드 수: rows_per_page
	3. 페이지 네비게이션에서 블록당 페이지 수: pages_per_block
	4. 페이지 네비게이션에서 현재 페이지 번호: pageNum
	5. 테이블에 표시할 시작번호: startNum
	6. 테이블에 표시할 끝번호: endNum
	7. 페이지 네비게이션에서 전체 페이지번호 수: totalPageNum
	8. 페이지 네비게이션에서 현재 페이지 블록: pageBlock
	9. 페이지 네비게이션에서 마지막 페이지 블록: lagePageBlock
	*/
	
	private int totalRows;
	private int rows_per_page;
	private int pages_per_block;
	private int pageNum;
	private int startNum;
	private int endNum;
	private int totalPageNum;
	private int pageBlock;
	private int lastPageBlock;
	
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public int getRows_per_page() {
		return rows_per_page;
	}
	public void setRows_per_page(int rows_per_page) {
		this.rows_per_page = rows_per_page;
	}
	public int getPages_per_block() {
		return pages_per_block;
	}
	public void setPages_per_block(int pages_per_block) {
		this.pages_per_block = pages_per_block;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	public int getTotalPageNum() {
		return totalPageNum;
	}
	public void setTotalPageNum(int totalPageNum) {
		this.totalPageNum = totalPageNum;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getLastPageBlock() {
		return lastPageBlock;
	}
	public void setLastPageBlock(int lastPageBlock) {
		this.lastPageBlock = lastPageBlock;
	}
	
}
