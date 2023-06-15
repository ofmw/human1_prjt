package vo;

import java.util.Date;

public class MemberVo {
	private int m_idx;
	private String m_id;
	private String m_pw;
	private String m_name;
	private int gender;
	private String selNum;
	private int grade;
	private Date join_date;
	private Date update_date;
	private Date cancel_date;
	private int cancel_or_not;

	
	public MemberVo() {}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getSelNum() {
		return selNum;
	}

	public void setSelNum(String selNum) {
		this.selNum = selNum;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public Date getCancel_date() {
		return cancel_date;
	}

	public void setCancel_date(Date cancel_date) {
		this.cancel_date = cancel_date;
	}

	public int getCancel_or_not() {
		return cancel_or_not;
	}

	public void setCancel_or_not(int cancel_or_not) {
		this.cancel_or_not = cancel_or_not;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	
	
	

}
