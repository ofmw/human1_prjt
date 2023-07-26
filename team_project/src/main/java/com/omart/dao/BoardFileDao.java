package com.omart.dao;

import org.apache.ibatis.session.SqlSession;

import com.omart.vo.BoardFileVo;

public class BoardFileDao {
	private static final String MAPPER = "com.omart.BoardFileMapper";
	
	private SqlSession sqlSession;
	
	public BoardFileDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insertBoard(BoardFileVo vo) {
		return sqlSession.insert(MAPPER + ".insertBoard", vo);
	}
}
