package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnectionPool;
import vo.BoardVo;
import vo.CommentVo;
import dao.CommentDao;
import vo.MemberVo;

public class BoardDao extends DBConnectionPool {
	
	//작성한 게시글 수 반환
	public int countBoardM(MemberVo mVo) {
		int result = 0;
		
		try {
			String sql = "select count(*) from rc_b_qa where m_idx = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mVo.getM_idx());
			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			rs.close();
		} catch (SQLException e) {
			System.out.println("qa 작성글 카운트 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int insertNotice(BoardVo vo) {
		int result = 0;//글 등록 실패시 반환값
		
		try {
			String sql = "insert into rc_b_notice (b_idx, content, m_idx) "
					+ "values(rc_b_notice_seq.nextval, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getContent());
			pstmt.setInt(2, vo.getM_idx());
			
			result = pstmt.executeUpdate();//executeUpdate()쿼리 수행결과 적용된 행의 수 반환
			//성공시 1 반환
			
		} catch (Exception e) {
			System.out.println("글 등록 중 예외 발생");
			e.printStackTrace();
		}	
		return result;
	}
	
	public int insertQA(BoardVo vo) {
		int result = 0;//글 등록 실패시 반환값
		
		try {
			String sql = "insert into rc_b_qa (b_idx, title, content, m_idx, m_name) "
					+ "values(rc_b_qa_seq.nextval, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getM_idx());
			pstmt.setString(4, vo.getM_name());
			
			result = pstmt.executeUpdate();//executeUpdate()쿼리 수행결과 적용된 행의 수 반환
			//성공시 1 반환
			
		} catch (Exception e) {
			System.out.println("글 등록 중 예외 발생");
			e.printStackTrace();
		}	
		return result;
	}
	
	public int insertBoard(BoardVo vo) {
		int result = 0;//글 등록 실패시 반환값
		
		try {
			String sql = "insert into rc_b_qa (b_idx, title, content, m_idx, m_name) "
					+ "values(rc_b_qa_seq.nextval, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getM_idx());
			pstmt.setString(4, vo.getM_name());
			
			result = pstmt.executeUpdate();//executeUpdate()쿼리 수행결과 적용된 행의 수 반환
			//성공시 1 반환
			
		} catch (Exception e) {
			System.out.println("글 등록 중 예외 발생");
			e.printStackTrace();
		}	
		return result;
	}
	
	//검색 조건에 맞는 게시물 수를 반환하는 메소드
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String searchWord, searchField, sql;
		searchWord = searchField = sql = null;
		
		try {
			if(map.size() != 0) {//검색어가 있는 경우
				searchWord = (String)map.get("searchWord");
				searchField = (String)map.get("searchField");
				
				if(searchField.equals("title")) {//검색구분이 '제목'인 경우
					sql = "select count(*) from rc_b_qa "
							+ "where title like '%'||?||'%' "
							+ "order by b_idx desc";
				}else {//검색구분이 '내용'인 경우
					sql = "select count(*) from rc_b_qa "
							+ "where content like '%'||?||'%' "
							+ "order by b_idx desc";
				}				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
				//PreparedStatement like를 이용한 검색시 %와 ? 바인딩 방법
				//OracleSQL에서는 sql문을 like '%'||?||'%'로 쓰고 pstmt.setString(1, searchWord);로 작성했으나,
				//MySQL에서는 like sql문을 ?로 쓰고 pstmt.setString(1, "%"+searchWord+"%");로 작성함
				pstmt.executeQuery();
				
			}else {//검색어가 없는 경우
				sql = "select count(*) from rc_b_qa order by b_idx desc";
				pstmt = conn.prepareStatement(sql);
			}
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	
	//검색 조건에 맞는 게시물 목록을 반환하는 메소드
	public List<BoardVo> selectList(Map<String, Object> map) {
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		CommentDao cDao = new CommentDao();
		
		String searchWord, searchField, sql;
		searchWord = searchField = sql = null;
		
		try {
			if(map.size() != 0) {//검색어가 있는 경우
				searchWord = (String)map.get("searchWord");
				searchField = (String)map.get("searchField");
				
				if(searchField.equals("title")) {//검색구분이 '제목'인 경우
					sql = "select * from rc_b_qa "
							+ "where title like '%'||?||'%' "
							+ "order by b_idx desc";
				}else {//검색구분이 '내용'인 경우
					sql = "select * from rc_b_qa "
							+ "where content like '%'||?||'%' "
							+ "order by b_idx desc";
				}				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);

				pstmt.executeQuery();
				
			}else {//검색어가 없는 경우
				sql = "select * from rc_b_qa order by b_idx desc";
				pstmt = conn.prepareStatement(sql);
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVo vo = new BoardVo();
				vo.setB_idx(rs.getInt("b_idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getDate("post_date"));
				vo.setM_idx(rs.getInt("m_idx"));
				vo.setM_name(rs.getString("m_name"));
				vo.setRead_count(rs.getInt("read_count"));
				vo.setDel_or_not(rs.getInt("del_or_not"));
				vo.setC_count(cDao.selectCount(rs.getInt("b_idx")));
				
				boardList.add(vo);
				
			}
			cDao.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}
	
//----------------------------------------------------------------------------------------------------------------------------------
	public List<BoardVo> selectNotice() {
		
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		
		String sql = null;
		
		try {
				sql = "select * from rc_b_notice order by b_idx desc";
				pstmt = conn.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVo vo = new BoardVo();
				vo.setB_idx(rs.getInt("b_idx"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getDate("post_date"));
				vo.setM_idx(rs.getInt("m_idx"));
				vo.setDel_or_not(rs.getInt("del_or_not"));
				
				boardList.add(vo);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}
	
	public int countNotice() {
		int totalCount = 0;
		
		String sql = null;
		
		try {
			sql = "select count(*) from rc_b_notice order by b_idx desc";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public void readCount_qa(int b_idx) {
		String sql = "update rc_b_qa set read_count = read_count+1 where b_idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
		
	}
	
	public int updateQA(BoardVo vo) {
		int result = 0;//수정 실패시 반환값
		
		try {
			String sql = "update rc_b_qa set title=?, content=? where b_idx=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getB_idx());
			
			//쿼리문 실행 후 적용된 행의 수 반환
			//성공시 1 반환
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}		
		return result;
	}
	
	public BoardVo selectQA(int b_idx) {
		BoardVo vo = new BoardVo();
		CommentDao cDao = new CommentDao();
		
		String sql = "select * from rc_b_qa where b_idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setB_idx(rs.getInt("b_idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getDate("post_date"));
				vo.setM_idx(rs.getInt("m_idx"));
				vo.setM_name(rs.getString("m_name"));
				vo.setRead_count(rs.getInt("read_count"));
				vo.setDel_or_not(rs.getInt("del_or_not"));
			}
			
		} catch (SQLException e) {
			System.out.println("게시물 로드 중 예외 발생");
			e.printStackTrace();
		}		
		return vo;
	}	
	
	//검색 조건에 맞는 게시물 목록을 반환하는 메소드 관리자용
	public List<BoardVo> selectAll(Map<String, Object> map) {
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		CommentDao cDao = new CommentDao();
		
		String searchWord, searchField, sql;
		searchWord = searchField = sql = null;
		
		try {
			if(map.size() != 0) {//검색어가 있는 경우
				searchWord = (String)map.get("searchWord");
				searchField = (String)map.get("searchField");
				if(searchField.equals("title")) {//검색구분이 '제목'인 경우
					sql = "select 'rc_b_qa' as table_name, b_idx, title, content, post_date, read_count, m_name, m_idx, del_or_not, del_date "
							+ "from rc_b_qa "
							+ "where title like '%'||?||'%' "
							+ "union all "
							+ "select 'rc_b_ps' as table_name, b_idx, title, content, post_date, read_count, m_name, m_idx, del_or_not, del_date "
							+ "from rc_b_ps "
							+ "where title like '%'||?||'%' "
							+ "order by post_date desc";
				}else if(searchField.equals("content")) {//검색구분이 '내용'인 경우
					sql = "select 'rc_b_qa' as table_name, b_idx, title, content, post_date, read_count, m_name, m_idx, del_or_not, del_date "
							+ "from rc_b_qa "
							+ "where content like '%'||?||'%' "
							+ "union all "
							+ "select 'rc_b_ps' as table_name, b_idx, title, content, post_date, read_count, m_name, m_idx, del_or_not, del_date "
							+ "from rc_b_ps "
							+ "where content like '%'||?||'%' "
							+ "order by post_date desc";
				}else {
					sql = "select 'rc_b_qa' as table_name, b_idx, title, content, post_date, read_count, m_name, m_idx, del_or_not, del_date "
							+ "from rc_b_qa "
							+ "where m_name like '%'||?||'%' "
							+ "union all "
							+ "select 'rc_b_ps' as table_name, b_idx, title, content, post_date, read_count, m_name, m_idx, del_or_not, del_date "
							+ "from rc_b_ps "
							+ "where m_name like '%'||?||'%' "
							+ "order by post_date desc";
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
				pstmt.setString(2, searchWord);
				pstmt.executeQuery();
				
			}else {//검색어가 없는 경우
				sql = "select 'rc_b_qa' as table_name, b_idx, title, content, post_date, read_count, m_name, m_idx, del_or_not, del_date from rc_b_qa "
						+ "union all "
						+ "select 'rc_b_ps' as table_name, b_idx, title, content, post_date, read_count, m_name, m_idx, del_or_not, del_date from rc_b_ps "
						+ "order by post_date desc";
				pstmt = conn.prepareStatement(sql);
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVo vo = new BoardVo();
				vo.setTable_name(rs.getString("table_name"));
				vo.setB_idx(rs.getInt("b_idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getDate("post_date"));
				vo.setM_idx(rs.getInt("m_idx"));
				vo.setM_name(rs.getString("m_name"));
				vo.setRead_count(rs.getInt("read_count"));
				vo.setDel_or_not(rs.getInt("del_or_not"));
				vo.setC_count(cDao.selectCount(rs.getInt("b_idx")));
				
				boardList.add(vo);
				
			}
			cDao.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}
	
	//검색 조건에 맞는 게시물 수를 반환하는 메소드 관리자용
	public int countAll(Map<String, Object> map) {
		int totalCount = 0;
		
		String searchWord, searchField, sql;
		searchWord = searchField = sql = null;
		
		try {
			if(map.size() != 0) {//검색어가 있는 경우
				searchWord = (String)map.get("searchWord");
				searchField = (String)map.get("searchField");
				
				if(searchField.equals("title")) {//검색구분이 '제목'인 경우
					sql = "select( "
							+ "(select count(*) from rc_b_qa "
							+ "where title like '%'||?||'%')+ "
							+ "(select count(*) from rc_b_ps "
							+ "where title like '%'||?||'%')) "
							+ "from dual";
				}else if(searchField.equals("content")) {//검색구분이 '내용'인 경우
					sql = "select( "
							+ "(select count(*) from rc_b_qa "
							+ "where content like '%'||?||'%')+ "
							+ "(select count(*) from rc_b_ps "
							+ "where content like '%'||?||'%')) "
							+ "from dual";
				}else {
					sql = "select( "
							+ "(select count(*) from rc_b_qa "
							+ "where m_name like '%'||?||'%')+ "
							+ "(select count(*) from rc_b_ps "
							+ "where m_name like '%'||?||'%')) "
							+ "from dual";	
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
				pstmt.setString(2, searchWord);
				pstmt.executeQuery();
				
			}else {//검색어가 없는 경우
				sql = "select( "
						+ "(select count(*) from rc_b_qa)+ "
						+ "(select count(*) from rc_b_ps)) "
						+ "from dual";
				pstmt = conn.prepareStatement(sql);
			}
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	
	//검색 조건에 맞는 게시물 수를 반환하는 메소드 랭킹용
	public int rCountAll(String m_name) {
		int totalCount = 0;
		
		String sql = null;
		
		try {			
				sql = "select( "
					+ "(select count(*) from rc_b_qa "
					+ "where m_name like '%'||?||'%')+ "
					+ "(select count(*) from rc_b_ps "
					+ "where m_name like '%'||?||'%')) "
					+ "from dual";	
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m_name);
				pstmt.setString(2, m_name);
				pstmt.executeQuery();				
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public void addScore(BoardVo vo) {
		String sql = null;
		
		try {
			sql = "update rc_m set score = score + 2 where m_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getM_idx());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	//검색 조건에 맞는 게시물 목록을 반환하는 메소드
	public List<BoardVo> selectMain() {
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		CommentDao cDao = new CommentDao();
		
		String sql = null;
		
		try {
			sql = "select * from rc_b_qa order by post_date desc";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVo vo = new BoardVo();
				vo.setB_idx(rs.getInt("b_idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getDate("post_date"));
				vo.setM_idx(rs.getInt("m_idx"));
				vo.setM_name(rs.getString("m_name"));
				vo.setRead_count(rs.getInt("read_count"));
				vo.setDel_or_not(rs.getInt("del_or_not"));
				vo.setC_count(cDao.selectCount(rs.getInt("b_idx")));
				
				boardList.add(vo);
				
			}
			cDao.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}
	
	public List<BoardVo> selectPostAll(Map<String, Object> map) {
				
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		CommentDao cDao = new CommentDao();
		
		String searchWord, searchField, sql;
		int m_idx = (Integer)map.get("m_idx");
		searchWord = searchField = sql = null;
		
		try {
			if(map.size() != 1) {//검색어가 있는 경우
				searchWord = (String)map.get("searchWord");
				searchField = (String)map.get("searchField");
				if(searchField.equals("title")) {//검색구분이 '제목'인 경우
					sql = "select 'rc_b_qa' as table_name, b_idx, title, content, post_date, read_count, m_name, m_idx, del_or_not, del_date "
							+ "from rc_b_qa "
							+ "where title like '%'||?||'%' and m_idx=? "
							+ "union all "
							+ "select 'rc_b_ps' as table_name, b_idx, title, content, post_date, read_count, m_name, m_idx, del_or_not, del_date "
							+ "from rc_b_ps "
							+ "where title like '%'||?||'%' and m_idx=? "
							+ "order by post_date desc";
				}else if(searchField.equals("content")) {//검색구분이 '내용'인 경우
					sql = "select 'rc_b_qa' as table_name, b_idx, title, content, post_date, read_count, m_name, m_idx, del_or_not, del_date "
							+ "from rc_b_qa "
							+ "where content like '%'||?||'%' and m_idx=? "
							+ "union all "
							+ "select 'rc_b_ps' as table_name, b_idx, title, content, post_date, read_count, m_name, m_idx, del_or_not, del_date "
							+ "from rc_b_ps "
							+ "where content like '%'||?||'%' and m_idx=? "
							+ "order by post_date desc";
				}else {
					sql = "select 'rc_b_qa' as table_name, b_idx, title, content, post_date, read_count, m_name, m_idx, del_or_not, del_date "
							+ "from rc_b_qa "
							+ "where m_name like '%'||?||'%' and m_idx=? "
							+ "union all "
							+ "select 'rc_b_ps' as table_name, b_idx, title, content, post_date, read_count, m_name, m_idx, del_or_not, del_date "
							+ "from rc_b_ps "
							+ "where m_name like '%'||?||'%' and m_idx=? "
							+ "order by post_date desc";
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
				pstmt.setInt(2, m_idx);
				pstmt.setString(3, searchWord);
				pstmt.setInt(4, m_idx);
				
			}else {//검색어가 없는 경우				
				
				sql = "select 'rc_b_qa' as table_name, b_idx, title, content, post_date, read_count, m_name, m_idx, del_or_not, del_date "
						+ "from rc_b_qa where m_idx=? "
						+ "union all "
						+ "select 'rc_b_ps' as table_name, b_idx, title, content, post_date, read_count, m_name, m_idx, del_or_not, del_date "
						+ "from rc_b_ps where m_idx=? "
						+ "order by post_date desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, m_idx);
				pstmt.setInt(2, m_idx);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVo vo = new BoardVo();
				vo.setTable_name(rs.getString("table_name"));
				vo.setB_idx(rs.getInt("b_idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getDate("post_date"));
				vo.setM_idx(rs.getInt("m_idx"));
				vo.setM_name(rs.getString("m_name"));
				vo.setRead_count(rs.getInt("read_count"));
				vo.setDel_or_not(rs.getInt("del_or_not"));
				vo.setC_count(cDao.selectCount(rs.getInt("b_idx")));
				
				boardList.add(vo);
			}
			cDao.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}
	
	//검색 조건에 맞는 게시물 수를 반환하는 메소드 관리자용
	public int countPostAll(Map<String, Object> map) {
		int totalCount = 0;
		
		String searchWord, searchField, sql;
		int m_idx = (Integer)map.get("m_idx");
		searchWord = searchField = sql = null;
		
		try {
			if(map.size() != 1) {//검색어가 있는 경우
				searchWord = (String)map.get("searchWord");
				searchField = (String)map.get("searchField");
				
				if(searchField.equals("title")) {//검색구분이 '제목'인 경우
					sql = "select( "
							+ "(select count(*) from rc_b_qa "
							+ "where title like '%'||?||'%' and m_idx=?)+ "
							+ "(select count(*) from rc_b_ps "
							+ "where title like '%'||?||'%' and m_idx=?)) "
							+ "from dual";
				}else {//검색구분이 '내용'인 경우
					sql = "select( "
							+ "(select count(*) from rc_b_qa "
							+ "where content like '%'||?||'%' and m_idx=?)+ "
							+ "(select count(*) from rc_b_ps "
							+ "where content like '%'||?||'%' and m_idx=?)) "
							+ "from dual";
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
				pstmt.setInt(2, m_idx);
				pstmt.setString(3, searchWord);
				pstmt.setInt(4, m_idx);
				
			}else {//검색어가 없는 경우
				sql = "select( "
						+ "(select count(*) from rc_b_qa where m_idx=?)+ "
						+ "(select count(*) from rc_b_ps where m_idx=?)) "
						+ "from dual";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, m_idx);
				pstmt.setInt(2, m_idx);

			}
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public String getTitle(int b_idx) {
		String title, sql;
		title = sql = null;
		
		try {
			sql = "select title from rc_b_qa where b_idx=?";
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				title = rs.getString("title");
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return title;
	}	
	
//----------------------------------------------------------------------------------------------------------------------------------

	//조회수 증가 메소드
	public void updateReadCount(int b_idx) {
		String sql = "update rc_b_qa set read_count = read_count+1 where b_idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
		
	}
	
	
	public BoardVo selectView(int b_idx) {
		BoardVo vo = new BoardVo();
		
		String sql = "select * from rc_b_qa where b_idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setB_idx(rs.getInt("b_idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getDate("post_date"));
				vo.setM_idx(rs.getInt("m_idx"));
				vo.setM_name(rs.getString("m_name"));
				vo.setRead_count(rs.getInt("read_count"));
				vo.setDel_or_not(rs.getInt("del_or_not"));
			}
			
		} catch (SQLException e) {
			System.out.println("게시물 로드 중 예외 발생");
			e.printStackTrace();
		}		
		return vo;
	}	
	
	//지정한 게시물의 내용을 수정하는 메소드
	public int updateBoard(BoardVo vo) {
		int result = 0;//수정 실패시 반환값
		
		try {
			String sql = "update rc_b_qa set title=?, content=? where b_idx=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getB_idx());
			
			//쿼리문 실행 후 적용된 행의 수 반환
			//성공시 1 반환
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}		
		return result;
	}
	
	//
	public int deletePost(BoardVo vo) {
		int result = 0; //게시글 삭제 실패시 반환값
		CommentDao cDao = new CommentDao(); //관련된 댓글 삭제를 위한 dao
		cDao.deletePost(vo.getB_idx());
		cDao.close();
		try {
			String sql = "delete from rc_b_qa where b_idx=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getB_idx());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	

}

