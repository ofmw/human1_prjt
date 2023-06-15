package dao;

import java.sql.SQLException;

import common.DBConnectionPool;
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
			String sql = "insert into rc_m (m_idx, m_id, m_pw, m_name, gender, selNum) "
					+ "values (rc_m_seq.nextval, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getM_id());
			pstmt.setString(2, vo.getM_pw());
			pstmt.setString(3, vo.getM_name());
			pstmt.setInt(4, vo.getGender());
			pstmt.setString(5, vo.getSelNum());
			
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
		
		try {
			String sql = "update rc_member set m_pw=?, m_name=?, gender=?, selNum=?, update_date=sysdate where m_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getM_pw());
			pstmt.setString(2, vo.getM_name());
			pstmt.setInt(3, vo.getGender());
			pstmt.setString(4, vo.getSelNum());
			pstmt.setString(5, vo.getM_id());
			int rowCount = pstmt.executeUpdate();
			
			if(rowCount == 1) {
				System.out.println("업데이트 성공");
			}
			
			//세션객체에 담기위해 수정된 회원정보를 조회해서 MemberVo객체에 담음
			sql = "select * from rc_member where m_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getM_id());
				rs = pstmt.executeQuery();
				
			if(rs.next()) {
				member = new MemberVo();
				member.setM_idx(rs.getInt("m_idx"));
				member.setM_id(rs.getString("m_id"));
				member.setM_pw(rs.getString("m_pw"));
				member.setM_name(rs.getString("m_name"));
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
			String sql = "update rc_member set cancel_or_not=-1, cancel_date=sysdate where m_idx=?";
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
}
