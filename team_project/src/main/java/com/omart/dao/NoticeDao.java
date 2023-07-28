package com.omart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omart.vo.BoardFileVo;

@Repository
public class NoticeDao {
	private static final String MAPPER = "com.omart.BoardFileMapper";
	
	private SqlSession sqlSession;
	
	@Autowired
	public NoticeDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int noticeBoard(BoardFileVo vo) {
		return sqlSession.insert(MAPPER + ".noticeBoard", vo);
	}
	
	public List<BoardFileVo> getAllNotices(){
		return sqlSession.selectList(MAPPER + ".getAllNotices");
	}
	
	public BoardFileVo getNoticeById(int bIdx) {
		return sqlSession.selectOne(MAPPER + ".getNoticeById", bIdx);
	}
}
