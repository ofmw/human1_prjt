package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnectionPool;
import vo.BoardFileVo;

public class BoardFileDao extends DBConnectionPool {

	public int insertBoard(BoardFileVo vo) {
		int result = 0;//글 등록 실패시 반환값
		
		try {
			String sql = "insert into board_file (board_idx, title, content, member_idx, member_name, originfile, savefile) "
					+ "values(board_file_seq.nextval, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getMember_idx());
			pstmt.setString(4, vo.getMember_name());
			pstmt.setString(5, vo.getOriginFile());
			pstmt.setString(6, vo.getSaveFile());
			
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
					sql = "select count(*) from board_file "
							+ "where title like '%'||?||'%' "
							+ "order by board_idx desc";
				}else {//검색구분이 '내용'인 경우
					sql = "select count(*) from board_file "
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
				sql = "select count(*) from board_file order by board_idx desc";
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
	public List<BoardFileVo> selectList(Map<String, Object> map) {
		List<BoardFileVo> boardList = new ArrayList<BoardFileVo>();
		
		String searchWord, searchField, sql;
		searchWord = searchField = sql = null;
		
		try {
			if(map.size() != 0) {//검색어가 있는 경우
				searchWord = (String)map.get("searchWord");
				searchField = (String)map.get("searchField");
				
				if(searchField.equals("title")) {//검색구분이 '제목'인 경우
					sql = "select * from board_file "
							+ "where title like '%'||?||'%' "
							+ "order by board_idx desc";
				}else {//검색구분이 '내용'인 경우
					sql = "select * from board_file "
							+ "where content like '%'||?||'%' "
							+ "order by board_idx desc";
				}				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);

				pstmt.executeQuery();
				
			}else {//검색어가 없는 경우
				sql = "select * from board_file order by board_idx desc";
				pstmt = conn.prepareStatement(sql);
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardFileVo vo = new BoardFileVo();
				vo.setBoard_idx(rs.getInt("board_idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setOriginFile(rs.getString("originFile"));//원본 파일명
				vo.setSaveFile(rs.getString("saveFile"));//저장 파일명
				vo.setPost_date(rs.getDate("post_date"));
				vo.setMember_idx(rs.getInt("member_idx"));
				vo.setMember_name(rs.getString("member_name"));
				vo.setRead_count(rs.getInt("read_count"));
				vo.setDel_or_not(rs.getInt("del_or_not"));//삭제 여부(1:유지, -1:삭제)
				
				boardList.add(vo);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}
	
	//조회수 증가 메소드
	public void updateReadCount(int board_idx) {
		String sql = "update board_file set read_count = read_count+1 where board_idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_idx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
		
	}
	
	
	public BoardFileVo selectView(int board_idx) {
		BoardFileVo vo = new BoardFileVo();
		
		String sql = "select * from board_file where board_idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setBoard_idx(rs.getInt("board_idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setOriginFile(rs.getString("originFile"));//원본 파일명
				vo.setSaveFile(rs.getString("saveFile"));//저장 파일명
				vo.setPost_date(rs.getDate("post_date"));
				vo.setMember_idx(rs.getInt("member_idx"));
				vo.setMember_name(rs.getString("member_name"));
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
	public int updateBoard(BoardFileVo vo) {
		int result = 0;//수정 실패시 반환값
		String sql = null;
		try {
			
			if(vo.getOriginFile() != null) {
				sql = "update board_file set title=?, content=?, originfile=?, savefile=? where board_idx=?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getTitle());
				pstmt.setString(2, vo.getContent());
				pstmt.setString(3, vo.getOriginFile());
				pstmt.setString(4, vo.getSaveFile());
				pstmt.setInt(5, vo.getBoard_idx());
				
			}else {
				sql = "update board_file set title=?, content=? where board_idx=?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getTitle());
				pstmt.setString(2, vo.getContent());
				pstmt.setInt(3, vo.getBoard_idx());
			}
			
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
	public int deletePost(BoardFileVo vo) {
		int result = 0; //게시글 삭제 실패시 반환값
		
		try {
			String sql = "delete from board_file where board_idx=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBoard_idx());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
}
