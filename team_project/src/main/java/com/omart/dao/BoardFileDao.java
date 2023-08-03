package com.omart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omart.vo.BoardFileVo;

@Repository
public class BoardFileDao {
	private static final String MAPPER = "com.omart.BoardFileMapper";
	
	private SqlSession sqlSession;
	
	@Autowired
	public BoardFileDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insertInquiry(BoardFileVo vo) {
		return sqlSession.insert(MAPPER + ".insertInquiry", vo);
	}
	
	public int insertNotice(BoardFileVo vo) {
		return sqlSession.insert(MAPPER + ".insertNotice", vo);
	}
	
	public int insertFaq(BoardFileVo vo) {
		return sqlSession.insert(MAPPER + ".insertFaq", vo);
	}
	
	public int insertEvent(BoardFileVo vo) {
		return sqlSession.insert(MAPPER + ".insertEvent", vo);
	}
	
	public List<BoardFileVo> getAllNotices(){
		return sqlSession.selectList(MAPPER + ".getAllNotices");
	}
	
	public List<BoardFileVo> getAllFaqes(){
		return sqlSession.selectList(MAPPER + ".getAllFaqes");
	}


	public List<BoardFileVo> getAllEvents(){
		return sqlSession.selectList(MAPPER + ".getAllEvents");
	}
	
	public BoardFileVo getNoticeById(int bIdx) {
		return sqlSession.selectOne(MAPPER + ".getNoticeById", bIdx);
	}
}
