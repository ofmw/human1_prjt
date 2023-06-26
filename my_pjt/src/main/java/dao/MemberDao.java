package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnectionPool;
import vo.BoardVo;
import vo.MemberVo;

public class MemberDao extends DBConnectionPool {
	
	public int checkId(String m_id) {
		int result = -1;//동일한 아이디가 없을 때 반환값
		
		try {
			String sql = "select m_id from rc_m where m_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;//동일한 아이디가 있을 때 반환값
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	//회원가입 처리
	public int join(MemberVo vo) {
		int result = 0;//회원가입 실패시 반환값
		
		try {
			String sql = "insert into rc_m (m_idx, m_id, m_pw, m_name, birth, gender, selNum) "
					+ "values (rc_m_seq.nextval, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getM_id());
			pstmt.setString(2, vo.getM_pw());
			pstmt.setString(3, vo.getM_name());
			pstmt.setString(4, vo.getBirth());
			pstmt.setInt(5, vo.getGender());
			pstmt.setString(6, vo.getSelNum());
			
			result = pstmt.executeUpdate();
			//result값이 1이면 회원가입 성공
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return result;
	}
	
	//로그인 처리
	public MemberVo login(String m_id, String m_pw) {
		MemberVo vo = null;//같은 아이디와 비밀번호가 없을 떄 반환값
		
		String sql = "select * from rc_m where m_id=? and m_pw=? and cancel_or_not=1";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_pw);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new MemberVo();
				vo.setM_idx(rs.getInt("m_idx"));
				vo.setM_id(rs.getString("m_id"));
				vo.setM_pw(rs.getString("m_pw"));
				vo.setM_name(rs.getString("m_name"));
				vo.setBirth(rs.getString("birth"));
				vo.setGender(rs.getInt("gender"));
				vo.setSelNum(rs.getString("selNum"));
				vo.setGrade(rs.getInt("grade"));
				vo.setJoin_date(rs.getDate("join_date"));
				vo.setCancel_date(rs.getDate("Cancel_date"));
				vo.setCancel_or_not(rs.getInt("cancel_or_not"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return vo;
	}
	
	//업데이트 처리
	public MemberVo update(MemberVo vo) {
		MemberVo member = null;
		System.out.println(vo.getM_id());
		try {
			String sql = "update rc_m set m_pw=?, m_name=?, birth=?, gender=?, selNum=?, update_date=sysdate where m_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getM_pw());
			pstmt.setString(2, vo.getM_name());
			pstmt.setString(3, vo.getBirth());
			pstmt.setInt(4, vo.getGender());
			pstmt.setString(5, vo.getSelNum());
			pstmt.setString(6, vo.getM_id());
			int rowCount = pstmt.executeUpdate();
			
			if(rowCount == 1) {
				System.out.println("업데이트 성공");
			}else {
				System.out.println("업데이트 실패");
			}
			
			//세션객체에 담기위해 수정된 회원정보를 조회해서 MemberVo객체에 담음
			sql = "select * from rc_m where m_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getM_id());
				rs = pstmt.executeQuery();
				
			if(rs.next()) {
				member = new MemberVo();
				member.setM_idx(rs.getInt("m_idx"));
				member.setM_id(rs.getString("m_id"));
				member.setM_pw(rs.getString("m_pw"));
				member.setM_name(rs.getString("m_name"));
				member.setBirth(rs.getString("birth"));
				member.setGender(rs.getInt("gender"));
				member.setSelNum(rs.getString("selNum"));
				member.setJoin_date(rs.getDate("join_date"));
				member.setCancel_date(rs.getDate("Cancel_date"));
				member.setCancel_or_not(rs.getInt("cancel_or_not"));
				member.setGrade(rs.getInt("grade"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}		
		return member;
	}
	
	//회원탈퇴 처리
	public int cancel(int m_idx) {
		int result = 0;//회원탈퇴 실패시 반환값
		
		try {
			String sql = "update rc_m set cancel_or_not=-1, cancel_date=sysdate where m_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_idx);
			
			result = pstmt.executeUpdate();//업데이트 성공시 1 반환
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}				
		return result;
	}
	
	//검색 조건에 맞는 회원 목록을 반환하는 메소드
	public List<MemberVo> selectList(Map<String, Object> map) {
		List<MemberVo> MemberList = new ArrayList<MemberVo>();
		
		String searchWord, searchField, sql;
		searchWord = searchField = sql = null;
		
		try {
			if(map.size() != 0) {//검색어가 있는 경우
				searchWord = (String)map.get("searchWord");
				searchField = (String)map.get("searchField");
				
				if(searchField.equals("grade")) {//검색구분이 '등급'인 경우
					sql = "select * from rc_m "
							+ "where grade like '%'||?||'%' "
							+ "order by m_idx desc";
				}else {//검색구분이 '탈퇴여부'인 경우
					sql = "select * from rc_m "
							+ "where cancel_or_not like '%'||?||'%' "
							+ "order by m_idx desc";
				}				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
				pstmt.executeQuery();
				
			}else {//검색어가 없는 경우
				sql = "select * from rc_m order by m_idx desc";
				pstmt = conn.prepareStatement(sql);
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVo member = new MemberVo();
				member = new MemberVo();
				member.setM_idx(rs.getInt("m_idx"));
				member.setM_id(rs.getString("m_id"));
				member.setM_pw(rs.getString("m_pw"));
				member.setM_name(rs.getString("m_name"));
				member.setBirth(rs.getString("birth"));
				member.setGender(rs.getInt("gender"));
				member.setSelNum(rs.getString("selNum"));
				member.setJoin_date(rs.getDate("join_date"));
				member.setUpdate_date(rs.getDate("update_date"));
				member.setCancel_date(rs.getDate("cancel_date"));
				member.setCancel_or_not(rs.getInt("cancel_or_not"));
				member.setGrade(rs.getInt("grade"));
				member.setScore(rs.getInt("score"));
				
				MemberList.add(member);
				

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return MemberList;
	}
	
	//검색 조건에 맞는 회원 수를 반환하는 메소드
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String searchWord, searchField, sql;
		searchWord = searchField = sql = null;
		
		try {
			if(map.size() != 0) {//검색어가 있는 경우
				searchWord = (String)map.get("searchWord");
				searchField = (String)map.get("searchField");
				
				if(searchField.equals("grade")) {//검색구분이 '등급'인 경우
					sql = "select count(*) from rc_m "
							+ "where grade like '%'||?||'%' "
							+ "order by m_idx desc";
				}else {//검색구분이 '탈퇴여부'인 경우
					sql = "select count(*) from rc_m "
							+ "where cancel_or_not like '%'||?||'%' "
							+ "order by m_idx desc";
				}				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, searchWord);
				pstmt.executeQuery();
				
			}else {//검색어가 없는 경우
				sql = "select count(*) from rc_m order by m_idx desc";
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
	
	public int checkSelNum(String selNum) {
		int result = -1;
		
		try {
			String sql = "select selNum from rc_m where selNum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, selNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	//검색 조건에 맞는 회원 목록을 반환하는 메소드 랭킹용
	public List<MemberVo> rankingList(Map<String, Object> map) {
		List<MemberVo> MemberList = new ArrayList<MemberVo>();
		
		String sql = null;
		
		try {

			sql = "select * from rc_m where cancel_or_not=1 and not grade=9 order by score desc";
			pstmt = conn.prepareStatement(sql);			
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVo member = new MemberVo();
				member = new MemberVo();
				member.setM_idx(rs.getInt("m_idx"));
				member.setM_id(rs.getString("m_id"));
				member.setM_pw(rs.getString("m_pw"));
				member.setM_name(rs.getString("m_name"));
				member.setBirth(rs.getString("birth"));
				member.setGender(rs.getInt("gender"));
				member.setSelNum(rs.getString("selNum"));
				member.setJoin_date(rs.getDate("join_date"));
				member.setUpdate_date(rs.getDate("update_date"));
				member.setCancel_date(rs.getDate("cancel_date"));
				member.setCancel_or_not(rs.getInt("cancel_or_not"));
				member.setGrade(rs.getInt("grade"));
				member.setScore(rs.getInt("score"));
				
				MemberList.add(member);
				

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return MemberList;
	}
	
	//검색 조건에 맞는 회원 수를 반환하는 메소드 랭킹용
	public int rankingCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String sql = null;
		
		try {
			sql = "select count(*) from rc_m where cancel_or_not=1 and not grade=9 order by score desc";
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
	
	public void gradeUp(int[] idxList) {
		
		MemberDao dao = new MemberDao();
		String sql = null;
		
		try {
			for(int m_idx : idxList) {
				sql = "update rc_m set grade = ? where m_idx=?";
				pstmt = conn.prepareStatement(sql);
				if(dao.selectGrade(m_idx) == 9) {
					pstmt.setInt(1, (dao.selectGrade(m_idx)));
				}else {
					pstmt.setInt(1, (dao.selectGrade(m_idx)+1));
				}
				
				pstmt.setInt(2, m_idx);				
				pstmt.executeQuery();
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void gradeDown(int[] idxList) {
		
		MemberDao dao = new MemberDao();
		String sql = null;
		
		try {
			for(int m_idx : idxList) {
				sql = "update rc_m set grade = ? where m_idx=?";
				pstmt = conn.prepareStatement(sql);
				if(dao.selectGrade(m_idx) == 0) {
					pstmt.setInt(1, (dao.selectGrade(m_idx)));
				}else {
					pstmt.setInt(1, (dao.selectGrade(m_idx)-1));
				}			
				
				pstmt.setInt(2, m_idx);				
				pstmt.executeQuery();
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void cancel(int[] idxList) {
		
		MemberDao dao = new MemberDao();
		String sql = null;
		
		try {
			for(int m_idx : idxList) {
				sql = "update rc_m set cancel_or_not = -1, cancel_date = sysdate where m_idx=?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, m_idx);				
				pstmt.executeQuery();
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void restoration(int[] idxList) {
		
		MemberDao dao = new MemberDao();
		String sql = null;
		
		try {
			for(int m_idx : idxList) {
				sql = "update rc_m set cancel_or_not = 1, cancel_date = null where m_idx=?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, m_idx);				
				pstmt.executeQuery();
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public int selectGrade(int m_idx) {
		int result = 0;
		
			String sql = null;
			
			try {
				sql = "select grade from rc_m where m_idx=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, m_idx);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt("grade");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		
		return result;
	}
}
