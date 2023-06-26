package dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnectionPool;
import vo.BoardVo;
import vo.CommentVo;
import vo.MemberVo;

public class CommentDao extends DBConnectionPool {
	
	//댓글 등록
	public int insertComment(CommentVo vo) {
		int result = 0;//댓글등록 실패시 반환값
		
		try {
			String sql = "insert into rc_c_qa (b_idx, content, m_idx, m_name) "
					+ "values(?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getB_idx());
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
	
	//댓글 수
	public int selectCount(int b_idx) {
		int Count = 0;
		
		String sql = null;
		
		try {
			sql = "select count(*) from rc_c_qa where b_idx=? order by post_date desc";
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, b_idx);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Count;
	}
	
	//댓글 목록
	public List<CommentVo> selectList(int b_idx) {
		List<CommentVo> CommentList = new ArrayList<CommentVo>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String sql = null;
		
		try {
			sql = "select * from rc_c_qa where b_idx=? order by post_date desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommentVo vo = new CommentVo();
				vo.setB_idx(rs.getInt("b_idx"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getTimestamp("post_date"));
				vo.setM_idx(rs.getInt("m_idx"));
				vo.setM_name(rs.getString("m_name"));
				vo.setDel_or_not(rs.getInt("del_or_not"));
				
				CommentList.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return CommentList;
	}
	
	//작성한 댓글 수 반환
	public int countComment(MemberVo mVo) {
		int result = 0;
		
		try {
			String sql = "select count(*) from rc_c_qa where m_idx = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mVo.getM_idx());
			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			rs.close();
		} catch (SQLException e) {
			System.out.println("댓글 카운트 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int rCountAll(String m_name) {
		int result = 0;
		
		try {
			String sql = "select count(*) from rc_c_qa where m_name = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_name);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			rs.close();
		} catch (SQLException e) {
			System.out.println("댓글 카운트 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}

	public void addScore(CommentVo vo) {
		String sql = null;
		
		try {
			sql = "update rc_m set score = score + 1 where m_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getM_idx());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public int deletePost(int b_idx) {
		int result = 0; //게시글 삭제 실패시 반환값
		
		try {
			String sql = "delete from rc_c_qa where b_idx=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}

	public List<CommentVo> selectCommentAll(Map<String, Object> map) {
		
		List<CommentVo> cList = new ArrayList<CommentVo>();
		
		String searchWord, sql;
		int m_idx = (Integer)map.get("m_idx");
		searchWord = sql = null;
		
		try {
			if(map.size() != 1) {//검색어가 있는 경우
				searchWord = (String)map.get("searchWord");
				sql = "select 'rc_c_qa' as table_name, b_idx, content, post_date, m_name, m_idx, del_or_not, del_date "
						+ "from rc_c_qa "
						+ "where content like '%'||?||'%' and m_idx=? "
						+ "order by post_date desc";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
				pstmt.setInt(2, m_idx);
				
			}else {//검색어가 없는 경우				
				
				sql = "select 'rc_c_qa' as table_name, b_idx, content, post_date, m_name, m_idx, del_or_not, del_date "
						+ "from rc_c_qa "
						+ "where m_idx=? "
						+ "order by post_date desc";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, m_idx);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CommentVo vo = new CommentVo();
				BoardDao dao = new BoardDao();
				vo.setB_idx(rs.getInt("b_idx"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getTimestamp("post_date"));
				vo.setM_idx(rs.getInt("m_idx"));
				vo.setM_name(rs.getString("m_name"));
				vo.setDel_or_not(rs.getInt("del_or_not"));
				vo.setB_title(dao.getTitle(rs.getInt("b_idx")));
				
				cList.add(vo);
				dao.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cList;
	}
	
	//검색 조건에 맞는 게시물 수를 반환하는 메소드 관리자용
	public int countCommentAll(Map<String, Object> map) {
		int totalCount = 0;
		
		String searchWord, sql;
		int m_idx = (Integer)map.get("m_idx");
		searchWord = sql = null;
		
		try {
			if(map.size() != 1) {//검색어가 있는 경우
				searchWord = (String)map.get("searchWord");
				
				sql = "select count(*) from rc_c_qa "
						+ "where content like '%'||?||'%' and m_idx=? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
				pstmt.setInt(2, m_idx);
				
			}else {//검색어가 없는 경우
				sql = "select count(*) from rc_c_qa "
						+ "where m_idx=? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, m_idx);

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
//---------------------------------------------------------------------------------------------------------------------------------	
	
	
	
	
	
	
	
	public int countBoardM(CommentVo cVo) {
		int result = 0;
		
		try {
			String sql = "select count(*) from rc_b_qa where m_idx = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cVo.getM_idx());
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
	
	public int insertNotice(CommentVo vo) {
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
	
	public int insertQA(CommentVo vo) {
		int result = 0;//글 등록 실패시 반환값
		
		try {
			String sql = "insert into rc_b_qa (b_idx, title, content, m_idx, m_name) "
					+ "values(rc_b_qa_seq.nextval, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
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
	
	public int insertBoard(CommentVo vo) {
		int result = 0;//글 등록 실패시 반환값
		
		try {
			String sql = "insert into rc_b_qa (b_idx, title, content, m_idx, m_name) "
					+ "values(rc_b_qa_seq.nextval, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
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
	
	
//----------------------------------------------------------------------------------------------------------------------------------
	public List<CommentVo> selectNotice() {
		
		List<CommentVo> boardList = new ArrayList<CommentVo>();
		
		String sql = null;
		
		try {
				sql = "select * from rc_b_notice order by b_idx desc";
				pstmt = conn.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommentVo vo = new CommentVo();
				vo.setB_idx(rs.getInt("b_idx"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getTimestamp("post_date"));
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
	
	public int updateQA(CommentVo vo) {
		int result = 0;//수정 실패시 반환값
		
		try {
			String sql = "update rc_b_qa set title=?, content=? where b_idx=?";
			
			pstmt = conn.prepareStatement(sql);
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
	
	public CommentVo selectQA(int b_idx) {
		CommentVo vo = new CommentVo();
		
		String sql = "select * from rc_b_qa where b_idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setB_idx(rs.getInt("b_idx"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getTimestamp("post_date"));
				vo.setM_idx(rs.getInt("m_idx"));
				vo.setM_name(rs.getString("m_name"));
				vo.setDel_or_not(rs.getInt("del_or_not"));
			}
			
		} catch (SQLException e) {
			System.out.println("게시물 로드 중 예외 발생");
			e.printStackTrace();
		}		
		return vo;
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
	
	
	public CommentVo selectView(int b_idx) {
		CommentVo vo = new CommentVo();
		
		String sql = "select * from rc_b_qa where b_idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setB_idx(rs.getInt("b_idx"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getTimestamp("post_date"));
				vo.setM_idx(rs.getInt("m_idx"));
				vo.setM_name(rs.getString("m_name"));
				vo.setDel_or_not(rs.getInt("del_or_not"));
			}
			
		} catch (SQLException e) {
			System.out.println("게시물 로드 중 예외 발생");
			e.printStackTrace();
		}		
		return vo;
	}	
	
	//지정한 게시물의 내용을 수정하는 메소드
	public int updateBoard(CommentVo vo) {
		int result = 0;//수정 실패시 반환값
		
		try {
			String sql = "update rc_b_qa set title=?, content=? where b_idx=?";
			
			pstmt = conn.prepareStatement(sql);
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
}
	
	//

