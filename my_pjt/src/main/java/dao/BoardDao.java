package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnectionPool;
import vo.BoardVo;

public class BoardDao extends DBConnectionPool {

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
	
	public int insertBoard(BoardVo vo) {
		int result = 0;//글 등록 실패시 반환값
		
		try {
			String sql = "insert into board_basic (board_idx, title, content, member_idx, member_name) "
					+ "values(board_basic_seq.nextval, ?, ?, ?, ?)";
			
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
					sql = "select count(*) from board_basic "
							+ "where title like '%'||?||'%' "
							+ "order by board_idx desc";
				}else {//검색구분이 '내용'인 경우
					sql = "select count(*) from board_basic "
							+ "where content like '%'||?||'%' "
							+ "order by board_idx desc";
				}				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
				//PreparedStatement like를 이용한 검색시 %와 ? 바인딩 방법
				//OracleSQL에서는 sql문을 like '%'||?||'%'로 쓰고 pstmt.setString(1, searchWord);로 작성했으나,
				//MySQL에서는 like sql문을 ?로 쓰고 pstmt.setString(1, "%"+searchWord+"%");로 작성함
				pstmt.executeQuery();
				
			}else {//검색어가 없는 경우
				sql = "select count(*) from board_basic order by board_idx desc";
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
		
		String searchWord, searchField, sql;
		searchWord = searchField = sql = null;
		
		try {
			if(map.size() != 0) {//검색어가 있는 경우
				searchWord = (String)map.get("searchWord");
				searchField = (String)map.get("searchField");
				
				if(searchField.equals("title")) {//검색구분이 '제목'인 경우
					sql = "select * from board_basic "
							+ "where title like '%'||?||'%' "
							+ "order by board_idx desc";
				}else {//검색구분이 '내용'인 경우
					sql = "select * from board_basic "
							+ "where content like '%'||?||'%' "
							+ "order by board_idx desc";
				}				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);

				pstmt.executeQuery();
				
			}else {//검색어가 없는 경우
				sql = "select * from board_basic order by board_idx desc";
				pstmt = conn.prepareStatement(sql);
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVo vo = new BoardVo();
				vo.setB_idx(rs.getInt("board_idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getDate("post_date"));
				vo.setM_idx(rs.getInt("member_idx"));
				vo.setM_name(rs.getString("member_name"));
				vo.setRead_count(rs.getInt("read_count"));
				vo.setDel_or_not(rs.getInt("del_or_not"));
				
				boardList.add(vo);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}
	
	//조회수 증가 메소드
	public void updateReadCount(int board_idx) {
		String sql = "update board_basic set read_count = read_count+1 where board_idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_idx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
		
	}
	
	
	public BoardVo selectView(int board_idx) {
		BoardVo vo = new BoardVo();
		
		String sql = "select * from board_basic where board_idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setB_idx(rs.getInt("board_idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getDate("post_date"));
				vo.setM_idx(rs.getInt("member_idx"));
				vo.setM_name(rs.getString("member_name"));
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
			String sql = "update board_basic set title=?, content=? where board_idx=?";
			
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
		
		try {
			String sql = "delete from board_basic where board_idx=?";
			
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
