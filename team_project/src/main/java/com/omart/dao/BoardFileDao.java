package com.omart.dao;

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
	
	public int insertBoard(BoardFileVo vo) {
		return sqlSession.insert(MAPPER + ".insertBoard", vo);
	}
	
}
