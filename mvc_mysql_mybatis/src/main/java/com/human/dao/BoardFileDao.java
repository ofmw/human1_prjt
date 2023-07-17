package com.human.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.human.vo.BoardFileVo;

@Repository
public class BoardFileDao{
	//BoardFileMapper.xml파일의 네임스페이스로 Mapper가 구분되므로 DAO에서 사용하는 Mapper의 네임스페이스를 상수로 정의함
	public static final String MAPPER = "com.human.BoardFileMapper";
	
	//MyBatis를 이용한 DB연결 및 SQL작업은 SQLSession 객체가 담당함
	private SqlSession sqlSession;
	
	//SqlSession객체는 root-context.xml에 빈으로 등록했기 때문에 의존자동주입을 받을 수 있음
	@Autowired
	public BoardFileDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//게시글 추가
	public int insertBoard(BoardFileVo vo) {		
		return sqlSession.insert(MAPPER+".insertBoard", vo);
	}
	
	//검색 조건에 맞는 게시물 수를 반환하는 메소드
	public int selectCount(Map<String, Object> map) {
		return sqlSession.selectOne(MAPPER+".selectCount", map);
	}
	
	//검색 조건에 맞는 게시물 목록을 반환하는 메소드
	public List<BoardFileVo> selectList(Map<String, Object> map) {
		return sqlSession.selectList(MAPPER+".selectList", map);
	}
	
	//조회수 증가시키는 메소드
	public void updateReadCount(int board_idx) {
		sqlSession.update(MAPPER+".updateReadCount", board_idx);
	}
	
	//지정한 게시물을 찾아 내용을 반환하는 메소드
	public BoardFileVo selectView(int board_idx) {
		return sqlSession.selectOne(MAPPER+".selectView", board_idx);
	}
	
	//지정한 게시물의 내용을 수정하는 메소드
	public int updateBoard(BoardFileVo vo) {
		return sqlSession.update(MAPPER+".updateBoard", vo);
	}
	
	//지정한 게시물을 삭제하는 메소드
	public int deletePost(BoardFileVo vo) {
		return sqlSession.delete(MAPPER+".deletePost", vo);
	}
	
}
